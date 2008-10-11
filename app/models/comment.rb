class Comment
  include DataMapper::Resource
  
  property :id,           Integer, :serial => true
  property :article_id,   Integer, :serial => true
  property :title,        String,  :length => 255
  property :email,        String,  :length => 255
  property :alias,        String,  :length => 255
  property :gravatar_url, String,  :length => 255
  property :markup,       String
  property :raw,          Text
  property :html,         Text
  
  belongs_to :article

  validates_present :raw
  validates_present :title
  
  validates_with_block :raw do
    begin
      if markup == "textile"
        self.html = RedCloth.new(@raw).to_html
      elsif markup == "markdown"
        self.html = BlueCloth.new(@raw).to_html
      elsif markup == "plain"
        self.html = "<pre>#{@raw}</pre>"
      else
        return [false, "No markup was specified."]
      end
    rescue Exception => e
      return [false, e.message]
    end
    true
  end
end
