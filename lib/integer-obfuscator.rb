require 'digest/sha1'
require 'cipher/skip32'
require 'integer_obfuscator/version'

# Obfuscates or unobfuscates 32-bit integers using a 32-bit block cipher based on SKIPJACK.
class IntegerObfuscator
  
  class RangeError < ArgumentError
    def initialize(i)
      super("#{i.inspect} is not a 32-bit integer")
    end
  end
  
  MAX_SIZE = 0xffffffff
  
  # Creates an obfuscator
  # @param key [String] the key used to obfuscate/unobfuscate integers
  def initialize(key)
    shakey = Digest::SHA1.digest(key)[0...10]
    @c = Cipher::Skip32.new(shakey)
  end
  
  # Obfuscates an integer
  # @param i [Integer] the integer to obfuscate
  # @return [Integer] the obfuscated integer
  # @raise [RangeError] if `i` is not a 32-bit integer
  def obfuscate(i)
    require_32bit_integer(i)
    @c.encrypt([i].pack("I")).unpack("I").first
  end
  
  # Unobfuscates an integer
  # @param i [Integer] the integer to unobfuscate
  # @return [Integer] the unobfuscated integer
  # @raise [RangeError] if `i` is not a 32-bit integer
  def unobfuscate(i)
    require_32bit_integer(i)
    @c.decrypt([i].pack("I")).unpack("I").first
  end
  
private
 
  def require_32bit_integer(i)
    (0..MAX_SIZE) === i or raise RangeError.new(i)
  end
end
