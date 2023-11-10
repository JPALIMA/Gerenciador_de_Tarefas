class TasksController < ApplicationController
     def index
          @tasks = if params[:sort] == 'due_date'
                         Task.order(due_date: :asc)
                    elsif params[:sort] == 'priority'
                         Task.order(priority: :desc)
                    else
                         Task.all
                    end
     end

     before_action :authenticate_user!

     def new
          @task = Task.new
     end

     def create
          @task = Task.new(task_params)
          if @task.save
               flash[:success] = 'Tarefa criada com sucesso!'
               redirect_to tasks_path
          else
               flash[:error] = 'Erro ao criar a tarefa.'
               render 'new'
          end
     end

     #Implementar as ações para editar, atualizar e excluir tarefas aqui

     private

     def task_params
          params.require(:task).permit(:title, :assignee, :due_date, :priority)
     end
end
