class Users::RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(_resource)
    new_user_session_url
  end
end

