cengen_UMI_bulk <-
  local({
    load("cengen_UMI.rda")

    new_columns <- cbind(
      AWC = apply(cengen_UMI[,c("AWC_ON", "AWC_OFF")], 1, mean),
      DA  = apply(cengen_UMI[,c("DA", "DA9")], 1, mean),
      DB  = apply(cengen_UMI[,c("DB", "DB01")], 1, mean),
      IL2 = apply(cengen_UMI[,c("IL2_DV", "IL2_LR")], 1, mean),
      RMD = apply(cengen_UMI[,c("RMD_DV", "RMD_LR")], 1, mean),
      RME = apply(cengen_UMI[,c("RME_DV", "RME_LR")], 1, mean),
      VA  = apply(cengen_UMI[,c("VA", "VA12")], 1, mean),
      VB  = apply(cengen_UMI[,c("VB", "VB01", "VB02")], 1, mean),
      VC  = apply(cengen_UMI[,c("VC", "VC_4_5")], 1, mean),
      VD  = cengen_UMI[,"VD_DD"],
      DD  = cengen_UMI[,"VD_DD"])

    redundant_columns <- c("AWC_ON","AWC_OFF","DA","DA9","DB","DB01","IL2_DV","IL2_LR",
                           "RMD_DV","RMD_LR","RME_DV","RME_LR","VA","VA12","VB","VB01","VB02",
                           "VC","VC_4_5","VD_DD")

    res <- cbind(
      cengen_UMI[ , - which(colnames(cengen_UMI) %in% redundant_columns)],
      new_columns
    )

    # alphabetic order
    res[,order(colnames(res))]
  })

