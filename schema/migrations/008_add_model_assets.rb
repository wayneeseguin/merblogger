# For details on Sequel migrations see 
# http://sequel.rubyforge.org/
# http://code.google.com/p/ruby-sequel/wiki/Migrations

class AddModelAssets < Sequel::Migration

  def up
    create_table :assets do
      primary_key :id
    end
  end

  def down
    execute "DROP TABLE assets"
  end

end
