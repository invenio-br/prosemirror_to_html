module ProsemirrorToHtml
  module Nodes
    class TableHeader < TableCell
      def matching
        @node.type == 'table_header'
      end

      def tag
        'th'
      end

      # TODO: support attrs
    end
  end
end
