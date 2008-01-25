# Relationship: 
#   <blogs> >=< <blogs_uris> >=< <uris>
#
# Any blog can have any urls
# blog.wayneseguin.us, wayne.overnothing.com -> my blog

class Blog < Sequel::Model(:blogs)
  set_schema do
      primary_key :id
      varchar     :name
      varchar     :title
      varchar     :tagline
      integer     :logo_id
      datetime    :created_at
      datetime    :updated_at
  end
  is :configurable
  # is :taggable 
end