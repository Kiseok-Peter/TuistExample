import ProjectDescription

let config = Config(
    plugins: [
        .local(path: .relativeToRoot("Plugins/TuistExample")),
        .git(url: "git@github.com:Kiseok-Peter/TuistTemplate.git", sha: "e4422cd", directory: "Templates"),
        .git(url: "git@github.com:Kiseok-Peter/TuistTemplate.git", sha: "e4422cd", directory: "StringSynthesizer")
    ]
)
