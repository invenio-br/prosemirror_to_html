RSpec.describe ProsemirrorToHtml::Marks::Strike do
  it 'renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'text',
          text: 'Example Text',
          marks: [
            {
              type: 'strike',
            }
          ]
        }
      ]
    }

    html = '<strike>Example Text</strike>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
