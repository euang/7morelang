USING: examples.strings tools.test ;
IN: examples.strings.tests

{ f } [ "racencar" palindrome? ] unit-test
{ t } [ "racecar" palindrome? ] unit-test