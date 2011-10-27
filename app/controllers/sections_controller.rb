class SectionsController < ApplicationController
layout 'admin'
	
	def index
		list
		render('list')
	end
	
	
	def list
		@sections = Section.order("sections.position ASC")

	end
	
	def show
		@section = Section.find(params[:id])
	end
	
	
	def new
	 @section = Section.new(:name => 'default')
	end
	
	def create
		#instant a new obj
		@section = Section.new(params[:section])
		#save the obj
		if @section.save
		flash[:notice] = "Section created successfully !"
		#if 1 -> list
			redirect_to(:action => 'list')
		else #if 0 -> redisplay the form
			render('new')
		end
	end
	
	def edit
		@section = Section.find(params[:id])
	end
	
	def update
		#find obj
		@section = Section.find(params[:id])

		#update the obj
		if @section.update_attributes(params[:section])
		#if 1 -> list
			redirect_to(:action => 'show', :id => @section.id)
		else #if 0 -> redisplay the form
			render('edit')
		end

	end
	
	
	def delete
	
	@section = Section.find(params[:id])
	
	end
	
	def destroy
		Section.find(params[:id]).destroy
		flash[:notice] = "Section destroyed !"
		redirect_to(:action => 'list')
	end
end
