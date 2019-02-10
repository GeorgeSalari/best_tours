class CommentsController < ApplicationController
  before_action :set_comment, only: :destroy
  include ApplicationHelper

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:success] = 'Спасибо за комментарий.'
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = 'Извините, что то пошло не так, попробуйте снова.'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if logged_in?
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to @path, notice: 'Comment tour was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

private
  def comment_params
    params.require(:comment).permit(:customer_name, :customer_email, :comment, :avatar, :tour_id, :tour_type, {images: []})
  end

  def set_comment
    @comment = Comment.find(params[:id])
    @path = show_path(@comment.tour_type, @comment.tour_id)
  end

end
