cengen_proportion_bulk <-
  local({
    load("cengen_proportion.rda")

    new_columns <- cbind(
      AWC = apply(cengen_proportion[,c("AWC_ON", "AWC_OFF")], 1, mean),
      DA  = apply(cengen_proportion[,c("DA", "DA9")], 1, mean),
      DB  = apply(cengen_proportion[,c("DB", "DB01")], 1, mean),
      IL2 = apply(cengen_proportion[,c("IL2_DV", "IL2_LR")], 1, mean),
      RMD = apply(cengen_proportion[,c("RMD_DV", "RMD_LR")], 1, mean),
      RME = apply(cengen_proportion[,c("RME_DV", "RME_LR")], 1, mean),
      VA  = apply(cengen_proportion[,c("VA", "VA12")], 1, mean),
      VB  = apply(cengen_proportion[,c("VB", "VB01", "VB02")], 1, mean),
      VC  = apply(cengen_proportion[,c("VC", "VC_4_5")], 1, mean),
      VD  = cengen_proportion[,"VD_DD"],
      DD  = cengen_proportion[,"VD_DD"])

    redundant_columns <- c("AWC_ON","AWC_OFF","DA","DA9","DB","DB01","IL2_DV","IL2_LR",
                           "RMD_DV","RMD_LR","RME_DV","RME_LR","VA","VA12","VB","VB01","VB02",
                           "VC","VC_4_5","VD_DD")

    res <- cbind(
      cengen_proportion[ , - which(colnames(cengen_proportion) %in% redundant_columns)],
      new_columns
    )

    # alphabetic order
    res[,order(colnames(res))]
  })

