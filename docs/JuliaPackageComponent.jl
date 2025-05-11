struct JuliaPackageComponent <: MultiDocumenter.DropdownComponent
    upstream::String
    path::String
    name::Any
    fix_canonical_url::Bool
    giturl::String
    branch::String
end

function JuliaPackageComponent(;
    upstream,
    name,
    path,
    giturl = "",
    branch = "gh-pages",
    fix_canonical_url = true,
)
    JuliaPackageComponent(upstream, path, name, fix_canonical_url, giturl, branch)
end

function MultiDocumenter.render(c::JuliaPackageComponent, doc, thispagepath, prettyurls)
    path = joinpath(doc, c.path)
    if !isfile(joinpath(path, "index.html"))
        stable = joinpath(path, "stable")
        dev = joinpath(path, "dev")
        if isfile(joinpath(stable, "index.html"))
            path = stable
        elseif isfile(joinpath(dev, "index.html"))
            path = dev
        end
    end
    rp = relpath(path, thispagepath)
    href = string(rp, prettyurls ? "/" : "/index.html")
    # need to force a trailing pathsep here
    class =
        startswith(thispagepath, joinpath(doc, c.path, "")) ? "nav-link active nav-item" :
        "nav-link nav-item"

    if c.name in wrapper_packages
        return MultiDocumenter.@htl """
            <a href="$(href)" style="color: #9b6622" class=$(class)>
                $(c.name)
            </a>
        """
    else
        return MultiDocumenter.@htl """
            <a href="https://juliaastro.org/$(c.name)/" class="nav-link nav-item">
                $(c.name)
            </a>
        """
    end
end

struct WrapperLink <: MultiDocumenter.DropdownComponent
    text::String
    link::String
end

function MultiDocumenter.render(c::WrapperLink, doc, thispage, prettyurls)
    if c.text in wrapper_packages
        return MultiDocumenter.@htl """
        <a href=$(c.link) class="nav-link nav-item" style="color: #9b6622">$(c.text)</a>
        """
        else
        return MultiDocumenter.@htl """
            <a href=$(c.link) class="nav-link nav-item">$(c.text)</a>
        """
    end
end

@eval MultiDocumenter begin
function maybe_clone(docs::Vector)
    for doc in filter(x -> x isa $(JuliaPackageComponent), docs)
        if !isdir(doc.upstream)
            if isempty(doc.giturl)
                error(
                    "MultiDocRef for $(doc.name): if giturl= is not passed, then upstream= must be an existing directory",
                )
            end
            @info "Upstream at $(doc.upstream) does not exist. `git clone`ing `$(doc.giturl)#$(doc.branch)`"
            run(
                `$(git()) clone --depth 1 $(doc.giturl) --branch $(doc.branch) --single-branch --no-tags $(doc.upstream)`,
            )
        else
            git_dir, git_worktree =
                abspath(joinpath(doc.upstream, ".git")), abspath(doc.upstream)
            if !isdir(git_dir)
                @warn "Unable to update existing clone at $(doc.upstream): .git/ directory missing"
                continue
            end
            @info "Updating existing clone at $(doc.upstream)"
            gitcmd = `$(git()) -C $(git_worktree) --git-dir=$(git_dir)`
            try
                if !success(`$(gitcmd) diff HEAD --exit-code`)
                    @warn "Existing clone at $(doc.upstream) has local changes -- not updating."
                    continue
                end
                run(`$(gitcmd) fetch origin $(doc.branch)`)
                run(`$(gitcmd) checkout --detach origin/$(doc.branch)`)
            catch e
                # We're only interested in catching `git` errors here
                isa(e, ProcessFailedException) || rethrow()
                @error "Unable to update existing clone at $(doc.upstream)" exception =
                    (e, catch_backtrace())
            end
        end
    end
    return nothing
end
end
