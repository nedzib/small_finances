# == Schema Information
#
# Table name: months
#
#  id            :integer          not null, primary key
#  active        :boolean
#  final_balance :decimal(, )
#  period        :date
#  total_debt    :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer          not null
#
# Indexes
#
#  index_months_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Month < ApplicationRecord
  belongs_to :user
end
