class Suggestion < ActiveRecord::Base
  validates :name, presence: true
end
