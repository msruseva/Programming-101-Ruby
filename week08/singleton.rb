class Object
  def singleton_class
    class << self
      self
    end
  end

  def define_singleton_method(name, &block)
    singleton_class.send(:define_method, name, &block)
  end
end

=begin
class Symbol
  def to_proc
    proc { |arg, *args| arg.public_send(self, *args)}
  end
end
=end

class String
  def to_proc
    proc do |arg, *args|
      split('.').each { |m| arg = arg.public_send(m) }
      arg
    end
  end
end

class Module

  def private_attr_accessor(*args)
    args.each do |arg|
      class_eval("def #{arg}; @#{arg}; end")
      class_eval("def #{arg}=(other); @#{arg}=other; end")
      private arg
      private "#{arg}="
    end
  end

  def private_attr_reader(*name)
    name.each do |arg|
      define_method(arg) {instance_variable_get("@#{arg}")}
      private arg
    end
  end

  def private_attr_writter(*name)
    name.each do |arg|
      define_method("#{arg}=") {instance_variable_set("@#{arg}", value)}
      private "#{arg}="
    end
  end
end

class TestClass
  private_attr_accessor :foo

  def some_method
    foo + 42
  end
end

t = TestClass.new
p t.foo #=> NameError

t.send(:foo=, 42)
t.send(:foo) #=> 42

t.some_method #=> 84
