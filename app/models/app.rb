class App < ActiveRecord::Base
  validates :name, :description, :price, :author, :file_data, :file_name, :file_mime_type, :presence => true

  #before_save :upload_file
  #before_destroy :destroy_file

  #def upload_file
  #  file_hash = Digest::SHA1.hexdigest file_data
  #  f = File.new("public/files/#{author}_#{file_hash}", "w+b")
  #end
end
