require_relative '../spec_helper'

require 'blast_furnace/parser'

describe BlastFurnace::Parser do
  let(:parser) { BlastFurnace::Parser.new }

  it 'should parse nothing' do
    parser.parse('').should == []
  end

  it 'should parse simple class declaration' do
    parser.parse(<<-EOF).should == [:class, 'AClass']
    class AClass
    EOF
  end
end