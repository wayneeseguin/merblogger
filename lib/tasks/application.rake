namespace :app do

  task :environment do
    Merb.start_environment(
      :adapter => "runner", 
      :environment => (ENV["MERB_ENV"] || "development")
    )
  end

  namespace :generate do
    desc "Generate randomized test data."
    task :data => "app:environment" do
      require Merb.root / "spec" / "fixtures"
    end
  end

  namespace :load do
    desc "Load default users: admin & system with appropriate roles."
    task :default_users => "app:environment" do
      system = User.create!(:email => "system@merblogger.com", :password => "changeme", :password_confirmation => "changeme")
      master = User.create!(:email => "master@merblogger.com", :password => "changeme", :password_confirmation => "changeme")
      system_role = Role.create!(:name => "users:system")
      admin_role =  Role.create!(:name => "users:admin")
      UserRole.create!(:user => system, :role => system_role)
      UserRole.create!(:user => master, :role => admin_role)
    end
  end

  desc "Reload initial and test data (migrate down,up then load both datasets in)"
  task :reload => ["db:automigrate","app:load:default_users"]

end

