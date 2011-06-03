class GlobalAccountSetting < ActiveRecord::Base

  class << self

    def twitter_on?
      main_settings.twitter_request_token? && main_settings.twitter_request_token_secret?
    end

    def main_settings
      GlobalAccountSetting.first || GlobalAccountSetting.create!
    end

    def set_twitter_stuff session, params

      token, secret = TwitterInterface.get_settings_from(session, params)

      if token && secret
        main_settings.update_attributes!({
          :twitter_request_token => token,
          :twitter_request_token_secret => secret
        })
      end

    end
  end
end
