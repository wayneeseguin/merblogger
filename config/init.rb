# Go to http://wiki.merbivore.com/pages/init-rb
 
require "config/dependencies.rb"

use_orm :datamapper
use_test :rspec
use_template_engine :erb

Merb::Config.use do |config|
  config[:use_mutex] = false
  config[:session_store] = "cookie"  # can also be "memory", "memcache", "container", "datamapper
  config[:session_secret_key]  = "1205346b9baa87cf8e49f78124c8d17a31ac0971"  # required for cookie session store
  config[:session_id_key] = "_merblogger" # cookie session id key, defaults to "_session_id"
end

Merb::BootLoader.before_app_loads do
  # This will get executed after dependencies have been loaded but before your app"s classes have loaded.
end

Merb::BootLoader.after_app_loads do
  # This will get executed after your app;s classes have been loaded.
end