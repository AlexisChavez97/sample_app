if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIAJBUEKT5MSIMHTP5Q',
      aws_secret_access_key: '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',
      region:                'us-east-2'
    }

    config.fog_directory  = 'meme-reviews'
    config.fog_public     = false
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  end
end
