class RolePermission
  include DataMapper::Resource

  property :role_id,       Integer, :key => true
  property :permission_id, Integer, :key => true

  belongs_to :role
  belongs_to :permission
end
