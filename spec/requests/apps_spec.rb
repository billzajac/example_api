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
  it "uploads the binary to s3 for a new app" do
    #post new_app_path, {:app => valid_attributes}, valid_session
    post '/apps', {:app => valid_attributes}
    url = App.first.binary.url
    App.destroy_all
    expect(File.basename(url)).to eq('testfile1.txt')
  end
end
