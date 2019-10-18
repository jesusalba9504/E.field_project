#In terminal write: bash RUNME.sh
atomsk --polycrystal uc_sno2.xsf poly.txt substrate.cfg
rm substrate.dat substrate_grains-com.xsf substrate_nodes.xsf substrate_param.txt
atomsk --polycrystal uc_zno.xsf poly_zno.txt big_seed_zno.xyz
rm seed_zno.dat big_seed_zno.dat big_seed_zno_grains-com.xsf big_seed_zno_nodes.xsf big_seed_zno_param.txt
#atomsk big_seed_zno.xyz -duplicate 2 2 2 many_seeds.xyz
atomsk big_seed_zno.xyz -cut below 10 x -cut above 20 x -cut below 10 y -cut above 20 y -cut below 10 z -cut above 20 z seed1.xyz
atomsk big_seed_zno.xyz -cut below 30 x -cut above 40 x -cut below 10 y -cut above 20 y -cut below 10 z -cut above 20 z seed2.xyz
atomsk big_seed_zno.xyz -cut below 10 x -cut above 20 x -cut below 30 y -cut above 40 y -cut below 10 z -cut above 20 z seed3.xyz
atomsk big_seed_zno.xyz -cut below 30 x -cut above 40 x -cut below 30 y -cut above 40 y -cut below 10 z -cut above 20 z seed4.xyz

atomsk --merge 4 seed1.xyz seed2.xyz seed3.xyz seed4.xyz seed_array.xyz
atomsk --merge 2 substrate.cfg seed_array.xyz final.xyz
atomsk final.xyz lammps
ovito final.xyz

#rm seed_zno.dat seed_zno_grains-com.xsf seed_zno_nodes.xsf seed_zno_param.txt
