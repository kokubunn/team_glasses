class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]

<<<<<<< HEAD
  def index

  end

  def create

  end

  def show

  end

  def new

  end

  def edit

  end
  def update

  end

  def destroy

  end

  private

  # def point_aggregate_each_user
  #   @shun_point =
  #   @yoshiyuki_point =
  #   @kouhei_point =

  # end

end
=======
    def index
      @tasks = Task.all
    end

    def show
    end

    def new
      @task = Task.new
    end

    def edit
    end

    def create
      @task = Task.new(task_params)
      @task.save!
      redirect_to tasks_path
    rescue => e
      flash[:alert] = e.message
      render :new
    end

    def update
      @task.update!(task_params)
      redirect_to tasks_path
    rescue => e
      render :edit
    end

    def destroy
      @task.destroy
      redirect_to tasks_path
    end

    private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :points)
    end
  end
>>>>>>> develop
