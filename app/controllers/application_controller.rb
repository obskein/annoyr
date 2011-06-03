class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :update_global_twitter_account

  def update_global_twitter_account
    GlobalAccountSetting.set_twitter_stuff(session, params)
  end
end
