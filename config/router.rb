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

  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")
end
