class WaDesk < Formula
  desc "Lightweight native WhatsApp client for macOS (WKWebView, no Electron)"
  homepage "https://github.com/zenmz/wa-desk"
  url "https://github.com/zenmz/wa-desk/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "e8e46b3c5eb2a4c9dc40c788ac380d3f68325f9af30cf00b046e00eb738f2929"
  head "https://github.com/zenmz/wa-desk.git", branch: "main"

  depends_on macos: :sonoma

  def install
    system "./build.sh"
    prefix.install "WA Desk.app"
  end

  def caveats
    <<~EOS
      Tautkan ke /Applications supaya muncul di Launchpad/Spotlight:
        ln -sfn "#{opt_prefix}/WA Desk.app" "/Applications/WA Desk.app"
    EOS
  end

  test do
    system "#{prefix}/WA Desk.app/Contents/MacOS/wa-desk", "--selftest"
  end
end
