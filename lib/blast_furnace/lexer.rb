module BlastFurnace
end

class BlastFurnace::Lexer
  KEYWORDS = %w{in class}
  def initialize string
    string ||= ''
    @fiber = Fiber.new do
      index = 0
      while index < string.size
        case string[index..-1]
        when /\A([A-Za-z\/]+)[^A-Za-z]/,/\A([A-Za-z\/]+)$/
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

  def shift
    @fiber.resume
  end
end