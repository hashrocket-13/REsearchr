class Query < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :q_string, presence: true

end