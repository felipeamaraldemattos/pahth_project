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
    @p_steps_feed_items = current_pahth.p_steps
  end

# Build a new Path by adding steps on the go
  def build_new
    @pahth = Pahth.find(params[:id])
    @p_step = PStep.new
    @p_steps_feed_items = current_pahth.p_steps
    store_location
  end

# Create the new steps and add to the path on the go
  def build_create
    @p_step = current_user.p_steps.build(params[:p_step])
    if @p_step.save
      @step_pahth = StepPahth.new(:pahth_id => current_pahth.id, :p_step_id => @p_step.id,:times_taken => 0)
      if @step_pahth.save
        @p_steps_feed_items = current_pahth.p_steps
        flash[:success] = "Step created!"
        redirect_to build_new_pahth_path(current_pahth.id)
      else
        @p_steps_feed_items = current_pahth.p_steps
        flash[:notice] = "Step was created but not added to Path!"
        render 'pahths/build_new'
      end
    else
      @p_steps_feed_items = current_pahth.p_steps
      flash[:notice] = "Step could not be created!"
      render 'pahths/build_new'
    end
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
