RSpec::Matchers.define :be_triggered_by do |message|
  match do |klass|
    klass.new(message).check
  end
end
