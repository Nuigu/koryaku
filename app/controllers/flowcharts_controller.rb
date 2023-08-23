class FlowchartsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @flowcharts = Flowchart.includes(:user).order(created_at: :desc)
  end

  def new
    @flowchart = Flowchart.new
  end

  def create
    @flowchart = Flowchart.new(flowchart_params)
    if @flowchart.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @flowchart = Flowchart.find(params[:id])
  end

  private

  def require_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def flowchart_params
    params.require(:flowchart).permit(:title, :goal, :category_id, :image, :private).merge(user_id: current_user.id)
  end
end
