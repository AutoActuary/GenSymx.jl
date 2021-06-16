# GenSymx.jl

This module adds the function `gensymx` and macro `@gensymx`. They work exactly the same as their Base equivalents, except that our symbols are generated in the form `:ₓₓvarₓ₄₀₂` to ease readability, rather than  `Symbol("##var#402")`.

### Example usage
```
julia> using GenSymx
julia> @gensymx a b helloworld
julia> @show a b helloworld
a = :ₓₓaₓ₄₀₄
b = :ₓₓbₓ₄₀₅
helloworld = :ₓₓhelloworldₓ₄₀₆
```

