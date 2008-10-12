task :merb_env do
  Merb.start_environment :adapter => "runner", :environment => (ENV["MERB_ENV"] || "development")
end

namespace :app do
  namespace :generate do
    desc "Load randomized test data."
    task :data => :merb_env do
      require Merb.root / "spec" / "fixtures"
    end
  end
  desc "Load admin & system users with appropriate roles."
  task :load_admin_user do
    Merb.start_environment :adapter => "runner", :environment => ENV["MERB_ENV"] || "development"
    system = User.create!(:login => "system@merblogger.com", :password => "changeme", :password_confirmation => "changeme")
    master = User.create!(:login => "master@merblogger.com", :password => "changeme", :password_confirmation => "changeme")
    system_role = Role.create!(:name => "users:system")
    admin_role = Role.create!(:name => "users:admin")
    UserRole.create!(:user => system, :role => system_role)
    UserRole.create!(:user => master, :role => admin_role)
  end
  
  desc "Reload initial and test data (migrate down,up then load both datasets in)"
  task :reload => ["db:migrate:down","db:migrate:up", "app:load_admin_user"]
end
