class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://download.clojure.org/install/brew/clojure-scripts-1.8.0.129.tar.gz"
  sha256 "8010fce3a9f7be929e82d3175dc6222a9080743e637af31ff7bf4179df5c797b"

  devel do
    url "https://download.clojure.org/install/brew/clojure-scripts-1.9.0-alpha19.152.tar.gz"
    sha256 "8e6c8e41896f190c8e2e361c251304ddb21a6a4bd2fc6e9aae44013e8776ec69"
    version "1.9.0-alpha19.152"
  end

  bottle :unneeded

  depends_on :java => "1.7+"
  depends_on "rlwrap"

  def install
    prefix.install Dir["*.jar"]
    prefix.install "deps.edn"
    inreplace "clojure", /PREFIX/, prefix
    bin.install "clojure"
    bin.install "clj"
  end

  def caveats; <<-EOS.undent
      Run `clojure -h` to see Clojure runner options.
      Run `clj` for an interactive Clojure REPL.
    EOS
  end

  test do
    ENV.java_cache
    system("#{bin}/clj -e nil")
    %w[clojure clj].each do |clj|
      assert_equal "2", shell_output("#{bin}/#{clj} -e \"(+ 1 1)\"").strip
    end
  end
end
