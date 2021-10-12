na_and_cut <- function(df, year){
  year_list <- rep(0, times = year[2]-year[1]+2)
  year_list[1] <- 'country'
  for (i in year[1]:year[2]) {
    year_list[i - year[1] + 2] <- paste('X', i, sep='')
  }
  new_df <- tidyr::drop_na(df) #drop NA value
  new_df <- dplyr::select(new_df, year_list) #select the data between given years
  return(new_df)
}

select_combine <- function(df1, df2, name){
  #select specific countries from the data sets
  newdf1 <- dplyr::filter(df1, country %in% name) 
  newdf2 <- dplyr::filter(df2, country %in% name)
  #the combine the two with respect to countires names
  result <- dplyr::full_join(newdf1, newdf2, by='country')
  return(list(newdf1, newdf2, result))
}