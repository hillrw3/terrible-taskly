class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
    @tasks = Task.all
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
    @tasks = Task.where(task_lists_id: params[:id])
  end

end
