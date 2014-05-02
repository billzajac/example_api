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

  it "is invalid without a file_id" do
    expect(build(:app, file_id: nil)).not_to be_valid
  end
end
