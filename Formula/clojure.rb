class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"

  devel do
    version "1.9.0-alpha18.116"
    url "https://download.clojure.org/install/brew/install-clj-1.9.0-alpha18.116.tar.gz"
    sha256 "9a11824797190fb6603c8022dbc6398d7a1ae91fb2da56c0587d39f83a40a060"
  end

  bottle :unneeded

  depends_on :java => "1.7+"
  depends_on "rlwrap"

  def install
    prefix.install "install-clj-1.9.0-alpha18.116.jar"
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
