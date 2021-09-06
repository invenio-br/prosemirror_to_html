RSpec.describe ProsemirrorToHtml::Nodes::Blockquote do
  it 'renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'blockquote',
          content: [
            type: 'text',
            text: 'Example Quote',
          ],
        },
      ]
    }

    html = '<blockquote>Example Quote</blockquote>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
