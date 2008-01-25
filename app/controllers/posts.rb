class Posts < Application
  
  provides :xml, :js, :yaml, :json # our primary!
  
  def index
    @posts = Post.all
    render @posts
  end
  
  def show
    @post = Post[params[:id]]
    render @post
  end
  
  def new
    only_provides :html
    @post = Post.new(params[:post])
    render
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect url(:post, @post)
    else
      render :action => :new
    end
  end
  
  def edit
    only_provides :html
    @post = Post[params[:id]]
    render
  end
  
  def update
    @post = Post[params[:id]]
    if @post.update(params[:post])
      redirect url(:post, @post)
    else
      raise BadRequest # no doughnut
    end
  end
  
  def destroy
    @post = Post[params[:id]]
    if @post.destroy
      redirect url(:posts)
    else
      raise BadRequest # no doughnut
    end
  end

end