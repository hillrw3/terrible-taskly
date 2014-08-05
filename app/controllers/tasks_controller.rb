class TasksController < ApplicationController

  def new
    @task_list_id = params[:id]
    @task = Task.new
  end

  def create
    date = "#{params[:task]["date(1i)"]}-#{params[:task]["date(2i)"]}-#{params[:task]["date(3i)"]}"
    @task = Task.new(task: params[:task][:task],
                     date: date,
                     task_lists_id: params[:task][:task_list_id])
    if @task.save
      flash[:notice] = "Task was created successfully!"
      redirect_to '/'
    else
      flash[:notice] = "Your task could not be created"
      redirect_to(:back)
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to(:back)
  end

end