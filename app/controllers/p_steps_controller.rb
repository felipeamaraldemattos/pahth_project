class PStepsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def new
    @p_step = PStep.new
  end


  def create
    @p_step = pahth.p_steps.build(params[:p_step])
    @p_step.category_knowledge = pahth.pahth_tipo
    if @p_step.save
      @p_steps_feed_items = pahth.p_steps_feed
      flash[:success] = "Step created!"
      redirect_to build_pahth_path(pahth)
    else
      @p_steps_feed_items = pahth.p_steps_feed
      flash[:notice] = "Step could not be created!"
      render 'pahths/build'
    end
  end

  def destroy
    @p_step = PStep.find(params[:id])
    @p_step.destroy
    redirect_to build_pahth_path(pahth)
  end


  private

  def correct_user
    @p_step_id = PStep.find(params[:id]).pahth.user_id
    redirect_to root_url unless p_step_id = current_user.id
  end


end
