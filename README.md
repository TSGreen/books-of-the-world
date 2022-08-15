[![status: experimental](https://github.com/GIScience/badges/raw/master/status/experimental.svg)](https://github.com/GIScience/badges#experimental)
![R Version](https://img.shields.io/badge/R-4.1.2-blue.svg)
[![MIT License](https://img.shields.io/badge/License-MIT-lightgray.svg)](LICENSE)

# Books of the world 📚🌍

## About 
In the project I aim to build a geo-map of the birth place of literary authors that I have read.

### Rationale ###
Literature provides an almost unique opportunity to vicariously experience other places and cultures. I therefore try to be as diverse in my reading as possible, actively seeking out new authors and works in contexts I have not previously read. In this bid to read literature from all over the world, I want to develop a tool to help me better visualise what countries and regions I have previously read and which are still lacking. 

### How ###
This project will aim to combine my personal reading history data from Goodreads, with each author's nationality and/or place of birth, to generate an interactive visual map where I can explore this. 

I plan to build this tool in _R_, primarily as a learning opportunity to develop my usage of this language. And the final visualisation will likely form either an Rmarkdown document or a dashboard. 

#### Overview #### 
The broad procedural outline is as follows:
- Extract reading history through personal [Goodreads profile](https://www.goodreads.com/user/show/25830284-timothy-green) (either through CSV export, or the API; TBC). This will include each book's title, original publication data, author's name, etc. 
- Scrape birth place and/or nationality of author's by passing author name list to online searches (e.g. [Wikipedia](https://en.wikipedia.org/wiki/List_of_novelists_by_nationality) or sites like [author and book info.com](http://www.authorandbookinfo.com/)).
- Geocode location name into latitude and longitude .
- Create global map with pin points at each author's place of birth. When hovering at each pin point, it should list authors name, the number of books of theirs I have read and titles of said books. Will likely add a feature to colour countries where at I've read at least one work of literature. 

### Expansion ###
Possible areas to expand on, given time are:
- Adding images for each author for displaying when hovering above pins. 
- Some aggregated metrics - number of books and authors I've read per continent, for example. 
- Use Goodreads API feature so that map can be generated for any goodreads user profile. _Might be a streth_ depending on the level of manual cleaning/additions needed at the stage of getting author's nationality from the web. 
- Filtering options by year/decade/century of publication. 
- Generate list of read and unread places. 


