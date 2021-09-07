module ProsemirrorToHtml
  module Nodes
    class TableRow < Node
      @node_type = 'table_row'
      @tag_name = 'tr'
    end
  end
end
