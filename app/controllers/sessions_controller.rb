class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #login & redirect detail page
      logger.info("Success, login")
      log_in user
      redirect_to user
    else
      #error message
      logger.info("Failure, login")
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
