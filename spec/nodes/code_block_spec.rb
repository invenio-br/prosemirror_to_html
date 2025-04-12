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

  it 'renders a code block with language class' do
    node = {
      'type' => 'code_block',
      'attrs' => { 'language' => 'ruby' },
      'content' => [{ 'type' => 'text', 'text' => 'puts "Hello, world!"' }]
    }

    code_block = ProsemirrorToHtml::Nodes::CodeBlock.new(node)
    expect(code_block.tag).to eq([
      { tag: 'pre' },
      { tag: 'code', attrs: { class: 'language-ruby' } }
    ])
  end
end
