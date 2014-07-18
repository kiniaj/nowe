#coding: UTF-8

class AnimalsController < ApplicationController

  def index
    @animals=Animal.all
  end

  def show
    @animal=Animal.find(params[:id])
  end

  def destroy
    @animal=Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_path, alert: "Usunięto"
  end

  def new
    @animal=Animal.new
  end

  def create
    @animal=Animal.new(animal_params)
    if @animal.save
      redirect_to animals_path, notice: "Utworzono"
    else
      render 'new'
    end
  end

  def edit
    @animal=Animal.find(params[:id])
  end

  def update
    @animal=Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to animals_path, notice: "Edytowano"
    else
      render 'edit'
    end
  end

  private
    def animal_params
      params.require(:animal).permit(:name, :age, :color)
    end
end