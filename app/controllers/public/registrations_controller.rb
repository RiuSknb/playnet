class Public::RegistrationsController < Devise::RegistrationsController
  # サインアップ後にマイページにリダイレクト
  def after_sign_up_path_for(resource)
    mypage_users_path  # マイページのパスに変更
  end
end