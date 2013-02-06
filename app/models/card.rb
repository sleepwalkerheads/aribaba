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

class Card < ActiveRecord::Base
  
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  def user_id=(user)
    super
  end
  
  attr_accessible :active, :character, :comment, :game_title, :latitude, :longitude, :player_name, :user_id
  
  validates :player_name,
    :presence => true,
    :length => { :minimum => 3, :maximum => 16 }
    
  validates :game_title,
    :presence => true,
    :length => { :minimum => 3, :maximum => 32 }
    
  validates :character,
    :length => { :maximum => 16 }
    
  validates :comment,
    :length => { :maximum => 256 }
    
  # validates :user,
  #   :presence => true
    
  validates :latitude,
    :presence => true,
    :numericality => {}
    
  validates :longitude,
    :presence => true,
    :numericality => {}
end
                       
