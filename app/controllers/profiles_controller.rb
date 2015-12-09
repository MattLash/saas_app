class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :only_current_user
    
    def new
       # form for user 
       @user = User.find( params[:user_id])
       @profile = Profile.new
    end
    
    def create
       @user = User.find(params[:user_id])
       @profile = @user.build_profile(profile_params)
       if @profile.save
           flash[:success] = "Profile Created, Nice work biznatch!!!"
          redirect_to user_path(params[:user_id]) 
       else
           render action: :new
       end
    end
    def edit
        @user = User.find(params[:user_id])
        @profile = @user.profile
    end
    
    def update
        @user = User.find(params[:user_id])
        @profile = @user.profile
        if @profile.update_attributes(profile_params)
            flash[:success] = "Good job, ya schmuck!"
            redirect_to user_path(params[:user_id])
        else
            render action: :edit
        end
    end
    private 
        def profile_params
            params.require(:profile).permit(:avatar, :first_name, :last_name, :job_title, :phone_number, :contact_email, :desrciption)
        end
        def only_current_user
           @user = User.find(params[:user_id])
           redirect_to(root_url) unless @user == current_user
        end
end