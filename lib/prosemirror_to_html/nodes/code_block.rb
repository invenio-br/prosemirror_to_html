module ProsemirrorToHtml
  module Nodes
    class CodeBlock < Node
      @node_type = 'code_block'
      @tag_name = ['pre', 'code']
    end
  end
end
