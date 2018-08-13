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
    
    @user.yes_participating = params.fetch("yes_participating")
    
    redirect_to("/users/#{@user.id}", :notice => "You're in for today!")
  end
  
end
