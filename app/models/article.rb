class Article
  include DataMapper::Resource

  #############################################################################
  # Properties
  #############################################################################
  property :id,              Integer,  :serial => true
  property :version,         Integer
  property :title,           String,   :length => 255
  property :sub_title,       String,   :length => 255
  property :slug,            Slug,     :length => 255, :index => true # Will store an SEO friendly slug
  property :state,           String,   :length => 16  # we'll use state_machine on this
  property :parent_id,       Integer   # eg. 4 part series of related articles.    
  property :rating,          Integer   # how good of a Article the user thinks it is 1..10
  property :published_at,    DateTime  # Allow them to set publish date
  property :markup,          String,   :length => 32
  property :raw,             Text
  property :html,            Text
  property :created_at,      DateTime, :index => true
  property :updated_at,      DateTime, :index => true
  property :deleted_at,      DateTime, :index => true
  property :published_by_id, Integer,  :index => true
  property :created_by_id,   Integer,  :index => true
  property :updated_by_id,   Integer,  :index => true
  property :deleted_by_id,   Integer,  :index => true
  
  # is :versioned, version
  
  #############################################################################
  # Relationships
  #############################################################################
  is :polymorphic, :created_by
  is :polymorphic, :updated_by
  is :polymorphic, :deleted_by

  has n, :comments
  has n, :blog_articles
  has n, :blogs, :through => :blog_articles
  has n, :article_authors
  has n, :authors, :through => :article_authors

  def to_hash
    self.attributes.merge(
    :authors => self.authors.map{|a| Hash.new(:name => a.login, :id => a.id)},
    :blogs => self.blogs.map{|b| Hash.new(:name => b.name, b.id)}
    )
  end

  #############################################################################
  # Validations
  #############################################################################
  validates_present :raw
  validates_present :title
  
  #validates_within :markup,  :set => Formatter.formatters, :if => Proc.new {|m| m.send(:published?)}
  #validates_format :slug,    :with => /^[a-z0-9-]+$/,      :if => Proc.new {|m| m.send(:published?)}
  #validates_block  :html,    :logic  => Proc.new{|m| m.formatted_body != FORMATTING_ERROR }, 

  validates_with_block :raw do
    begin
      if markup == "textile"
        self.html = RedCloth.new(@raw).to_html
      elsif markup == "markdown"
        self.html = BlueCloth.new(@raw).to_html
      elsif markup == "plain"
        self.html = "<pre>#{@raw}</pre>"
      else
        [false, "No markup was specified."]
      end
      true
    rescue Exception => e
      [false, e.message]
    end
  end

  #############################################################################
  is_state_machine  
  #############################################################################
  States = %w(draft preview published archived deleted)
  
  is :state_machine, :initial => :draft, :column => :state do
    state :draft,     :enter => Proc.new { |entity| entity.change_state(:draft) }
    state :preview,   :enter => Proc.new { |entity| entity.change_state(:preview) }
    state :published, :enter => Proc.new { |entity| entity.change_state(:published) }
    state :archived,  :enter => Proc.new { |entity| entity.change_state(:archived) }
    state :deleted,   :enter => Proc.new { |entity| entity.change_state(:deleted) }
  
    # This should be triggered automatically when someone first saves an article.
    #event :start do
    #  transition :from => :draft,  :to => :preview
    #end
    
    event :publish do
      transition :from => :draft,     :to => :published
      transition :from => :preview,   :to => :published
    end
    
    event :preview do
      transition :from => :draft,     :to => :preview
    end
    
    event :archive do
      transition :from => :draft,     :to => :archived
      transition :from => :preview,   :to => :archived
      transition :from => :published, :to => :archived
    end
    
    event :unarchive do
      transition :from => :archived, :to => :published
    end
    
    event :delete do
      transition :from => :draft,     :to => :deleted
      transition :from => :preview,   :to => :deleted
      transition :from => :published, :to => :deleted
    end
    
  end
  
  # When we change state we run these call backs
  def change_state(state)
    # TODO: audit logging of state changes.
    case state
    when "draft"
      Merb.logger.info "draft"
    when "preview"
      Merb.logger.info "preview"
    when "published"
      #self.deleted_by = current_user
      #self.update_attributes(:published_by => current_user.id) if current_user
    when "archived"
    when "deleted"
      #self.deleted_by = current_user
      #self.update_attributes(:deleted => current_user.id) if current_user
    end
    #self.updated_by = current_user
    #hash.merge(:updated_by => current_user.id) if current_user

    # Because we are using the block this is required.
    # The block is used for rejecting the state if necessary, here we are 
    # using it for adding accountability.
    self.update_attributes(:state => state)
    self.reload
  end
    
  def current_user
    @current_user ||= (User.find(Merb::Session[:user_id]) rescue 2) # Default to the admin user.
  end
end
