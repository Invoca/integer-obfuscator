require "helper"

class TestIntegerObfuscator < Test::Unit::TestCase
  
  def setup
    @c = IntegerObfuscator.new("my secret key")
  end
  
  def test_obfuscation
    assert_equal 418026769, @c.obfuscate(1)
  end
  
  def test_unobfuscation
    assert_equal 1, @c.unobfuscate(418026769)
  end
  
  def test_1000_obfuscation_deobfuscates
    0.upto(1000) do |i|
      assert_equal i, @c.unobfuscate(@c.obfuscate(i))
    end
  end
  
  def test_does_not_allow_negative_values
    assert_raises IntegerObfuscator::RangeError do
      @c.obfuscate(-1)
    end
    assert_raises IntegerObfuscator::RangeError do
      @c.unobfuscate(-1)
    end
  end
  
  def test_does_not_allow_big_integers
    bigint = (2 ** 32) + 1
    assert_raises IntegerObfuscator::RangeError do
      @c.obfuscate(bigint)
    end
    assert_raises IntegerObfuscator::RangeError do
      @c.unobfuscate(bigint)
    end
  end

end
