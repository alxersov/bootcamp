$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "admin_panel/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "admin_panel"
  s.version     = AdminPanel::VERSION
  s.authors     = ["A"]
  s.email       = ["a"]
  s.homepage    = "https://domain.com/"
  s.summary     = "Summary of AdminPanel."
  s.description = "Description of AdminPanel."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.22"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
