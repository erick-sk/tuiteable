class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to "/games"
  end

  rescue_from Pundit::NotDefinedError, with: :policy_not_defined

  private
  def policy_not_defined
    flash[:alert] = "There's no policy for this action"
    redirect_to "/games"
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :username, :name, :location, :bio])
  end
end
