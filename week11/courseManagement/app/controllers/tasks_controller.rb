class TasksController < ApplicationController
  before_action :set_lecture, only: [:index, :create, :new]

  def index
    @tasks = @lecture.tasks
  end

  # POST /lectures/1/tasks/new
  def new
    @task = Task.new
  end

  # POST /lectures/1/tasks
  def create
    @task = @lecture.tasks.build(tasks_params)

    # @task = Task.new(tasks_params)
    # @task.lecture_id = params[:lecture_id]

    if @task.save
      redirect_to lecture_tasks_path(params[:lecture_id])
    else
      render :new, status: :unprocessable_entity #422
    end
  end

  def edit
    @task = @lecture.tasks.find(params[:id])
  end

  def update
    # Task.where(lecture_id: params[:lecture_id], id: params[:id]).take!
    @task = @lecture.tasks.find(params[:id])

    if @task.update(tasks_params)
      redirect_to lecture_tasks_path(params[:lecture_id])
    else
      render :new, status: :unprocessable_entity #422
    end
  end

  def show
    @task = Task.find(params[:lecture_id])
  end

  def destroy
    @lecture = Lecture.find(params[:id])

    if @lecture.destroy
      redirect_to lectures_path
    end
  end

  private

  def tasks_params
    params.require(:task).permit(:name, :description)
  end

  def set_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
end
