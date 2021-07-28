# install packages
source("./init.R")

library(shiny)
library(shinydashboard)
library(tidyverse)
library(DT)

# function
source("./function/cal_hplc.R", local = TRUE)
source("./function/std_plot.R", local = TRUE)
source("./function/validate_numeric.R", local = TRUE)
source("./function/not_numeric_colname.R", local = TRUE)

# ui
source("./ui/ui_cal_hplc.R", local = TRUE)