class ApplicationController < ActionController::Base
  protect_from_forgery

  include UserSessionsHelper
  include PahthsHelper
  include StyleHelper

end
