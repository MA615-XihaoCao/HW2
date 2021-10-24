plot_one_year <- function(df, year, title){
  year <- paste('X', year, sep='')
  ggplot(df) + aes_string(x='country', y=year)+ geom_bar(stat="identity") + labs(title=title)#only plot the data of given year with bar plot
}

plot_one_country <- function(df, name){
  
  ggplot(filter(df, country.equals(name))) + aes_string(y=) + geom_bar(stat="identity") #only plot the data of given country with bar plot
}

plot_scatter <- function(df1, df2, year, title){
  year <- paste('X', year, sep='')
  #Minor data wrangling to get data into one dataframe
  data1 <- select(df1, year)
  data1 <- rename(data1, investments = X2003)
  data2 <- select(df2, year)
  data2<- rename(data2, GDP = X2003)
  data <- tibble(select(df1,country),data1,data2)
  
  #Scatterplot to plot investments vs gdp in 2003
  ggplot(data) + geom_point(mapping = aes(investments,GDP, color = country), size = 5) + labs(title=title)
}