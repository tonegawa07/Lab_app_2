shinyUI(
  fluidPage(
    dashboardPage(skin = "green",
      dashboardHeader(title = "Lab App"),
      dashboardSidebar(
        sidebarMenu(
        menuItem("Calculation of HPLC data", tabName = "cal_hplc"),
        menuItem("Statistical tests", 
                        menuSubItem("Tukey", tabName = "tukey"),
                        menuSubItem("Two-way ANOVA", tabName = "tw_anova"),
                        menuSubItem("Other tests", tabName = "stat_test")),
        menuItem("Information", tabName = "information")
        )
      ),
      dashboardBody(

        tabItems(
          tabItem(tabName = "cal_hplc",
            ui_cal_hplc
                      ),

          tabItem(tabName = "tukey",
            ui_tukey
                      ),

          tabItem(tabName = "tw_anova",
            ui_tw_anova
                      ),

          tabItem(tabName = "stat_test",
            box(
              title = "Coming soon"
            )
                      ),

          tabItem(tabName = "information",
            box(
              title = "Information",
              tags$p("If you don't know how to use."),
              tags$a(href = "https://github.com/tonegawa07/Lab_app/blob/master/README.md", "Click here.", target="_blank", rel="noopener")
              )
          )
        )

      )
    ),
    tags$footer(
      tags$p("© 2020 Yusuke Fukuda")
    ),
    includeCSS("./css/style.css")
  )
)