require 'io/console'

require 'mojikun/errors'

require 'mojikun/point_right_node'
require 'mojikun/point_left_node'
require 'mojikun/thumbs_up_node'
require 'mojikun/thumbs_down_node'
require 'mojikun/display_node'
require 'mojikun/save_node'
require 'mojikun/loop_node'
require 'mojikun/end_loop_node'


module Mojikun
  class Interpreter
    attr_reader :runtime, :loop_map

    def initialize(runtime)
      @runtime = runtime
      @loop_map = {}
    end

    def evaluate(ast)
      # first, update the loop map so we know positions of LoopNode/EndLoopNode
      loop_counter = 0
      loop_stack = []

      ast.each_with_index do |node, index|
        case node
        when LoopNode
          loop_stack << index
        when EndLoopNode
          raise MismatchedBracketError if loop_stack.empty?
          
          @loop_map[loop_stack.pop] = index
        end
      end

      raise MismatchedBracketError unless loop_stack.empty?

      # then, evaluate the nodes
      until(runtime.instruction_pointer == ast.count)
        case ast[runtime.instruction_pointer]
        when PointRightNode
          runtime.increment_data_pointer
        when PointLeftNode
          runtime.decrement_data_pointer
        when ThumbsUpNode
          runtime.increment_data
        when ThumbsDownNode
          runtime.decrement_data
        when DisplayNode
          STDOUT.print(runtime.current_data.chr)
        when SaveNode
          runtime.set_current_data(STDIN.getch.ord)
        when LoopNode
          if runtime.current_data == 0
            runtime.set_instruction_pointer(@loop_map[runtime.instruction_pointer])
          end
        when EndLoopNode
          if runtime.current_data != 0
            runtime.set_instruction_pointer(@loop_map.key(runtime.instruction_pointer))
          end
        end

        runtime.increment_instruction_pointer
      end

      self
    end
  end
end
