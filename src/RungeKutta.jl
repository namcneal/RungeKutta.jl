module RungeKutta

export AbstractRungeKuttaSolution
export AbstractRungeKuttaSolver

export RungeKuttaSolution
export ButcherTableau

export ExplicitRungeKuttaSolver, ERK
export ImplicitRungeKuttaSolver, IRK
export ExplicitExponentialRungeKuttaSolver, EERK

export Euler, ExplicitEuler
export Midpoint, ExplicitMidpoint
export Heun2
export Ralston2
export Heun3
export Kutta3
export Ralston3
export SSPRK3
export RK4
export Rule38

export HeunEuler
export Fehlberg45, F45
export DormandPrince54, DP54
export Verner65, V65

export BackwardEuler, ImplicitEuler
export ImplicitMidpoint
export CrankNicolson
export SDIRK3
export GaussLegendre4, GL4
export GaussLegendre6, GL6
export LobattoIIIA4
export LobattoIIIB2
export LobattoIIIB4
export LobattoIIIC2
export LobattoIIIC4
export RadauIA3
export RadauIA5
export RadauIIA3
export RadauIIA5

export ExponentialRK4, ERK4

export ℛ
export extract

using ArrowMacros
using LinearAlgebra
using NSDEBase
using RecipesBase

include("abstract.jl")
include("utils.jl")
include("solution.jl")
include("adaptive.jl")
include("tableau.jl")
include("stepsize.jl")
include("explicit.jl")
include("newton.jl")
include("implicit.jl")
include("exponential.jl")
include("methods.jl")
include("cache.jl")
include("step.jl")
include("solve.jl")
include("stability.jl")
include("plot.jl")

end
