class TaskList < ActiveRecord::Base
  validates :name, presence: {message: "Your task list could not be created"}
  has_many :tasks
end