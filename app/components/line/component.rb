# frozen_string_literal: true

class Line::Component < ViewComponent::Base
  with_collection_parameter :line

  def initialize(line:)
    @line = line
  end
end
