class Class
  def children
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end
