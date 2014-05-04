require 'spec_helper'

describe "Apps" do
  before do
    Capybara.current_driver = :webkit
  end
  let(:file1_path) { Rails.root.join('spec/fixtures/testfile1.txt') }
  let(:file1) { Rack::Test::UploadedFile.new(file1_path, 'text/plain') }
  let(:file2_path) { Rails.root.join('spec/fixtures/testfile2.txt') }
  let(:file2) { Rack::Test::UploadedFile.new(file2_path, 'text/plain') }

  it "uploads the binary to s3 for a new app" do
    app = create(:app, binary: file1)
    url = app.binary.url
    expect(File.basename(url)).to eq(File.basename(file1_path))
    visit url
    expect(page.status_code).to eq(200)
    app.destroy # Cleanup and destroy the S3 object
  end
  it "updates the binary on s3 on update app" do
    app = create(:app, binary: file1)
    url = app.binary.url
    expect(File.basename(url)).to eq(File.basename(file1_path))
    visit url
    expect(page.status_code).to eq(200)
    expect(File.read(file1_path)).to eq(page.body)
    app.update(binary: file2)
    url = app.binary.url
    visit url
    # NOTE: update does not change the filename in S3 so we need to verify the contents of the file
    # expect(File.basename(url)).to eq(File.basename(file2_path))
    expect(page.status_code).to eq(200)
    expect(File.read(file2_path)).to eq(page.body)
    app.destroy # Cleanup and destroy the S3 object
  end
  it "destroys the binary on s3 on destroy app" do
    app = create(:app, binary: file1)
    url = app.binary.url
    app.destroy # Cleanup and destroy the S3 object
    expect(File.basename(url)).to eq(File.basename(file1_path))
    visit url
    expect(page.status_code).to eq(403)
  end
end
