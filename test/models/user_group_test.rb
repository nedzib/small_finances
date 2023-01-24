# == Schema Information
#
# Table name: user_groups
#
#  id          :integer          not null, primary key
#  active      :boolean          default(FALSE)
#  description :string
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class UserGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
