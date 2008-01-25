set :domain,     "blog.wayneseguin.us"
set :deploy_to,  "/home/wayne/blog"
set :repository, "https://secure.svnrepository.com/s_wayne/merb_sequel_jquery_blog/trunk"
set :user,       "wayne"
set :use_sudo,   false

namespace :production do
  namespace :merb do

    desc "Release the hounds"
    remote_task :start, :roles => :app do
      run mongrel("cd #{deploy_to}/current && merb -d")
    end

    desc "Reap the hounds"
    remote_task :stop, :roles => :app do
      run mongrel("cd #{deploy_to}/current && ./script/stop_merb")
    end

    desc "Reap the hounds"
    remote_task :restart, :roles => :app do
      stop
      start
    end
  end
end
