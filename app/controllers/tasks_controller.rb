class TasksController < ApplicationController
     def index
          @tasks = if params[:sort] == 'data de vencimento'
                         Task.order(due_date: :asc).paginate(page: params[:page], per_page: 10)
                    elsif params[:sort] == 'Prioridade'
                         Task.order(priority: :desc).paginate(page: params[:page], per_page: 10)
                    else
                         Task.paginate(page: params[:page], per_page: 10)
                    end

     before_action :authenticate_user!

     def new
          @task = Task.new
     end

     def create
          @task = Task.new(task_params)
          if @task.save
               flash[:seccess] = 'Tarefa criada com sucesso!'
               redirect_to tasks_path
          else
               flash[:error] = 'Erro ao criar a tarefa'
               render 'new'
          end
     end

     #implementar as ações para editar, atualizar e excluir tarefas aqui

     private

     def task_params
          params.require(:task).permit(:title, :assignee, :due_date, :priority, :category_ids => [], :tag_ids => [], :comments, :attachments => [])
     end
end

