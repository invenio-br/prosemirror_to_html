RSpec.describe ProsemirrorToHtml::Marks::Subscript do
  it 'renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'text',
          text: 'Example Text',
          marks: [
            {
              type: 'subscript',
            }
          ]
        }
      ]
    }

    html = '<sub>Example Text</sub>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
