# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{columnize}
  s.version = "0.3.0"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["R. Bernstein"]
  s.cert_chain = nil
  s.date = %q{2009-01-10}
  s.description = %q{Columnize is a module for reading and caching lines. This may be useful for example in a debugger where the same lines are shown many times.}
  s.email = %q{rockyb@rubyforge.net}
  s.extra_rdoc_files = ["README", "lib/columnize.rb"]
  s.files = ["AUTHORS", "COPYING", "ChangeLog", "NEWS", "README", "Rakefile", "VERSION", "lib/columnize.rb", "test/test-columnize.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://rubyforge.org/projects/rocky-hacks/columnize}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.2")
  s.rubyforge_project = %q{rocky-hacks}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Read file with caching}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 1

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
