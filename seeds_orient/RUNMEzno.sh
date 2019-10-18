#In terminal write: bash RUNME.sh
atomsk --polycrystal uc_zno.xsf poly_zno.txt seed_zno.xyz
#atomsk seed_zno.cfg -dup 2 2 0 many_seeds.cfg
#rm seed_zno.dat seed_zno_grains-com.xsf seed_zno_nodes.xsf seed_zno_param.txt
ovito seed_zno.xyz
