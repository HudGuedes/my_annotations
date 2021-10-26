class AnnotationsController < ApplicationController

  before_action :authenticate_user!

  def index
    @annotations = Annotation.all.paginate(page: params[:page], per_page: 5)
  end

  def show
    @annotation = Annotation.find(params[:id])
  end

  def new
    @annotation = Annotation.new
  end

  def create
    @annotation = Annotation.new(annotation_params)
    if @annotation.save
      redirect_to root_path, notice: 'Anotação criada com sucesso!'
    else
      redirect_to :new
    end
  end

  def edit
    @annotation = Annotation.find(params[:id])
  end

  def update
    @annotation = Annotation.find(params[:id])
    if @annotation.update(annotation_params)
      redirect_to root_path
    else
      redirect_to :edit
    end
  end

  def destroy
    @annotation = Annotation.find(params[:id])
    @annotation.destroy
    redirect_to root_path, notice: 'Anotação deletado com sucesso!'
  end

  private

  def annotation_params
    params.require(:annotation).permit(:title, :body, :date, :priority)
  end

end
