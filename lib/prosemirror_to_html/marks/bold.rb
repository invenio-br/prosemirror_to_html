module ProsemirrorToHtml
  module Marks
    class Bold < Mark
      @mark_type = 'bold'
      @tag_name = 'strong'
    end
  end
end
