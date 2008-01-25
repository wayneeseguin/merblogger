class Post < Sequel::Model(:posts)

  set_schema do
    primary_key :id
    varchar     :title
    varchar     :state # spam, ...
    datetime    :created_at
    datetime    :updated_at
  end
  
  #is :formatted
end


class PostContent < Content
  set_schema do
  end

  is :formatted
end
