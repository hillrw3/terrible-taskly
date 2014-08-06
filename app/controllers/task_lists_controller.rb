class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
    @tasks = Task.where(complete: false).order('date')
  end

  def new
    @task = TaskList.new
    render :new
  end

  def create
    @task = TaskList.new(name: params[:task_list][:name])
    if @task.save
      flash[:notice] = "Task List was created successfully!"
      redirect_to '/'
    else
      render :new
    end
  end

  def edit
    @task = TaskList.find(params[:id])
  end

  def update
    @task = TaskList.find(params[:id])
    @task.name = params[:task_list][:name]
    if @task.save
      flash[:notice] = "Task List was updated successfully!"
      redirect_to '/'
    else
      render :new
    end
  end

  def show
    @task_list = TaskList.find(params[:id])
    @tasks = Task.where(task_lists_id: params[:id], complete: false).order('date')
  end

  def completed
    @task_list = TaskList.find(params[:id])
    @tasks = Task.where(task_lists_id: params[:id], complete: true).order('date')
  end

  def destroy
    @task_lists = TaskList.find(params[:id])
    Task.where(task_lists_id: params[:id]).destroy_all
    TaskList.find(params[:id]).destroy
    flash[:notice] = "Task List was deleted successfully!"
    redirect_to root_path
  end

end
