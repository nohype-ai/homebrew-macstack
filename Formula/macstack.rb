class Macstack < Formula
  desc "Tech stack management based on a personal stack definition"
  homepage "https://macstack.dev"
  url "https://github.com/nohype-ai/MacStack/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "63c491fa7d60ef7fc2ec34d2b7756e8d02efc5262cf6ebbb1b8671d2de0d4a7b"
  license "MIT"

  depends_on "jq"
  depends_on "moreutils"
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
