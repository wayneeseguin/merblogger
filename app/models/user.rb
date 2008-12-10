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
