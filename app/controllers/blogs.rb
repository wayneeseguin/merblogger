class Blogs < Application

  provides :xml, :js, :yaml
  
  def index
    @blogs = Blog.all
    render @blogs
  end
  
  def show
    @blog = Blog[params[:id]]
    render @blog
  end
  
  def new
    only_provides :html
    @blog = Blog.new(params[:blog])
    render
  end
  
  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
      redirect url(:blog, @blog)
    else
      render :action => :new
    end
  end
  
  def edit
    only_provides :html
    @blog = Blog[params[:id]]
    render
  end
  
  def update
    @blog = Blog[params[:id]]
    if @blog.update(params[:blog])
      redirect url(:blog, @blog)
    else
      raise BadRequest
    end
  end
  
  def destroy
    @blog = Blog[params[:id]]
    if @blog.destroy
      redirect url(:blogs)
    else
      raise BadRequest
    end
  end

end
