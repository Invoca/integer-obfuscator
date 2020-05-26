# frozen_string_literal: true

require_relative 'helper'

describe Cipher::Skip32 do
  let(:key)       { [0x00, 0x99, 0x88, 0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11].pack('C*') }
  let(:c)         { Cipher::Skip32.new(key) }
  let(:block)     { [0x33, 0x22, 0x11, 0x00].pack('C*') }
  let(:enc_block) { [0x81, 0x9d, 0x5f, 0x1f].pack('C*') }

  it 'encrypts' do
    assert_equal enc_block, c.encrypt(block)
  end

  it 'decrypts' do
    assert_equal block, c.decrypt(enc_block)
  end

end
