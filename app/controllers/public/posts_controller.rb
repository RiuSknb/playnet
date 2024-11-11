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
    @game = Game.find(params[:game_id])
    @genre = Genre.find(@game.genre_id)

    # `post_params` で `date` を組み立てる
    post_params = post_params()

    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: '投稿が作成されました。'
    else
      flash[:error] = @post.errors.full_messages.join(', ')
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
  
  # `post_params` で、date や他のフィールドを許可
  def post_params
    params.require(:post).permit(
      :game_id, :post_type, :genre_id, :title, :body, :place, :group_id, :user_id,
      'date(1i)', 'date(2i)', 'date(3i)', 'date(4i)', 'date(5i)',
      :date_1i, :date_2i, :date_3i, :date_4i, :date_5i
    ).merge(date: build_date(params[:post]))
  end

  # `date` フィールドを DateTime オブジェクトに組み立て
  def build_date(post_params)
    # 日付の各パラメータが正しいかチェック
    begin
      year = post_params[:'date_1i'].to_i
      month = post_params[:'date_2i'].to_i
      day = post_params[:'date_3i'].to_i
      hour = post_params[:'date_4i'].to_i
      minute = post_params[:'date_5i'].to_i

      # 日付のバリデーション
      raise ArgumentError, 'Invalid date components' if month < 1 || month > 12 || day < 1 || day > 31

      # DateTime オブジェクトを作成
      DateTime.new(year, month, day, hour, minute)
    rescue ArgumentError => e
      # エラーが発生した場合に nil を返す
      nil
    end
  end
end