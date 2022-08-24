
ui <- dashboardPage(
  skin = "blue",
  
  dashboardHeader(title = "Welcome"),
  
  dashboardSidebar(sidebarMenu(
    menuItem("Home page", tabName = "home", icon = icon("home")),
    menuItem("Summary", tabName = "sum")
  )),
  dashboardBody(
    tags$head(tags$style(HTML('
                          /* logo */
                          .skin-blue .main-header .logo {
                          background-color: #FFFFFF; color: #1E90FF;
                          font-weight: bold;font-size: 24px;text-align: center;
                          }

                          /* logo when hovered */

                          .skin-blue .main-header .logo:hover {
                          background-color: #AFEEEE;
                          }


                          /* navbar (rest of the header) */
                          .skin-blue .main-header .navbar {
                          background-color: #FFFFFF;
                          }

                          /* main sidebar */
                          .skin-blue .main-sidebar {
                          background-color: #FFFFFF;;
                          }

                          # /* main body */
                          # .skin-blue .main-body {
                          # background-color: #1E90FF;
                          # }

                          /* active selected tab in the sidebarmenu */
                          .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{
                          background-color: #FFFFFF;
                          color: #1E90FF;font-weight: bold;font-size: 18px;
                          }

                          /* other links in the sidebarmenu */
                          .skin-blue .main-sidebar .sidebar .sidebar-menu a{
                          background-color: #FFFFFF;
                          color: #1E90FF;font-weight: bold;
                          }

                          /* other links in the sidebarmenu when hovered */
                          .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover{
                          background-color: #AFEEEE ;color: #1E90FF ;font-weight: bold;
                          }

                          /* toggle button color  */
                          .skin-blue .main-header .navbar .sidebar-toggle{
                          background-color: #FFFFFF ;color: #1E90FF;
                          }

                          /* toggle button when hovered  */
                          .skin-blue .main-header .navbar .sidebar-toggle:hover{
                          background-color: #AFEEEE; color:1E90FF;
                          }

#                           '))),
    
    tabItems(
      tabItem(
        tabName = "home",
        setBackgroundColor(color = c("#FFFFFF"),
                           shinydashboard = TRUE),
        fluidRow(column(12,
                        align = "center",
                        titlePanel(
                          h1(id = "big heading",
                             "Welcome to Samuel Schappel's interactive R-shiny Resume!",
                             align = "center")
                        )))
        
      ),
      tabItem(tabName = "sum",
              fluidRow(column(
                12,
                align = "center",
                tags$iframe(
                  src = "C:/Users/Samuel M Schappel/datacode/Resume/www/Resume_bayer_fin",
                  width = "900",
                  height = "900"
                )
              )))
    ))
)

server <- function(input, output, session) {
  set.seed(122)
}

shinyApp(ui, server)

