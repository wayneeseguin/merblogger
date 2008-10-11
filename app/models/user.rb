class User
  Merb::Authentication.user_class = self
  include DataMapper::Resource
  property :id,               Serial, :key => true
  property :login,            String
  property :crypted_password, String
  property :salt,             String

  has n, :user_roles
  has n, :roles, :through => :user_roles

  def role_names; roles.map{|r| r.name}; end
  
end
