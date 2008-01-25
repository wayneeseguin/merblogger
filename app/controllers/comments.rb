class Comments < Application
  provides :xml, :js, :yaml
  
  def index
    @comments = Comment.all
    render @comments
  end
  
  def show
    @comment = Comment[params[:id]]
    render @comment
  end
  
  def new
    only_provides :html
    @comment = Comment.new(params[:comment])
    render
  end
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect url(:comment, @comment)
    else
      render :action => :new
    end
  end
  
  def edit
    only_provides :html
    @comment = Comment[params[:id]]
    render
  end
  
  def update
    @comment = Comment[params[:id]]
    if @comment.update(params[:comment])
      redirect url(:comment, @comment)
    else
      raise BadRequest
    end
  end
  
  def destroy
    @comment = Comment[params[:id]]
    if @comment.destroy
      redirect url(:comments)
    else
      raise BadRequest
    end
  end
end