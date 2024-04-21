# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-kenkoba"
  spec.version       = "3.0"
  spec.authors       = ["Ken Kobayashi"]
  
  spec.summary       = "Jekyll theme for research project websites"
  spec.homepage      = "https://github.com/KenKoba2119/KenKoba2119.github.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_data|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", '>= 3.9'
end
