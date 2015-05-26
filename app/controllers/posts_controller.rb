class PostsController < ApplicationController

  def create
    Corner.find_by!(slug: params[:corner_id]).posts.create post_params
    redirect_to :back
  end


  private

  def post_params
    params.require(:post).permit(:body)
  end

end
