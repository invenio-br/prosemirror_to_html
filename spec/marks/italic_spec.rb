RSpec.describe ProsemirrorToHtml::Marks::Italic do
  it 'renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'text',
          text: 'Example Text',
          marks: [
            {
              type: 'italic',
            }
          ]
        }
      ]
    }

    html = '<em>Example Text</em>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
