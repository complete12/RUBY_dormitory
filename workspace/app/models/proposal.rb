class Proposal < ActiveRecord::Base
    has_many :reply_proposals
    validates :p_content,  :presence => true
    validates :p_category,  :presence => true
    validates :p_title, :presence => true
                        #,
                        #:length => { :minimum => 1 }
                        #모든 글(communitydb)은 내용(com_content)과 제목(com_title)을 가짐. 
                        #제목(com_title), 내용(com_content)은 최소 1글자 이상.
end
