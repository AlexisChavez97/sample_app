if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAIBWRYS44B7NTDZ4Q'],
      :aws_secret_access_key => ENV['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']

    }
    config.fog_directory     =  ENV['meme-reviews']
  end
end
