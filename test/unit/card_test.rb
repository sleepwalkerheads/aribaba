# == Schema Information
#
# Table name: cards
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  player_name :string(255)
#  game_title  :string(255)
#  character   :string(255)
#  comment     :text
#  latitude    :float
#  longitude   :float
#  active      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
