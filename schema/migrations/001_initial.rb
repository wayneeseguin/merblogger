# If you are having trouble migrating down then do this in the database before migrating down:
# insert into migration_info (migration_name) VALUES ('initial');
# reset via:
# rake app:reload
# or
# rake db:migrate:down ; rake db:migrate:up

include DataMapper::Types
migration(1, :initial) do
  up do
    create_table :articles do
      column :id, Integer, :serial => true

      column :version,      Integer
      column :title,        String, :size => 255
      column :sub_title,    String, :size => 255
      column :slug,         Slug, :size => 255 # Will store an SEO friendly slug
      column :state,        String, :size => 16, :default => "draft" # we'll use state_machine on this
      column :parent_id,    Integer   # eg. 4 part series of related articles.    
      column :rating,       Integer   # how good of a Article the user thinks it is 1..10
      column :publised_at,  DateTime  # Allow them to set publish date
      column :markup,       String, :size => 32

      column :raw,          Text
      column :html,         Text

      column :created_at,         DateTime
      column :updated_at,         DateTime
      column :deleted_at,         DateTime
      column :published_by_id,    Integer
      column :created_by_id,      Integer
      column :updated_by_id,      Integer
      column :deleted_by_id,      Integer
      column :created_by_class,   String, :size => 16
      column :updated_by_class,   String, :size => 16
      column :deleted_by_class,   String, :size => 16
    end

    create_table :blogs do
      column :id,          Integer, :serial => true
      column :name,        String,  :size => 32
      column :title,       String,  :size => 128
      column :tagline,     String,  :size => 128
      column :logo_id,     Integer 
      column :created_at,  DateTime
      column :updated_at,  DateTime
    end

    create_table :blog_articles do
      column :blog_id,    Integer, :key => true
      column :article_id, Integer, :key => true
      column :created_at, Time
    end

    create_table :article_authors do
      column :article_id, Integer, :key => true
      column :author_id,  Integer, :key => true
      column :created_at, Time
    end
    
    create_table :comments do
      column :id,           Integer, :serial => true
      column :article_id,           Integer
      column :title,        String,  :size => 255
      column :email,        String,  :size => 255
      column :alias,        String,  :size => 255
      column :gravatar_url, String,  :size => 255
      column :markup,       String,  :size => 32
      column :raw,          Text
      column :html,         Text
    end
    
    create_table :users do
      column :id,               Integer, :serial => true
      column :login,            String, :size => 255
      column :crypted_password, String, :size => 50
      column :salt,             String, :size => 50
    end

    #
    # User & Admin Preferences
    #
    create_table :admin_preferences do
      column :user_id, String, :size => 18, :key => true
      column :hash, Text
    end

    create_table :user_preferences do
      column :user_id, String, :size => 18, :key => true
      column :hash, Text
    end

    create_table :roles do
      column :id,   Serial, :key => true
      column :name, String, :size => 255
    end

    create_table :permissions do
      column :id,   Serial, :key => true
      column :name, String, :size => 255
    end
    
    create_table :user_roles do
      column :user_id, Integer
      column :role_id, Integer
    end

    create_table :role_permissions do
      column :role_id,       Integer
      column :permission_id, Integer
    end
  end

  down do
    [:articles,:article_authors,:comments,:admin_preferences,:user_preferences,:blogs, :blog_articles,:users,:roles, :permissions, :user_roles, :role_permissions].each do |table_name|
      begin
        drop_table table_name
      rescue Exception => e
        puts e.inspect
      end
    end
  end
end
