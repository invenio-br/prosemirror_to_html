RSpec.describe ProsemirrorToHtml::Nodes::CodeBlock do
  it 'renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'code_block',
          content: [
            {
              type: 'text',
              text: 'Example Text'
            }
          ]
        },
      ]
    }

    html = '<pre><code>Example Text</code></pre>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
