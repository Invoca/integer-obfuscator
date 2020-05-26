# frozen_string_literal: true

require_relative 'helper'

describe IntegerObfuscator do
  let(:subject) { IntegerObfuscator.new('my secret key') }

  describe '#obfuscate' do
    it 'works' do
      assert_equal 418_026_769, subject.obfuscate(1)
    end
  end

  describe '#unobfuscation' do
    it 'works' do
      assert_equal 1, subject.unobfuscate(418_026_769)
    end

    it 'works up to 1000' do
      0.upto(1000) do |i|
        assert_equal i, subject.unobfuscate(subject.obfuscate(i))
      end
    end
  end

  describe 'negative values' do
    it 'does not allow' do
      assert_raises IntegerObfuscator::RangeError do
        subject.obfuscate(-1)
      end
      assert_raises IntegerObfuscator::RangeError do
        subject.unobfuscate(-1)
      end
    end
  end

  describe 'big integers' do
    it 'does not allow' do
      bigint = (2**32) + 1
      assert_raises IntegerObfuscator::RangeError do
        subject.obfuscate(bigint)
      end
      assert_raises IntegerObfuscator::RangeError do
        subject.unobfuscate(bigint)
      end
    end
  end
end
