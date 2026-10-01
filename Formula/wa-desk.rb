class WaDesk < Formula
  desc "Lightweight native WhatsApp client for macOS: one window, multi-account, privacy blur, bookmarks, tags, quiet hours"
  homepage "https://github.com/zenmz/wa-desk"
  url "https://github.com/zenmz/wa-desk/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "2b5799c3853eb635d8e09c18f6f73d65d834cb468449030cb204fc7e6e3d32a8"
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
