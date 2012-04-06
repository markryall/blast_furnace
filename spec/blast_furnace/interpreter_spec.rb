require 'blast_furnace/interpreter'

describe BlastFurnace::Interpreter do
  let(:interpreter) { BlastFurnace::Interpreter.new }

  def interpret *tokens
    interpreter.interpret *tokens
  end

  it 'should generate nothing from empty token list' do
    interpreter.should_not_receive :puts
    interpret
  end

  it 'should generate simple class' do
    interpreter.should_receive(:puts).with <<EOF
public class AClass {
}
EOF
    interpret [:class, 'AClass']
  end
end