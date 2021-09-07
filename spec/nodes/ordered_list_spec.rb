RSpec.describe ProsemirrorToHtml::Nodes::OrderedList do
  it 'renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'ordered_list',
          content: [
            {
              type: 'list_item',
              content: [
                {
                  type: 'text',
                  text: 'first list item',
                },
              ],
            },
          ],
        },
      ]
    }

    html = '<ol><li>first list item</li></ol>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end

  it 'renders correctly with offset' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'ordered_list',
          attrs: {
            start: 3,
          },
          content: [
            {
              type: 'list_item',
              content: [
                {
                  type: 'text',
                  text: 'first list item',
                },
              ],
            },
          ],
        },
      ]
    }

    html = '<ol start="3"><li>first list item</li></ol>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
