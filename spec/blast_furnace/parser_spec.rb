require 'blast_furnace/parser'

describe BlastFurnace::Parser do
  def parse *tokens
    BlastFurnace::Parser.new.parse tokens
  end

  it 'should parse empty token list' do
    parse.should == []
  end

  it 'should parse simple class declaration' do
    parse([:class, nil],[:identifier, 'AClass']).should == [ClassNode.new('AClass')]
  end
end