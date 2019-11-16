> setwd("C:/work/journeycell60")
> journey_list <- list.files(pattern = ".xlsx")
> library("readxl", lib.loc="~/R/win-library/3.4")
> journey_data <- lapply(journey_list,read_excel )

> a<- NULL
> many <- 0
> journey_gop <- NULL
> for (b in 1:393){ 
+ a <- data.frame(journey_data[[b]])
+ a$preq = 0
+ for (i in 1:(nrow(a) - 1)) {
+ if (a$Lat[[i]] == a$Lat[[i+1]] & a$Long[[i]] == a$Long[[i+1]]){
+ many <- many +1
+ if (i == nrow(a) -1) { a$preq[[i +1]] = many + 1}
+ } else{
+ a$preq[[i]] = many + 1
+ many <- 0
+ }
+ }
+ journey_one <- subset(a, a$preq > 5)
+ journey_one <- unique(journey_one)
+ journey_gop <- rbind(journey_gop, journey_one)
+ }
+ journey_gop_LatLong <- journey_gop[,1:2]

> journey_gop_uni <- unique(journey_gop_LatLong)
> journey_gop_uni$Preq = 0
> for (i in 1:nrow(journey_gop_uni)){
+ a <- subset(journey_gop, journey_gop$Lat == journey_gop_uni$Lat[[i]] & journey_gop$Long == journey_gop_uni$Long[[i]])
+ journey_gop_uni$Preq[[i]] = nrow(a)
}
> journey_gop_use <- subset(journey_gop_uni, journey_gop_uni$Preq > 3)   


>  setwd("C:/work/routecell60")
> route_list <- list.files(pattern = ".xlsx")
> route_data <- lapply(route_list, read_excel)
> route_gop <- NULL
> for (i in 1:42) {
+ route_gop <- rbind.data.frame(route_gop, route_data[[i]])
+ }
> route_gop_LatLong <- route_gop[,8:9]
> route_gop_LatLong_uni <- unique(route_gop_LatLong)
> journey_LatLong_use <- journey_gop_use[,1:2]
> names(route_gop_LatLong_uni) <- c("Lat","Long")
> processfile <- rbind(journey_LatLong_use,route_gop_LatLong_uni) 
> processfile_uni <- unique(processfile)
> processfile_uni$Preq = 0

> for ( i in 1: nrow(processfile_uni)){
+ a <- subset(processfile, processfile$Lat == processfile_uni$Lat[[i]] & processfile$Long == processfile_uni$Long[[i]])
+ processfile_uni$Preq[[i]] <- nrow(a)
+ }
> choose_station <- subset(processfile_uni, processfile_uni$Preq >1)  
> choose_station <- choose_station[,1:2]  

> processfile2 <- rbind(journey_LatLong_use, choose_station)
> processfile2_uni <- unique(processfile2)
> processfile2_uni$Preq = 0

> for (i in 1:nrow(processfile2_uni)){
+ a <- subset(processfile2, processfile2$Lat == processfile2_uni$Lat[[i]] & processfile2$Long == processfile2_uni$Long[[i]])
+ processfile2_uni$Preq[[i]] = nrow(a)
+ }

> ketqua <- subset(processfile2_uni, processfile2_uni$Preq == 1)
> ketqua <- ketqua[,1:2]