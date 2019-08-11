FROM julia

RUN julia -e 'using Pkg; Pkg.add("HTTP"); Pkg.add("JLD"); Pkg.add("RDatasets"); Pkg.add("StatsBase");' &&\
    julia -e 'using Pkg; Pkg.add(PackageSpec(url="https://github.com/genieframework/Genie.jl"))' &&\
    julia -e 'using Pkg; Pkg.add(PackageSpec(url="https://github.com/RottenFruits/SVM.jl"))'

COPY src/ /home/src

WORKDIR /home/src

EXPOSE 7000