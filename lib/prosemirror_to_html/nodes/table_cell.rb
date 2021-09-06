module ProsemirrorToHtml
  module Nodes
    class TableCell < Node
      def matching
        @node.type == 'table_cell'
      end

      def tag
        'td'
      end
    end
  end
end
