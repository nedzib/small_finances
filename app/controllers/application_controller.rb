class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :authenticate_user!

  def after_sign_out_path_for(resource)
    user_session_path
  end
end
