
class UsersController < ApplicationController
  def index
    @users = User.all

    render("users/index.html.erb")
  end

  def show
    @user = User.find(current_user.id)
    @time = Time.new
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
  
  # def street_to_coords
  #   @street_address = params.fetch("full_daytime_address")
  #   url_safe_street_address = URI.encode(@street_address)

  #   raw_data = "https://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_street_address}"
  #   parsed_data = JSON.parse(open(raw_data).read)
    
  #   @latitude = parsed_data.dig("results", 0, "geometry", "location", "lat")
    
  #   @longitude = parsed_data.dig("results", 0, "geometry", "location", "lng")

  #   render("geocoding/street_to_coords.html.erb")
  # end
  
  
  # def linkedin_callback
  #   p 'HIT THE CALLBACK ROUTE'
  #   client = LinkedIn::Client.new('868dhmyht39gex', 'oXxUOPQerpyjvU11') 
  #   code = params.fetch("code")
  #   access_code = client.authorize_from_request(code, :redirect_uri => 'https://prandium-app-tgawlik.c9users.io/callback')
  #   client.authorize_from_access(access_code)
  #   p("====================")
  #   p(client.profile)
    
  #   @users = User.all
    

  #   render("users/index.html.erb")
  # end
  
  
end
