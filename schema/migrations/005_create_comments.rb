class CreateComments < Sequel::Migration

  def up
    create_table :comments do
      primary_key :id
      varchar     :name, :size => 32
      varchar     :title
      varchar     :name
      varchar     :website
      text        :body
    end
        
  end

  def down
    execute "DROP TABLE comments"
  end

end


