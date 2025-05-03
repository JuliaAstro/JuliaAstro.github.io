module JuliaAstroDocs

import CommonMark as CM
using TypedTables, SplitApplyCombine

parser = CM.Parser()
ecosystem_ast = open(parser, joinpath(dirname(@__DIR__), "docs", "src", "ecosystem.md"))

function parse_ecosystem(ast)
    packages = @NamedTuple{highlevel, name, repo, doc, tagline}[]
    for (node, enter) in ast
        t = node.t
        c = node.first_child
        if enter
            # Highlevel
            if t isa CM.Heading && t.level == 2
                global highlevel = c.literal
            end

            # Package name
            if t isa CM.Heading && t.level == 3
                global name = c.literal
            end

            # Links (repo, docs, ...)
            if t isa CM.Link
                link_kind = c.first_child
                if !isempty(link_kind) && link_kind.literal == "curly braces"
                    global repo = t.destination
                end
                if !isempty(link_kind) && link_kind.literal == "book icon"
                    global doc = t.destination
                end
            end

            # Tagline
            if t isa CM.Strong
                global tagline = c.literal
                push!(packages, (; highlevel, name, repo, doc, tagline))
            end

            # if t isa CM.ThematicBreak
            #   @info node
            # end
        end
    end
    return packages
end

t = parse_ecosystem(ecosystem_ast) |> Table

ecosystem = group(t.highlevel, t)

end
