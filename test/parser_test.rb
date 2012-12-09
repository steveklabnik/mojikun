# encoding: utf-8

require 'mojikun/parser'

require 'mojikun/display_node'
require 'mojikun/end_loop_node'
require 'mojikun/loop_node'
require 'mojikun/point_left_node'
require 'mojikun/point_right_node'
require 'mojikun/save_node'
require 'mojikun/thumbs_down_node'
require 'mojikun/thumbs_up_node'

require 'minitest/autorun'

class TestParser < MiniTest::Unit::TestCase
  def test_point_right
    tokens = ["👉"]
    assert_kind_of Mojikun::PointRightNode, Mojikun::Parser.new(tokens).call.first
  end

  def test_point_left
    tokens = ["👈"]
    assert_kind_of Mojikun::PointLeftNode, Mojikun::Parser.new(tokens).call.first
  end

  def test_thumbs_up
    tokens = ["👍"]
    assert_kind_of Mojikun::ThumbsUpNode, Mojikun::Parser.new(tokens).call.first
  end

  def test_thumbs_down
    tokens = ["👎"]
    assert_kind_of Mojikun::ThumbsDownNode, Mojikun::Parser.new(tokens).call.first
  end

  def test_display
    tokens = ["💻"]
    assert_kind_of Mojikun::DisplayNode, Mojikun::Parser.new(tokens).call.first
  end

  def test_save
    tokens = ["💾"]
    assert_kind_of Mojikun::SaveNode, Mojikun::Parser.new(tokens).call.first
  end

  def test_loop
    tokens = ["🔃"]
    assert_kind_of Mojikun::LoopNode, Mojikun::Parser.new(tokens).call.first
  end

  def test_end_loop
    tokens = ["🔙"]
    assert_kind_of Mojikun::EndLoopNode, Mojikun::Parser.new(tokens).call.first
  end
end
