require 'blast_furnace/class_node'
require 'ostruct'

describe BlastFurnace::ClassNode do
  let(:io) { stub 'io' }

  def expect base, path, content
    FileUtils.should_receive(:mkdir_p).with base
    File.should_receive(:open).with("#{base}/#{path}", 'w').and_yield io
    io.should_receive(:puts).with content
  end

  it 'should generate a simple class' do
    expect 'src', 'ClassyClass.java', <<EOF
public class ClassyClass {
}
EOF
    context = OpenStruct.new :destination => 'src'
    BlastFurnace::ClassNode.new('ClassyClass').eval context
  end

  it 'should generate a simple class' do
    expect 'src/a/b/c', 'ClassyClass.java', <<EOF
package a.b.c;

public class ClassyClass {
}
EOF
    context = OpenStruct.new :destination => 'src', :namespace => 'a/b/c'
    BlastFurnace::ClassNode.new('ClassyClass').eval context
  end

  it 'should generate a simple class' do
    expect 'src/a/b/c', 'ClassyClass.java', <<EOF
package a.b.c;

public class ClassyClass {
}
EOF
    context = OpenStruct.new :destination => 'src'
    BlastFurnace::ClassNode.new('a/b/c/ClassyClass').eval context
  end
end