# This file is maintained by secretree's release workflow. DO NOT EDIT.
cask "secretree" do
  version "0.5.0"

  on_macos do
    on_arm do
      sha256 "c4d73250cada9b62e8b00fef5bc78f7b5ca1724efc3a6bf13aaaa5adacbaf91c"
      url "https://github.com/andraspalinkas/secretree/releases/download/v#{version}/secretree_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "da68327ad620985b87e5a32b53dc1bba4a15b3795cc4b6bf13fec9e07846b025"
      url "https://github.com/andraspalinkas/secretree/releases/download/v#{version}/secretree_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "b92d4dcc586125ca1a3e72ea8a74fc9cf503a84f07f4316b0333c98f8613ff9b"
      url "https://github.com/andraspalinkas/secretree/releases/download/v#{version}/secretree_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "f8a9c88fa1699cbb3243eac54f43276e7cc10e1d5f7573fd305bd2d1a77bac51"
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
