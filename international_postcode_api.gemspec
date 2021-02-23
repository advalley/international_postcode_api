require_relative 'lib/international_postcode_api/version'

Gem::Specification.new do |spec|
  spec.name          = "international_postcode_api"
  spec.version       = InternationalPostcodeApi::VERSION
  spec.authors       = ["Dennis de Vulder"]
  spec.email         = ["dennisdevulder@gmail.com"]

  spec.summary       = %q{A ruby wrapper for the api.postcode.eu endpoints.}
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/advalley/international_postcode_api'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = 'https://github.com/advalley/international_postcode_api/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec"
end