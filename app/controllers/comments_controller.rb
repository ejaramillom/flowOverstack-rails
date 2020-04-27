class CommentsController < ApplicationController
	def create
		if params[:post_id].present?
			post = Post.find(params[:post_id])
			comment = post.comments.new(comments_params)
				if comment.save
					redirect_to post
				else
					@errors = post.errors.full_messages
					redirect_to post, alert: "El comentario no puede estar vacio"
				end
		elsif params[:answer_id].present?
			answer = Answer.find(params[:answer_id])
			comment_answer = answer.comments.new(comments_params)
				if comment_answer.save
					redirect_to answer.question
				else
					redirect_to answer.question, alert: "La respuestas no puede estar vacia"
				end
		else
			@errors = answer.errors.full_messages
		end

	end

	private
	  def comments_params
	    params.require(:comment).permit(:body).merge(user: current_user)
	  end
end
