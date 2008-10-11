class User
  include DataMapper::Resource
  
  property :id,               Integer
  property :login,            String
  property :crypted_password, String
  property :salt,             String
  
end
