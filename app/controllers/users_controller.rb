class UsersController < ApplicationController

	def new
		@user = User.new		
	end

	def create
		@user = User.new(user_params)
     	if @user.save
     		redirect_to root_path, notice: 'Thanks for signing up!'
     	else
     		render 'new'
   	 	end		
	end

	def edit
		 @user = User.find(params[:id])
	end

	def delete
		 @user = User.find(params[:id])
	end

	def update
    	@user = User.find(params[:id])

    	if @user.update_attributes(user_params)
      		redirect_to root_path
    	else
      		render :edit
    	end
  	end

  	def destroy
    	@user = User.find(params[:id])
    
    	if @users.nil?
      		if @user.delete
       			redirect_to root_path
      		else
      			render 'index'
      		end
    	else
    		redirect_to root_path, notice: 'User doesnt exist'
    	end  
  	end

end


private

  def user_params
    params.require(:user).permit(:name, :email, :password, :admin, :last_signed_in_at)
  end

