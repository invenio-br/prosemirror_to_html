RSpec.describe ProsemirrorToHtml::Nodes::HorizontalRule do
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
          ]
        },
        {
          type: 'horizontal_rule'
        },
        {
          type: 'paragraph',
          content: [
            {
              type: 'text',
              text: 'some more text'
            }
          ]
        }
      ]
    }

    html = '<p>some text</p><hr><p>some more text</p>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end

  it 'renders correctly with camelCase' do
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
          ]
        },
        {
          type: 'horizontalRule'
        },
        {
          type: 'paragraph',
          content: [
            {
              type: 'text',
              text: 'some more text'
            }
          ]
        }
      ]
    }

    html = '<p>some text</p><hr><p>some more text</p>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
