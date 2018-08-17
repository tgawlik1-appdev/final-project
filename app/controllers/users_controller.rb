class UsersController < ApplicationController
  def index
    @users = User.all

    render("users/index.html.erb")
  end

  def show
    @user = User.find(current_user.id)

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
  
  
  
  def linkedin_callback
    client = LinkedIn::Client.new('868dhmyht39gex', 'oXxUOPQerpyjvU11') 
    code = params.fetch("code")
    access_code = client.authorize_from_request(code, :redirect_uri => 'https://prandium-app-tgawlik.c9users.io/callback')
    client.authorize_from_access(access_code)
    p("====================")
    p(client.profile)
    
    @users = User.all
    

    render("users/index.html.erb")
  end
  
  
end
