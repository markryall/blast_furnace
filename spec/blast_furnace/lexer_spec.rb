require_relative '../spec_helper'

require 'blast_furnace/lexer'

describe BlastFurnace::Lexer do
  def lex code
    lexer = BlastFurnace::Lexer.new code
    tokens = []
    while token = lexer.next
      tokens << token
    end
    tokens
  end

  ['', nil,' '].each do |code|
    it "should tokenise #{code.inspect} to []" do
      lex(code).should == []
    end
  end

  it 'should tokenise class declaration' do
    lex('class AClass').should == [[:class, nil],[:identifier, 'AClass']]
  end
end