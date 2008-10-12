class Articles < Application
  provides :json

  def index
    @articles = Article.all
    display @articles
  end

  def show
    @article = Article.get(params[:id])
    raise NotFound unless @article
    display @article
  end

  def new
    only_provides :html
    @article = Article.new
    render
  end

  def edit
    only_provides :html
    @article = Article.get(params[:id])
    raise NotFound unless @article
    render
  end

  def create
    raise BadRequest, "No params passed to create a new object, check your new action view!" if params[:article].nil?
    @article = Article.new(params[:article])
    if @article.save
      redirect url(:article, @article)
    else
      render :new
    end
  end

  def update
    @article = Article.get(params[:id])
    raise NotFound unless @article
    if @article.update_attributes(params[:article]) || !@article.dirty?
      redirect url(:article, @article)
    else
      raise BadRequest
    end
  end

  def destroy
    @article = Article.get(params[:id])
    raise NotFound unless @article
    if @article.destroy
      redirect url(:articles)
    else
      raise BadRequest
    end
  end

end # Articles
