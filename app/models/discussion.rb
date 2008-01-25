class Discussion < Sequel::Model(:discussions)

  set_schema do
    primary_key :id
    varchar     :title
    varchar     :state # spam, ...
    datetime    :created_at
    datetime    :updated_at
  end
  
  is :state_machine
  
  # = Relationships
  #   the relationships block allows for
  # * encapsulation so that we can easly store for future reflection on relationships
  # * grouping of relationships together for cleaner more maintainable code
  relationships do
    has :one, :discussion_content # looks up the table associated with the class DiscussionContent
  end

end
