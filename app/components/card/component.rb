# frozen_string_literal: true

class Card::Component < ViewComponent::Base
  with_collection_parameter :month

  def initialize(month:)
    @month = month
  end

end
