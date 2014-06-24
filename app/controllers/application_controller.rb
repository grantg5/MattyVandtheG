class ApplicationController < ActionController::Base
  layout "header"
  
  protect_from_forgery with: :exception
end
