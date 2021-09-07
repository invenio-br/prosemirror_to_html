module ProsemirrorToHtml
  module Nodes
    class ListItem < Node
      @node_type = 'list_item'
      @tag_name = 'li'
    end
  end
end
