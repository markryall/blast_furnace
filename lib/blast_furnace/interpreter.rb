require 'fileutils'

module BlastFurnace
end

Context = Struct.new :destination, :namespace

class BlastFurnace::Interpreter
  def interpret destination, *expressions
    context = Context.new destination
    expressions.each { |node| node.eval context }
  end
end