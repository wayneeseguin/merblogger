class UserRole
  include DataMapper::Resource

  property :user_id, Integer, :key => true
  property :role_id, Integer, :key => true

  belongs_to :user
  belongs_to :role
end
