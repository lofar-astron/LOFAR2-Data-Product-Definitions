
if (EPS2EPS_CONVERTER)
  
  add_custom_target (fix_eps ALL)
  
  file (GLOB icd_figures *.eps)
  
  if (icd_figures)
    
    foreach (_filename ${icd_figures})
      
      get_filename_component (_filename  ${_filename} NAME_WE )
      get_filename_component (_extension ${_filename} EXT     )
      
      add_custom_target (${_filename}
	COMMAND echo "Processing ${_filename} ..."
#	COMMAND ${EPS2EPS_CONVERTER} ${_filename} tmp.${_extension}
#	COMMAND mv tmp.${_extension} ${_filename}
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
	)
      add_dependencies (fix_eps ${_filename})
      
    endforeach (_filename)
    
  endif (icd_figures)
  
endif (EPS2EPS_CONVERTER)
