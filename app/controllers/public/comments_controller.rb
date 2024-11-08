class Public::CommentsController < ApplicationController
  before_action :set_commentable

  # コメント作成アクション
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user  # 現在のユーザーをセット

    if @comment.save
      redirect_to @commentable, notice: 'コメントが投稿されました。'
    else
      redirect_to @commentable, alert: 'コメントの投稿に失敗しました。'
    end
  end

  # コメント削除アクション
  def destroy
    @comment = @commentable.comments.find(params[:id])
    if @comment.user == current_user || current_user.admin?
      @comment.destroy
      redirect_to @commentable, notice: 'コメントが削除されました。'
    else
      redirect_to @commentable, alert: 'コメント削除の権限がありません。'
    end
  end

  private

  # ポリモーフィックにコメント対象をセット
  def set_commentable
    # `params[:commentable_type]` と `params[:commentable_id]` を使って、コメント対象を動的に決定
    klass = params[:commentable_type].constantize
    @commentable = klass.find(params[:commentable_id])
  end

  # コメントのパラメータ
  def comment_params
    params.require(:comment).permit(:body)
  end
end
