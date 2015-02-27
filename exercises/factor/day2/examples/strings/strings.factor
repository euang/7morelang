USING: kernel sequences ;
IN: examples.strings

: palindrome? ( string -- ? ) dup reverse = ;