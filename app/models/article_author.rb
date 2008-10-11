class ArticleAuthor
  include DataMapper::Resource
  
  property :id, Integer, :serial => true
  
  belongs_to :article
  belongs_to :author, :class_name => "User", :child_key => [:author_id]
  
end
