class TasksController < ApplicationController
  def create
    if params[:task][:position] == nil || params[:task][:position] == ""
      params[:task][:position] = 65535 * (Task.count + 1)
    end
    @task = Task.new(task_params)
    if @task.save
      redirect_to flowchart_path(params[:flowchart_id])
    else
      @flowchart = Flowchart.find(params[:flowchart_id])
      @tasks = @flowchart.tasks.all.order(position: :asc)
      @task_count = @tasks.count
      render "flowcharts/show", status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :time, :position).merge(flowchart_id: params[:flowchart_id])
  end
end
