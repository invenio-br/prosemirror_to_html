module ProsemirrorToHtml
  module Nodes
    class User < Node
      def matching
        @node.type == 'user'
      end

      def tag
        nil
      end
    end
  end
end
