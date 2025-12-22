
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name automat_bancar -dir "F:/project-darabok/automat_bancar/planAhead_run_3" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "F:/project-darabok/automat_bancar/main.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {F:/project-darabok/automat_bancar} }
set_property target_constrs_file "main.ucf" [current_fileset -constrset]
add_files [list {main.ucf}] -fileset [get_property constrset [current_run]]
link_design
