require 'blast_furnace/lexer'

describe BlastFurnace::Lexer do
  def lex code
    lexer = BlastFurnace::Lexer.new code
    tokens = []
    while token = lexer.shift
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

  it 'should tokenise namespace declaration' do
    lex('in a/b/c').should == [[:in, nil],[:identifier, 'a/b/c']]
  end

  it 'should tokenise class declaration with namespace' do
    lex('class a/b/c/ClassyClass').should == [[:class, nil],[:identifier, 'a/b/c/ClassyClass']]
  end
end