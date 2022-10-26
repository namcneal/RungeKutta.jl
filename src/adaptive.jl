"""
    AdaptiveParameters <: AbstractAdaptiveParameters

A composite type for the parameters of an adaptive [`AbstractRungeKuttaSolver`](@ref).

# Constructors
```julia
AdaptiveParameters(; atol::Real=0.0, rtol::Real=1e-5, nits::Integer=100)
```

## Arguments
- `atol :: Real` : absolute tolerance.
- `rtol :: Real` : relative tolerance.
- `nits :: Integer` : maximum number of iterations.
"""
struct AdaptiveParameters <: AbstractAdaptiveParameters
	desired_tol::Real
	max_num_iters::Int64
end

AdaptiveParameters(; desired_tol::Float64) = AdaptiveParameters(desired_tol, 100)
