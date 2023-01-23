# == Schema Information
#
# Table name: types
#
#  id         :integer          not null, primary key
#  code       :string
#  color      :string
#  name       :string
#  operation  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_types_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Type < ApplicationRecord
  belongs_to :user

  before_create do
    self.code = name.parameterize.underscore
  end
end
