module WriteDemandCSV

using CSV
using DataFrames

"""
Write MacroEnergy-compatible demand.csv.

Inputs:
- path::String : path to output CSV
- time::Vector{DateTime} : time index
- z1::Vector{Float64} : demand scenario for zone 1
- z2::Vector{Float64} : demand scenario for zone 2
- z3::Vector{Float64} : demand scenario for zone 3
"""
function write_demand(path::String, time::Vector, z1::Vector, z2::Vector, z3::Vector)
    n = length(time)
    df = DataFrame(
        Time_Index = time,
        Demand_MW_z1 = z1,
        Demand_MW_z2 = z2,
        Demand_MW_z3 = z3,
        Demand_H2_z1 = zeros(n), # not needed because we only care about time and MW
        Demand_H2_z2 = zeros(n),
        Demand_H2_z3 = zeros(n),
        Demand_Zero = zeros(n)
    )
    CSV.write(path, df)
end

end # module