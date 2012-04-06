module BlastFurnace
end

class BlastFurnace::Lexer
  KEYWORDS = %w{in class}
  WORDCHARS = 'A-Za-z\/'
  def initialize string
    string ||= ''
    indents = []
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
        when /\A\n([ \t]+)/m
          Fiber.yield [:indent, $1.size]
          indents.push $1.size
          index+=$1.size+1
        else
          index+=1
        end
      end
      Fiber.yield [:dedent, indents.pop] until indents.empty?
    end
  end

  def shift
    @fiber.resume
  end
end