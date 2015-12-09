module UsersHelper
    
    def job_title_icon
       if @user.profile.job_title == "Developer"
           "<i class='fa fa-code'></i>".html_safe
        elsif @user.profile.job_title == "Pimp"
            "<i class='fa fa-child'></i>".html_safe
         elsif @user.profile.job_title == "Hoe"
            "<i class='fa fa-female'></i>".html_safe
           
       end
    end
end