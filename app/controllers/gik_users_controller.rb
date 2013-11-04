class GikUsersController < ApplicationController
  layout "layout_index"
  include ApplicationHelper

  def new
    @gik_user = GikUser.new
  end

  def create
    @gik_user = GikUser.new(gik_user_params)
    if @gik_user.valid?
      begin
        @gik_user.save
      rescue
      end
      redirect_to root_path
    else
      render 'new'
    end
  end

  # method edit profile user
  def edit
    return redirect_to root_path unless current_user
    unless params[:gik_user].blank?
      @gik_user = GikUser.where(email: params[:gik_user][:email].downcase).first
      # @gik_user.attributes = params['gik_user']
      @gik_user.name = params['gik_user']['name']
      @gik_user.email = params['gik_user']['email']
      @gik_user.password = params['gik_user']['password']
      @gik_user.password_confirmation = params['gik_user']['password_confirmation']

      if @gik_user.valid?
        begin
          @gik_user.save
          session['gik_user'] = @gik_user
        rescue
        end
        redirect_to root_path
      else
        return render 'edit'
      end
    else
      @gik_user = current_user
      render 'edit'
    end
  end

  # method see profile of user
  def profile
  end

  # method sign in user
  def signin
    return render 'signin' if params[:gik_user].blank?
    gik_user = GikUser.where(email: params[:gik_user][:email].downcase).first

    if gik_user && gik_user.authenticate(params[:gik_user][:password])
      create_session(gik_user)
      redirect_to root_path
    else
      render 'signin'
    end
  end

  # method signout user
  def signout
    destroy_session
    redirect_to root_path
  end

  private
  # strong parameters signup user
  def gik_user_params
    params.require(:gik_user).permit(:name, :email, :password, :password_confirmation)
  end

end
