module ProsemirrorToHtml
  module Nodes
    class HardBreak < Node
      @node_type = 'hard_break'
      @tag_name = 'br'

      def self_closing
        true
      end
    end
  end
end
