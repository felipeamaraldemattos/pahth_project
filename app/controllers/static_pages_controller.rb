class StaticPagesController < ApplicationController

  def home
    if current_user
      @pahths_feed_items = current_user.pahths_feed
    end
  end

end
