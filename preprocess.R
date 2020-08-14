homes <- readRDS('homes.rds')
homes$usecode <- NULL
homes$yearremodeled <- NULL
homes$remodel <- NULL
homes$lastsaledate <- NULL
homes$lastsaleprice <- NULL
homes$improvementsvalue <- NULL
homes$totalrooms <- NULL
homes$landvalue <- NULL

saveRDS(homes, file = 'homes.rds')
write.csv(homes, file = 'homes.csv', row.names = FALSE)

homes <- read.csv(file = 'homes.csv')

# sample 10% from each condition
h_lst <- split(homes, f = homes$condition)
set.seed(1)
homes_lst <- lapply(h_lst, function(x)x[sample(nrow(x), round(0.10*nrow(x))),])

homes2 <- do.call(rbind, homes_lst)
write.csv(homes, file = 'alb_homes.csv', row.names = FALSE)


