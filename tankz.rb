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

    @player = Tank.new(self, Vector2d.new(0, 0), 'green')
  end

  def update
    # Update the game one frame at the time
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
    # Tank movement
    # The tank moves with keys W, A, S, D
    when Gosu::KB_W
      @player.move :up
    when Gosu::KB_S
      @player.move :down
    when Gosu::KB_D
      @player.move :right
    when Gosu::KB_A
      @player.move :left
    end
  end
end

Tankz.new.show
