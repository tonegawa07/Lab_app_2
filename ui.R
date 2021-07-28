shinyUI(
  fluidPage(
    dashboardPage(skin = "yellow",
      dashboardHeader(title = "Lab App 2"),
      dashboardSidebar(
        sidebarMenu(
        menuItem("HPLC計算ツール", tabName = "cal_hplc"),
        menuItem("Lab App 2 について", tabName = "information")
        )
      ),
      dashboardBody(

        tabItems(
          tabItem(tabName = "cal_hplc",
            ui_cal_hplc
                      ),
          tabItem(tabName = "information",
            box(
              title = "Lab App 2 について",
              tags$p("詳細は以下のリンクに記載されています"),
              tags$a(href = "https://github.com/tonegawa07/Lab_app_2/blob/master/README.md", "詳細", target="_blank", rel="noopener")
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