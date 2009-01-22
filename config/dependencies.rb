dependency "rspec",        :require_as => nil
dependency "rake",         :require_as => nil
dependency "rcov",         :require_as => nil
dependency "thin",         :require_as => nil
dependency "hoe",          :require_as => nil
dependency "ruby-debug",   :require_as => nil
dependency "webrat",       ">=0.3.2",   :require_as => nil
dependency "nokogiri",     ">=1.0.7",   :require_as => nil
dependency "RedCloth",     ">= 4.1.1",  :require_as => "redcloth"
dependency "BlueCloth",    :require_as => "bluecloth"
dependency "textpow",      :require_as => nil
dependency "ultraviolet",  :require_as => nil
dependency "hpricot",      ">=0.6.164"

merb_version = "=1.0.7.1"
dm_version   = "=0.9.9"

dependency "data_objects", "=0.9.10.1"
dependency "do_postgres",  "=0.9.10.1"
dependency "do_mysql",     "=0.9.10.1"

dependency "dm-core",                  dm_version, :require_as => "dm-core"
dependency "dm-validations",           dm_version, :require_as => "dm-validations"
dependency "dm-serializer",            dm_version, :require_as => "dm-serializer"
dependency "dm-timestamps",            dm_version, :require_as => "dm-timestamps"
dependency "dm-migrations",            dm_version, :require_as => "dm-migrations"
dependency "dm-types",                 dm_version, :require_as => "dm-types"
dependency "dm-is-state_machine",      dm_version, :require_as => "dm-is-state_machine"
dependency "dm-polymorphic",           "=0.9.6",   :require_as => "dm-polymorphic"
dependency "dm-paperclip",             ">=2.0.0",  :require_as => "dm-paperclip"
dependency "dm-sweatshop",             dm_version, :require_as => nil

dependency "merb-core",                merb_version
dependency "merb-gen",                 merb_version, :require_as => nil
dependency "merb-helpers",             merb_version, :require_as => "merb-helpers"
dependency "merb-haml",                merb_version, :require_as => "merb-haml"
dependency "merb-auth-core",           merb_version, :require_as => "merb-auth-core"
dependency "merb-auth-more",           merb_version, :require_as => "merb-auth-more"
dependency "merb-assets",              merb_version, :require_as => "merb-assets"
dependency "merb-slices",              merb_version, :require_as => "merb-slices"
dependency "merb-action-args",         merb_version, :require_as => "merb-action-args"
dependency "merb-mailer",              merb_version, :require_as => "merb-mailer"
dependency "merb_datamapper",          merb_version, :require_as => "merb_datamapper"
dependency "merb-param-protection",    merb_version, :require_as => "merb-param-protection"
dependency "merb-auth-slice-password", merb_version
dependency "merb-param-protection",    merb_version
dependency "merb-exceptions",          merb_version

#dependency "merb-cache",            merb_gems_version
