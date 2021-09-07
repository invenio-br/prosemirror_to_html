module ProsemirrorToHtml
  module Nodes
    class TableCell < Node
      @node_type = 'table_cell'
      @tag_name = 'td'
    end
  end
end
