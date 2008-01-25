# Example:
# steps_for(:accounts) do
#   Given("my $account_type account balance is $amount") do |account_type, amount|
#     create_account(account_type, amount)
#   end
#   When("I transfer $amount from $source_account to $target_account") do |amount, source_account, target_account|
#     get_account(source_account).transfer(amount).to(get_account(target_account))
#   end
#   Then("my $account_type account balance should be $amount") do |account_type, amount|
#     get_account(account_type).should have_a_balance_of(amount)
#   end
# end


An Admin who chooses to login
* can manage the aggregator settings
* can adjust global blog application settings, including domains
* can manage blogs, including domains
* can add users to blogs
* gets all rights on all blogs and all areas of the application
* can unpublish aggregated stories from aggregated blog

A user who chooses to login 
* will be authenticated using http auth! (the way it was meant to be)
* will post to /sessions, success reloads page with priveliged items.

A user who chooses to logout
* Will destroy the session and reload the ENTIRE view (eg. privileged items disappear)

A user who has a blog and wants to edit their settings
* can specify whether or not use capatcha's for comments
* can specify whether or they want to monitor comments
* can set theming css, possibly choose from a few layouts
* can upload assets using the merb_assets plugin
* can activate/install/uninstall modules that can be plugged into their themes. 
* can search all aggregate posts

A visitor who visits the aggregator blog
* sees a list of the blog posts for the aggregator blog, in a summary form. 
* can click to view the full posting inline
* click a link to take them to view the entire post within the posters blog.
* can get an rss 2 feed of the aggregated posts

A visitor who visits an individual user's blog 
* can see a list of the blog posts for each individual blog
* can see an individual blog post for each individual blog
* can comment on and individual blog post, provided they supply name, email, website (optional) and body (some sort of antispam measures later on)
* can get an rss feed of each the blog posts
* can search the current blog's posts 


Infrastructure / Architecture concepts:
* will go to the url and the application will load entirely all html + js for the given blog.
* Initial page load is only large load, from then on there are no full server hits.
* All interaction will be between controller actions and jQuery via JSON.
* This will ensure that the users UI experience will be very fast and seemless.
* We will keep controllers lightweight and use declaritive "bitch do my bidding" methods on model objects to drive actual work. All business logic will go in the models.
* We will use Sequel's memcachd feature
* We will hookup sphinx for awesome searching capabilities for the blog. 


$.getJSON("url", function(json) { // json is a regular JS object, so use it! })

Merb PLUGINS:

merb_assets plugin
* provides an API to manage assets
* can specify filesystem or S3 in config. 

merb_sphinx plugin
* SIMPLE config api

merb_authentication_station =D EY reference ;)

merb_forum

I'm thinking that once this is running in Merb, we can write some Anvil app that interfaces with a server version of it
So people can blog locally and "push" to server when online.


