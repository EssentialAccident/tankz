# frozen_string_literal: true

# Gems
require 'gosu'
require 'vector2d'

# Local dependencies
require_relative 'game_object'

# Control the logic of the Tank
class Tank < GameObject
  TANK_MAX_SPEED = 10

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
      @position.x + ((@image.width / 2) * IMAGE_SCALE),
      @position.y + ((@image.height / 2) * IMAGE_SCALE),
      10,
      @angle_rot,
      0.5,
      0.5,
      IMAGE_SCALE,
      IMAGE_SCALE
    )
  end

  def move(direction)
    case direction
    when :up
      move_up
    when :down
      move_down
    when :right
      move_right
    when :left
      move_left
    end
  end

  private

  def move_up
    @angle_rot = 0
    @position += Vector2d.new(0, -TANK_MAX_SPEED)
  end

  def move_down
    @angle_rot = 180
    @position += Vector2d.new(0, TANK_MAX_SPEED)
  end

  def move_right
    @angle_rot = 90
    @position += Vector2d.new(TANK_MAX_SPEED, 0)
  end

  def move_left
    @angle_rot = 270
    @position += Vector2d.new(-TANK_MAX_SPEED, 0)
  end
end
