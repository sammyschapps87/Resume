library(shiny)
library(shinydashboard)



ui <- dashboardPage(
  skin = "blue",
  
  dashboardHeader(title = "Welcome to Sam's Website"),
  
  dashboardSidebar(sidebarMenu(
    menuItem("Home page", tabName = "home", icon = icon("home")),
    menuItem("Resume", tabName = "resume", icon = icon("resume"))
  )),
  dashboardBody(tabItems(
    tabItem(
      tabName = "home",
      setBackgroundColor(color = c("#FFFFFF"),
                         shinydashboard = TRUE),
      fluidRow(column(12,
                      align = "center",
                      titlePanel(
                        h1(id = "big heading",
                           "This is the Home Page!",
                           align = "center")
                      )))
      
    ),
    tabItem(tabName = "resume",
            fluidRow(column(
              12,
              align = "center",
              tags$iframe(
                src = "www/Resume_bayer_fin.pdf",
                width = "900",
                height = "600"
              )
            )))
  ))
)

server <- function(input, output, session) {
  set.seed(122)
}
