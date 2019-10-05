class TasksController < ApplicationController
  # 共通化をひとまとめに
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    # @tasks = Task.all.page(params[:page])
    
    # asc
    @tasks = Task.all.page(params[:page]).per(5)
     
    # desc
    # @tasks = Task.order(id: :desc).page(params[:page]).per(5)
  end

  def show
  end

  def new
     @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    # binding.pry
    if @task.save
       flash[:success] = '内容が正常に保存されました'
       redirect_to @task
    else
       flash.now[:danger] = '内容が保存されませんでした'
       render :new
    end
  end

  def edit
  end
  
  def update
    if @task.update(task_params)
       flash[:success] = '内容は正常に更新されました'
       redirect_to @task
    else
       flash.now[:danger] = '内容は更新されませんでした'
       render :edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = '内容は正常に削除されました'
    redirect_to tasks_url
  end

  private
  
  # 共通化
  def set_task
    @task = Task.find(params[:id])
  end
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(
       :content,
       :status)
  end
end
