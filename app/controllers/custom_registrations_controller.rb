class CustomRegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, only: :create 

  def create
    super
    if @user.persisted? 
      UserMailer.welcome_email(@user).deliver_later
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password)}
    end
end