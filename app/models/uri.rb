# Relationship: 
#   <blogs> >=< <blogs_uris> >=< <uris>

class URI < Sequel::Model(:uris)
  set_schema do
    primary_key :id
    varchar     :uri # blog.wayneseguin.us
  end

end