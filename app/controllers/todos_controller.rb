class TodosController < ApplicationController

  #GET /todos
  #GET /todos.json
  def index
    @todo = Todo.new
    @todos = Todo.all
  end

end
