require_relative '../spec_helper'

require 'blast_furnace/lexer'

describe BlastFurnace::Lexer do
  def lexer code=nil
    @lexer = BlastFurnace::Lexer.new code unless @lexer
    @lexer
  end

  it "should tokenise class declaration" do
    lexer <<-EOF
    class AClass
    EOF
    lexer.next.should == [:class, nil]
    lexer.next.should == [:identifier, "AClass"]
  end
end