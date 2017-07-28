if Rails.env.development?
  Rails.logger.info 'Running yarn...'
  system 'bin/yarn >> /dev/null'
end
