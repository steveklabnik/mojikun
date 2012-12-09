require 'mojikun/interpreter'
require 'mojikun/runtime'

require 'minitest/autorun'

class InterpreterTest < Minitest::Unit::TestCase
  def setup
    @runtime = Mojikun::Runtime.new
    @interpreter = Mojikun::Interpreter.new(@runtime)
  end

  def test_runtime
    assert_equal @runtime, @interpreter.runtime
  end

  def test_eval_point_right_node
    ast = [Mojikun::PointRightNode.new]
    assert_equal 1, @interpreter.evaluate(ast).runtime.data_pointer
  end

  def test_eval_point_left_node
    ast = [Mojikun::PointLeftNode.new]
    assert_equal -1, @interpreter.evaluate(ast).runtime.data_pointer
  end

  def test_eval_thumbs_up_node
    ast = [Mojikun::ThumbsUpNode.new]
    assert_equal 1, @interpreter.evaluate(ast).runtime.current_data
  end

  def test_eval_thumbs_down_node
    ast = [Mojikun::ThumbsDownNode.new]
    assert_equal -1, @interpreter.evaluate(ast).runtime.current_data
  end

  def test_eval_display_node
    mock =  MiniTest::Mock.new.expect(:print, nil, ["H"])

    redefine_constant("STDOUT", mock) do

      ast = 72.times.collect { Mojikun::ThumbsUpNode.new }
      ast << Mojikun::DisplayNode.new

      @interpreter.evaluate(ast)
    end

    mock.verify
  end

  def test_eval_save_node
    STDIN.stub :getch, "a" do
      ast = [Mojikun::SaveNode.new]

      @interpreter.evaluate(ast)

      assert_equal 97, @interpreter.runtime.current_data
    end
  end

  def test_eval_loop_node
    ast = [Mojikun::LoopNode.new, Mojikun::ThumbsUpNode.new, Mojikun::EndLoopNode.new]
    @interpreter.evaluate(ast)

    assert_equal 0, @interpreter.runtime.current_data
  end

  def test_eval_end_loop_node
           # so we enter the loop
    ast = [Mojikun::ThumbsUpNode.new,
           Mojikun::LoopNode.new,

             # move right once, increment, move left
             Mojikun::PointRightNode.new,
             Mojikun::ThumbsUpNode.new,
             Mojikun::PointLeftNode.new,

             # decrement so we leave the loop
             Mojikun::ThumbsDownNode.new,
           Mojikun::EndLoopNode.new,

           # move right so we can see the 1 we did in the loop
           Mojikun::PointRightNode.new,
          ]
    @interpreter.evaluate(ast)

    assert_equal 1, @interpreter.runtime.current_data
  end

  def test_loop_map
    ast = [Mojikun::LoopNode.new, Mojikun::EndLoopNode.new]

    @interpreter.evaluate(ast)

    map = {}
    map[0] = 1

    assert_equal map, @interpreter.loop_map
  end

  def test_nested_loop_map
    ast = [Mojikun::LoopNode.new, Mojikun::LoopNode.new, Mojikun::EndLoopNode.new, Mojikun::EndLoopNode.new]

    @interpreter.evaluate(ast)

    map = {}
    map[0] = 3
    map[1] = 2

    assert_equal map, @interpreter.loop_map
  end

  def test_uneven_loop
    ast = [Mojikun::LoopNode.new]
    begin
      @interpreter.evaluate(ast)
      flunk "Did not throw MismatchedBracketError"
    rescue Mojikun::MismatchedBracketError
      pass
    end
  end

  def test_uneven_end_loop
    ast = [Mojikun::EndLoopNode.new]
    begin
      @interpreter.evaluate(ast)
      flunk "Did not throw MismatchedBracketError"
    rescue Mojikun::MismatchedBracketError
      pass
    end
  end
end
