class Group < ApplicationRecord
  has_many :user_groupes
  has_many :users, through: :user_groupes
end
