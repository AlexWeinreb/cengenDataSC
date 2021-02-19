cengen_nCells_bulk <-
  local({
    load("cengen_nCells.rda")

    new_columns <- cbind(
      AWC = apply(cengen_nCells[,c("AWC_ON", "AWC_OFF")], 1, mean),
      DA  = apply(cengen_nCells[,c("DA", "DA9")], 1, mean),
      DB  = apply(cengen_nCells[,c("DB", "DB01")], 1, mean),
      IL2 = apply(cengen_nCells[,c("IL2_DV", "IL2_LR")], 1, mean),
      RMD = apply(cengen_nCells[,c("RMD_DV", "RMD_LR")], 1, mean),
      RME = apply(cengen_nCells[,c("RME_DV", "RME_LR")], 1, mean),
      VA  = apply(cengen_nCells[,c("VA", "VA12")], 1, mean),
      VB  = apply(cengen_nCells[,c("VB", "VB01", "VB02")], 1, mean),
      VC  = apply(cengen_nCells[,c("VC", "VC_4_5")], 1, mean),
      VD  = cengen_nCells[,"VD_DD"],
      DD  = cengen_nCells[,"VD_DD"])

    redundant_columns <- c("AWC_ON","AWC_OFF","DA","DA9","DB","DB01","IL2_DV","IL2_LR",
                           "RMD_DV","RMD_LR","RME_DV","RME_LR","VA","VA12","VB","VB01","VB02",
                           "VC","VC_4_5","VD_DD")

    res <- cbind(
      cengen_nCells[ , - which(colnames(cengen_nCells) %in% redundant_columns)],
      new_columns
    )

    # alphabetic order
    res[,order(colnames(res))]
  })

