# == Schema Information
#
# Table name: user_groups
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class UserGroup < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :months
end
