RSpec.describe ProsemirrorToHtml::Marks::Bold do
  it 'renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'text',
          text: 'Example Text',
          marks: [
            {
              type: 'bold',
            }
          ]
        }
      ]
    }

    html = '<strong>Example Text</strong>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
