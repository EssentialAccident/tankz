# frozen_string_literal: true

# Gems
require 'gosu'

# Local dependencies
require_relative 'lib/tank'

# The Tanz class will control the set up of the game
# and the main loop.
class Tankz < Gosu::Window
  WINDOW_WIDTH = 800
  WINDOW_HEIGHT = 800
  def initialize
    super WINDOW_WIDTH, WINDOW_HEIGHT
    self.caption = 'Tankz'

    @tank = Tank.new(self, Vector2d.new(0, 0), 'black')
  end

  def update
    # Update the game one frame at the time
  end

  def draw
    # Draw the game one frame at the time
    @tank.draw
  end

  def button_down(id)
    case id
    when Gosu::KB_ESCAPE
      close
    end
  end
end

Tankz.new.show
