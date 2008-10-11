class Comments < Application
  # provides :xml, :yaml, :js

  def index
    @comments = Comment.all
    display @comments
  end

  def show
    @comment = Comment.get(params[:id])
    raise NotFound unless @comment
    display @comment
  end

  def new
    only_provides :html
    @comment = Comment.new
    render
  end

  def edit
    only_provides :html
    @comment = Comment.get(params[:id])
    raise NotFound unless @comment
    render
  end

  def create
    raise BadRequest, "No params passed to create a new object, check your new action view!" if params[:comment].nil?
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect url(:comment, @comment)
    else
      render :new
    end
  end

  def update
    @comment = Comment.get(params[:id])
    raise NotFound unless @comment
    if @comment.update_attributes(params[:comment]) || !@comment.dirty?
      redirect url(:comment, @comment)
    else
      raise BadRequest
    end
  end

  def destroy
    @comment = Comment.get(params[:id])
    raise NotFound unless @comment
    if @comment.destroy
      redirect url(:comments)
    else
      raise BadRequest
    end
  end

end # Comments
