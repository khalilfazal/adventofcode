RSpec::Matchers.define :be_skipping_with do |*expected|
  def supports_block_expectations?
    true
  end

  match do
    actual = self.actual
    exception = nil

    if actual.is_a? Proc
      RSpec.describe do
        it { exception = actual.call }
      end.run

      RSpec.world.example_groups.pop
    else
      exception = actual
    end

    if expected.empty?
      !exception.nil?
    else
      exception.is_a? expected[0]
    end
  end
end

RSpec::Matchers.define :be_skipping do
  def supports_block_expectations?
    true
  end

  match do
    be_skipping_with
  end
end