require 'blast_furnace/interpreter'

describe BlastFurnace::Interpreter do
  let(:interpreter) { BlastFurnace::Interpreter.new }

  def interpret *classes
    interpreter.interpret *classes
  end

  it 'should generate nothing from empty token list' do
    interpreter.should_not_receive :puts
    interpret
  end

  it 'should generate a single class' do
    io = stub 'io'
    File.should_receive(:open).with('src/AClass.java', 'w').and_yield io
    io.should_receive(:puts).with <<EOF
public class AClass {
}
EOF
    interpret ClassNode.new('AClass')
  end
end