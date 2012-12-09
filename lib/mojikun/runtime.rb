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
  end
end
