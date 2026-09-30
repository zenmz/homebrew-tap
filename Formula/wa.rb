class Wa < Formula
  desc "Lightweight native WhatsApp client for macOS (WKWebView, no Electron)"
  homepage "https://github.com/zenmz/wa"
  url "https://github.com/zenmz/wa/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cc3d85fdbba4fc0e9b15e456a77cc13acad8ad395c791a6cbfde324257425b46"
  head "https://github.com/zenmz/wa.git", branch: "main"

  depends_on macos: :sonoma

  def install
    system "./build.sh"
    prefix.install "WA.app"
  end

  def caveats
    <<~EOS
      Tautkan ke /Applications supaya muncul di Launchpad/Spotlight:
        ln -sfn #{opt_prefix}/WA.app /Applications/WA.app
    EOS
  end

  test do
    system "#{prefix}/WA.app/Contents/MacOS/WA", "--selftest"
  end
end
