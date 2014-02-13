class Query < ActiveRecord::Base
  belongs_to :user
  validates :type, presence: true
  validates :query, presence: true

end