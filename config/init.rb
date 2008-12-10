# Go to http://wiki.merbivore.com/pages/init-rb
 
require "config/dependencies.rb"
 
use_orm :datamapper
use_test :rspec
use_template_engine :erb
 
Merb::Config.use do |config|
  config[:use_mutex] = false
  config[:session_store] = "cookie"  # can also be "memory", "memcache", "container", "datamapper
  config[:session_secret_key]  = "459ae1cfccd06dc1facd90d257d02c6bb46365a6"
  config[:session_id_key] = "_merblogger" 
end
 
Merb::BootLoader.before_app_loads do
  # This will get executed after dependencies have been loaded but before your app"s classes have loaded.
end
 
Merb::BootLoader.after_app_loads do
  # This will get executed after your app"s classes have been loaded.
end
