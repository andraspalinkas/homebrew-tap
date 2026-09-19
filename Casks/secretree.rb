# This file is maintained by secretree's release workflow. DO NOT EDIT.
cask "secretree" do
  version "0.5.0"

  on_macos do
    on_arm do
      sha256 ""
      url "https://github.com/andraspalinkas/secretree/releases/download/v#{version}/secretree_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 ""
      url "https://github.com/andraspalinkas/secretree/releases/download/v#{version}/secretree_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 ""
      url "https://github.com/andraspalinkas/secretree/releases/download/v#{version}/secretree_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 ""
      url "https://github.com/andraspalinkas/secretree/releases/download/v#{version}/secretree_#{version}_linux_amd64.tar.gz"
    end
  end

  name "secretree"
  desc "Private git: encrypted repositories on any host, with pull requests, reviews and CI intact"
  homepage "https://secretree.dev"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "secretree"

  postflight do
    # the git remote helper is the same binary under a second name
    FileUtils.ln_sf "#{HOMEBREW_PREFIX}/bin/secretree", "#{HOMEBREW_PREFIX}/bin/git-remote-secretree"
  end

  uninstall_postflight do
    FileUtils.rm_f "#{HOMEBREW_PREFIX}/bin/git-remote-secretree"
  end

  # No zap stanza required
end
