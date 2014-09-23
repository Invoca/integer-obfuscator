require "helper"

class TestSkip32 < Test::Unit::TestCase

  def setup
    @key       = [ 0x00,0x99,0x88,0x77,0x66,0x55,0x44,0x33,0x22,0x11 ].pack("C*")
    @c         = Cipher::Skip32.new(@key)
    @block     = [ 0x33,0x22,0x11,0x00 ].pack("C*")
    @enc_block = [ 0x81,0x9d,0x5f,0x1f ].pack("C*")
  end

  def test_original_encrypt
    assert_equal @enc_block, @c.encrypt(@block)
  end
  
  def test_original_decrypt
    assert_equal @block, @c.decrypt(@enc_block)
  end

end
