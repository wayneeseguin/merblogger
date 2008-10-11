class Article
  include DataMapper::Resource
  
  property :id, Integer, :serial => true
  
  property :title        String, :length => 255
  property :sub_title    String, :length => 255
  property :slug         Slug,   :length => 255 # Will store an SEO friendly slug
  property :state        String, :length => 16  # we'll use state_machine on this
  property :parent_id    Integer   # eg. 4 part series of related articles.    
  property :rating       Integer   # how good of a Article the user thinks it is 1..10
  property :publised_at  DateTime  # Allow them to set publish date
  
  property :raw,         Text
  property :html,        Text

  # Accountability
  property :created_at   DateTime
  property :updated_at   DateTime
  property :deleted_at   DateTime
  property :published_by Integer
  property :created_by   Integer
  property :updated_by   Integer
  property :deleted_by   Integer

  is :polymorphic, :created_by
  is :polymorphic, :updated_by
  is :polymorphic, :deleted_by

  has n, :authors
  has n, :comments
  has 1, :blog
  
  validates_with_block :raw do
    if markup == "textile"
      self.html = RedCloth.new(@raw).to_html
    elsif markup == "markdown"
      self.html = BlueCloth.new(@raw).to_html
    else
      return [false, "No content was supplied."]
    end
    true
  end

end
