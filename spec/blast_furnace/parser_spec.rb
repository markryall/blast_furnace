require 'blast_furnace/parser'

describe BlastFurnace::Parser do
  let(:parser) { BlastFurnace::Parser.new }

  it 'should parse nil' do
    parser.parse(nil).should == []
  end

  it 'should parse nothing' do
    parser.parse('').should == []
  end

  it 'should parse simple class declaration' do
    parser.parse(<<-EOF).should == [ClassNode.new('AClass')]
    class AClass
    EOF
  end
end