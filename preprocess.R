homes <- readRDS(url('https://github.com/clayford/albemarle_county_real_estate/raw/refs/heads/main/data/albemarle_homes_2025-01-08.rds'))
homes$usecode <- NULL
homes$yearremodeled <- NULL
homes$remodeled <- NULL
homes$lastsaledate1 <- NULL
homes$lastsaleprice <- NULL
homes$month_sold <- NULL
vars <- c("totalvalue", "finsqft", "lotsize", "bedroom", "fullbath", 
          "yearbuilt", "esdistrict", "msdistrict", "hsdistrict", 
          "censustract", "condition", "cooling", "age", "fp")

homes <- homes[,vars]

# sample 10% from each condition
h_lst <- split(homes, f = homes$condition)
set.seed(1)
homes_lst <- lapply(h_lst, function(x)x[sample(nrow(x), round(0.10*nrow(x))),])

homes2 <- do.call(rbind, homes_lst)
write.csv(homes2, file = 'alb_homes.csv', row.names = FALSE)


