class Task < ActiveRecord::Base
  belongs_to :task_list
  validates :task, presence: {message: "Your task could not be created"}
end