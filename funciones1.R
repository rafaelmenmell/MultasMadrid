library(data.table)
library(XML)

DescargarArchivos <- function(){
  ids <- seq(170,22,-4)
  multas <- vector("list",length(ids))
  n <- 1
  for (id in ids){
    path <- sprintf("http://datos.madrid.es/egob/catalogo/210104-%s-multas-circulacion-detalle.csv",id)
    multas[[n]] <- fread(input = path,sep = ";",header = TRUE)
    n <- n + 1
  }
}


ExtraerArchivos <- function(){
  content <- readLines("210104-0-multas-circulacion-detalle.dcat")
  lines <- which(grepl("Detalle",content))
  lines <- lines + 1
  content <- content[lines]
}