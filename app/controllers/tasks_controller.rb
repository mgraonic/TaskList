class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.assign_attributes(task_params)
    if task.save
      redirect_to '/tasks'
    end
  end


  def create
    task = params[:task]

    new_task = Task.new

    new_task.name = task[:name]
    new_task.description = task[:description]

    if new_task.save
      redirect_to '/tasks'
    end
  end

  # def complete
  #   task = Task.find(params[:id])
  #   task.assign_attributes(completed_at: Date.today)
  #   if task.save
  #     redirect_to '/tasks'
  #   end
  # end

  def complete
   @task = Task.find(params[:id])
   @task.completed_at = Date.today

    if @task.save
      redirect_to '/tasks'
    end
  end

  def destroy
    Task.destroy(params[:id])
    redirect_to '/tasks'
  end

  private
  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end

end
