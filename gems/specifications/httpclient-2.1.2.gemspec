# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{httpclient}
  s.version = "2.1.2"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["NAKAMURA, Hiroshi"]
  s.cert_chain = nil
  s.date = %q{2007-09-21}
  s.email = %q{nahi@ruby-lang.org}
  s.files = ["lib/httpclient.rb", "lib/http-access2.rb", "lib/httpclient", "lib/httpclient/cacert.p7s", "lib/httpclient/http.rb", "lib/httpclient/cookie.rb", "lib/http-access2", "lib/http-access2/http.rb", "lib/http-access2/cookie.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://dev.ctor.org/httpclient}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{gives something like the functionality of libwww-perl (LWP) in Ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 1

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
