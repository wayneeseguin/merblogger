# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{textpow}
  s.version = "0.10.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dizan Vasquez"]
  s.date = %q{2008-02-19}
  s.description = %q{A library for parsing TextMate[http://macromates.com/] bundles.}
  s.email = %q{dichodaemon@gmail.com}
  s.executables = ["plist2yaml", "plist2syntax"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["bin/plist2yaml", "bin/plist2syntax", "lib/textpow.rb", "lib/textpow", "lib/textpow/syntax.rb", "lib/textpow/score_manager.rb", "lib/textpow/debug_processor.rb", "mm/manual.mm", "test/test_textpow.rb", "History.txt", "Rakefile", "Manifest.txt", "README.txt"]
  s.has_rdoc = true
  s.homepage = %q{http://textpow.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{textpow}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{An engine for parsing Textmate bundles}
  s.test_files = ["test/test_textpow.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oniguruma>, [">= 1.1.0"])
      s.add_runtime_dependency(%q<plist>, [">= 3.0.0"])
    else
      s.add_dependency(%q<oniguruma>, [">= 1.1.0"])
      s.add_dependency(%q<plist>, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<oniguruma>, [">= 1.1.0"])
    s.add_dependency(%q<plist>, [">= 3.0.0"])
  end
end
