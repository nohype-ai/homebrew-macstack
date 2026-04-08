class Macstack < Formula
  desc "Tech stack management based on a personal stack definition"
  homepage "https://macstack.dev"
  url "https://github.com/nohype-ai/MacStack/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "3c9ed9086882d2a04551018a983f24000895f0f5ed85bda90c5ff9f58e0e3d9c"
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
