mutable struct ExplicitRungeKuttaCache{stepsize_T<:Real, n_T<:Integer, m_T<:Integer, v_T<:(AbstractVector{ℂ} where ℂ<:Number), k_T<:(AbstractVector{𝕍} where 𝕍<:AbstractVector{ℂ} where ℂ<:Number), e_T<:(Ref{ℝ} where ℝ<:Real)} <: AbstractRungeKuttaCache
    stepsize::stepsize_T # current stepsize
    n::n_T # step counter
    m::m_T # adaptive counter
    v::v_T # avoids allocation inside `adaptivestep!`
    v2::v_T
    k::k_T # stages at step `n`
    e::e_T # compensated summation error
end

function ExplicitRungeKuttaCache(initial_stepsize::T, u0::AbstractVector{ℂ}, solver::ExplicitRungeKuttaSolver) where {T<:Real, ℂ<:Number}
    @↓ s = solver.tableau
    n = m = 1
    v  = similar(u0)
    v2 = similar(u0)
    k = [similar(u0) for i = 1:s]
    e = Ref(0.0)
    return ExplicitRungeKuttaCache(initial_stepsize, n, m, v, v2, k, e)
end

#---------------------------------- FUNCTIONS ----------------------------------
RungeKuttaCache(h::T, u0::AbstractVector{ℂ}, solver::ExplicitRungeKuttaSolver) where {T<:Real, ℂ<:Number} = ExplicitRungeKuttaCache(h, u0, solver)
