library(tidyverse)
library(rvest)
library(here)


get_live_gigs <- function(url_live_gigs) {
  # Load the HTML file
  html <- read_html(url_live_gigs)
  
  # Extract all list items within the ordered list
  gigs_raw <- html %>%
    html_element("ol") |>
    html_elements("li") %>%
    html_text |> str_trim()
  
  gigs_raw
}

get_other_gigs <- function(url_other_gigs) {
  html <- read_html(url_other_gigs)
  
  ol_elements <- html_elements(html, "ol")
  
  # Mingle Harde
  mingle_harde <- ol_elements[[1]] %>%
    html_elements("li") %>%
    html_text() %>%
    str_trim()
  
  # Million Dead
  million_dead <- ol_elements[[2]] %>%
    html_elements("li") %>%
    html_text() %>%
    str_trim()
  
  record_buying_public <- ol_elements[[3]] %>%
    html_elements("li") %>%
    html_text() %>%
    str_trim()
  
  kneejerk <- ol_elements[[4]] %>%
    html_elements("li") %>%
    html_text() %>%
    str_trim()
  
  list(mingle_harde = mingle_harde,
       million_dead = million_dead,
       record_buying_public = record_buying_public,
       kneejerk = kneejerk)
}


if (sys.nframe() == 0){
  # ... do main stuff
  url_main_gigs <- "https://frank-turner.com/basic-archive/"
  url_other_gigs <- "https://frank-turner.com/md-archive/"
  
  gigs_main_raw <- get_live_gigs(url_main_gigs)
  gigs_other_raw <- get_other_gigs(url_other_gigs)
}


