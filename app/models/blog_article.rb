class BlogArticle
  include DataMapper::Resource
  
  property :blog_id,    Integer, :key => true
  property :article_id, Integer, :key => true
  
  belongs_to :blog
  belongs_to :article # WTF?

end
