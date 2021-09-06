RSpec.describe ProsemirrorToHtml::Marks::Superscript do
  it 'renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'text',
          text: 'Example Text',
          marks: [
            {
              type: 'superscript',
            }
          ]
        }
      ]
    }

    html = '<sup>Example Text</sup>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
