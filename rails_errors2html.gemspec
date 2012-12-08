## rails_errors2html.gemspec
#

Gem::Specification::new do |spec|
  spec.name = "rails_errors2html"
  spec.version = "1.2.0"
  spec.platform = Gem::Platform::RUBY
  spec.summary = "rails_errors2html"
  spec.description = "<%= form_for @post do %>  <%= @post.errors.to_html %>"

  spec.files =
["README.md",
 "Rakefile",
 "lib",
 "lib/rails_errors2html.rb",
 "rails_errors2html.gemspec",
 "test",
 "test/rails_errors2html_test.rb",
 "test/testing.rb"]

  spec.executables = []
  
  spec.require_path = "lib"

  spec.test_files = nil

  
    spec.add_dependency(*["map", " >= 6.2.0"])
  
    spec.add_dependency(*["rails_view", " >= 1.0.1"])
  

  spec.extensions.push(*[])

  spec.rubyforge_project = "codeforpeople"
  spec.author = "Ara T. Howard"
  spec.email = "ara.t.howard@gmail.com"
  spec.homepage = "https://github.com/ahoward/rails_errors2html"
end
