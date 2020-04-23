library(shiny)
library(leaflet)



ui <- fluidPage(
      titlePanel("Show me on the Map"),
      sidebarLayout(
            sidebarPanel(
                  p("Please enter Google coordinates to zoom in the map to the specified coordinates"),
                  numericInput("lat", "enter latitude", 48.858243, -90.000000, 90.000000, 0.000001),
                  numericInput("lng", "enter longitude", 2.294374, -180.000000, 180.000000, 0.000001)
            ),
            mainPanel(
     leafletOutput("map")
            )
            
      )
) 


server <- function(input, output) { 
      output$map <- renderLeaflet({      
      leaflet() %>%
                  addTiles() %>%
                  addMarkers(lat=input$lat, lng=input$lng)
      })
}
            

shinyApp(ui = ui, server = server)      
# numericInput(i"nputId", label, value,min, max, step) 