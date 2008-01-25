Gem.clear_paths && Gem.path.unshift(Merb.root / "gems")
$LOAD_PATH.unshift(Merb.root / "lib")

use_orm :sequel ; use_test :rspec

dependencies "RedCloth", "digest/sha1"

Merb::BootLoader.after_app_loads do

end
