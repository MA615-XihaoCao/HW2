plot_one_year <- function(df, year, title){
  year <- paste('X', year, sep='')
  ggplot(df) + aes_string(x='country', y=year)+ geom_bar(stat="identity") + labs(title=title)#only plot the data of given year with bar plot
}

plot_one_country <- function(df, name){
  
  ggplot(filter(df, country.equals(name))) + aes_string(y=) + geom_bar(stat="identity") #only plot the data of given country with bar plot
}