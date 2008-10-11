class Comment
  include DataMapper::Resource
  
  property :id,           Integer, :serial => true
  property :title,        String,  :length => 255
  property :email,        String,  :length => 255
  property :alias,        String,  :length => 255
  property :gravatar_url, String,  :length => 255
  property :raw,          Text
  property :html,         Text
  
  belongs_to :article

end
