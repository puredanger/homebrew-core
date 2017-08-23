class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  version "1.8.0.119"
  url "https://download.clojure.org/install/brew/install-clj-1.8.0.119.tar.gz"
  sha256 "7e272d3ae13d97c8fb6848d6851112e88995958391f40a1787bd82b6222d779e"

  devel do
    version "1.9.0-alpha18.118"
    url "https://download.clojure.org/install/brew/install-clj-1.9.0-alpha18.118.tar.gz"
    sha256 "93d59d7283a488b1d2fa21038519033543ca36e2f9ac50ccacf2a8801113cba7"
  end

  bottle :unneeded

  depends_on :java => "1.7+"
  depends_on "rlwrap"

  def install
    prefix.install "install-clj-1.9.0-alpha18.118.jar"
    prefix.install "clj.props"
    inreplace "install-clj", /PREFIX/, prefix
    bin.install "install-clj"
    bin.install "clj"
  end

  test do
    ENV.java_cache
    system "#{bin}/clj", "-e", "nil"
  end
end
