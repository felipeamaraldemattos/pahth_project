class PStepsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def new
    @p_step = PStep.new
    @p_steps_feed_items = current_user.p_steps_feed
    store_location
  end


  def create
    @p_step = current_user.p_steps.build(params[:p_step])
    if @p_step.save
      @p_steps_feed_items = current_user.p_steps_feed
      flash[:success] = "Step created!"
      redirect_to new_p_step_path
    else
      @p_steps_feed_items = current_user.p_steps_feed
      flash[:notice] = "Step could not be created!"
      render 'p_steps/new'
    end
  end

  def show
    @p_step = PStep.find(params[:id])
  end

  def destroy
    @p_step = PStep.find(params[:id])
    @p_step.destroy
    redirect_back_or (new_p_step_path)
  end


  private

  def correct_user
    @p_step_id = PStep.find(params[:id]).user_id
    redirect_to root_url unless @p_step_id = current_user.id
  end


end
