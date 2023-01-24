# == Schema Information
#
# Table name: types
#
#  id            :integer          not null, primary key
#  code          :string
#  color         :string
#  name          :string
#  operator      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_group_id :integer          not null
#
# Indexes
#
#  index_types_on_user_group_id  (user_group_id)
#
# Foreign Keys
#
#  user_group_id  (user_group_id => user_groups.id)
#
class Type < ApplicationRecord
  belongs_to :user_group

  validates :code, uniqueness: { scope: :user_id }
  validates :name, presence: true
  validates :operator, presence: true
  validates :color, presence: true
  validates :user_group, presence: true

  enum operator: {
    addition: 0,
    subtract: 1,
  }, _default: :subtract

  before_create do
    self.code = name.parameterize.underscore
  end
end
