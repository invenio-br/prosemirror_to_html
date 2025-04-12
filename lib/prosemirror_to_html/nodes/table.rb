module ProsemirrorToHtml
  module Nodes
    class Table < Node
      @node_type = 'table'
      @tag_name = ['table', 'tbody']

      def tag
        tags = []
        tags << { tag: "div", attrs: { class: "table-responsive" } }
        tags << { tag: "table", attrs: { class: "table table-striped table-bordered" } }
        tags << { tag: "tbody" }
        tags
      end
    end
  end
end
