require 'mojikun/runtime'

require 'minitest/autorun'

class RuntimeTest < MiniTest::Unit::TestCase
  def test_instruction_pointer
    assert_equal 0, Mojikun::Runtime.new.instruction_pointer
  end

  def test_data_pointer
    assert_equal 0, Mojikun::Runtime.new.data_pointer
  end

  def test_data
    assert_equal [0] * 30000, Mojikun::Runtime.new.data
  end
end
