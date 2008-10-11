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

      column :version,      Integer
      column :title,        String, :length => 255
      column :sub_title,    String, :length => 255
      column :slug,         DataMapper::Types::Slug, :length => 255 # Will store an SEO friendly slug
      column :state,        String, :length => 16, :default => "draft" # we'll use state_machine on this
      column :parent_id,    Integer   # eg. 4 part series of related articles.    
      column :rating,       Integer   # how good of a Article the user thinks it is 1..10
      column :publised_at,  DateTime  # Allow them to set publish date
      column :markup,       String, :length => 32

      column :raw,          DataMapper::Types::Text
      column :html,         DataMapper::Types::Text

      column :created_at,      DateTime
      column :updated_at,      DateTime
      column :deleted_at,      DateTime
      column :published_by_id, Integer
      column :created_by_id,   Integer
      column :updated_by_id,   Integer
      column :deleted_by_id,   Integer
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

    create_table :blog_articles do
      column :blog_id, Integer, :key => true
      column :article_id,  Integer, :key => true
      column :created_at, Time
    end

    create_table :article_authors do
      column :article_id, Integer, :key => true
      column :author_id,  Integer, :key => true
      column :created_at, Time
    end
    
    create_table :comments do
      column :id,           Integer, :serial => true
      column :title,        String,  :length => 255
      column :email,        String,  :length => 255
      column :alias,        String,  :length => 255
      column :gravatar_url, String,  :length => 255
      column :raw,          DataMapper::Types::Text
      column :html,         DataMapper::Types::Text
    end

    create_table :users do
      column :id,               Integer, :serial => true
      column :login,            String, :length => 255
      column :crypted_password, String
      column :salt,             String
      column :created_by_id,    Integer
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
    [:articles,:article_authors,:comments,:admin_preferences,:user_preferences,:blogs, :blog_articles,:users].each do |table_name|
      begin
        drop_table table_name
      rescue Exception => e
        puts e.inspect
      end
    end
  end
end
