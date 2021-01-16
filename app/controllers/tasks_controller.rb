class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def new
    @task = Task.new(priority: "medium")
    # handle creating a task from a thought
    if params[:thought_id]
      thought = Thought.find(params[:thought_id])
      @task.description = thought.description
    end
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/1/edit
  def edit
  end

  # create task from thought or /tasks/new
  def create
    # This makes the create task and destroy thought into 1 commit transaction so if either fails
    # the whole action of create and destroy doesn't leave data in a bad area.
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

  def update
    respond_to do |format|
      @task = Task.find(params[:id])
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path, notice: 'Task was successfully destroyed.'
  end

  # TODO: fix indents
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:description, :priority)
  end
end
