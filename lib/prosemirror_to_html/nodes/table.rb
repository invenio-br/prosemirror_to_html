module ProsemirrorToHtml
  module Nodes
    class Table < Node
      @node_type = 'table'
      @tag_name = ['table', 'tbody']
    end
  end
end
