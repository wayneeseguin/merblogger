# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ey_sso_slice}
  s.version = "0.2.29"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["halorgium", "atmos"]
  s.date = %q{2009-01-09}
  s.description = %q{Merb Slice that provides SSO Authentication at Engine Yard}
  s.email = %q{ninja@engineyard.com}
  s.extra_rdoc_files = ["README", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README", "Rakefile", "TODO", "lib/ey_sso_slice", "lib/ey_sso_slice/auth_strategy.rb", "lib/ey_sso_slice/matchers.rb", "lib/ey_sso_slice/mock_auth_strategy.rb", "lib/ey_sso_slice/version.rb", "lib/ey_sso_slice.rb", "config/dependencies.rb", "config/init.rb", "config/router.rb", "spec/fixtures", "spec/fixtures/controllers", "spec/fixtures/controllers/accounts.rb", "spec/requests", "spec/requests/all_spec.rb", "spec/slice_spec.rb", "spec/spec_helper.rb", "app/controllers", "app/controllers/application.rb", "app/controllers/exceptions.rb", "app/controllers/sessions.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/engineyard/ey_sso_slice/tree/master}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ey_sso_slice}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Merb Slice that provides SSO Authentication at Engine Yard}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>, [">= 1.1.11"])
      s.add_runtime_dependency(%q<rake>, [])
      s.add_runtime_dependency(%q<rcov>, [])
      s.add_runtime_dependency(%q<addressable>, [">= 2.0.0"])
      s.add_runtime_dependency(%q<extlib>, [">= 0.9.8"])
      s.add_runtime_dependency(%q<merb-core>, [">= 1.0"])
      s.add_runtime_dependency(%q<merb-gen>, [">= 1.0"])
      s.add_runtime_dependency(%q<merb-slices>, [">= 1.0"])
      s.add_runtime_dependency(%q<merb-auth-core>, [">= 1.0"])
      s.add_runtime_dependency(%q<merb-auth-more>, [">= 1.0"])
      s.add_runtime_dependency(%q<merb-helpers>, [">= 1.0"])
      s.add_runtime_dependency(%q<ey_salesforce_slice>, [">= 0.6.22"])
      s.add_runtime_dependency(%q<ruby-openid>, [">= 2.1.2"])
      s.add_runtime_dependency(%q<rfuzz>, [">= 0.9"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.0.7"])
      s.add_runtime_dependency(%q<webrat>, [">= 0.3.2"])
    else
      s.add_dependency(%q<rspec>, [">= 1.1.11"])
      s.add_dependency(%q<rake>, [])
      s.add_dependency(%q<rcov>, [])
      s.add_dependency(%q<addressable>, [">= 2.0.0"])
      s.add_dependency(%q<extlib>, [">= 0.9.8"])
      s.add_dependency(%q<merb-core>, [">= 1.0"])
      s.add_dependency(%q<merb-gen>, [">= 1.0"])
      s.add_dependency(%q<merb-slices>, [">= 1.0"])
      s.add_dependency(%q<merb-auth-core>, [">= 1.0"])
      s.add_dependency(%q<merb-auth-more>, [">= 1.0"])
      s.add_dependency(%q<merb-helpers>, [">= 1.0"])
      s.add_dependency(%q<ey_salesforce_slice>, [">= 0.6.22"])
      s.add_dependency(%q<ruby-openid>, [">= 2.1.2"])
      s.add_dependency(%q<rfuzz>, [">= 0.9"])
      s.add_dependency(%q<nokogiri>, [">= 1.0.7"])
      s.add_dependency(%q<webrat>, [">= 0.3.2"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.1.11"])
    s.add_dependency(%q<rake>, [])
    s.add_dependency(%q<rcov>, [])
    s.add_dependency(%q<addressable>, [">= 2.0.0"])
    s.add_dependency(%q<extlib>, [">= 0.9.8"])
    s.add_dependency(%q<merb-core>, [">= 1.0"])
    s.add_dependency(%q<merb-gen>, [">= 1.0"])
    s.add_dependency(%q<merb-slices>, [">= 1.0"])
    s.add_dependency(%q<merb-auth-core>, [">= 1.0"])
    s.add_dependency(%q<merb-auth-more>, [">= 1.0"])
    s.add_dependency(%q<merb-helpers>, [">= 1.0"])
    s.add_dependency(%q<ey_salesforce_slice>, [">= 0.6.22"])
    s.add_dependency(%q<ruby-openid>, [">= 2.1.2"])
    s.add_dependency(%q<rfuzz>, [">= 0.9"])
    s.add_dependency(%q<nokogiri>, [">= 1.0.7"])
    s.add_dependency(%q<webrat>, [">= 0.3.2"])
  end
end
