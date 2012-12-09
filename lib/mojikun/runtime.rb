module Mojikun
  class Runtime
    attr_reader :instruction_pointer,
                :data_pointer,
                :data

    def initialize
      @instruction_pointer = 0
      @data_pointer = 0
      @data = [0] * 30000 # original interpreter had 30,000 cells
    end

    def increment_data_pointer
      @data_pointer += 1
      self
    end

    def decrement_data_pointer
      @data_pointer -= 1
      self
    end

    def current_data
      data[data_pointer]
    end

    def set_current_data(val)
      data[data_pointer] = val

      self
    end

    def increment_data
      data[data_pointer] += 1
      self
    end

    def decrement_data
      data[data_pointer] -= 1
      self
    end

    def set_instruction_pointer(num)
      @instruction_pointer = num

      self
    end

    def increment_instruction_pointer
      @instruction_pointer += 1

      self
    end
  end
end
