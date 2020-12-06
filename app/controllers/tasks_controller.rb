class TasksController < ApplicationController
  def new
    @task = Task.new(priority: "medium")
    if params[:thought_id]
      thought = Thought.find(params[:thought_id])
      @task.description = thought.description
    end
  end

  def create
    ActiveRecord::Base.transaction do
      @task = Task.new(task_params)
      if @task.save
        if params[:thought_id].present?
          thought = Thought.find(params[:thought_id])
          thought.destroy
          notice = 'Thought was deleted and a Task was successfully created.'
        else
          notice = 'Task was successfully created.'
        end
        redirect_to root_path, notice: notice
      else
        render :new
      end
    end
  end
  

  private

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:description, :priority)
  end
end
