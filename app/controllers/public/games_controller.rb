class Public::GamesController < ApplicationController
  def index
    # ジャンルごとにゲームを取得
    @genres = Genre.includes(:games)
  end

  def show
    # ゲームの詳細を取得
    @game = Game.find(params[:id])
    
  end
end
