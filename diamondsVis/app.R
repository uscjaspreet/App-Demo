#install.packages("shiny")

library(shiny)
library(ggplot2)

#GUI

#fluidPage - resize app

ui <- fluidPage(
  titlePanel("Diamonds Data"),
  #h1("I am header 1")
  sidebarLayout(
    sidebarPanel(
      helpText("This app is to visualize diamonds dataset"),
      textInput(inputId = "title",
                label = "chart title", 
                value = ""),
      selectInput(inputId = "pos",
                  label = "Position",
                  choices = list("stack","dodge"),
                  selected = "dodge")
    ),
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)

#Server

server <- function(input,output){
  
output$plot =  renderPlot({
    ggplot(diamonds, aes(x=cut,fill = clarity))+
      geom_bar(position = input$pos)+
    ggtitle(input$title)
  })
}

#Run the App
shinyApp(ui, server)

