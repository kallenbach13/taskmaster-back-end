class TasksController < ApplicationController

    def index
        tasks = Task.all
        render json: tasks
      end
    
      def create
        task = Task.create(task_params)
        render json: task
      end
    
      def update
        task = Task.find(params[:id])
        task.update_attributes(task_params)
        render json: task
      end
    
      def destroy
        task = Task.find(params[:id])
        task.destroy
        render json: {}
        #head :no_content, status: :ok
      end
      
      private
        def task_params
          params.require(:task).permit(:title, :description)
        end
        
end
