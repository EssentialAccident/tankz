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
    @angle_rot = 0
  end

  def update
    # Updates to the tank go here
  end

  def draw
    # Image.draw_rot centers the image on the position
    # For that reason, the drawing position needs to be fixed
    @image.draw_rot(
      @position.x + (@image.width / 2),
      @position.y + (@image.height / 2),
      10,
      @angle_rot
    )
  end

  def move(direction)
    case direction
    when :up
      @angle_rot = 0
    when :down
      @angle_rot = 180
    when :right
      @angle_rot = 90
    when :left
      @angle_rot = 270

    end
  end
end
