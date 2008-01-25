class Discussions < Application

  provides :xml, :js, :yaml
  
  def index
    @discussions = Discussion.all
    render @discussions
  end
  
  def show
    @discussion = Discussion[params[:id]]
    render @discussion
  end
  
  def new
    only_provides :html
    @discussion = Discussion.new(params[:discussion])
    render
  end
  
  def create
    @discussion = Discussion.new(params[:discussion])
    if @discussion.save
      redirect url(:discussion, @discussion)
    else
      render :action => :new
    end
  end
  
  def edit
    only_provides :html
    @discussion = Discussion[params[:id]]
    render
  end
  
  def update
    @discussion = Discussion[params[:id]]
    if @discussion.update(params[:discussion])
      redirect url(:discussion, @discussion)
    else
      raise BadRequest
    end
  end
  
  def destroy
    @discussion = Discussion[params[:id]]
    if @discussion.destroy
      redirect url(:discussions)
    else
      raise BadRequest
    end
  end

end
