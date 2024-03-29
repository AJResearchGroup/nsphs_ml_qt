# message("Running on: ", uppmaxr::get_where_i_am())

args <- commandArgs(trailingOnly = TRUE)

if (1 == 2) {
  args <- "~/sim_data_issue_18/experiment_params.csv"
}

if (length(args) != 1) {
  stop(
    "Invalid number of arguments: must have 1 parameter: \n",
    " \n",
    "  1. gcae_experiment_params_filename \n",
    " \n",
    "Actual number of parameters: ", length(args), " \n",
    "Parameters: {", paste0(args, collapse = ", "), "}"
  )
}

gcae_experiment_params_filename <- args[1]
message("gcae_experiment_params_filename: ", gcae_experiment_params_filename)
testthat::expect_true(file.exists(gcae_experiment_params_filename))

message("Reading the 'gcae_experiment_params_filename'")
gcae_experiment_params <- gcaer::read_gcae_experiment_params_file(
  gcae_experiment_params_filename = gcae_experiment_params_filename
)

message("Creating the input data plots")
input_data_plots_filenames <- nsphsmlqt::create_input_data_plots(
  gcae_experiment_params = gcae_experiment_params
)
message(
  "Created 'input_data_plots_filenames': \n * ",
  paste0(
    as.character(unlist(input_data_plots_filenames)),
    collapse = "\n * "
  )
)
