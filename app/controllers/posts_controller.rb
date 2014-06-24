#@author Grant Gadomski

class PostsController < ApplicationController
  def index
	#Homepage for the application, displays all posts in the database from newest to oldest.
    @posts = Post.all
  end
  
  def new
	#Coresponds to the view containing the form for a new post.
  end
  
  def create
    #Saves a new post to the database.
    @post = Post.new(post_params)
	@post.save
	redirect_to @post
  end
  
  def show
	#Shows all of a specific post.
	@post = Post.find(params[:id])
  end
  
  private
	def post_params
	  #Checks new post to ensure it fills all criteria before saving it to the database.
	  params.require(:post).permit(:title, :author, :date, :content)
	end
end