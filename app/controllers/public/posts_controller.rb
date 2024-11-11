class Public::PostsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @genre = Genre.find(@game.genre_id)
    @post = Post.new
  end

  def index
  end

  def show
  end

  def create
    # 投稿タイプに応じて、Post または Event を作成する
    if params[:post][:post_type] == "diary"
      @post = Post.new(post_params)
    elsif params[:post][:post_type] == "event"
      @event = Event.new(post_params)
    end

    if @post.save || @event.save
      redirect_to post_confirm_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private
  
  def post_params
    params.require(:post).permit(:title, :body, :genre_id, :game_id, :group_id)
  end
end
