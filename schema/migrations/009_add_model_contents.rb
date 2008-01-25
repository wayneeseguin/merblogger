# For details on Sequel migrations see 
# http://sequel.rubyforge.org/
# http://code.google.com/p/ruby-sequel/wiki/Migrations

class AddModelContents < Sequel::Migration

  def up
    create_table :contents do
      primary_key :id
    end
  end

  def down
    execute "DROP TABLE contents"
  end

end
