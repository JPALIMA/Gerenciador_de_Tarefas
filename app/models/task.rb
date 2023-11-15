class Task < ApplicationRecord
     belongs_to :user
     has_adn_belongs_to_many :categories
     has_and_belongs_to_many :tags

     validates :title, presence: true
     validates :due_date, presence: true
     validates :priority, presence: true
end
