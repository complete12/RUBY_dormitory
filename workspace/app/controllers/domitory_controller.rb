class DomitoryController < ApplicationController
   before_filter :authenticate_domitory!
   
    def index
    end
    
    def myinfo
       post = Domitory.new
       post.sleepout_rest = params[:sleepout_rest]
       post.save
       
       @SleepUser = Sleepoutdb.all
       @CroomUser = Croomdb.all
    end
    
    def croom_apply
      @croom = Croomdb.all
    end
    
    def croom
      post = Croomdb.new
      post.domitory_id  = params[:domitory_id]
      post.student_number = params[:student_number]
      post.apply_date = params[:apply_date]
      post.apply = 1
      post.save
      
      redirect_to '/domitory/croom_apply'
    end
    
    def sleepout_apply
       # @room_number = Domitory.find(session["student_number"]).room_number
    end
    def sleepout
        post = Sleepoutdb.new
        post.domitory_id  = params[:domitory_id]
        post.student_number = params[:student_number]
        post.apply_start_date = params[:apply_start_date]
        post.apply_end_date = params[:apply_end_date]
        post.apply = 1
        post.save
 
        
        redirect_to '/domitory/sleepout_apply'
    end
    
    def show
        
    end
    def admin
        @domitory = Domitory.all
        @crooms = Croomdb.all
        @sleepoutApply = Sleepoutdb.all
        if current_domitory.email != "admin@dongduk.ac.kr"
            redirect_to '/domitory/admin_error'
        end
    end

    def admin_croom
        @one_post = Croomdb.find(params[:id])
        @one_post.apply = 2
        @one_post.save
        redirect_to '/domitory/admin'
    end
    
    def admin_sleepout
        one_post = Sleepoutdb.find(params[:id])
        one_post.domitory.decrement!(:sleepout_rest, (one_post.apply_end_date - one_post.apply_start_date))
        one_post.apply = 2
        one_post.save
        redirect_to :action => "admin"
    end
  
end