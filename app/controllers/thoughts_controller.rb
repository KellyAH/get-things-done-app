class ThoughtsController < ApplicationController
  before_action :set_thought, only: [:show, :edit, :update, :destroy]

  # GET /thoughts
  def index
    user = User.last
    @thoughts = user.thoughts
  end

  # GET /thoughts/1
  # GET /thoughts/1.json
  def show
    user = User.last
    @thought = user.thoughts.find(params[:id])
  end

  # GET /thoughts/new
  def new
    user = User.last
    @thought = user.thoughts.new
  end

  # GET /thoughts/1/edit
  def edit
    user = User.last
    @thought = user.thoughts.find(params[:id])
  end

  # POST /thoughts
  # POST /thoughts.json
  def create
    user = User.last
    @thought = user.thoughts.build(thought_params)

    if @thought.save
      flash[:success] = "You have successfully created thoughts"
      redirect_to root_path
    else
      flash.now[:error] = "There is an error creating thought"
      render 'thoughts/show'
    end

  end

  # PATCH/PUT /thoughts/1
  def update
    user = User.last
    @thought = user.thoughts.find(params[:id])
    @thought.update thought_params

    redirect_to root_path

  end

  # DELETE /thoughts/1

  def destroy
    @user = User.last
    @thought = @user.thoughts.find(params[:id])
    @thought.destroy
    redirect_to root_path
  end

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
