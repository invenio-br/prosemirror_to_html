module ProsemirrorToHtml
  module Nodes
    class HorizontalRule < Node
      @node_type = 'horizontal_rule'
      @tag_name = 'hr'

      def self_closing
        true
      end
    end
  end
end
