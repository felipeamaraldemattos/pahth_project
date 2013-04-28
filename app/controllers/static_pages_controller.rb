class StaticPagesController < ApplicationController

  def home
    if current_user
      @user = User.new
      @pahths_feed_items = current_user.pahths_feed
      @p_steps_feed_items = current_user.p_steps_feed
      @to_dos_items = current_user.to_dos_feed
    end
  end

end
