class ArticleContent < Sequel::Model(:article_contents)
  set_schema do
    integer :article_id
    varchar :format           # textile, markdown
    text    :raw
    text    :html
  end
  
  # is :versioned # TODO: implement sequel_versioned
  # is :formatted # TODO: implement sequel_formatted
end