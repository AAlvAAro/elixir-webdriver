defmodule WebDriver.Mixfile do
  use Mix.Project

  def project do
    [ app: :webdriver,
      version: "0.5.0",
      description: "Webdriver protocol for driving web browsers.",
      source_url: "https://github.com/stuart/elixir-webdriver",
      homepage_url: "http://stuart.github.io/elixir-webdriver",
      package: package,
      deps: deps(Mix.env)
    ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: { WebDriver, []},
      registered:   [ :webdriver ],
      applications: [ :httpotion ],
      env: [ debug_browser: false ]
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [{:httpotion, "~> 0.2.4", github: "myfreeweb/httpotion"},
     {:jsonex,    "~> 2.0.0", github: "marcelog/jsonex"}
     ]
  end

  defp deps :test do
    deps ++ [{:mock,          github: "jjh42/mock"}]
  end

  defp deps :dev do
    deps ++ [{:mock,          github: "jjh42/mock"},
             {:markdown,      github: "devinus/markdown"},
             {:ex_doc,        github: "elixir-lang/ex_doc"}]
  end

  defp deps _ do
    deps
  end

  defp package do
    [
      contributors: ["Stuart Coyle", "Carl Woodward"],
      licenses: ["MIT License"],
      links: %{"GitHub" => "https://github.com/stuart/elixir-webdriver",
              "Docs" => "http://stuart.github.io/elixir-webdriver/"}
    ]
  end
end
