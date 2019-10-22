using DelimitedFiles,Distributions
global NA = 6.022e23 ; #this is the Avogadro number;

#ionic radii
#Zn = 0.74
#O = 1.40


# this function calculates the cartesian distance between two points in the 3D-space
function distancia(p1,p2)
    return sqrt((p1[1]-p2[1])^2+(p1[2]-p2[2])^2+(p1[3]-p2[3])^2)
end

# this function verify if the distance of a point "pos" is less then "dist" for all the points in a list "lista"
function verifica(lista,pos,dist)
    t=[0];
    for k=1:length(lista)
        if distancia(pos,lista[k]) < dist
            push!(t,1);
        else push!(t,0);
        end
    end
    return sum(t);
end

# calculate the number of ions according to the box size:
function calcula_ion_number(volume)
	Ions_O = round(Int,NA*333*volume*1e-28);
	Ions_Zn = round(Int,NA*50*volume*1e-28);
	# Ions_O = 300;
	# Ions_Zn = 50;

	return lista = [Ions_Zn,Ions_O];
end


# generate a random array of particles with rules on the distances between then
function genera_particles(ion_number_list)
    dist_zn_o = 1.9;
    dist_zn_zn = 2.6;
    dist_o_o = 1.25;
    zn_lista = [];
    i = 1;
    while length(zn_lista) < ion_number_list[1]
        new_pos=[rand(Uniform(-20,20)) rand(Uniform(-20,20)) rand(Uniform(6,90))];
        if verifica(zn_lista,new_pos,dist_zn_zn)==0
            push!(zn_lista,new_pos)
            i+=1
        end
    end

    o_lista = [];
    while length(o_lista) < ion_number_list[2]
        new_pos=[rand(Uniform(-20,20)) rand(Uniform(-20,20)) rand(Uniform(6,90))];;
        if verifica(zn_lista,new_pos,dist_zn_o)==0 && verifica(o_lista,new_pos,dist_o_o)==0
            push!(o_lista,new_pos)
            i+=1
        end
    end
    return append!(zn_lista,o_lista)
end

# this function is for the exporting process of the data
function escribe(volume)
	n1 = calcula_ion_number(volume)[1];
	n2 = calcula_ion_number(volume)[2];
	n = n1+n2;
    a = genera_particles(calcula_ion_number(volume))
    b = [i for i in 1:n]
    c = append!(["Zn" for i in 1:n1],["O" for i in 1:n2])
    d = []

    for i in 1:n
        push!(d,[c[i] a[i]])
    end
    return d
end


open("/home/simulations/Documents/e.field/generate_nr/ini2.dat","w") do io
    writedlm(io,escribe(40*40*90))
end

# open("/home/jesus/Documents/electric_field_proyect/file_for_math","w") do io
#     writedlm(io,genera_particles(360,zn_zn,zn_o,o_o))
# end
