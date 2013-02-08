class PostsController < ApplicationController

	autocomplete :tag, :name, :class_name => 'ActsAsTaggableOn::Tag'

	def show
	  @post = Post.find(params[:id])
  end

	def index
		@posts = Post.limit(26)
		@types = Type.all
		@tags = Post.tag_counts_on(:tags)
	end

end
