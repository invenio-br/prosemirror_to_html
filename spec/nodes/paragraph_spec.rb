RSpec.describe ProsemirrorToHtml::Nodes::Paragraph do
  it 'renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'paragraph',
          content: [
            {
              type: 'text',
              text: 'Example Paragraph'
            }
          ]
        }
      ]
    }

    html = '<p>Example Paragraph</p>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
