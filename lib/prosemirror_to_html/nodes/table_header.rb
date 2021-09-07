module ProsemirrorToHtml
  module Nodes
    class TableHeader < TableCell
      @node_type = 'table_header'
      @tag_name = 'th'

      # TODO: support attrs
    end
  end
end
