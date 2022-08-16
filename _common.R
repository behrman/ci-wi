
# Parameters

# Set seed for random number generation
set.seed(42)

# General options
options(
  dplyr.print_max = 10,
  dplyr.print_min = 10,
  dplyr.summarise.inform = FALSE
)

# knitr options
knitr::opts_chunk$set(
  comment = "#>",
  collapse = FALSE,
  fig.asp = 0.618,  # 1 / phi
  fig.show = "hold",
  out.width = "100%"
)

#===============================================================================

# Save result
save_result <- function(x, file, section, method, dataset) {
  read_rds(here::here(file)) %>%
    filter(section != {{section}} | method != {{method}}) %>%
    add_row(section = section, method = method, dataset = dataset, x) %>%
    arrange(section, method, dataset) %>%
    write_rds(here::here(file))
}
