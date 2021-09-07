module ProsemirrorToHtml
  module Nodes
    class Heading < Node
      @node_type = 'heading'

      def tag
        "h#{@node.attrs.level}"
      end
    end
  end
end
