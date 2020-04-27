class VotesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def create
	  if params[:post_id].present?
	    post = Post.find(params[:post_id])
	    post.votes.create(user: current_user)

	    redirect_to post
	  elsif params[:answer_id].present?
	    answer = Answer.find(params[:answer_id])
	    answer.votes.create(user: current_user)

	    redirect_to answer.post
	  end
	end

	def destroy
	  if params[:post_id].present?
	    post = Post.find(params[:post_id])
	    post.votes.where(user: current_user).take.try(:destroy)

	    redirect_to post
	  elsif params[:answer_id].present?
	    answer = Answer.find(params[:answer_id])
	    answer.votes.where(user: current_user).take.try(:destroy)

	    redirect_to answer.post
	  end
	end
end
