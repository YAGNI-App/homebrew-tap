# Formula for the YAGNI Code CLI. Canonical home is the
# YAGNI-App/homebrew-tap repo (Formula/yagni.rb); this copy is the
# reviewed source of truth in the monorepo. Release process:
# docs/runbooks/homebrew-tap.md.
class Yagni < Formula
  desc "YAGNI Code: a terminal coding agent that already knows your company"
  homepage "https://yagni.app/code"
  url "https://registry.npmjs.org/@yagni-app/code/-/code-1.1.0.tgz"
  sha256 "6c4f9095d6759ff68b7619b1f179b9aaab05f2496b0ce756d0cb4eeba270c0b7"
  license :cannot_represent

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yagni --version")
  end
end
