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
        @doc = current_user.doc.build
    end
    def create
        puts "DEbug #{params[:doc_index][:title]} second #{params[:doc_index][:content]} "
        @doc=current_user.doc.build(title: params[:doc_index][:title],content: params[:doc_index][:content])
        @doc.user_id= current_user
        if @doc.save
            flash[:notice]='Document Created Successfully'
            redirect_to doc_path(@doc)
        else
            flash[:notice]="Error Occured!!!"
            puts  @doc.errors.full_messages
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