# GenSymx.jl

This module adds the function `gensymx` and macro `@gensymx`. They work exactly the same as Base's 
`gensym` and `@gensym`, except that those symbols are generated in the form `Symbol("##varname#402")`
and our symbols are generated in the form `:ₓₓvarnameₓ₄₀₂`  in order to remove some visual noise.

### Example usage
```
julia> using GenSymx
julia> @gensym a b helloworld
julia> @show a b helloworld
a = :ₓₓaₓ₄₀₄
b = :ₓₓbₓ₄₀₅
helloworld = :ₓₓhelloworldₓ₄₀₆
```

