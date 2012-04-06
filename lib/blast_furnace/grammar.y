class BlastFurnace::Parser

token class
token in
token identifier

rule
  Root:
    /* nothing */        { result = [] }
  | Nodes                { result = val[0] }
  ;

  Nodes:
    Node                 { result = val }
  | Nodes Node           { result = val[0] << val[1]}

  Node:
    Class                { result = val[0] }
  | Namespace            { result = val[0] }
  ;

  Class:
    class identifier     { result = BlastFurnace::ClassNode.new val[1] }
  ;

  Namespace:
    in identifier        { result = BlastFurnace::NamespaceNode.new val[1] }
  ;
end

---- header
require 'blast_furnace/class_node'
require 'blast_furnace/namespace_node'
---- inner
  def parse lexer
    @lexer = lexer
    do_parse # Kickoff the parsing process
  end

  def next_token
    @lexer.shift
  end