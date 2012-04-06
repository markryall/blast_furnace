class ClassNode < Struct.new :name
  def eval context
    FileUtils.mkdir_p context.destination
    File.open("#{context.destination}/#{name}.java", "w") do |io|
    io.puts <<EOF
public class #{name} {
}
EOF
    end
  end
end

class NamespaceNode < Struct.new :name
  def eval context
    context.namespace = name
  end
end