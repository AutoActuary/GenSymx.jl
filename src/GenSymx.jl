module GenSymx
    export gensymx, @gensymx


    numsubscript(s) = begin
        subs = Dict("0"=>"₀", "1"=>"₁", "2"=>"₂", "3"=>"₃", "4"=>"₄", "5"=>"₅", "6"=>"₆", "7"=>"₇", "8"=>"₈", "9"=>"₉");
        replace(s, r"0|1|2|3|4|5|6|7|8|9" => x->subs[x])
    end


    """
    gensymx([tag])
    Generates a symbol which will not conflict with other variable names.
    """
    gensymx(s) = begin
        sym = string(gensym(s))
        i = collect(findlast("#", sym))[1]

        nums = sym[i+1:end]
        sym = "ₓₓ" * sym[3:i-1] * "ₓ" * numsubscript(nums)

        Symbol(sym)
    end

    gensymx() = begin
        sym = string(gensym())
        Symbol("ₓₓ" * numsubscript(sym[3:end]))
    end


    """
        @gensymx
    Generates a gensymx symbol for a variable. For example, `@gensymx x y`
    is transformed into `x = gensymx("x"); y = gensymx("y")`.
    """
    macro gensymx(names...)
    Expr(:block,
       [:($(esc(i)) = gensymx($(string(i)))) for i in names]...,
       nothing
    )
    end

end
