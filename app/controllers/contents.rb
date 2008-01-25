class Contents < Application

  provides :xml, :js, :yaml
  
  def index
    @contents = Content.all
    render @contents
  end
  
  def show
    @content = Content[params[:id]]
    render @content
  end
  
  def new
    only_provides :html
    @content = Content.new(params[:content])
    render
  end
  
  def create
    @content = Content.new(params[:content])
    if @content.save
      redirect url(:content, @content)
    else
      render :action => :new
    end
  end
  
  def edit
    only_provides :html
    @content = Content[params[:id]]
    render
  end
  
  def update
    @content = Content[params[:id]]
    if @content.update(params[:content])
      redirect url(:content, @content)
    else
      raise BadRequest
    end
  end
  
  def destroy
    @content = Content[params[:id]]
    if @content.destroy
      redirect url(:contents)
    else
      raise BadRequest
    end
  end

end
