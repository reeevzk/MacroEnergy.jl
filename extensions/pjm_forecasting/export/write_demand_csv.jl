module WriteDemandCSV

using CSV
using DataFrames

"""
Write MacroEnergy-compatible demand.csv.

only necessary variables are the time index, and the MW demands for each (3) zones.
The H2 demands and Demand_Zero columns are filled with zeros.
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
