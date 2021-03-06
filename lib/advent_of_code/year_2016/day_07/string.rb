autoload :Boolean, 'helpers/boolean'

require 'monkey_patches/array'
require 'monkey_patches/string'

# Can check if an +IPV7+ string supports tls or ssl
module IPV7
  # @return Boolean
  def tls?
    nets.even.any?(&:abba?) && nets.odd.none?(&:abba?)
  end

  # Splits an IPV7 address into subnets
  #
  # @return Array of String
  def nets
    split(/\[|\]/)
  end

  # @return Boolean
  def abba?
    substrings_of(4).any? do |a, b, c, d|
      a.eql?(d) && b.eql?(c) && a.not_eql?(b)
    end
  end

  # Finds all substrings of length n
  #
  # @param n Integer
  #
  # @return Array of [String]
  def substrings_of(n)
    chars.each_cons n
  end

  # @return Boolean
  def ssl?
    odds = nets.even.abas.map(&:opposite)
    evens = nets.odd.abas

    (odds & evens).full?
  end

  # Gets the opposite of the string
  # Assuming the string is three characters long
  #
  # Example: "xyx" -> "yxy"
  #
  # @return String
  def opposite
    a, b, = chars
    [b, a, b].join
  end
end

# prepend IP to String
class String
  prepend IPV7
end