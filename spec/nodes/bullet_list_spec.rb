RSpec.describe ProsemirrorToHtml::Nodes::BulletList do
  it 'renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'bullet_list',
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

    html = '<ul><li>first list item</li></ul>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
