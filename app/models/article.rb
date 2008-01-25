class Article < Sequel::Model(:articles)
#authorize opening?
  set_schema do
    primary_key :id
    varchar     :title
    varchar     :sub_title
    integer     :parent_id   # eg. 4 part series of related articles.    
    varchar     :slug        # Will store an SEO friendly slug
    integer     :rating      # how good of a Article the user thinks it is 1..10
    varchar     :state       # we'll use state_machine on this
    datetime    :publised_at # Allow them to set publish date
    datetime    :created_at
    datetime    :updated_at
    datetime    :deleted_at
  end

  # ==== Parameters  
  # format:<Symbol>
  def content(format)
    return html if [:html,"html"].include?(format)
    raw
  end
  
  is :validatable
  # is :ratable        # requires a 'rating' column, a cached result of votes
  # is :permalinkable  # requires a 'slug' column
  # is :state_machine  # requires a 'state' column
  # is :attachable     # allows you to attach uploaded files?
  #   <articles> >=< <articles_attachments> >=< <attachments>
  #   The apply method will check if the join table existed
  #   and create it. You don't use a model, just a join table.
  # is :taggable 

  relationships do
    has :one, :article_content
  end
  
  validates do
    presence_of :title
    uniqueness_of :slug # This will probably go in the permalinkable plugin
  end
  
end