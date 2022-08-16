## This script extracts a list of authors that have been read / are being read.

setwd("~/GitHub/books-of-the-world/src")

library(tidyverse)
library(janitor)

get_read_books <- function(data, final_useful_column=19) {
  #' Return dataframe of reading data with only read or currently reading
  #' books selected and drop superfluous columns.
  #' 
  #' @param data The whole set of Goodreads user library data
  #' @param final_useful_column The column number of the final useful column in data
  #'
  #' @return read_books Subet of books that have been read or are currently being read.

  books_data <- data[1:final_useful_column]

  # Select only read or currently reading books
  read_books <- books_data %>% 
    janitor :: clean_names() %>%
    filter(
      exclusive_shelf == "read" | 
      exclusive_shelf == "currently-reading" 
      )
  return(read_books)
}


get_author_list <- function(data, literature_only=TRUE) {
  #' Retrieve and save a list of read authors
  #'
  #' @param data Dataframe of read/currently reading books
  #' @param literature_only If TRUE, selects subset of books that literature (rather
  #' than non-fiction etc). 
  #'
  #' @return List of read authors and generates data file in data dir. 
  
  if (literature_only) { 
    # Select only literature (rather than non-fiction etc).
    # Relys on my shelving system of adding e.g. lit-south-asian or lit-european tags
    data <- data %>%
      filter(str_detect(bookshelves, "lit-" ))
  }
  
  authors <- data$author %>% noquote() %>% unique()
  
  write.table(authors, 
              file.path(data_path, "book_authors_list.csv"),
              sep=",",
              col.names=FALSE,
              row.names=FALSE
  )
  
  return(authors)
}

data_path = file.path("..", "data")

books_data <- read_csv(file.path(data_path, "goodreads_library_export.csv"))

read_books <- get_read_books(books_data)

authors <- get_author_list(read_books)

