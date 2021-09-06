module ProsemirrorToHtml
  module Nodes
    class HardBreak < Node
      def matching
        @node.type == 'hard_break'
      end

      def tag
        'br'
      end
    end
  end
end
