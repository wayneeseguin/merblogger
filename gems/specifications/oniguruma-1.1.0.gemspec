# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{oniguruma}
  s.version = "1.1.0"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["Dizan Vasquez", "Nikolai Lugovoi"]
  s.cert_chain = nil
  s.date = %q{2007-05-09}
  s.description = %q{Ruby bindings to the Oniguruma[http://www.geocities.jp/kosako3/oniguruma/] regular expression library (no need to recompile Ruby).}
  s.email = %q{dichodaemon@gmail.com}
  s.extensions = ["ext/extconf.rb"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Syntax.txt", "Rakefile", "lib/oniguruma.rb", "ext/oregexp.c", "ext/extconf.rb", "test/test_oniguruma.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://oniguruma.rubyforge.org}
  s.require_paths = ["lib", "ext"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubyforge_project = %q{oniguruma}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Bindings for the oniguruma regular expression library}
  s.test_files = ["test/test_oniguruma.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 1

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
