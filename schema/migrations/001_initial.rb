# If you are having trouble migrating down then do this in the database before migrating down:
# insert into migration_info (migration_name) VALUES ('initial');
# reset via:
# rake app:reload
# or
# rake dm:db:migrate:down ; rake dm:db:migrate:up

migration(1, :initial) do
  up do
    create_table :articles do
      column :id, Integer, :serial => true

      column :title,        String, :length => 255
      column :sub_title,    String, :length => 255
      column :slug,         String, :length => 255 # Will store an SEO friendly slug
      column :state,        String, :length => 16  # we'll use state_machine on this
      column :parent_id,    Integer   # eg. 4 part series of related articles.    
      column :rating,       Integer   # how good of a Article the user thinks it is 1..10
      column :publised_at,  DateTime  # Allow them to set publish date

      column :created_at,   DateTime
      column :updated_at,   DateTime
      column :deleted_at,   DateTime
      column :published_by, Integer
      column :created_by,   Integer
      column :updated_by,   Integer
      column :deleted_by,   Integer
    end

    create_table :blogs do
      column :id,          Integer, :serial => true
      column :name,        String,  :length => 32
      column :title,       String,  :length => 128
      column :tagline,     String
      column :logo_id,     Integer 
      column :created_at,  DateTime
      column :updated_at,  DateTime
    end
    create_table :authors
      property :article_id, Integer, :key => true
      property :author_id,  Integer, :key => true
      property :created_at, Time
    end
    
    create_table :comments
      column :id,           Integer, :serial => true
      column :title,        String,  :length => 255
      column :email,        String,  :length => 255
      column :alias,        String,  :length => 255
      column :gravatar_url, String,  :length => 255
      column :raw,          Text
      column :html,         Text
    end

    #
    # User & Admin Preferences
    #
    create_table :admin_preferences do
      column :user_id, String, :size => 18, :key => true
      column :hash, DataMapper::Types::Text
    end

    create_table :user_preferences do
      column :user_id, String, :size => 18, :key => true
      column :hash, DataMapper::Types::Text
    end
    
  end

  down do
    [:articles,:authors,:comments,:admin_preferences,:user_preferences,:blogs].each do |table_name|
      begin
        drop_table table_name
      rescue Exception => e
        puts e.inspect
      end
    end
  end
end

