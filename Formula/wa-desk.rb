class WaDesk < Formula
  desc "Lightweight native WhatsApp client for macOS (WKWebView, no Electron)"
  homepage "https://github.com/zenmz/wa-desk"
  url "https://github.com/zenmz/wa-desk/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "52bc773906c8046cf34d9615f6b877b5c138f37fa035263dbc3d718011a14cb0"
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
