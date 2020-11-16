class TasksController < ApplicationController
  def new
    @task = Task.new(priority: "medium")
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:description, :priority)
  end
end
#TODO user can create a task from a thought move decsiption from though to task
# create empty task