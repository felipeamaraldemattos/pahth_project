class PahthsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def new
    @pahth = Pahth.new
  end


  def create
    @pahth = current_user.pahths.build(params[:pahth])
    if @pahth.save
      flash[:success] = "Pahth created!"
      redirect_to root_url
    else
      render 'new'
    end
  end


  def show
    @pahth = Pahth.find(params[:id])
  end



  def destroy
    @pahth.destroy
    redirect_to root_url
  end

  private

  def correct_user
    @pahth = current_user.pahth.find_by_id(params[:id])
    redirect_to root_url if @pahth.nil?
  end


end
