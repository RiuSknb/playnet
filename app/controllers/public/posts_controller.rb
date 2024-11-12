class Public::PostsController < ApplicationController
  before_action :authenticate_user!  # ログイン必須


  def new
    @game = Game.find(params[:game_id])
    @genre = Genre.find(@game.genre_id)
    @post = Post.new
  end

  def diaries
    @posts = Post.where(is_deleted: false, post_type: 'diary').includes(:user, :game, :genre).order(created_at: :desc)
  end

  def events
    
    @posts = Post.where(post_type: 'event').includes(:user, :game, :genre)
  end

  def show
    @post = Post.find(params[:id])
  end


  def create
    @game = Game.find(params[:game_id])
    @genre = Genre.find(@game.genre_id)

    # `post_params` で `date` を組み立てる
    post_params = post_params()
    @post = current_user.posts.new(post_params)  # current_userを投稿に関連付け

    if @post.save
      redirect_to @post, notice: '投稿が作成されました。'
    else
      flash[:error] = @post.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '投稿が更新されました'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      if @post.update(genre_id: nil,
                      game_id: nil,
                      group_id: nil,
                      title: "",
                      body: "",
                      place: "",
                      date: "",
                      is_deleted: true,
                      deleted_by: 0)
        if @post.post_type == "diary"
          redirect_to diaries_posts_path, notice: '投稿が削除されました。'
        else
          redirect_to events_posts_path, notice: '投稿が削除されました。'
        end
      else
        # バリデーションエラーメッセージをログに表示
        Rails.logger.error @post.errors.full_messages.join(", ")
        redirect_to diaries_posts_path, alert: '削除に失敗しました。'
      end
    else
      redirect_to diaries_posts_path, alert: '削除権限がありません。'
    end
  end


  private
  
  # `post_params` で、date や他のフィールドを許可
  def post_params
    params.require(:post).permit(:title, :body, :date, :place, :user_id, :game_id, :post_type, :genre_id, :group_id)
  end
end