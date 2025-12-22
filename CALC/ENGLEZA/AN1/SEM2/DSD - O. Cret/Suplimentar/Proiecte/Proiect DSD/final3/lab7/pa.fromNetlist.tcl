
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name lab7 -dir "D:/semestrul 2/final3/lab7/planAhead_run_3" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/semestrul 2/final3/lab7/counter.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/semestrul 2/final3/lab7} }
set_property target_constrs_file "counter.ucf" [current_fileset -constrset]
add_files [list {counter.ucf}] -fileset [get_property constrset [current_run]]
link_design
