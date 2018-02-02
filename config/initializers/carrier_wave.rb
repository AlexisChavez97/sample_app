if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIAJYZQJL45B6B3WCQA',
      aws_secret_access_key: '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',
      region:                'us-east-2'
    }

    config.fog_directory  = 'meme-reviews'
    config.fog_public     = false
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  end
end
