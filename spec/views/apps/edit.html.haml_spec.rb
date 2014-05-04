require 'spec_helper'

describe "apps/edit" do
  before(:each) do
    @app = assign(:app, stub_model(App,
      :name => "MyString",
      :description => "MyText",
      :author => "some_author",
      :price => "MyString",
      :binary => Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/testfile1.txt'), 'text/plain')
    ))
  end

  it "renders the edit app form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", app_path(@app), "post" do
      assert_select "input#app_name[name=?]", "app[name]"
      assert_select "textarea#app_description[name=?]", "app[description]"
      assert_select "input#app_author[name=?]", "app[author]"
      assert_select "input#app_price[name=?]", "app[price]"
      assert_select "input#app_binary[name=?]", "app[binary]"
    end
  end
end
