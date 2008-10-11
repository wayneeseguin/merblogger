class Authors < Application
  # provides :xml, :yaml, :js

  def index
    @authors = Author.all
    display @authors
  end

  def show
    @author = Author.get(params[:id])
    raise NotFound unless @author
    display @author
  end

  def new
    only_provides :html
    @author = Author.new
    render
  end

  def edit
    only_provides :html
    @author = Author.get(params[:id])
    raise NotFound unless @author
    render
  end

  def create
    raise BadRequest, "No params passed to create a new object, check your new action view!" if params[:author].nil?
    @author = Author.new(params[:author])
    if @author.save
      redirect url(:author, @author)
    else
      render :new
    end
  end

  def update
    @author = Author.get(params[:id])
    raise NotFound unless @author
    if @author.update_attributes(params[:author]) || !@author.dirty?
      redirect url(:author, @author)
    else
      raise BadRequest
    end
  end

  def destroy
    @author = Author.get(params[:id])
    raise NotFound unless @author
    if @author.destroy
      redirect url(:authors)
    else
      raise BadRequest
    end
  end

end # Authors
