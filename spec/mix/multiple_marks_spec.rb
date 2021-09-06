RSpec.describe ProsemirrorToHtml::Marks do
  it 'multiple marks renders correctly' do
    json = {
      type: 'doc',
      content: [
        {
          type: 'paragraph',
          content: [
            {
              type: 'text',
              text: 'Example Text',
              marks: [
                {
                  type: 'bold',
                },
                {
                  type: 'italic',
                }
              ]
            }
          ]
        }
      ]
    }

    html = '<p><strong><em>Example Text</em></strong></p>'

    renderer = ProsemirrorToHtml::Renderer.new
    expect(renderer.render(json)).to eq html
  end
end
