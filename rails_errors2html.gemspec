## rails_errors2html.gemspec
#

Gem::Specification::new do |spec|
  spec.name = "rails_errors2html"
  spec.version = "1.5.1"
  spec.platform = Gem::Platform::RUBY
  spec.summary = "rails_errors2html"
  spec.description = "description: rails_errors2html kicks the ass"
  spec.license = "Ruby"

  spec.files =
["README.md",
 "Rakefile",
 "lib",
 "lib/rails_errors2html",
 "lib/rails_errors2html.rb",
 "lib/rails_errors2html/_lib.rb",
 "rails_errors2html.gemspec",
 "test",
 "test/rails_errors2html_test.rb",
 "test/testing.rb"]

  spec.executables = []
  
  spec.require_path = "lib"

  spec.test_files = nil

  
    spec.add_dependency(*["fattr", " ~> 2"])
  
    spec.add_dependency(*["map", " ~> 6"])
  
    spec.add_dependency(*["rails_view", " ~> 1"])
  

  spec.extensions.push(*[])

  spec.author = "Ara T. Howard"
  spec.email = "ara.t.howard@gmail.com"
  spec.homepage = "https://github.com/ahoward/rails_errors2html"
end
