RSpec.describe ProsemirrorToHtml::Marks::Link do
  it 'renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'text',
          text: 'Example Link',
          marks: [
            {
              type: 'link',
              attrs: {
                href: 'https://etamin.studio'
              }
            }
          ]
        }
      ]
    }

    html = '<a href="https://etamin.studio">Example Link</a>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end

  it 'renders correctly with rel' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'text',
          text: 'Example Link',
          marks: [
            {
              type: 'link',
              attrs: {
                href: 'https://etamin.studio',
                rel: 'noopener'
              }
            }
          ]
        }
      ]
    }

    html = '<a href="https://etamin.studio" rel="noopener">Example Link</a>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end

  it 'renders correctly with target' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'text',
          text: 'Example Link',
          marks: [
            {
              type: 'link',
              attrs: {
                href: 'https://etamin.studio',
                target: '_blank'
              }
            }
          ]
        }
      ]
    }

    html = '<a href="https://etamin.studio" target="_blank">Example Link</a>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end

  it 'renders correctly with title' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'text',
          text: 'Example Link',
          marks: [
            {
              type: 'link',
              attrs: {
                href: 'https://etamin.studio',
                title: 'Foo'
              }
            }
          ]
        }
      ]
    }

    html = '<a href="https://etamin.studio" title="Foo">Example Link</a>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end

  it 'renders correctly with nested marks' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'text',
          text: 'Example ',
          marks: [
            {
              type: 'link',
              attrs: {
                href: 'https://etamin.studio',
              }
            }
          ]
        },
        {
          type: 'text',
          text: 'Link',
          marks: [
            {
              type: 'link',
              attrs: {
                href: 'https://etamin.studio',
              }
            },
            {
              type: 'bold'
            }
          ]
        }
      ]
    }

    html = '<a href="https://etamin.studio">Example <strong>Link</strong></a>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end

  it 'renders correctly with nested marks, inside nodes' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'paragraph',
          content: [
            {
              type: 'text',
              text: 'Example ',
              marks: [
                {
                  type: 'link',
                  attrs: {
                    href: 'https://etamin.studio',
                  }
                }
              ]
            },
            {
              type: 'text',
              text: 'Link',
              marks: [
                {
                  type: 'link',
                  attrs: {
                    href: 'https://etamin.studio',
                  }
                },
                {
                  type: 'bold'
                }
              ]
            }
          ]
        }
      ]
    }

    html = '<p><a href="https://etamin.studio">Example <strong>Link</strong></a></p>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
