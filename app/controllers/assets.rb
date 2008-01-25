class Assets < Application

  provides :xml, :js, :yaml
  
  def index
    @assets = Asset.all
    render @assets
  end
  
  def show
    @asset = Asset[params[:id]]
    render @asset
  end
  
  def new
    only_provides :html
    @asset = Asset.new(params[:asset])
    render
  end
  
  def create
    @asset = Asset.new(params[:asset])
    if @asset.save
      redirect url(:asset, @asset)
    else
      render :action => :new
    end
  end
  
  def edit
    only_provides :html
    @asset = Asset[params[:id]]
    render
  end
  
  def update
    @asset = Asset[params[:id]]
    if @asset.update(params[:asset])
      redirect url(:asset, @asset)
    else
      raise BadRequest
    end
  end
  
  def destroy
    @asset = Asset[params[:id]]
    if @asset.destroy
      redirect url(:assets)
    else
      raise BadRequest
    end
  end

end
