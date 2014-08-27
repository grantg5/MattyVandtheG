class SessionsController < ApplicationController
  def new
  end
  
  def create
    puts(params[:password])
	
    @author = Author.authenticate params[:name], params[:password]
	if @author
	  session[:author] = @author.name
	  redirect_to @author
	else
	  redirect_to root_path
	end
  end
  
  def destroy
    session[:author] = nil
	redirect_to root_url
  end
end