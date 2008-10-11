# Merb.start_environment :adapter => "runner", :environment => ENV["MERB_ENV"]

desc "Reload initial and test data (migrate down,up then load both datasets in)"
task :reload => ["dm:db:migrate:down","dm:db:migrate:up","app:db:data:initial","app:db:data:test"]
