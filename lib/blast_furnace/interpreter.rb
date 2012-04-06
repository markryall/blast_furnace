require 'fileutils'

module BlastFurnace
end

class BlastFurnace::Interpreter
  def interpret destination, *expressions
    expressions.each do |clazz|
      FileUtils.mkdir_p destination
      File.open("#{destination}/#{clazz.name}.java", "w") do |io|
      io.puts <<EOF
public class #{clazz.name} {
}
EOF
      end
    end
  end
end