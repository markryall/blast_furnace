class BlastFurnace::Parser

token class
token identifier

rule
  Root:
    /* nothing */       { result = [] }
  | Expression          { result = val[0] }
  ;

  Expression:
    class identifier    { result = [:class, val[1]] }
  ;
end

---- header
require 'blast_furnace/lexer'
require 'blast_furnace/nodes'
---- inner
  def parse(code, show_tokens=false)
    @lexer = BlastFurnace::Lexer.new code
    do_parse # Kickoff the parsing process
  end

  def next_token
    @lexer.next
  end