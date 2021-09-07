RSpec.describe ProsemirrorToHtml::Nodes::Image do
  it 'renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'image',
          attrs: {
            alt: 'an image',
            src: 'image/source',
            title: 'The image title',
          }
        }
      ]
    }

    html = '<img alt="an image" src="image/source" title="The image title">'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
