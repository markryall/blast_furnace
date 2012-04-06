class BlastFurnace::Parser

token class
token identifier

rule
  Root:
    /* nothing */        { result = [] }
  | Expressions          { result = val[0] }
  ;

  Expressions:
    Expression           { result = val }
  ;

  Expression:
    Class                { result = val[0] }
  ;

  Class:
    class identifier     { result = ClassNode.new val[1] }
  ;
end

---- header
require 'blast_furnace/lexer'
require 'blast_furnace/nodes'
---- inner
  def parse code
    @lexer = BlastFurnace::Lexer.new code
    do_parse # Kickoff the parsing process
  end

  def next_token
    @lexer.next
  end