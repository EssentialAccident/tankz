# Gems
require 'gosu'
require 'vector2d'

# Local dependencies
require_relative 'game_object'

# Control the logic of the Tank
class Tank < GameObject
  def initialize(window, position = Vector2d.new(0, 0), color = 'red')
    super window, position
    @image = get_image('tank', color)
  end

  def update; end

  def draw
    @image.draw(@position.x, @position.y)
  end

  def move(direction)
    case direction
    when :up
    when :down
    when :left
    when :right
    end
  end
end
