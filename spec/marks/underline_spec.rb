RSpec.describe ProsemirrorToHtml::Marks::Underline do
  it 'renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'text',
          text: 'Example Text',
          marks: [
            {
              type: 'underline',
            }
          ]
        }
      ]
    }

    html = '<u>Example Text</u>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
