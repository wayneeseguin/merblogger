class CreatePosts < Sequel::Migration

  def up
    create_table :posts do
      primary_key :id
      varchar     :title
      varchar     :format # textile, markdown
      text        :body
      datetime    :created_at
      datetime    :updated_at
    end        
  end

  def down
    execute "DROP TABLE posts"
  end

end


