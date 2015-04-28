class LikesController < ApplicationController
  helper_method :current_post

  def create
    current_post.likes.create

    respond_to do |format|
      format.js { render 'changed' }
    end
  end

  def current_post
    # conditionally assign `@post` -- let's us call `current_post` over and over
    # without always hitting the database
    @post ||= Post.find(params[:post_id])
    # @_song ||= Song.find(params[:song_id])
  end
end
