class App < ActiveRecord::Base
  validates :name, :description, :price, :author, :presence => true
  mount_uploader :binary, BinaryUploader

  #before_save :upload_file
  #before_destroy :destroy_file

  #def upload_file
  #  file_hash = Digest::SHA1.hexdigest file_data
  #  f = File.new("public/files/#{author}_#{file_hash}", "w+b")
  #end
end
