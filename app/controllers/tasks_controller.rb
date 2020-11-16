class TasksController < ApplicationController
  def new
    @task = Task.new(priority: "medium")
    @thought = Thought.find(params[:id])
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
