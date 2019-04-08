class ClojureLsp < Formula
  desc "Language Server (LSP) for Clojure"
  homepage "https://github.com/snoe/clojure-lsp"
  url "https://github.com/snoe/clojure-lsp/archive/release-20190408T040839.tar.gz"
  sha256 "79c6d812a8ef4af2cfdd78c4b9aa96674ff9fb8dfeb27869215caa4aee954fae"
  head "https://github.com/snoe/clojure-lsp.git"

  depends_on "leiningen" => :build

  def install
    system "lein", "uberjar"
    jar = Dir["target/clojure-lsp-*-standalone.jar"][0]
    libexec.install jar
    bin.write_jar_script libexec/File.basename(jar), "clojure-lsp"
  end

  test do
    system "#{bin}/clojure-lsp", "--version"
  end
end
