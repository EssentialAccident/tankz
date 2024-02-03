# frozen_string_literal: true

# Gems
require 'gosu'
require 'vector2d'

# Local dependencies
require_relative 'game_object'

# Control the logic of the Tank
class Tank < GameObject
  TANK_MAX_SPEED = 5
  BARREL_MAX_SPEED = 2

  def initialize(window, position = Vector2d.new(10, 10), color = 'red')
    super window, position
    @positions = { tank: position,
                   barrel: Vector2d.new(50, 50) }
    @images = { tank: get_image('tank', color),
                barrel: get_image('barrel', "#{color}_outline") }
    @angles = { tank: 0,
                barrel: 0 }
  end

  def update
    # Updates to the tank go here
    move_tank
    position_barrel
    angle_barrel
  end

  def draw
    # Image.draw_rot centers the image on the position
    # For that reason, the drawing position needs to be fixed
    @images[:tank].draw_rot(@positions[:tank].x + ((@images[:tank].width / 2) * IMAGE_SCALE),
                            @positions[:tank].y + ((@images[:tank].height / 2) * IMAGE_SCALE),
                            10,
                            @angles[:tank],
                            0.5,
                            0.5,
                            IMAGE_SCALE,
                            IMAGE_SCALE)
    @images[:barrel].draw_rot(@positions[:barrel].x + ((@images[:barrel].width / 2) * IMAGE_SCALE),
                              @positions[:barrel].y + ((@images[:barrel].height / 2) * IMAGE_SCALE),
                              10,
                              @angles[:barrel],
                              0.5,
                              1.0,
                              IMAGE_SCALE,
                              IMAGE_SCALE)
  end

  private

  def move_tank
    if Gosu.button_down? Gosu::KB_W
      move_up
    elsif Gosu.button_down? Gosu::KB_S
      move_down
    elsif Gosu.button_down? Gosu::KB_A
      move_left
    elsif Gosu.button_down? Gosu::KB_D
      move_right
    end
  end

  def position_barrel
    @positions[:barrel] = tank_center - Vector2d.new(((@images[:barrel].width / 2) * IMAGE_SCALE),
                                                     (@images[:barrel].height / 2) * IMAGE_SCALE)
  end

  def angle_barrel
    mouse = Vector2d.new(@window.mouse_x, @window.mouse_y)
    @angles[:barrel] = (Gosu.radians_to_degrees (tank_center - mouse).angle) - 90
  end

  def move_up
    @angles[:tank] = 0
    @positions[:tank] += Vector2d.new(0, -TANK_MAX_SPEED)
  end

  def move_down
    @angles[:tank] = 180
    @positions[:tank] += Vector2d.new(0, TANK_MAX_SPEED)
  end

  def move_right
    @angles[:tank] = 90
    @positions[:tank] += Vector2d.new(TANK_MAX_SPEED, 0)
  end

  def move_left
    @angles[:tank] = 270
    @positions[:tank] += Vector2d.new(-TANK_MAX_SPEED, 0)
  end

  def tank_center
    Vector2d.new(@positions[:tank].x + ((@images[:tank].width / 2) * IMAGE_SCALE) - 1,
                 @positions[:tank].y + ((@images[:tank].height / 2) * IMAGE_SCALE))
  end
end
