class Helpers

    def self.current_user(session)
      if session[:user_id]
        User.find(session[:user_id])
      else
        nil
      end
    end

    def self.is_logged_in?(session)
      !!current_user(session)
    end

    def self.name(session)
      self.current_user(session).username
    end

    def self.get_email(params)
      User.all.exists?(email: params[:email])
    end

    def self.confirm_password(params)
      params[:password] == params[:verify_password]
    end

    def self.get_park(params,session)
      index = 1 #sets index as 1 as all index starts at 0
      poems_id = params[:id].to_i #sets poems_id == params[:id] and converts to integer
      poems = self.current_user(session).parks[park_id -= 1] #poems is == the users poems with index - 1 (to account for 0)
    end

    def self.get_index(params,session)
      user = self.current_user(session)
      user.poems.find_index {|obj| obj.id == params}
    end
  end
