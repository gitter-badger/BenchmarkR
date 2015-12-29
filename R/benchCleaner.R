# functions for cleaning data.frame created by benchmaRk

benchCleaner <- function(target){
  # Cleans target data.frame/files

  target <- tolower(target)

  if(target == "profiles"){
    # removes all records in PROFILES
    ExecEnvironment$PROFILES <- NULL
  }

  if(target == "benchmarks"){
    # removes all records in BENCHMARKS
    ExecEnvironment$BENCHMARKS <- NULL
  }

  if(target == "meta"){
    # removes all records in META
    ExecEnvironment$META <- NULL
  }

  if(target == "warnings"){
    # removes all records in WARNINGS
    ExecEnvironment$WARNINGS <- NULL

  }

  if(target == "timedfunctionfile"){
    # removes timedFunctions.R file
    if(file.exists("R/timedFunctions.R")){
      cat("\nRemoving R/timedFunctions.R file...\n")
      file.remove("R/timedFunctions.R")
    }
  }

}