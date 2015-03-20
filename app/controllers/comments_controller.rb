class CommentsController < ApplicationController
	def create
	
	end
	
	def new
	@comment = Comment.new(comment_params)
      if @comment.save
        redirect_to root_url, notice: 'Created comment'
      else
        render 'create' 
      end
	end
	
	def edit
      if @comment.edit(comment_params)
        redirect_to root_url, notice: 'Updated comment'
      else
        render 'edit'
      end
	end
	
	def delete
	@comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_url, notice 'Deleted Comment' 
	end

private

	def comment_params
		params.require(:comment).permit(:body)
	end
	
end
