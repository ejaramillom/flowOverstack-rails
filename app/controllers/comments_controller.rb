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
					redirect_to answer.post
				else
					redirect_to answer.post, alert: "La respuestas no puede estar vacia"
				end
		else
			@errors = answer.errors.full_messages
		end
	end

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy

		if params[:post_id].present?
			post = Post.find(params[:post_id])

			redirect_to post
		elsif params[:answer_id].present?
			answer = Answer.find(params[:answer_id])

			redirect_to answer.post
		end
		flash[:notice] = "El comentario ha sido eliminado exitosamente"

	end

	private
	  def comments_params
	    params.require(:comment).permit(:body).merge(user: current_user)
	  end
end
