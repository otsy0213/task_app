class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :start, :end, :remarks))
    if @task.save
      flash[:notice] = "予定を新規登録しました！"
      redirect_to :tasks
    else
      render "new"
    end
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
    
  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:title, :start, :end, :remarks))
      flash[:notice] = "IDが「#{@task.id}」の予定を変更しました"
      redirect_to :tasks
    else
      render "edit"
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "タイトルが「#{@task.title}」の予定を削除しました"
    redirect_to :tasks
  end
end