module ProsemirrorToHtml
  module Nodes
    class Node
      @node_type = nil
      @tag_name = nil

      class << self
        attr_reader :node_type, :tag_name
      end

      def initialize(node)
        @node = node
      end

      def matching
        return @node.type == self.class.node_type if @node.type

        false
      end

      def self_closing
        false
      end

      def tag
        self.class.tag_name
      end

      def text
        nil
      end
    end
  end
end
