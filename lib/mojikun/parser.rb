# encoding: utf-8
module Mojikun
  class Parser
    def initialize(tokens)
      @tokens = tokens
    end

    def call
      @tokens.collect do |token|
        case token
        when "👈"
          PointLeftNode.new
        when "👉"
          PointRightNode.new
        when "👍"
          ThumbsUpNode.new
        when "👎"
          ThumbsDownNode.new
        when "💾"
          SaveNode.new
        when "💻"
          DisplayNode.new
        when "🔃"
          LoopNode.new
        when "🔙"
          EndLoopNode.new
        end
      end
    end
  end
end
