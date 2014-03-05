class User < ActiveRecord::Base
  # Remember to create a migration!

  def loggedin?
    !!session[:id]
  end

  def auth_user

    session[:id] = new_user[:id]
  end

end




