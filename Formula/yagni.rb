# Formula for the YAGNI Code CLI. Canonical home is the
# YAGNI-App/homebrew-tap repo (Formula/yagni.rb); this copy is the
# reviewed source of truth in the monorepo. Release process:
# docs/runbooks/homebrew-tap.md.
class Yagni < Formula
  desc "YAGNI Code: a terminal coding agent that already knows your company"
  homepage "https://yagni.app/code"
  url "https://registry.npmjs.org/@yagni-app/code/-/code-1.0.7.tgz"
  sha256 "d9e2fd6ba40d21ed2b65e750f236607ea86c0ecce6d0dc950b2143e86a1af8b3"
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
