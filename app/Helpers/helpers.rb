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

    def self.get_poems(params,session)
      poem = Poem.find_by_id(params[:id])
      # binding.pry
      poem if self.current_user(session).poems.include?(poem)
    end

    def self.get_index(params,session)
      user = self.current_user(session)
      user.poems.find_index {|obj| obj.id == params}
    end
  end
