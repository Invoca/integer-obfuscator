# Integer Obfuscator

This is a tool for obfuscating 32-bits integers.  More specifically,
`IntegerObfuscator` will one-to-one transform a 32-bit integer to another
32-bit integer using a 32-bit block cipher based on SKIPJACK.

This is useful when you want to transform sequentially generated
IDs (e.g. database IDs) into integers that don't have an obvious ordering.

## Installation

    gem install integer-obfuscator

## Example

    require 'rubygems'
    require 'integer_obfuscator'
    
    c = IntegerObfuscator.new("my secret key")
    c.obfuscate(1)            # => 418026769
    c.obfuscate(2)            # => 1524067781
    c.obfuscate(3)            # => 1476269236
    c.unobfuscate(418026769)  # => 1
    c.unobfuscate(1524067781) # => 2
    c.unobfuscate(1476269236) # => 3

## Warnings

This code...

1. is not intended to be cryptographically secure.
3. is slow (i.e., pure Ruby implementation).
4. only handles integers up to 32-bits in size.

## References

This is based directly on the Perl Crypt::Skip32 module and the Greg Rose's
original C implementation.

* <http://search.cpan.org/~esh/Crypt-Skip32-0.15/lib/Crypt/Skip32.pm>
* <http://www.qualcomm.com.au/PublicationsDocs/skip32.c>

## Copyright and License

Copyright (c) 2010-2011 Pat Deegan, PhD & Associates, LLC. Released under
the MIT license. See the license file for details.
