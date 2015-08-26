class UserController < ApplicationController
before_filter :authenticate_user!

def after_sign_in_path_for(user)
  user_path
end

def index
end

end
