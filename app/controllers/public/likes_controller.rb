class Public::LikesController < ApplicationController
  before_action :set_likeable

  # いいねを作成
  def create
    @like = @likeable.likes.build(user: current_user)
    # @likeable.likes.build(user: current_user) でいいねを作成します。

    if @like.save
      redirect_to @likeable, notice: 'いいねしました！'
    else
      redirect_to @likeable, alert: 'いいねできませんでした。'
    end
  end

  # いいねを削除
  def destroy
    @like = @likeable.likes.find_by(id: params[:id], user: current_user)
    # @likeable.likes.find_by(id: params[:id], user: current_user) を使って、ユーザーがつけたいいねを削除
    if @like
      @like.destroy
      redirect_to @likeable, notice: 'いいねを解除しました。'
    else
      redirect_to @likeable, alert: 'いいねの解除に失敗しました。'
    end
  end

  private

  # ポリモーフィックにlikeableをセット
  def set_likeable
    klass = params[:likeable_type].constantize
    @likeable = klass.find(params[:likeable_id])
  end
end