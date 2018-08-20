lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "botpack/version"

Gem::Specification.new do |spec|
  spec.name          = "botpack"
  spec.version       = Botpack::VERSION
  spec.authors       = ["Airat Shigapov"]
  spec.email         = ["hi@airat.sh"]

  spec.summary       = "Chat Bot Framework for Ruby"
  spec.homepage      = "https://github.com/airatdev/botpack"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.require_paths = ["lib"]
  spec.executables   = ["botpack"]

  spec.add_dependency "dotenv", "2.4.0"
  spec.add_dependency "telegram-bot-ruby", "0.8.6.1"
  spec.add_dependency "unicode", "0.4.4.4"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "byebug", "9.0.6"
  spec.add_development_dependency "coveralls", "0.8.21"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "3.6.0"
  spec.add_development_dependency "rubocop", "0.58.1"
  spec.add_development_dependency "rubocop-rspec", "1.15.1"
end
