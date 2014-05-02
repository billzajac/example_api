require 'spec_helper'

describe App do
  it "has a valid factory" do
    expect(build(:app)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:app, name: nil)).not_to be_valid
  end

  it "is invalid without a description" do
    expect(build(:app, description: nil)).not_to be_valid
  end

  it "is invalid without a author" do
    expect(build(:app, author: nil)).not_to be_valid
  end

  it "is invalid without a price" do
    expect(build(:app, price: nil)).not_to be_valid
  end

  it "is invalid without a file_name" do
    expect(build(:app, file_name: nil)).not_to be_valid
  end

  it "is invalid without a file_data" do
    expect(build(:app, file_data: nil)).not_to be_valid
  end

  it "is invalid without a file_mime_type" do
    expect(build(:app, file_mime_type: nil)).not_to be_valid
  end
end
