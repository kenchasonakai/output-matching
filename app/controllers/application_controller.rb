class ApplicationController < ActionController::Base
	before_action :require_login
  add_flash_types :success, :info, :warning, :danger
  unless Rails.env.development?
    rescue_from StandardError, with: :render_500
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  end

  def render_404
    render file: Rails.root.join('/public/404.html').to_s,
           layout: false, status: :not_found
  end

  def render_500(error)
    logger.error error
    logger.error error.backtrace.join("\n\n")
    render file: Rails.root.join('/public/500.html').to_s,
           layout: false, status: :internal_server_error
  end

  private

  def not_authenticated
    flash[:danger] = 'ログインしてください'
    redirect_to login_path
  end
end
