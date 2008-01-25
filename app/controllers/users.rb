class Users < Application
  provides :xml, :js, :yaml
  
  def index
    @users = User.all
    render @users
  end
  
  def show
    @user = User[:id => params[:id]]
    render @user
  end
  
  def new
    only_provides :html
    @user = User.new(params[:user])
    render
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect url(:user, @user)
    else
      render :action => :new
    end
  end
  
  def edit
    only_provides :html
    @user = User[:id => params[:id]]
    render
  end
  
  def update
    @user = User[:id => params[:id]]
    if @user.update(params[:user])
      redirect url(:user, @user)
    else
      raise BadRequest
    end
  end
  
  def destroy
    @user = User[:id => params[:id]]
    if @user.destroy
      redirect url(:users)
    else
      raise BadRequest
    end
  end
end