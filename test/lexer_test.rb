# encoding: utf-8

require 'mojikun/lexer'

require 'minitest/autorun'

class TestLexer < MiniTest::Unit::TestCase
  def test_lexing
    source = "👍"
    assert_equal ["👍"], Mojikun::Lexer.new(source).call
  end

  def test_lexing
    source = "👍👍"
    assert_equal ["👍", "👍"], Mojikun::Lexer.new(source).call
  end
end
