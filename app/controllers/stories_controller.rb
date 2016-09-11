class StoriesController < ApplicationController

	impressionist :actions=>[:show]
	before_action :get_story,only:[:show,:edit,:update,:destroy,:like,:dislike]
	before_action :authenticate_user!,only:[:edit,:new,:create,:update,:destroy,:like,:dislike]

	def index
		@stories = Story.all.order("created_at DESC")
	end

	def show
	end

	def new
		@story = Story.new
	end

	def edit
		unless current_user.id == @story.user.id
			redirect_to :back,notice:"Your don't have rights to edit this Story"
		end

	end

	def update
		unless current_user.id == @story.user.id
			redirect_to :back,notice:"Your don't have rights to update this Story"
		else
			if @story.update(story_params)
				redirect_to @story,notice: "Successfully updated your story"
			else
				render "edit"
			end
		end
	end

	def create
		@story = Story.new(story_params)
		@story.user_id = current_user.id
		if @story.save
			redirect_to @story,notice:"Successfully created your story"
		else
			render "new"
		end
	end

	def destroy
		unless current_user.id == @story.user.id
			redirect_to :back,notice:"Your don't have rights to Delete this Story"
		else
			@story.destroy
			redirect_to root_path,notice:"Successfully removed your story"
		end
	end

	def like
		@story.liked_by current_user
		redirect_to :back
	end

	def dislike
		@story.disliked_by current_user
		redirect_to :back
	end

 	private

 		def get_story
 			@story = Story.find(params[:id])
 		end

 		def story_params
 			params.require(:story).permit(:name,:description,:simage,:privacy_id,:region,:office)
 		end
end
