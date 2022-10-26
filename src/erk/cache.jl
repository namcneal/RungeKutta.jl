mutable struct ExplicitRungeKuttaCache{n_T<:Integer, m_T<:Integer, v_T<:(AbstractVector{ℂ} where ℂ<:Number), k_T<:(AbstractVector{𝕍} where 𝕍<:AbstractVector{ℂ} where ℂ<:Number), e_T<:(Ref{ℝ} where ℝ<:Real)} <: AbstractRungeKuttaCache
    n::n_T # step counter
    m::m_T # adaptive counter
    v::v_T # avoids allocation inside `adaptivestep!`
    v2::v_T
    k::k_T # stages at step `n`
    e::e_T # compensated summation error
end

function ExplicitRungeKuttaCache(u0::AbstractVector{ℂ}, solver::ExplicitRungeKuttaSolver) where {ℂ<:Number}
    @↓ s = solver.tableau
    n = m = 1
    v  = similar(u0)
    v2 = simular(u0)
    k = [similar(u0) for i = 1:s]
    e = Ref(0.0)
    return ExplicitRungeKuttaCache(n, m, v, v2, k, e)
end

function ExplicitRungeKuttaCache(problem::AbstractInitialValueProblem, solver::ExplicitRungeKuttaSolver)
    @↓ u0 = problem
    @↓ s = solver.tableau
    n = m = 1
    v  = similar(u0)
    v2 = similar(u0)
    k = [similar(u0) for i = 1:s]
    e = Ref(0.0)
    return ExplicitRungeKuttaCache(n, m, v, v2, k, e)
end

#---------------------------------- FUNCTIONS ----------------------------------

RungeKuttaCache(problem::AbstractInitialValueProblem, solver::ExplicitRungeKuttaSolver)    = ExplicitRungeKuttaCache(problem, solver)

RungeKuttaCache(u0::AbstractVector{ℂ}, solver::ExplicitRungeKuttaSolver) where {ℂ<:Number} = ExplicitRungeKuttaCache(u0,      solver)
