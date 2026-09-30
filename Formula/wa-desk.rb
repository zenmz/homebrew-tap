class WaDesk < Formula
  desc "Lightweight native WhatsApp client for macOS (WKWebView, no Electron)"
  homepage "https://github.com/zenmz/wa-desk"
  url "https://github.com/zenmz/wa-desk/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "2e1061e6b2a10ff7dadf31e3bee22b7677ccfba1dae1c2e40b48e5e1e0573049"
  head "https://github.com/zenmz/wa-desk.git", branch: "main"

  depends_on macos: :sonoma

  def install
    system "./build.sh"
    prefix.install "wa-desk.app"
  end

  def caveats
    <<~EOS
      Tautkan ke /Applications supaya muncul di Launchpad/Spotlight:
        ln -sfn #{opt_prefix}/wa-desk.app /Applications/wa-desk.app
    EOS
  end

  test do
    system "#{prefix}/wa-desk.app/Contents/MacOS/wa-desk", "--selftest"
  end
end
