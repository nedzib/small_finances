# == Schema Information
#
# Table name: months
#
#  id            :integer          not null, primary key
#  active        :boolean          default(FALSE)
#  final_balance :decimal(, )      default(0.0)
#  period        :date
#  total_debt    :decimal(, )      default(0.0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_group_id :integer          not null
#
# Indexes
#
#  index_months_on_user_group_id  (user_group_id)
#
# Foreign Keys
#
#  user_group_id  (user_group_id => user_groups.id)
#
class Month < ApplicationRecord
  belongs_to :user_group

  validates :user_group, presence: true
  validates :period, presence: true

end
