module ProsemirrorToHtml
  module Nodes
    class CodeBlock < Node
      @node_type = 'code_block'
      @tag_name = ['pre', 'code']

      def matching
        @node['type'] == 'code_block'
      end

      def tag
        language = @node.dig('attrs', 'language')
        if language
          [
            { tag: 'pre' },
            { tag: 'code', attrs: { class: "language-#{language}" } }
          ]
        else
          ['pre', 'code']
        end
      end
    end
  end
end
