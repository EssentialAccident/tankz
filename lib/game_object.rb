require 'vector2d'

# The class GameObject will bethe base for any game object in the game
class GameObject
  def initialize(window, position = Vector2d(0, 0), size)
    @window = window
    @position = position
    @size = size
  end
end
