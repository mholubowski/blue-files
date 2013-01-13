CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    # aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    aws_access_key_id: "AKIAIHDQQ3EQBT7XQG4Q",
    # aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    aws_secret_access_key: "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"
  }
  # config.fog_directory = ENV["AWS_S3_BUCKET"]
  config.fog_directory = "blue-files-1"

end