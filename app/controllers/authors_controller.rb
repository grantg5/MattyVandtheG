#@author Grant Gadomski

class AuthorsController < ApplicationController
  def index
	#Lists all posts created by this author.
  end
  
  def new
	#Corresponds to the view that displays the form to create a new author.
  end
  
  def create
	#Creates a new author in the database.
	before_action :require_login
	
	@author = Author.new(author_params)
	@author.save
	redirect_to @author
  end
  
  private
    def author_params
	  #Checks the information entered to ensure it's what's required for a new author.
	  
	  #Enter params required here to prevent injection/cross site.
	end
	
	def require_login
	  #Ensures that an author is currently logged in.
	  
	  #Check to make sure an account is currently logged in.
	end
end