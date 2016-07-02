class Croomdb < ActiveRecord::Base
    belongs_to :domitory, :foreign_key => "domitory_id"
end
