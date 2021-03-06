autoload :Boolean, 'helpers/boolean'

# Represents triangles that can be validated with the triangle inequality
class Triangle
  private_class_method :new

  class << self
    # Interpreting a +Triangle+ as three integers row-wise,
    # count the number of valid +triangle+s
    #
    # @param input String
    #
    # @return Integer
    def num_of_triangles_as_rows(input)
      num_of_triangles input
    end

    # Interpreting a +Triangle+ as three integers column-wise,
    # count the number of valid +triangle+s
    #
    # @param input String
    #
    # @return Integer
    def num_of_triangles_as_columns(input)
      num_of_triangles input, transpose: true
    end

    private

    # Interpreting a +Triangle+ as three integers either row-wise or column-wise,
    # count the number of valid +triangle+s
    #
    # @param input String
    # @param transpose Boolean
    #
    # @return Integer
    def num_of_triangles(input, transpose: false)
      sides = input.lines.map(&:split)
      sides = sides.transpose.flatten.each_slice 3 if transpose
      sides.count do |triplet|
        new(triplet.map(&:to_i)).triangle?
      end
    end
  end

  # Creates a triangle from a list of integers
  # The points are sorted to make validation easier
  #
  # @param points [Integer]
  def initialize(points)
    @a, @b, @c = points.sort
  end

  # Does the triangle inequality hold?
  #
  # @return Boolean
  def triangle?
    @a + @b > @c
  end
end