module TerminalGat

using Markdown

using gat_jll: gat_jll
export gat, gess

using IOCapture: IOCapture
using TerminalPager: pager

function gat(filename::AbstractString)
    if splitext(filename)[end] == ".md"
        run(`$(gat_jll.gat()) -M $(filename) --force-color`)
    else
        run(`$(gat_jll.gat()) $(filename) --force-color`)
    end
    nothing
end

function gat(md::Markdown.MD)
    str = sprint(show, MIME"text/plain"(), md, context=:color => false)
    open(pipeline(`$(gat_jll.gat()) --force-color -l julia`), "w", stdout) do f
        println(f, str)
    end
end

function gess(filename::AbstractString)
    c = IOCapture.capture() do
        gat(filename)
    end
    c.output |> pager
end

function gess(md::Markdown.MD)
    c = IOCapture.capture() do
        gat(md)
    end
    c.output |> pager
end

end # module
