class Articles < Application
  provides :json
  does_not_provide :html

  def index
    if params[:blog_id]
      @blog = Blog.get(params[:blog_id])
      @articles = @blog.articles
    else
      @articles = Article.all
    end
    display @articles.map{|article|article.to_hash}
  end

  def show
    @article = Article.get(params[:id])
    raise NotFound unless @article
    display @article
  end

  def new
    @article = Article.new
    display @article
  end

  def edit
    @article = Article.get(params[:id])
    raise NotFound unless @article
    display @article
  end

  def create
    raise BadRequest, "No params passed to create a new object, check your new action view!" if params[:article].nil?
    @article = Article.new(params[:article])
    if @article.save
      display @article
    else
      display Hash.new(:status => "error", :errors => @article.errors.to_a)
    end
  end

  def update
    @article = Article.get(params[:id])
    authors = params[:authors]
    tags = params[:tags]

    published_at = params[:article].delete(:published_at)
    unless params[:published_at].blank?
      params[:article][:published_at] = DateTime.parse(published_at)
    end
    
    raise NotFound unless @article
    
    if @article.update_attributes(params[:article]) || !@article.dirty?
      display @article
    else
      raise BadRequest
    end
  end
  
  def destroy
    @article = Article.get(params[:id])
    raise NotFound unless @article
    if @article.destroy
      display Hash.new(:status => "ok", :id => params[:id])
    else
      raise BadRequest
    end
  end

end # Articles
