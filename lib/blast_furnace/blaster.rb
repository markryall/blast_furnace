require 'blast_furnace/interpreter'
require 'blast_furnace/parser'
require 'blast_furnace/lexer'

module BlastFurnace
  class Blaster
    def blast *args
      destination = args.shift
      parser = BlastFurnace::Parser.new
      args.each do |path|
        lexer = BlastFurnace::Lexer.new File.read path
        BlastFurnace::Interpreter.new.interpret destination, *parser.parse(lexer)
      end
    end
  end
end