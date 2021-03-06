require 'blast_furnace/interpreter'

describe BlastFurnace::Interpreter do
  let(:interpreter) { BlastFurnace::Interpreter.new }

  def interpret *classes
    interpreter.interpret 'src', *classes
  end

  it 'should generate nothing from empty token list' do
    interpreter.should_not_receive :puts
    interpret
  end

  it 'should generate a single class' do
    io = stub 'io'
    FileUtils.should_receive(:mkdir_p).with 'src'
    File.should_receive(:open).with('src/AClass.java', 'w').and_yield io
    io.should_receive(:puts).with <<EOF
public class AClass {
}
EOF
    interpret BlastFurnace::ClassNode.new('AClass')
  end
end