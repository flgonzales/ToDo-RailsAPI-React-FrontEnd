class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  #GET /todos
  #GET /todos.json
  def index
    @todo = Todo.new
    @todos = Todo.all
    render json: @todos
  end

  def create
    @todo = Todo.new(todo_params)

  respond_to do |format|
    if @todo.save
      format.html { redirect_to todos_path, notice: 'Task was successfully created.' }
      format.json { render :show, status: :created, location: @todo }
    else
      format.html { render :new }
      format.json { render json: @todo.errors, status: :unprocessable_entity }
    end
  end
  end


  def updated
    respond_to do |format|
     if @todo.update(todo_params)
       format.html { redirect_to @todo, notice: 'Task was updated.' }
       format.json { render :show, status: :ok, location: @todo }
     else
       format.html { render :edit }
       format.json { render json: @todo.errors, status: :unprocessable_entity }
     end
   end
  end

  def destroy
    @todo.destroy
    respond_to do |format|
      format.html {redirect_to todos_url, noticie: 'Task was deleted.'}
      format.json {head :no_content}
    end
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
