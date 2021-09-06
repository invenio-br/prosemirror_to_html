RSpec.describe ProsemirrorToHtml::Nodes::HardBreak do
  it 'renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'paragraph',
          content: [
            {
              type: 'text',
              text: 'some text'
            },
            {
              type: 'hard_break'
            },
            {
              type: 'text',
              text: 'some more text'
            }
          ]
        }
      ]
    }

    html = '<p>some text<br>some more text</p>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
