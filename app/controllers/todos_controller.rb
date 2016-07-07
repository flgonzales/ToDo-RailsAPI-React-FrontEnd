class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  #GET /todos
  #GET /todos.json
  def index
    @todo = Todo.new
    @todos = Todo.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:title, :completed)
    end
    
end
