class ClassNode < Struct.new :name
  def eval context
    context.namespace ||= ''
    path = "#{context.destination}/#{context.namespace}/#{name}.java"
    FileUtils.mkdir_p File.dirname path
    File.open(path, 'w') do |io|
    io.puts <<EOF
#{package_declaration(context.namespace)}public class #{name} {
}
EOF
    end
  end

  def package_declaration namespace
    namespace.empty? ? '' : <<EOF
package #{namespace.gsub('/','.')};

EOF
  end
end

class NamespaceNode < Struct.new :name
  def eval context
    context.namespace = name
  end
end