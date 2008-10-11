# Merb.start_environment :adapter => "runner", :environment => ENV["MERB_ENV"]

namespace :app do
  desc "Reload initial and test data (migrate down,up then load both datasets in)"
  task :reload => ["db:migrate:down","db:migrate:up"]#,"app:db:data:initial","app:db:data:test"]
end