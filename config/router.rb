Merb.logger.info("Compiling routes...")
Merb::Router.prepare do

  resources :blogs do |blog|
    blog.resources :articles do |article|
      article.resources :comments
    end
  end
  resources :articles
  resources :comments
  
  all_slices

  match('/').
    to(:controller => "blogs", :action => "index")

  slice(:MerbAuth, :name_prefix => nil, :path_prefix => nil)
  merb_auth_routes(:name_prefix => nil, :path_prefix => "")
    
end
