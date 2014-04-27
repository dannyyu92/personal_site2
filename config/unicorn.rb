require 'sidekiq'

# Sidekiq concurrency set to 2
before_fork do |server, worker|
   @sidekiq_pid ||= spawn("bundle exec sidekiq -c 2")
end

# 3 unicorn worker processes
worker_processes 3

# Redis configs
after_fork do |server, worker|
  Sidekiq.configure_client do |config|
    config.redis = { :size => 1 }
  end
  Sidekiq.configure_server do |config|
    config.redis = { :size => 5 }
  end
end