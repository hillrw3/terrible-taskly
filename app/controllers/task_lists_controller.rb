class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
  end

  def new_list
    @task = TaskList.new
    render :new_list
  end

  def add
    TaskList.create(name: params[:name])
    flash[:notice] = "Task List was created successfully!"
    redirect_to '/'
  end

end