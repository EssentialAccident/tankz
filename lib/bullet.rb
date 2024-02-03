# frozen_string_literal: true

require_relative 'game_object'

# Controls the bullets fire by tanks
class Bullet < GameObject
  BULLET_SPEEED = 10
  def initialize(window, position, color = 'green', angle = 0)
    super window, position
    @image = get_image('bullet', color)
    @angle = angle
  end

  def update
    # Update processes
  end

  def draw
    @image.draw_rot(@position.x + ((@image.width / 2) * IMAGE_SCALE),
                    @position.y + ((@image.height / 2) * IMAGE_SCALE),
                    10,
                    @angle,
                    0.5,
                    0.5,
                    IMAGE_SCALE,
                    IMAGE_SCALE)
  end
end
