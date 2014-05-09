class User < ActiveRecord::Base
  # Remember to create a migration!

# To implement later


  # def auth_user

  #   session[:id] = self[:id]
  # end

  def tweet(string)
    self.client.update(string)
  end


end




