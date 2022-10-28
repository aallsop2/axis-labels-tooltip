library(highcharter)


# Create data set. 
## The variable that will be the axis labels needs to have a dash between the 
## axis label and what will show up when it is hovered over
category_definition <- c("Assets - A resource of economic value",
                         "Debt - An amount owed for funds borrowed",
                         "Expenses - The reduction in value of an asset as it is used to generate revenue",
                         "Revenue")
value <- c(1000, -3000, 100, 6000)
df <- cbind(category_definition, value)

# Turn it into a data frame
df <- as.data.frame(df)

#Make sure the y variable is numeric
df$value <- as.numeric(df$value)


# Create highchart 
highchart() %>% 
  hc_add_series(data = df,
                "lollipop",
                hcaes(x = category_definition, y = value),
                name = "Category",
                colorByPoint = TRUE,
                connectorWidth=5,
                marker=list(radius=5)) %>% 
  hc_chart(inverted = T) %>% 
  hc_xAxis(
    type = "category",
    labels = list(
      formatter = JS("function(){
                             var values = this.value.split(\" - \");
                          if (values.length > 1) {
                              return '<span title=\"' + values[1] + '\">' + values[0] + '</span>';
                          } else {
                              return this.value;
                          }  
                      }"),
      useHTML = TRUE
    ))
