module Mojikun
  class Lexer
    def initialize(source)
      @source = source
    end

    # omg easiest lexer ever
    def call
      @source.split(//)
    end
  end
end
