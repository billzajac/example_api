require 'spec_helper'

describe "Apps" do
  #let(:valid_attributes) { attributes_for(:app, :with_binary) }
  let(:valid_attributes) { attributes_for(:app).merge(binary: Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/testfile1.txt'), 'text/plain')) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AppsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET /apps" do
    it "returns 200" do
      get apps_path
      expect(response.status).to be(200)
    end
  end

  describe "POST /apps" do
    it "uploads the binary to s3 for a new app" do
      #post new_app_path, {:app => valid_attributes}, valid_session
      post '/apps', {:app => valid_attributes}
      url = App.first.binary.url
      App.destroy_all
      expect(File.basename(url)).to eq('testfile1.txt')
    end

    it "JSON data as input works too" do
      # Note: Can't send the binary as JSON
      params = {:app => valid_attributes}
      #post '/apps', params.to_json, format: :json
      post '/apps', params.to_json, {'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json'}
      latest_name = App.last.name
      App.destroy_all
      expect(latest_name).to eq(valid_attributes[:name])
    end
  end
end
