class Content < Sequel::Model(:contents)

  set_schema do
    primary_key :id
    integer     :article_id
    integer     :post_id
    varchar     :format     # textile, markdown
    text        :raw
    text        :html
    varchar     :type
  end
  
  is :versioned
  is :formatted

end

# http://pastie.textmate.org/private/ljjyietmt3gsj0xpqebkrg

# Also added a piece to article.rb

class DiscussionContent < Content

  relationships do
    belongs_to :one, :discussion
  end

end

class ArticleContent < Content
  relationships do
    belongs_to :one, :article
  end
end

# is :hierarchy   # STI
# is :polymorphic # supplies the same polymorphic mechanisms as AR

# As for how they are related, we should stick with join tables I think.
# discussions >=< contents_discussions >=< DiscussionContent(:contents)
# articles >=< articles_contents >=< ArticleContent(:contents)

# joins can get you two things.
# * many many
# * (efficient!) polymorphic associations. 

