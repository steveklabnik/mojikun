require 'mojikun/runtime'

require 'minitest/autorun'

class RuntimeTest < MiniTest::Unit::TestCase
  def setup
    @runtime = Mojikun::Runtime.new
  end

  def test_instruction_pointer
    assert_equal 0, @runtime.instruction_pointer
  end

  def test_data_pointer
    assert_equal 0, @runtime.data_pointer
  end

  def test_data
    assert_equal [0] * 30000, @runtime.data
  end

  def test_increment_data_pointer
    runtime = @runtime.increment_data_pointer
    assert_equal 1, runtime.data_pointer
  end

  def test_decrement_data_pointer
    runtime = @runtime.decrement_data_pointer
    assert_equal -1, runtime.data_pointer
  end

  def test_current_data
    assert_equal 0, @runtime.current_data
  end

  def test_increment_data
    runtime = @runtime.increment_data
    assert_equal 1, runtime.current_data
  end

  def test_decrement_data
    runtime = @runtime.decrement_data
    assert_equal -1, runtime.current_data
  end

  def test_set_current_data
    runtime = @runtime.set_current_data(1337)
    assert_equal 1337, runtime.current_data
  end

  def test_set_instruction_pointer
    runtime = @runtime.set_instruction_pointer(2)
    assert_equal 2, runtime.instruction_pointer
  end

  def test_increment_instruction_pointer
    runtime = @runtime.increment_instruction_pointer
    assert_equal 1, runtime.instruction_pointer
  end
end
