class CommentsController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.build(comment_params)
    @comment.user = Current.user
    if @comment.save
      redirect_to image_path(@image)
    else
      redirect_to image_path(@image), alert: "Comment could not be saved: #{@comment.errors.full_messages.join(', ')}"
    end
  end

  def index
  end

  private

  def comment_params
    params.expect(comment: [ :body, :user_id, :image_id ])
  end
end
