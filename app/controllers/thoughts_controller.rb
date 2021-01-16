class ThoughtsController < ApplicationController
  before_action :set_thought, only: [:show, :edit, :update, :destroy]

  # GET /thoughts
  # GET /thoughts.json
  def index
    @thoughts = Thought.all    
  end

  # GET /thoughts/1
  # GET /thoughts/1.json
  # Delegating to find tasks id into private methods set_thought
  def show
  end

  # GET /thoughts/new
  def new
    @thought = Thought.new
    # handle creating a thought from a task
    if params[:task_id]
      task = Task.find(params[:task_id])
      @thought.description = task.description
    end
  end

  # GET /thoughts/1/edit
  def edit
  end

  # POST /thoughts
  # POST /thoughts.json
  def create
    # This makes the create task and destroy thought into 1 commit transaction so if either fails
    # the whole action of create and destroy doesn't leave data in a bad area.
    ActiveRecord::Base.transaction do
      @thought = Thought.new(thought_params)
      if @thought.save
        if params[:task_id].present?
          task = Task.find(params[:task_id])
          task.destroy
          notice = 'Task was deleted and a Thought was successfully created'
        else
          notice = 'Thought was successfully created.'
        end
        redirect_to root_path, notice: notice
      else
        # NOTE: triggers when saving a thought fails.
        # Test via setting if !@thought.save
        alert = 'Thought failed to be saved.'
        redirect_to new_thought_path, alert: alert
        # TODO: preserve description when new page is rerendered
      end
    end
  end

  # PATCH/PUT /thoughts/1
  # PATCH/PUT /thoughts/1.json
  def update
    respond_to do |format|
      if @thought.update(thought_params)
        format.html { redirect_to @thought, notice: 'Thought was successfully updated.' }
        format.json { render :show, status: :ok, location: @thought }
      else
        format.html { render :edit }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thoughts/1
  # DELETE /thoughts/1.json
  def destroy
    @thought.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Thought was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # TODO: fix indents
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thought
      @thought = Thought.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def thought_params
      params.require(:thought).permit(:description)
    end
end
