class DocController < ApplicationController
    def index
        @docs=Doc.all
    end
    def show
        @doc=Doc.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            flash[:error]="With Given Id Record Not Found"
            redirect_to doc_index_path
        end
    def new
        @doc = Doc.new
    end
    def create
        @doc=Doc.new(doc_params)
        if @doc.save
            flash[:notice]='Document Created Successfully'
            redirect_to doc_path(@doc)
        else
            flash[:notice]="Error Occured!!!"
            render :new, status: :unprocessable_entity
        end
    end
    def edit
        @doc=Doc.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            redirect_to doc_index_path
    end
    def update
        @doc=Doc.find(params[:id])
        if @doc.update(doc_params)
            flash[:notice]="#{@doc.title} updated Successfully"
            redirect_to doc_path(@doc)
        else
            flash[:error]="Error Occured"
            render :edit, status: :unprocessable_entity
        end
    end
    def destroy
        puts "debug"
        @doc=Doc.find(params[:id])
        @doc.destroy
        flash[:error]="Doc Deleted Successfully"
    end
    private
        def doc_params
            params.require(:doc).permit(:title,:content)
        end
end