require 'monkey_patches/array'

# Noises are decoded by finding the most common or least common character per column
class Noise
  private_class_method :new

  class << self
    # Unscramble by finding the most common character in the column.
    #
    # @param input [String]
    #
    # @return String
    def unscramble(input)
      unscramble_generic input, :mode
    end

    # Unscramble by finding the rarest character in the column.
    #
    # @param input [String]
    #
    # @return String
    def unscramble2(input)
      unscramble_generic input, :rarest
    end

    private

    # @param input [String]
    # @param mode Symbol
    #
    # @return String
    def unscramble_generic(input, mode)
      input.map(&:chars).transpose.map(&mode).join
    end
  end
end