module ProsemirrorToHtml
  module Nodes
    class CodeBlock < Node
      @node_type = 'code_block'
      @tag_name = ['pre', 'code']

      def tag
        language = @node.dig('attrs', 'language')
        tags = [ { tag: "div", attrs: { "data-controller" => "code-highlight" } } ]
        tags << { tag: "pre" }
        tags << { tag: "code", attrs: { class: "language-#{language}" } } if language
        tags << { tag: "code" } unless language
        tags
      end
    end
  end
end
