shinyUI(
  fluidPage(
    dashboardPage(skin = "yellow",
      dashboardHeader(title = "Lab App 2"),
      dashboardSidebar(
        sidebarMenu(
        menuItem("HPLC計算ツール", tabName = "cal_hplc"),
        menuItem("Lab App 2 について", tabName = "information"),
        menuItem("バージョン情報", tabName = "version")
        )
      ),
      dashboardBody(

        tabItems(
          tabItem(tabName = "cal_hplc",
            ui_cal_hplc
                      ),
          tabItem(tabName = "information",
            box(
              status = "warning", 
              includeMarkdown("./README.md")
              )
          ),
          tabItem(tabName = "version",
            infoBox(
              "",
              includeText("version.txt"),
              color = "yellow",
              icon = icon("info-sign", lib = "glyphicon")
            )
          )
        )

      )
    ),
    tags$footer(
      tags$p("© 2021 Yusuke Fukuda")
    ),
    includeCSS("./css/style.css")
  )
)