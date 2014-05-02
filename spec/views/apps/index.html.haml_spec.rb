require 'spec_helper'

describe "apps/index" do
  before(:each) do
    assign(:apps, [
      stub_model(App,
        :name => "Name",
        :description => "MyText",
        :author => "some_author",
        :price => "Price",
        :file_name => "File",
        :file_data => "data",
        :file_mime_type => "application/octet-stream"
      ),
      stub_model(App,
        :name => "Name",
        :description => "MyText",
        :author => "some_author",
        :price => "Price",
        :file_name => "File",
        :file_data => "data",
        :file_mime_type => "application/octet-stream"
      )
    ])
  end

  it "renders a list of apps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "some_author", :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    assert_select "tr>td", :text => "File".to_s, :count => 2
    assert_select "tr>td", :text => "application/octet-stream".to_s, :count => 2
  end
end
