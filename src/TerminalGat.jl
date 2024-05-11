module TerminalGat

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

function gess(filename::AbstractString)
    c = IOCapture.capture() do
        gat(filename)
    end
    c.output |> pager
end

end # module