# There is a join table for authors <-> articles
# So that multiple people can author a single article
class ArticleAuthor < Sequel::Model(:articles_authors)
  set_schema do
    integer   :aritcle_id
    integer   :author_id
    timestamp :created_at
  end

  def author  ; User[author_id]   ; end
  def article ; Article[article_id] ; end
end
