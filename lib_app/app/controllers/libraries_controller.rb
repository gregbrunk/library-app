class LibrariesController < ApplicationController
	before_action :logged_in?, only: [:new, :create, :edit, :update, :destroy]
    def index
		@libraries = Library.all.order(:name)
        current_user
	end
	def new
    	@library = Library.new
    end
    def create
    	@library = Library.create(library_params)
    	redirect_to "/libraries"
    end
    def show
	    @library = Library.find(params[:id])
	    render :show
	end
    def edit
        @library = Library.find(params[:id])
    end
    def update
        library = Library.find(params[:id])
        library.update_attributes(library_params)
        redirect_to libraries_path(library)
    end
    def destroy
        library = Library.find(params[:id])
        library.destroy
        redirect_to libraries_path
    end

    private
    
    def user_params
        library_params = params.require(:library).permit(:name, :floor_count, :floor_area)
    end
end
