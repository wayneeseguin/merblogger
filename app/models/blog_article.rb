class BlogArticle
  include DataMapper::Resource
  
  property :id, Integer, :serial => true
  
  belongs_to :blog
  belongs_to :article # WTF?

end
