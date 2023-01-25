# == Schema Information
#
# Table name: month_lines
#
#  id              :integer          not null, primary key
#  additional_info :string
#  concept         :string
#  paid            :boolean          default(FALSE)
#  value           :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  month_id        :integer          not null
#  type_id         :integer          not null
#
# Indexes
#
#  index_month_lines_on_month_id  (month_id)
#  index_month_lines_on_type_id   (type_id)
#
# Foreign Keys
#
#  month_id  (month_id => months.id)
#  type_id   (type_id => types.id)
#
class MonthLine < ApplicationRecord

  delegate :subtract?, to: :type
  delegate :addition?, to: :type



  belongs_to :month
  belongs_to :type

  validates :month, presence: true
  validates :type, presence: true
  validates :value, presence: true
  validates :concept, presence: true



end
