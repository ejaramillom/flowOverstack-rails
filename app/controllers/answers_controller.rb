class AnswersController < ApplicationController
 def create
   post = Post.find(params[:question_id])
   answer = post.answers.new(answer_params)
   if answer.save
     redirect_to post
   else
     @errors = answer.errors.full_messages
     redirect_to answer.post, alert: "La respuesta no puede estar vacia"
   end
 end

 private

   def answer_params
     params.require(:answer).permit(:body).merge(user: current_user)
   end
end
