# This is a default user class used to activate merb-auth.  Feel free to change from a User to 
# Some other class, or to remove it altogether.  If removed, merb-auth may not work by default.
#
# Don't forget that by default the salted_user mixin is used from merb-more
# You'll need to setup your db as per the salted_user mixin, and you'll need
# To use :password, and :password_confirmation when creating a user
#
# see merb/merb-auth/setup.rb to see how to disable the salted_user mixin
#
# You will need to setup your database and create a user.
class User

  include DataMapper::Resource

  property :id,               Serial, :key => true
  property :email,            String
  property :crypted_password, String
  property :salt,             String
  property :gravatar,         String

  has n, :user_roles
  has n, :roles, :through => :user_roles

  attr_accessor :password
  attr_accessor :password_confirmation

  def role_names; roles.map{|r| r.name}; end

  def permissions; roles.inject([]){|a,r| a + r.permissions}; end

  def permission_names; permissions.map{|p| p.name}; end


end
