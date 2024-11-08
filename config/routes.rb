Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  # 利用者側
  scope module: :public do
    root to: "homes#top"

    # Usersコントローラ
    resources :users, only: [:index, :new, :show, :edit, :update, :destroy] do
      collection do
        get 'mypage', to: 'users#mypage' # マイページ用のカスタムルート
      end
    end

    # Postsコントローラ
    resources :posts, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
    end

    # Eventsコントローラ
    resources :events, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
    end

    # Genresコントローラ
    resources :genres, only: [:index, :show]

    # Gamesコントローラ
    resources :games, only: [:index, :show]

    # Groupsコントローラ
    resources :groups, only: [:new, :index, :show, :create, :edit, :update, :destroy]

    # Group_membersコントローラ
    resources :group_members
  end


  # 管理者側
  namespace :admin do
    root to: "homes#top"
    # Usersコントローラ
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        patch :deactivate  # ユーザーを非アクティブにするアクション
        patch :activate    # ユーザーをアクティブにするアクション
      end
    end

    # Postsコントローラ
    resources :posts, only: [:index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:destroy]
    end

    # Eventsコントローラ
    resources :events, only: [:index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:destroy]
    end

    # Genresコントローラ
    resources :genres, only: [:index, :show, :edit, :update, :destroy]

    # Gamesコントローラ
    resources :games, only: [:index, :show, :edit, :update, :destroy]

    # Groupsコントローラ
    resources :groups, only: [:index, :show, :edit, :update, :destroy]

    # Group_membersコントローラ
    resources :group_members, only: [:index, :show, :edit, :update, :destroy]
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

