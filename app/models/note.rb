class Note < ActiveRecord::Base
  belongs_to :study_session
  belongs_to :user
end
