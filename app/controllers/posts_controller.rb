class PostsController < ApplicationController

	autocomplete :tag, :name, :class_name => 'ActsAsTaggableOn::Tag'

	before_filter :fetch_filters, :only => [:index,:show,:filtered]

	def show
	  @post = Post.find(params[:id])
  end

	def index
		@posts = Post.all
	end
	
	def filtered
		
		@posts = Post.where(:published => false)
		
		if params[:type]
			@type = Type.find(params[:type])
			@posts = @posts.joins(:type).where('type_id = ?', @type.id)
		end
		
		if params[:tag]
			@tag = ActsAsTaggableOn::Tag.find(params[:tag])
			@posts = @posts.tagged_with(@tag.name)
		end
		
		render :index
	end
	
	private
	
		def fetch_filters
			@types = Type.all
			@tags = Post.tag_counts_on(:tags)
		end

end
