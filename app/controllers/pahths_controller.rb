class PahthsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: [:destroy, :build]

  def new
    @pahth = Pahth.new
  end


  def create
    @pahth = current_user.pahths.build(params[:pahth])
    if @pahth.save
      flash[:success] = "Pahth created!"
      redirect_to manage_pahths_user_path(current_user)
    else
      render 'new'
    end
  end


  def show
    @pahth = Pahth.find(params[:id])
    @p_steps_feed_items = pahth.p_steps_feed
  end

  def build
    @pahth = Pahth.find(params[:id])
    @p_step = PStep.new
    @p_steps_feed_items = pahth.p_steps_feed
  end


  def destroy
    @pahth.destroy
    redirect_to manage_pahths_user_path(current_user)
  end

  private

  def correct_user
    @pahth = current_user.pahths.find_by_id(params[:id])
    redirect_to root_url if @pahth.nil?
  end


end
