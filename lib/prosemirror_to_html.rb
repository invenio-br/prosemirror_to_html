require "prosemirror_to_html/version"
require "prosemirror_to_html/marks/mark"
require "prosemirror_to_html/marks/bold"
require "prosemirror_to_html/marks/code"
require "prosemirror_to_html/marks/italic"
require "prosemirror_to_html/marks/link"
require "prosemirror_to_html/marks/strike"
require "prosemirror_to_html/marks/subscript"
require "prosemirror_to_html/marks/superscript"
require "prosemirror_to_html/marks/underline"
require "prosemirror_to_html/nodes/node"
require "prosemirror_to_html/nodes/blockquote"
require "prosemirror_to_html/nodes/bullet_list"
require "prosemirror_to_html/nodes/code_block_wrapper"
require "prosemirror_to_html/nodes/code_block"
require "prosemirror_to_html/nodes/hard_break"
require "prosemirror_to_html/nodes/horizontal_rule"
require "prosemirror_to_html/nodes/heading"
require "prosemirror_to_html/nodes/image"
require "prosemirror_to_html/nodes/list_item"
require "prosemirror_to_html/nodes/ordered_list"
require "prosemirror_to_html/nodes/paragraph"
require "prosemirror_to_html/nodes/table"
require "prosemirror_to_html/nodes/text"
require "prosemirror_to_html/nodes/user"
require 'nokogiri'
require 'json'
require "ostruct"

module ProsemirrorToHtml
  class Error < StandardError; end

  class Renderer
    def initialize()
      @storedMarks = []
      @marks = [
        ProsemirrorToHtml::Marks::Bold,
        ProsemirrorToHtml::Marks::Code,
        ProsemirrorToHtml::Marks::Italic,
        ProsemirrorToHtml::Marks::Link,
        ProsemirrorToHtml::Marks::Strike,
        ProsemirrorToHtml::Marks::Subscript,
        ProsemirrorToHtml::Marks::Superscript,
        ProsemirrorToHtml::Marks::Underline,
      ]
      @nodes = [
        ProsemirrorToHtml::Nodes::Blockquote,
        ProsemirrorToHtml::Nodes::BulletList,
        ProsemirrorToHtml::Nodes::CodeBlockWrapper,
        ProsemirrorToHtml::Nodes::CodeBlock,
        ProsemirrorToHtml::Nodes::HardBreak,
        ProsemirrorToHtml::Nodes::HorizontalRule,
        ProsemirrorToHtml::Nodes::Heading,
        ProsemirrorToHtml::Nodes::Image,
        ProsemirrorToHtml::Nodes::ListItem,
        ProsemirrorToHtml::Nodes::OrderedList,
        ProsemirrorToHtml::Nodes::Paragraph,
        # ProsemirrorToHtml::Nodes::Text,
        ProsemirrorToHtml::Nodes::User
      ]
    end

    def render(input)
      html = ""

      json = case input
             when Hash then input.to_json
             when String then input
             else raise Error
             end

      object = JSON.parse(json, object_class: OpenStruct)

      object.content.each do |node|
        html += renderNode(node)
      end

      html
    end

    private

    def renderNode(item)
      html = []
      if item.marks
        item.marks.each do |m|
          mark = get_matching_mark(m)
          html.push(render_opening_tag(mark.tag)) if mark
        end
      end

      node = get_matching_node(item)
      html.push(render_opening_tag(node.tag)) if node

      if item.content
        item.content.each do |content|
          html.push(renderNode(content))
        end
      elsif item.text
        html.push(item.text)
      end

      html.push(render_closing_tag(node.tag)) if node
      if item.marks
        item.marks.reverse.each do |m|
          mark = get_matching_mark(m)
          html.push(render_closing_tag(mark.tag)) if mark
        end
      end
      return html.join("");
    end

    def render_opening_tag(tags)
      return "<#{tags}>" if tags.is_a? String
      all = tags.map do |tag|
        return "<#{tags}>" if tag.is_a? String
        h = "<#{tag[:tag]}"
        tag[:attrs].to_h.each_pair { |key, value| h += " #{key}=\"#{value}\"" } if tag[:attrs]
        "#{h}>"
      end
      return all.join('')
    end

    def render_closing_tag(tags)
      return "</#{tags}>" if tags.is_a? String
      all = tags.reverse.map do |tag|
        return "</#{tag}>" if tag.is_a? String
        "</#{tag[:tag]}>"
      end
      return all.join('')
    end

    # Find which Node matches the Html Node
    def get_matching_node(item)
      return get_matching_class(item, @nodes)
    end

    # Find which Mark matches the HtmlElement
    def get_matching_mark(item)
      return get_matching_class(item, @marks)
    end

    # Find which class matches the HtmlElement
    def get_matching_class(node, classes)
      found = classes.select do |klass|
        instance = klass.new(node)
        if instance.matching
          return instance
        end
      end
      found.first
    end
  end
end
