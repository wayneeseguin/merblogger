class User < Sequel::Model(:users)
  set_schema do
    primary_key   :id
    # varchar       :username
    varchar       :email
    varchar       :sekret # encrypted
    varchar       :salt
    integer       :active, :limit => 1, :default => 1
    timestamp     :created_at
    timestamp     :updated_at
    timestamp     :deleted_at
  end

  # requires, salt, password and email / username fields
  # is :authenticated,
  #   :identity => "email", # specify the identity field
  #   :password => "sekret" # specify which field encrypted password is to be stored in
  # RBAC == Role Based Access Control <= THE shit vv
  # is :rbac
  # is :user / :person ? Provide common methods for 'people' objects ?
end
