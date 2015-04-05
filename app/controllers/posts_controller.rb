class PostsController < ApplicationController
helper_method :lookup
 def index
    @posts = Posts.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = lookup.posts.create!(post_params)
	respond_to do |format|
		if @post.save
		  format.html { redirect_to root_path(lookup) }
		  format.js
		else
		  format.html { render :new }
		  format.js
		end
	end
  end

  def edit
    @post = Post.find(params[:id])
  end

  
  def add_new_comment
	# Get the object that you want to comment
	commentable = Post.find(params[:id])

	# Create a comment with the user submitted content
	comment = Comment.new(comment_params)
	# Add the comment
	commentable.comments << comment
	@comments = commentable.comments
    respond_to do |format|
	  format.html { redirect_to root_path }
	  format.js
	end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
	respond_to do |format|
	  format.html { redirect_to root_path }
	  format.js
	end
  end

  private

  def post_params
    params.require(:post).permit(:name, :description, :photo_url, :rating)
  end
  
  def comment_params
    params.require(:comment).permit(:title, :comment, :post_id, :user_id)
  end
  
  def lookup
    @_user ||= User.find(params[:user_id])
  end
  
  def posts
	@posts
  end
end
