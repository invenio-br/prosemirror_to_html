RSpec.describe ProsemirrorToHtml::Nodes::Text do
  it 'escapes scripts' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'text',
          text: '<script>alert(1)</script>'
        }
      ]
    }

    html = '&lt;script&gt;alert(1)&lt;/script&gt;'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
