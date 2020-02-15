library(data.table)
library(dplyr)
library(stringi)
library(magrittr)
library(Rcrawler)
lookup_table <- fread("file:///C:/Users/White/OneDrive/Desktop/Bible Projects/GenArt/BibleGenArt/Bible_Book_Lookup_Table.csv")
lookup_table$chron_order <- 1:nrow(lookup_table)
chapter_vector <- lookup_table$Chapters
length_vector <- sum(lookup_table$Chapters)
jw_link_init <- as.character()
jw_link_processed <- as.character()
length_vec <- 1
 for(count in 1:nrow(lookup_table)) 
  {
    for(i in 1:chapter_vector[count])
   {
      jw_link_init[count] <-  paste(c("https://wol.jw.org/en/wol/b/r1/lp-e/nwtsty/"),"/",count,"/",i)
      jw_link_processed[length_vec] <- jw_link_init[count]
      length_vec = length_vec + 1
   }
 }
jw_link_processed <- gsub(" ","",jw_link_processed)

crawl_data <- list()
status_check <- list()
for( i in 1:length(jw_link_processed))
{
 Rcrawler(jw_link_processed[i],no_cores = 4, no_conn= 4,ExtractXpathPat =  "/html/body/div[1]/div[2]/div[6]/div[1]/div[2]/article", MaxDepth = 0)

  crawl_data[i] <- DATA
  status_check[[i]] <- INDEX
  Progess_Vector = i / length(jw_link_processed) * 100
  Progess_Vector <- round(Progess_Vector,2)
  cat(Progess_Vector,"%")
}
  https://wol.jw.org/en/wol/binav/r1/lp-e/nwtsty/1
https://wol.jw.org/en/wol/binav/r1/lp-e/nwtsty/2
https://wol.jw.org/en/wol/b/r1/lp-e/nwtsty/2/1#study=discover
https://wol.jw.org/en/wol/b/r1/lp-e/nwtsty/2/2