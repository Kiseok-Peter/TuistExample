import ProjectDescription

let config = Config(
    plugins: [
        .local(path: .relativeToRoot("Plugins/TuistExample")),
        .git(url: "git@github.com:Kiseok-Peter/TuistTemplate.git", sha: "7166681", directory: "Templates"),
        .git(url: "git@github.com:Kiseok-Peter/TuistTemplate.git", sha: "7166681", directory: "StringSynthesizer")
    ]
)
