class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to users_path, info: "User #{@user.email} was created successfully!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize! :update, @user
  end

  def update
    @user = User.find(params[:id])
    authorize! :update, @user

    @user.attributes = params_for_user

    if @user.save
      own_account = current_user.id == @user.id
      flash[:success] = own_account ? 'You have successfully updated your account information' : "User #{@user.email} was updated successfully!"
      redirect_to own_account ? root_path : users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def params_for_user
    allowed = [:password, :password_confirmation]
    if current_user.admin
      allowed << :email << :admin
    end

    params.require(:user).permit(*allowed)
  end
end
