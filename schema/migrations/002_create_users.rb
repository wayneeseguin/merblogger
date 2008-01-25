class CreateUsers < Sequel::Migration

  def up
    create_table :users do
      primary_key :id
      varchar     :email
      varchar     :password
      varchar     :salt
      datetime    :created_at
      datetime    :updated_at
    end
  end
  
  def down
    execute "DROP TABLE users"
  end

end
