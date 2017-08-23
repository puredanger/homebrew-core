class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://download.clojure.org/install/brew/install-clj-1.8.0.119.tar.gz"
  sha256 "7e272d3ae13d97c8fb6848d6851112e88995958391f40a1787bd82b6222d779e"

  devel do
    url "https://download.clojure.org/install/brew/install-clj-1.9.0-alpha18.120.tar.gz"
    sha256 "92946dd137c394d954b47513aa87a39578e4a2c893ff3501710072f170b07aca"
    version "1.9.0-alpha18.120"
  end

  bottle :unneeded

  depends_on :java => "1.7+"
  depends_on "rlwrap"

  def install
    prefix.install "install-clj-1.9.0-alpha18.120.jar"
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
