RSpec.describe ProsemirrorToHtml::Marks::Code do
  it 'renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'text',
          text: 'Example Text',
          marks: [
            {
              type: 'code',
            }
          ]
        }
      ]
    }

    html = '<code>Example Text</code>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
