# frozen_string_literal: true

require 'gosu'
require 'vector2d'
require 'xmlsimple'

# The class GameObject will bethe base for any game object in the game
class GameObject
  def initialize(window, position = Vector2d(0, 0))
    @window = window
    @position = position
    @image = get_image('tank', 'red')
  end

  def draw
    @image.draw(@position.x, @position.y)
  end

  # private
  # Extracts the image of the object from the spritesheet
  def get_image(object, color) # rubocop:disable Metrics/AbcSize
    # Locating the files
    pwd = Dir.pwd
    xml_file = "#{pwd}/assets/img/sheet_tanks.xml"
    png_file = "#{pwd}/assets/img/sheet_tanks.png"

    # Parsing the xml file
    png_coord = XmlSimple.xml_in(xml_file, 'KeyToSymbol' => true, 'AttrToSymbol' => true)
    png_coord = png_coord[:subtexture]
    # Getting the coordinates of the image
    png_coord = (png_coord.select { |e| e[:name].downcase == "#{object}#{color}.png" })

    raise 'Object image not found' if png_coord.empty?

    # Loading the spritesheet
    spritesheet = Gosu::Image.new(png_file, { tileable: true })

    # Returning the image
    spritesheet.subimage(
      png_coord[0][:x].to_i,
      png_coord[0][:y].to_i,
      png_coord[0][:width].to_i,
      png_coord[0][:height].to_i
    )
  end
end
