using TerminalGat
using Documenter

DocMeta.setdocmeta!(TerminalGat, :DocTestSetup, :(using TerminalGat); recursive=true)

makedocs(;
    modules=[TerminalGat],
    authors="Satoshi Terasaki <terasakisatoshi.math@gmail.com> and contributors",
    sitename="TerminalGat.jl",
    format=Documenter.HTML(;
        canonical="https://terasakisatoshi.github.io/TerminalGat.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/terasakisatoshi/TerminalGat.jl",
    devbranch="main",
)
