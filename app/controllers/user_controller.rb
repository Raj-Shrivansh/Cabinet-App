class UserController < ApplicationController
    def new
        @user=User.new
    end
    def show
        @user=User.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            flash[:error]="User not found"
            redirect_to users_path
        end
    def create
        puts "hello"
        @user=User.new(user_params)
        if @user.save
            session[:user_id]=@user.id
            flash[:notice]="Welcome to Cabinet App,#{@user.username } Successfully signed up."
            redirect_to doc_index_path
        else
            flash[:error]="Error Occured"
            render 'new', status: :unprocessable_entity
        end
    end
    def edit
        @user=User.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            flash[:error]="With GIven id no user found."
        redirect_to root_path
    end
    def update
        @user = User.find params[:id]
        if @user.update(user_params)
            flash[:notice]="Profile Updated successfully."
            redirect_to root_path
        else
            @user.errors.full_messages.each do |err|
                puts err
            end
            flash[:error]="Error Occured"
            redirect_to  edit_user_path(@user)
        end
    end
    private 
        def user_params
            params.require(:user).permit(:username,:password,:email)
        end
end

