# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dm-polymorphic}
  s.version = "0.9.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel Neighman, Wayne E. Seguin"]
  s.date = %q{2008-12-08}
  s.description = %q{DataMapper plugin enabling simple ActiveRecord style polymorphism}
  s.email = %q{has.sox@gmail.com, wayneeseguin@gmail.com}
  s.extra_rdoc_files = ["README", "LICENSE", "TODO"]
  s.files = ["lib/associations.rb", "lib/dm-polymorphic.rb", "lib/tester.rb", "lib/types.rb", "spec/dm-polymorphic_spec.rb", "spec/spec_helper.rb", "spec/spec.opts", "Rakefile", "README", "LICENSE", "TODO"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/hassox/dm-polymorphic}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{DataMapper plugin enabling simple ActiveRecord style polymorphism}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>, [">= 0.9.6"])
    else
      s.add_dependency(%q<dm-core>, [">= 0.9.6"])
    end
  else
    s.add_dependency(%q<dm-core>, [">= 0.9.6"])
  end
end
