class UsersController < ApplicationController
  def index
    @users = User.all

    render("users/index.html.erb")
  end

  def show
    @user = User.find(params.fetch("id_to_display"))

    render("users/show.html.erb")
  end
  def participate
    @user = User.find(params.fetch("id_to_update"))
    
    if @user.yes_participating == false || nil
      @user.yes_participating = true
    else
      @user.yes_participating = false
    end
    @user.save
    redirect_to("/users/#{@user.id}", :notice => "Change Saved!")
  end
  
end
