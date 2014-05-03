require 'spec_helper'

describe "apps/show" do
  before(:each) do
    @app = assign(:app, stub_model(App,
      :name => "Name",
      :description => "MyText",
      :author => "some_author",
      :price => "Price",
      :file_name => "File",
      #:file_data => "data",
      :file_mime_type => "application/octet-stream"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/some_author/)
    expect(rendered).to match(/Price/)
    expect(rendered).to match(/File/)
    expect(rendered).to match(/application\/octet-stream/)
  end
end
