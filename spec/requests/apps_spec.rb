require 'spec_helper'

describe "Apps" do
  describe "GET /apps" do
    it "returns 200" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get apps_path
      expect(response.status).to be(200)
    end
  end
end
