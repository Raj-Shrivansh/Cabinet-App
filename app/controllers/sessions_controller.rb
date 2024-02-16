class SessionsController < ApplicationController
    def new
    end

    def create
        @user=User.find_by(email: params[:session][:email].downcase)
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id]=@user.id
            session[:user_name]=@user.username
            flash[:notice]="Login Successfully"
            puts "debug1 #{session[:user_id]}"
            redirect_to doc_index_path
        else
            if @user.present?
                flash.now[:error]="Invalid password."
                render :new,status: :unprocessable_entity
            else
                flash[:error]="Both Credentials Are Wrong"
                render :new, status: :unprocessable_entity
            end
        end
    end

    def destroy
        puts "debug1 #{session[:user_id]}"
        session[:user_id]=nil
        session[:user_name]=nil
        flash[:error]="Logout Successfully"
        puts "debug #{session[:user_id]}"
        redirect_to root_path
    end
end