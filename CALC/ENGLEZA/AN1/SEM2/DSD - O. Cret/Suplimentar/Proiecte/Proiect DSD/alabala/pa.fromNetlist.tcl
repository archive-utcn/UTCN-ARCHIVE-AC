
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name alabala -dir "C:/Documents and Settings/lh/Desktop/RL_XILINX/alabala/planAhead_run_1" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Documents and Settings/lh/Desktop/RL_XILINX/alabala/MAIN.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Documents and Settings/lh/Desktop/RL_XILINX/alabala} }
set_property target_constrs_file "MAIN.ucf" [current_fileset -constrset]
add_files [list {MAIN.ucf}] -fileset [get_property constrset [current_run]]
link_design
