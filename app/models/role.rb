class Role
  include DataMapper::Resource
  
  property :id,   Serial, :key => true
  property :name, String, :length => 255

  has n, :role_permissions
  has n, :permissions, :through => :role_permissions


end
