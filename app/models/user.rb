class User
  Merb::Authentication.user_class = self
  include DataMapper::Resource
  property :id,               Serial, :key => true
  property :login,            String
  property :crypted_password, String
  property :salt,             String
  
end
