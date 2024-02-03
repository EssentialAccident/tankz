# frozen_string_literal: true

# Gems
require 'gosu'

# Local dependencies
require_relative 'lib/tank'

# The Tanz class will control the set up of the game
# and the main loop.
class Tankz < Gosu::Window
  WINDOW_WIDTH = 1000
  WINDOW_HEIGHT = 1000
  def initialize
    super WINDOW_WIDTH, WINDOW_HEIGHT
    self.caption = 'Tankz'

    @player = Tank.new(Vector2d.new(10, 10), 'green')
  end

  def update
    # Update the game one frame at the time
    # Move the player tank
    @player.update
  end

  def draw
    # Draw the game one frame at the time
    @player.draw
  end

  def button_down(button_id)
    case button_id
    # When Esc key is pressed, game quits
    when Gosu::KB_ESCAPE
      close
    end
  end

  def needs_cursor?
    true
  end
end

Tankz.new.show
