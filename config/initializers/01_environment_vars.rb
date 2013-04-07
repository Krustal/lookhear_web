if Rails.env.test? || Rails.env.development?
  ENV['AWS_ACCESS_KEY_ID'] = 'AKIAISLSU7SVRHOOJ3XQ'
  ENV['AWS_SECRET_ACCESS_KEY'] = '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'
  ENV['S3_BUCKET_NAME'] = 'lookhear'
end