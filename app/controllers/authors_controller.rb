#@author Grant Gadomski

class AuthorsController < ApplicationController
  def index
	#Lists all of the authors to choose from.
	@authors = Author.all
  end
  
  def show
    #Lists all of the posts by author, given the author's id as a param.
	@posts = Post.where(:author => params[:author])
  end
  
  def new
	#Corresponds to the view that displays the form to create a new author.
  end
  
  def create
	#Creates a new author in the database.
	if require_login
	  @author = Author.new(author_params)
	
	  if (@author.save)
	    session[:author] = @author.name
	    redirect_to @author
	  else
	    redirect_to root_path
	  end
	  
	#else
	  #redirect_to root_path
    #end
  end
  
  private
    def author_params
	  #Checks the information entered to ensure it's what's required for a new author.
	  params.require(:author).permit(:name, :password, :password_confirmation, :email, :security_question, :security_answer)
	end
	
	def require_login
	  #Ensures that an author is currently logged in.
	  if session[:author]
	    return true
	  else
	    return false
	  end
	end
end