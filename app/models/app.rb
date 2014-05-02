class App < ActiveRecord::Base
  validates :name, :description, :price, :author, :file_id, :presence => true
end
