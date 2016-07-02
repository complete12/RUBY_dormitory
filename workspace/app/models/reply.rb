class Reply < ActiveRecord::Base
    
    belongs_to :community
    
    validates :r_content,  :presence => true
                    #,
                    #:length => { :minimum => 1 }
                    #모든 글(reply)은 내용(r_content)을 가짐. 
                    #내용(r_content)은 최소 1글자 이상.
    
end
