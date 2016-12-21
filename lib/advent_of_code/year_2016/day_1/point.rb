class Point
  private_class_method :new

  def self.origin
    new 0, 0
  end

  def initialize(*dims)
    @x, @y     = dims
    @first_dup = nil
    @visited = Set.new [dup]
  end

  def dims
    [@x, @y]
  end

  def move(dir)
    case dir
      when Compass::NORTH
        @y += 1
      when Compass::EAST
        @x += 1
      when Compass::SOUTH
        @y -= 1
      when Compass::WEST
        @x -= 1
      else
        raise Compass::InvalidDirection.new 'Invalid direction'
    end

    copy = dup

    if @visited.include?(copy) && @first_dup.nil?
      @first_dup = copy
    else
      @visited << copy
    end
  end

  def twice_visited!
    @x, @y = @first_dup.dims
    self
  end

  def taxicab_metric
    dims.map do |val|
      val.abs
    end.inject :+
  end

  private

  def eql?(other)
    dims.eql? other.dims
  end

  def hash
    dims.hash
  end
end