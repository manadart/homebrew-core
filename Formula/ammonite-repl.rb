class AmmoniteRepl < Formula
  desc "Ammonite is a cleanroom re-implementation of the Scala REPL"
  homepage "https://ammonite.io/"
  url "https://github.com/lihaoyi/Ammonite/releases/download/2.3.8/2.13-2.3.8"
  version "2.3.8"
  sha256 "e7af76416202ff02b8faece785740d957e3ca6351f8d56cf69a749ec4d25484b"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "777b931c4acfc5877495f31eafbc63b991c39b8d408177540b3ef64cb469d049"
  end

  depends_on "openjdk"

  def install
    (libexec/"bin").install Dir["*"].first => "amm"
    chmod 0755, libexec/"bin/amm"
    (bin/"amm").write_env_script libexec/"bin/amm", Language::Java.overridable_java_home_env
  end

  test do
    output = shell_output("#{bin}/amm -c 'print(\"hello world!\")'")
    assert_equal "hello world!", output.lines.last
  end
end
