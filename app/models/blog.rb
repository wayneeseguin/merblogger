class Blog
  include DataMapper::Resource
  
   property :id,          Integer, :serial => true
   property :name,        String, :length => 32
   property :title,       String, :length => 128
   property :tagline,     String, :length => 255
   property :logo_id,     Integer 
   property :created_at,  DateTime
   property :updated_at,  DateTime

   has n, :blog_articles # Each co-author can have the article in their blog!
   has n, :articles, :through => :blog_articles
end
