type ODEProblem{uType,tType,isinplace,F} <: AbstractODEProblem{uType,tType,isinplace,F}
  f::F
  u0::uType
  tspan::Tuple{tType,tType}
end

type ODETestProblem{uType,AType,tType,isinplace,F} <: AbstractODETestProblem{uType,tType,isinplace,F}
  f::F
  u0::uType
  analytic::AType
  tspan::Tuple{tType,tType}
end

function ODEProblem(f,u0,tspan; iip = isinplace(f,3))
  ODEProblem{typeof(u0),eltype(tspan),iip,typeof(f)}(f,u0,tspan)
end

function ODETestProblem(f,u0,analytic,tspan=(0.0,1.0); iip = isinplace(f,3))
  ODETestProblem{typeof(u0),typeof(analytic),eltype(tspan),iip,typeof(f)}(f,u0,analytic,tspan)
end

#=
function print{uType,tType,isinplace,F}(io::IO, prob::AbstractODEProblem{uType,tType,isinplace,F})
  println(io,"AbstractODEProblem")
  println(io,"Independent Variable Type: $uType")
  println(io,"Depdendent Variable Type: $tType")
  println(io,"Function is in-place? $isinplace")
  nothing
end
=#

#=
function show{uType,tType,isinplace,F}(io::IO,prob::AbstractODEProblem{uType,tType,isinplace,F})
  println(io,"AbstractODEProblem{$uType,$tType,$isinplace}")
  nothing
end
=#
