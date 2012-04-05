module BlastFurnace
end

class BlastFurnace::Lexer
  KEYWORDS = %w{class}
  def initialize string
    @fiber = Fiber.new do
      index = 0
      while index < string.size
        case string[index..-1]
        when /\A([A-Za-z]\w*)/
          if KEYWORDS.include? $1
            Fiber.yield [$1.to_sym, nil]
          else
            Fiber.yield [:identifier, $1]
          end
          index+=$1.size
        else
          index+=1
        end
      end
    end
  end

  def next
    @fiber.resume
  end
end