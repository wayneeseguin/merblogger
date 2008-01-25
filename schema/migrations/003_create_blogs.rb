class CreateBlogs < Sequel::Migration

  def up
    create_table :blogs do
      primary_key :id
      varchar     :name
      varchar     :title
      datetime    :created_at
      datetime    :updated_at
    end
  end

  def down
    execute "DROP TABLE blogs"
  end

end
