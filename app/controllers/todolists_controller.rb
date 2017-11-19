class TodolistsController < ApplicationController
  before_action :set_todolist, only: [:show, :edit, :update, :destroy, :complete]

  def index
    @todolists = Todolist.all
  end

  def new
    @todolist = Todolist.new
  end

  def create
    @todolist = Todolist.new(todolist_params)
    if @todolist.save
      redirect_to todolists_path
      flash[:notice] = "Todo List was created"
    else
      render :new
      flash[:notice] = "Todo List was not created"
    end
  end

  def update
    if @todolist.update(todolist_params)
      redirect_to todolist_path(@todolist)
      flash[:notice] = "Todo List was updated"
    else
      render :edit
      flash[:notice] = "Todo List was not updated"
    end
  end

  def destroy
    @todolist.destroy
    redirect_to todolists_path
  end

  def complete
    if @todolist.completed == false
      @todolist.update_attribute(:completed, true)
    else
      @todolist.update_attribute(:completed, false)
    end
    redirect_to todolists_path
  end

  private

  def todolist_params
    params.require(:todolist).permit(:name, :due_date, :note)
  end

  def set_todolist
    @todolist = Todolist.find(params[:id])
  end
end
