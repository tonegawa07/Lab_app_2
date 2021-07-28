library(shiny)
library(shinydashboard)
library(tidyverse)
library(multcomp)
library(DT)

# function
source("./function/cal_hplc.R", local = TRUE)
source("./function/std_plot.R", local = TRUE)
source("./function/tukey.R", local = TRUE)
source("./function/tukey_table.R", local = TRUE)
source("./function/tw_anova.R", local = TRUE)
source("./function/tw_anova_table.R", local = TRUE)

# ui
source("./ui/ui_cal_hplc.R", local = TRUE)
source("./ui/ui_tukey.R", local = TRUE)
source("./ui/ui_tw_anova.R", local = TRUE)