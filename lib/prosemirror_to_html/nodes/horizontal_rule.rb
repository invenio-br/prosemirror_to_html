module ProsemirrorToHtml
  module Nodes
    class HorizontalRule < Node
      def matching
        @node.type == 'hr'
      end

      def tag
        'hr'
      end

      def self_closing
        true
      end
    end
  end
end
