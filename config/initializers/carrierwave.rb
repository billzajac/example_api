# This is a more targeted install
require 'fog/aws/storage'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIRJNI3ZBGMFX745A',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'us-west-2',                  # optional, defaults to 'us-east-1'
    #:host                   => 's3.example.com',             # optional, defaults to nil
    #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'oculus-app-store'                     # required
  #config.fog_public     = false                                   # optional, defaults to true # NEED THIS TRUE FOR DIRECT DOWNLOADS
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
