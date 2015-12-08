class ProfilesController < ApplicationController
    def new
       # form for user 
       @user = User.find( params[:user_id])
       @profile = @user.build_profile
    end
    
    def create
       @user = User.find(params[:user_id])
       @profile = @user.build_profile(profile_params)
       if @profile.save
           flash[:succes] = "Profile Created, Nice work biznatch!!!"
          redirect_to user_path(params[:user_id]) 
       else
           render action: :new
       end
    end
    
    private 
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :desrciption)
        end
end