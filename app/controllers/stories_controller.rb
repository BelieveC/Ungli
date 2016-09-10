class StoriesController < ApplicationController

	impressionist :actions=>[:show]
	before_action :get_story,only:[:show,:edit,:update,:destroy]

	def index
		@stories = Story.all.order("created_at DESC")
	end

	def show
	end

	def new
		@story = Story.new
	end

	def edit
	end

	def update
		if @story.update(story_params)
			redirect_to @story,notice: "Successfully updated your story"
		else
			render "edit"
		end
	end

	def create
		@story = Story.new(story_params)
		if @story.save
			redirect_to @story,notice:"Successfully created your story"
		else
			render "new"
		end
	end

	def destroy
	end

 	private

 		def get_story
 			@story = Story.find(params[:id])
 		end

 		def story_params
 			params.require(:story).permit(:name,:description,:simage)
 		end
end
