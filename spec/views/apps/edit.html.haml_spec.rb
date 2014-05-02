require 'spec_helper'

describe "apps/edit" do
  before(:each) do
    @app = assign(:app, stub_model(App,
      :name => "MyString",
      :description => "MyText",
      :author => 1,
      :price => "MyString",
      :file_id => "MyString"
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
      assert_select "input#app_file_id[name=?]", "app[file_id]"
    end
  end
end
