class WaDesk < Formula
  desc "Lightweight native WhatsApp client for macOS (WKWebView, no Electron)"
  homepage "https://github.com/zenmz/wa-desk"
  url "https://github.com/zenmz/wa-desk/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "183e08e336596ac87d1db2ece1edae5108b9c24d3c02919717f4300b08df1f3c"
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
