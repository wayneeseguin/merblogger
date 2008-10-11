class Blogs < Application
  # provides :xml, :yaml, :js

  def index
    @blogs = Blog.all
    display @blogs
  end

  def show
    @blog = Blog.get(params[:id])
    raise NotFound unless @blog
    display @blog
  end

  def new
    only_provides :html
    @blog = Blog.new
    render
  end

  def edit
    only_provides :html
    @blog = Blog.get(params[:id])
    raise NotFound unless @blog
    render
  end

  def create
    raise BadRequest, "No params passed to create a new object, check your new action view!" if params[:blog].nil?
    @blog = Blog.new(params[:blog])
    if @blog.save
      redirect url(:blog, @blog)
    else
      render :new
    end
  end

  def update
    @blog = Blog.get(params[:id])
    raise NotFound unless @blog
    if @blog.update_attributes(params[:blog]) || !@blog.dirty?
      redirect url(:blog, @blog)
    else
      raise BadRequest
    end
  end

  def destroy
    @blog = Blog.get(params[:id])
    raise NotFound unless @blog
    if @blog.destroy
      redirect url(:blogs)
    else
      raise BadRequest
    end
  end

end # Blogs
