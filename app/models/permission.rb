class Permission
  include DataMapper::Resource
  
  property :id,   Serial, :key => true
  property :name, String, :length => 255


end
