#In terminal write: bash RUNME.sh
atomsk --polycrystal uc_sno2.xsf poly.txt substrate.cfg
rm substrate.dat substrate_grains-com.xsf substrate_nodes.xsf substrate_param.txt
ovito substrate.cfg
