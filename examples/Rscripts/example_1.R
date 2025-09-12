# ---- Libraries ----
library(here)

# ---- Settings ----
script_name <- "example_1.R"   # <-- Change to your actual script name
data_file   <- here("output", "random_data.csv")
log_file    <- here("log", "script_log.txt")

# ---- Open log file and redirect console output ----
sink(log_file, append = FALSE, split = TRUE)   # redirect output to logfile
cat(paste0('"', script_name, '" opened.\n'))

success <- FALSE

tryCatch({
  # Generate data
  set.seed(123) # reproducibility
  df <- data.frame(
    var1 = sample(0:99999, 1000, replace = TRUE),
    var2 = sample(0:99999, 1000, replace = TRUE),
    var3 = sample(0:99999, 1000, replace = TRUE),
    var4 = sample(0:99999, 1000, replace = TRUE),
    var5 = sample(0:99999, 1000, replace = TRUE)
  )
  
  # Example console message
  print("Random Data generated: ")
  print(head(df))   # just to show something will appear in logfile
  
  # Write CSV
  write.csv(df, data_file, row.names = FALSE)
  
  success <- TRUE
}, error = function(e) {
  cat("ERROR:", conditionMessage(e), "\n")
})

# ---- Final logging ----
if (success) {
  cat(paste0('"', script_name, '" execution successful!\n'))
} else {
  cat(paste0('"', script_name, '" execution failed!\n'))
}

# ---- Stop redirecting ----
sink()