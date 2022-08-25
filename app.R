
source("lib.R")

ui <- dashboardPage(
  skin = "blue",
  
  dashboardHeader(title = "Resume App"),
  
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
                          background-image: linear-gradient(to right, #FFFFFF, #F0FFF0);
                          }

                          /* main sidebar */
                          .skin-blue .main-sidebar {
                          background-image: linear-gradient(to bottom, #FFFFFF, #F0FFF0);;
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
        setBackgroundColor(color = c("#FFFFFF", "#F0FFF0"), gradient = "radial", direction = c("top", "left"),
                           shinydashboard = TRUE),
        fluidRow(column(12,
                        align = "center",
                        div(
                          style = "height:150px; font-size:40px",
                          "Welcome to Samuel Schappel's Interactive R-shiny Resume Application"
                        )
                        )),
        fluidRow(
          box(
            title = "Summary",
            width = 12,
            status = "info",
            solidHeader = TRUE,
            background = "light-blue",
            div(
              style = "font-size:25px",
              "Multidisciplinary, driven Data Analyst seeking an entry-level position to utilize skills in data science, statistics, and applied mathematics obtained through relevant coursework at the Rutgers Business School. Obtaining a certificate in Data Science from Rutgers University enables the ability to contribute to a fast-paced, competitive, and professional business environment."
            )
            
          ),
          box(
            title = "Techinical Skills",
            width = 6,
            status = "info",
            solidHeader = TRUE,
            background = "teal",
            uiOutput("skills")
          ),
          box(
            title = "Tools",
            width = 6,
            status = "info",
            solidHeader = TRUE,
            background = "teal",
            uiOutput("tools")
          ), 
          box(
            title = "Machine Learning",
            width = 6,
            status = "info",
            solidHeader = TRUE,
            background = "teal",
            uiOutput("ml")
          ),
          box(
            title = "Hobbies",
            width = 6,
            status = "info",
            solidHeader = TRUE,
            background = "blue",
            uiOutput("hobbies")
          )
        )
        
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
  
  output$skills <- renderUI({
    width1 <- session$clientData$output_skills_width
    height1 <- session$clientData$output_skills_height
    HTML("<ul><li> Python </li><li> R </li><li> SQL </li><li> Excel </li><li> VBA </li><li> PowerBI </li><li> Tableau </li><li> JavaScript </li><li> HTML </li><li> CSS </li><li> Git </li><li> Github </li></ul>")
    outputArgs = list(
      height = height1,
      width = width1
    )
  })
  output$ml <- renderUI(HTML("<ul><li> Logistic Regression (sklearn) </li><li> Linear Regression (sklearn) </li><li> Random Forest (sklearn) </li><li> Decision Tree Classifier (sklearn)</li><li> Extream Gradient Boosting (xgboost)</li><li> Nearest Neighbors (sklearn) </li><li> Support Vector Machines (sklearn)</li></ui>"))
  output$tools <- renderUI(HTML("<ul><li> dplyr (r) </li><li> shiny (r) </li><li> ggplot2 (r) </li><li> tidyverse (r) </li><li> reticulate (r) </li><li> gt (r) </li><li> pandas (python) </li><li> matplotlib (python)</li><li> numpy (python) </li><li> seaborn (python) </li><li> BeautifulSoup (python) </li><li> SciPy (python) </li></ul>"))
  output$hobbies <- renderUI(HTML("<ui><li> Hockey </li><li> Skiing </li><li> Golf </li><li> Telescopes / Space exploration </li></ui>"))
}

shinyApp(ui, server)

