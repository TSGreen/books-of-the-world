## This script extracts a list of authors that have been read / are being read.

setwd("~/GitHub/books-of-the-world/src")

library(tidyverse)
library(janitor)

data_path = file.path("..", "data")

books_data <- read_csv(file.path(data_path, "goodreads_library_export.csv"))

# Strip out last several columns which are not needed
final_useful_column <- 19
books_data <- books_data[1:final_useful_column]

# Select only read or currently reading books
read_books <- books_data %>% 
  janitor :: clean_names() %>%
  filter(
    exclusive_shelf == "read" | 
    exclusive_shelf == "currently-reading" 
    )

# Select only literature (rather than non-fiction etc).
# Relys on my shelving system of adding e.g. lit-south-asian or lit-european tags
read_lit <- read_books %>%
  filter(str_detect(bookshelves, "lit-" ))

authors <- read_lit$author %>% noquote() %>% unique()

write.table(authors, 
            file.path(data_path, "book_authors_list.csv"),
            sep=",",
            col.names=FALSE,
            row.names=FALSE
            )


