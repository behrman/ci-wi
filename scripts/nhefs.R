# Download and process NHEFS data

# Author: Bill Behrman
# Version: 2022-05-23

# Packages
library(tidyverse)

# Parameters
  # URL for NHFES data
url_nhfes <- "https://cdn1.sph.harvard.edu/wp-content/uploads/sites/1268/1268/20/nhefs.csv"
  # File for downloaded raw NHEFS data
file_raw <- here::here("data-raw/nhefs.csv")
  # File for processed NHFES data
file_nhfes <- here::here("data/nhefs.rds")

#===============================================================================

download.file(url = url_nhfes, destfile = file_raw)

file_raw %>%
  read_csv(
    col_types =
      cols(
        seqn = col_integer(),
        qsmk = col_factor(),
        death = col_factor(),
        yrdth = col_integer(),
        modth = col_integer(),
        dadth = col_integer(),
        sbp = col_double(),
        dbp = col_double(),
        sex = col_factor(),
        age = col_double(),
        race = col_factor(),
        income = col_factor(),
        marital = col_factor(),
        school = col_double(),
        education = col_factor(),
        ht = col_double(),
        wt71 = col_double(),
        wt82 = col_double(),
        wt82_71 = col_double(),
        birthplace = col_factor(),
        smokeintensity = col_double(),
        smkintensity82_71 = col_double(),
        smokeyrs = col_double(),
        asthma = col_factor(),
        bronch = col_factor(),
        tb = col_factor(),
        hf = col_factor(),
        hbp = col_factor(),
        pepticulcer = col_factor(),
        colitis = col_factor(),
        hepatitis = col_factor(),
        chroniccough = col_factor(),
        hayfever = col_factor(),
        diabetes = col_factor(),
        polio = col_factor(),
        tumor = col_factor(),
        nervousbreak = col_factor(),
        alcoholpy = col_factor(),
        alcoholfreq = col_factor(),
        alcoholtype = col_factor(),
        alcoholhowmuch = col_double(),
        pica = col_factor(),
        headache = col_factor(),
        otherpain = col_factor(),
        weakheart = col_factor(),
        allergies = col_factor(),
        nerves = col_factor(),
        lackpep = col_factor(),
        hbpmed = col_factor(),
        boweltrouble = col_factor(),
        wtloss = col_factor(),
        infection = col_factor(),
        active = col_factor(),
        exercise = col_factor(),
        birthcontrol = col_factor(),
        pregnancies = col_factor(),
        cholesterol = col_double(),
        hightax82 = col_factor(),
        price71 = col_double(),
        price82 = col_double(),
        tax71 = col_double(),
        tax82 = col_double(),
        price71_82 = col_double(),
        tax71_82 = col_double()
      )
  ) %>%
  mutate(
    across(where(is.factor), ~ fct_relevel(., ~ str_sort(., numeric = TRUE)))
  ) %>%
  arrange(seqn) %>%
  write_rds(file_nhfes)
