#In terminal write: bash RUNME.sh
#Si es en la del local de adiestrados cambia mpi por serial
lmp_mpi <in.seeds_zno> out.oriented_seeds
ovito dump.Seeds.xyz
