require 'blast_furnace/parser'

describe BlastFurnace::Parser do
  def parse *tokens
    BlastFurnace::Parser.new.parse tokens
  end

  it 'should parse empty token list' do
    parse.should == []
  end

  it 'should parse class declaration' do
    parse([:class, nil],[:identifier, 'AClass']).should == [
      BlastFurnace::ClassNode.new('AClass')
    ]
  end

  it 'should parse namespace declaration' do
    parse([:in, nil],[:identifier, 'com/organisation/application']).should == [
      BlastFurnace::NamespaceNode.new('com/organisation/application')
    ]
  end
end