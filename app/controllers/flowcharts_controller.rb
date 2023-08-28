class FlowchartsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update]
  before_action :set_flowchart, only: [:edit, :update] 

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
    @tasks = @flowchart.tasks.all.order(position: :asc)
    @task_count = @tasks.count
    @task = Task.new
  end

  def edit
  end

  def update
    if @flowchart.update(flowchart_params)
      redirect_to flowchart_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def require_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def set_flowchart
    @flowchart = Flowchart.find(params[:id])
  end

  def flowchart_params
    params.require(:flowchart).permit(:title, :goal, :category_id, :image, :private).merge(user_id: current_user.id)
  end
end
