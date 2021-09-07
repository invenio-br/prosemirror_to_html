module ProsemirrorToHtml
  module Marks
    class Link < Mark
      @mark_type = 'link'
      @tag_name = 'a'

      def tag
        attrs = {}

        attrs['href'] = @mark.attrs.href

        attrs['target'] = @mark.attrs.target if @mark.attrs.target
        attrs['title'] = @mark.attrs.title if @mark.attrs.title
        attrs['rel'] = @mark.attrs.rel if @mark.attrs.rel

        [
          {
            tag: self.class.tag_name,
            attrs: attrs
          }
        ]
      end
    end
  end
end
