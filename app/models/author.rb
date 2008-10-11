class Author
  include DataMapper::Resource
  
  property :article_id, Integer, :key => true
  property :author_id,  Integer, :key => true
  property :created_at, Time

  belongs_to :user
  belongs_to :article
end
