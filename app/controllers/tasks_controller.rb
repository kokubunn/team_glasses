class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
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

    def get_point
      @userTask = UserTask.new
      @userTask.user_id = Current.user.id
      @userTask.task_id = params[:task_id]
      if @userTask.save
        flash[:success] = "ポイントget！"
      end
    end

    def mypage
      current_user = User.find_by(id: session[:user_id])
      if current_user
        @tasks = current_user.tasks
        user = current_user
        @user_data = {}
        @user_data[user.user_name] = user.total_points
        

      else
        flash[:alert] = "ユーザーが見つかりません。"
        redirect_to root_path
      end
    end

    private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :points)
    end
  end
