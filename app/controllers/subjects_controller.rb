class SubjectsController < ApplicationController

	layout 'admin'
	
	def index
		list
		render('list')
	end
	
	
	def list
		@subjects = Subject.order("subjects.position ASC")

	end
	
	def show
		@subject = Subject.find(params[:id])
	end
	
	
	def new
	 @subject = Subject.new(:name => 'default')
	end
	
	def create
		#instant a new obj
		@subject = Subject.new(params[:subject])
		#save the obj
		if @subject.save
		flash[:notice] = "Subject created successfully !"
		#if 1 -> list
			redirect_to(:action => 'list')
		else #if 0 -> redisplay the form
			render('new')
		end
	end
	
	def edit
		@subject = Subject.find(params[:id])
	end
	
	def update
		#find obj
		@subject = Subject.find(params[:id])

		#update the obj
		if @subject.update_attributes(params[:subject])
		#if 1 -> list
			redirect_to(:action => 'show', :id => @subject.id)
		else #if 0 -> redisplay the form
			render('edit')
		end

	end
	
	
	def delete
	
	@subject = Subject.find(params[:id])
	
	end
	
	def destroy
		Subject.find(params[:id]).destroy
		flash[:notice] = "Subject destroyed !"
		redirect_to(:action => 'list')
	end
	
end
