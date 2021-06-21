class TodosController < ApplicationController
  def index
    @todos = current_user.todos
    render "index"
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date]

    todo = Todo.find_by(todo_text: todo_text, user_id: current_user.id)
    # check if todo already exists within same user
    if todo
      due = if todo.due_date == Date.today
          "(Due today"
        elsif todo.due_date < Date.today
          "(Overdue"
        else
          "(Due later"
        end
      completed = todo.completed ? "and completed)" : "and not completed)"
      flash[:error] = "Todo already exists. Due date: #{todo.due_date.to_s(:short)} #{due} #{completed}"
      redirect_to todos_path
      # if todo doesnt already exist, create a new one(if todo_text and due_date are filled)
    else
      new_todo = Todo.new(
        todo_text: todo_text,
        due_date: due_date,
        completed: false,
        user_id: current_user.id,
      )
      if new_todo.save
        redirect_to todos_path
      else
        errors = new_todo.errors.full_messages
        if errors.length > 2
          errors.delete_at(1)
        end
        flash[:error] = errors.join(", ")
        redirect_to todos_path
      end
    end
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = current_user.todos.find(id)
    todo.completed = completed
    todo.save
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = current_user.todos.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
