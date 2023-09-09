class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, except: %i[index create new]

  def show; end

  def new; end

  def create
    @comment = @post.comments.new(comment_params.merge(user: current_user))

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment created!'
    else
      redirect_to post_path(@post)
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to post_comment_path(@post, @comment), notice: 'Comment updated!'
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
