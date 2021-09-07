module ProsemirrorToHtml
  module Nodes
    class BulletList < Node
      @node_type = 'bullet_list'
      @tag_name = 'ul'
    end
  end
end
