class WaDesk < Formula
  desc "Lightweight native WhatsApp client for macOS: one window, multi-account, privacy blur, bookmarks, tags, quiet hours"
  homepage "https://github.com/zenmz/wa-desk"
  url "https://github.com/zenmz/wa-desk/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "4fb4ff5d220b9caec1db41e5f38282b40c723587491ef960a6659a5ff7c584be"
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
