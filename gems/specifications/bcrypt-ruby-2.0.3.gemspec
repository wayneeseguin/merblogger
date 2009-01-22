# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bcrypt-ruby}
  s.version = "2.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Coda Hale"]
  s.date = %q{2008-05-07}
  s.description = %q{bcrypt() is a sophisticated and secure hash algorithm designed by The OpenBSD project for hashing passwords. bcrypt-ruby provides a simple, humane wrapper for safely handling passwords.}
  s.email = %q{coda.hale@gmail.com}
  s.extensions = ["ext/extconf.rb"]
  s.extra_rdoc_files = ["README", "COPYING", "CHANGELOG", "lib/bcrypt.rb"]
  s.files = ["Rakefile", "COPYING", "README", "CHANGELOG", "lib/bcrypt.rb", "spec/spec_helper.rb", "spec/bcrypt/password_spec.rb", "spec/bcrypt/engine_spec.rb", "ext/blowfish.c", "ext/bcrypt.c", "ext/bcrypt_ext.c", "ext/blf.h", "ext/extconf.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://bcrypt-ruby.rubyforge.org}
  s.rdoc_options = ["--title", "bcrypt-ruby", "--line-numbers", "--inline-source", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{bcrypt-ruby}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{OpenBSD's bcrypt() password hashing algorithm.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
