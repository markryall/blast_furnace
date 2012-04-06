module BlastFurnace
end

class BlastFurnace::Lexer
  KEYWORDS = %w{in class}
  WORDCHARS = 'A-Za-z\/'
  def initialize string
    string ||= ''
    @fiber = Fiber.new do
      index = 0
      while index < string.size
        case string[index..-1]
        when /\A([#{WORDCHARS}]+)[^#{WORDCHARS}]/,/\A([#{WORDCHARS}]+)$/
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