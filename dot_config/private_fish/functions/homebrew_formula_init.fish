function homebrew_formula_init --description "Generate a Formula for a Homebrew tap"
    set -l user $argv[1]
    set -l tool $argv[2]
    set -l ver $argv[3]

    if test (count $argv) -ne 3
        echo "Usage: homebrew_formula_init <github-user> <tool-name> <version>"
        return 1
    end

    set -l file Formula/$tool.rb
    mkdir -p Formula

    # Convert to valid Ruby class name (CamelCase, no dashes)
    set -l class (string join '' (for word in (string split '-' $tool); echo (string upper (string sub -l 1 $word))(string sub -s 2 $word); end))

    printf 'class %s < Formula
  desc "Generate minimal Helm values overrides"
  homepage "https://github.com/%s/%s"
  version "%s"

  if OS.mac? && Hardware::CPU.arm?
    # HOMEBREW_MAC_ARM
    url "https://github.com/%s/%s/releases/download/v%s/%s-darwin-arm64"
    sha256 "PUT_MAC_ARM_SHA"
    # END_HOMEBREW_MAC_ARM
  elsif OS.mac? && Hardware::CPU.intel?
    # HOMEBREW_MAC_AMD64
    url "https://github.com/%s/%s/releases/download/v%s/%s-darwin-amd64"
    sha256 "PUT_MAC_AMD64_SHA"
    # END_HOMEBREW_MAC_AMD64
  elsif OS.linux?
    # HOMEBREW_LINUX_AMD64
    url "https://github.com/%s/%s/releases/download/v%s/%s-linux-amd64"
    sha256 "PUT_LINUX_AMD64_SHA"
    # END_HOMEBREW_LINUX_AMD64
  end

  def install
    bin.install "#{File.basename(stable.url)}" => "%s"
  end
end
' \
    $class $user $tool $ver \
    $user $tool $ver $tool \
    $user $tool $ver $tool \
    $user $tool $ver $tool $tool \
    > $file

    echo "✅ Formula created at $file"
end
