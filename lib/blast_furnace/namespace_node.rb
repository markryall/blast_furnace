module BlastFurnace
end

class BlastFurnace::NamespaceNode < Struct.new :name
  def eval context
    context.namespace = name
  end
end