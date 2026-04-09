class Macstack < Formula
  desc "Tech stack management based on a personal stack definition"
  homepage "https://macstack.dev"
  url "https://github.com/nohype-ai/MacStack/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "372d803bdd33cf0a2c279930643fcc4d16a0497ee9666b6afd632088a51435ef"
  license "MIT"

  depends_on "jq"
  depends_on "node"
  depends_on "check-jsonschema"

  def install
    prefix.install "bin"
    prefix.install "scripts"
  end

  def caveats
    <<~EOS
      To update (set up) your Mac, run:
        mack update

      On first run, mack will ask where your stack definition folder is.
    EOS
  end

  test do
    assert_match "Valid calls are", shell_output("#{bin}/mack help")
  end
end
