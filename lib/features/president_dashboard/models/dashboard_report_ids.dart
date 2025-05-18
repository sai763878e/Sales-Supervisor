enum DashboardReportIds {
  //Graphs
  SSP_LSSP,
  SSP_CSSP,
  SSP_SSSP,
  SSTA_LSSTA,
  SSTA_TLSSTA,
  SSTA_CSSTA,
  SSTA_TCSSTA,
  SSTA_SSSTA,
  SSTA_TSSSTA,
  SPP_LSPP,
  SPP_TLSPP,
  SITO_LSITO,
  SITO_TLSITO,
  CDSP_CCDSP,
  TCDSP_TCCDSP,
  ISDP_VISDP,
  ISDP_TVISDP,
  //new 01 April 2025
  ISDP_LISDP,
  ISDP_TLISDP,
  ISDP_CISDP,
  ISDP_TCISDP,
  ISDP_SISDP,
  ISDP_TSISDP,
  ITAG_LITAG,
  ITAG_TLITAG,
  ITAG_CMCITAG,
  ITAG_TCMCITAG,
  ITAG_L1MCITAG,
  ITAG_TL1MCITAG,
  ITAG_L2MCITAG,
  ITAG_TL2MCITAG,
  ZSIC_LZSIC, //no table

  AROD_LAROD,
  AROD_TLAROD,
  AODP_LAODP,
  AODP_TLAODP,
  ARTA_LARTA,
  ARTA_TLARTA,

  SFAT_CSFAQ,//no table
  SOAT_LSOAT,
  SOAT_TLSOAT,
  PHOD_LPHOD,
  PHOD_TLPHOD,

  //tables
}

DashboardReportIds? getTableId(DashboardReportIds dashboardReportIds) {
  switch (dashboardReportIds) {
    case DashboardReportIds.SSTA_LSSTA:
      return DashboardReportIds.SSTA_TLSSTA;
    case DashboardReportIds.SSTA_CSSTA:
      return DashboardReportIds.SSTA_TCSSTA;
    case DashboardReportIds.SSTA_SSSTA:
      return DashboardReportIds.SSTA_TSSSTA;
    case DashboardReportIds.SPP_LSPP:
      return DashboardReportIds.SPP_TLSPP;
    case DashboardReportIds.SITO_LSITO:
      return DashboardReportIds.SITO_TLSITO;
    case DashboardReportIds.CDSP_CCDSP:
      return DashboardReportIds.TCDSP_TCCDSP;
    case DashboardReportIds.ISDP_VISDP:
      return DashboardReportIds.ISDP_TVISDP;

    case DashboardReportIds.ISDP_LISDP:
      return DashboardReportIds.ISDP_TLISDP;
    case DashboardReportIds.ISDP_CISDP:
      return DashboardReportIds.ISDP_TCISDP;
    case DashboardReportIds.ISDP_SISDP:
      return DashboardReportIds.ISDP_TSISDP;
    case DashboardReportIds.ITAG_LITAG:
      return DashboardReportIds.ITAG_TLITAG;
    case DashboardReportIds.ITAG_CMCITAG:
      return DashboardReportIds.ITAG_TCMCITAG;
    case DashboardReportIds.ITAG_L1MCITAG:
      return DashboardReportIds.ITAG_TL1MCITAG;
    case DashboardReportIds.ITAG_L2MCITAG:
      return DashboardReportIds.ITAG_TL2MCITAG;

    case DashboardReportIds.AROD_LAROD:
      return DashboardReportIds.AROD_TLAROD;
      case DashboardReportIds.AODP_LAODP:
      return DashboardReportIds.AODP_TLAODP;
      case DashboardReportIds.ARTA_LARTA:
      return DashboardReportIds.ARTA_TLARTA;

    case DashboardReportIds.SOAT_LSOAT:
      return DashboardReportIds.SOAT_TLSOAT;
    case DashboardReportIds.PHOD_LPHOD:
      return DashboardReportIds.PHOD_TLPHOD;

    default:
      return null;
  }
}

Iterable<DashboardReportIds> getGraphDashboard() sync* {
  yield DashboardReportIds.SSP_LSSP;
  yield DashboardReportIds.SSP_CSSP;
  yield DashboardReportIds.SSP_SSSP;
  yield DashboardReportIds.SSTA_LSSTA;
  yield DashboardReportIds.SSTA_CSSTA;
  yield DashboardReportIds.SSTA_SSSTA;
  yield DashboardReportIds.SPP_LSPP;
  yield DashboardReportIds.SITO_LSITO;
  yield DashboardReportIds.CDSP_CCDSP;
  yield DashboardReportIds.ISDP_VISDP;
  yield DashboardReportIds.ISDP_LISDP;
  yield DashboardReportIds.ISDP_CISDP;
  yield DashboardReportIds.ISDP_SISDP;

  yield DashboardReportIds.ITAG_LITAG;
  yield DashboardReportIds.ITAG_CMCITAG;
  yield DashboardReportIds.ITAG_L1MCITAG;
  yield DashboardReportIds.ITAG_L2MCITAG;

  yield DashboardReportIds.ZSIC_LZSIC;

  yield DashboardReportIds.AROD_LAROD;
  yield DashboardReportIds.AODP_LAODP;
  yield DashboardReportIds.ARTA_LARTA;
  yield DashboardReportIds.SFAT_CSFAQ;
  yield DashboardReportIds.SOAT_LSOAT;
  yield DashboardReportIds.PHOD_LPHOD;

}

Iterable<DashboardReportIds> getTableDashboard() sync* {
  yield DashboardReportIds.SSTA_TLSSTA;
  yield DashboardReportIds.SSTA_TCSSTA;
  yield DashboardReportIds.SSTA_TSSSTA;
  yield DashboardReportIds.SPP_TLSPP;
  yield DashboardReportIds.SITO_TLSITO;
  yield DashboardReportIds.TCDSP_TCCDSP;
  yield DashboardReportIds.ISDP_TVISDP;

  yield DashboardReportIds.ISDP_TLISDP;
  yield DashboardReportIds.ISDP_TCISDP;
  yield DashboardReportIds.ISDP_TSISDP;
  yield DashboardReportIds.ITAG_TLITAG;
  yield DashboardReportIds.ITAG_TCMCITAG;
  yield DashboardReportIds.ITAG_TL1MCITAG;
  yield DashboardReportIds.ITAG_TL2MCITAG;
  yield DashboardReportIds.AROD_TLAROD;
  yield DashboardReportIds.AODP_TLAODP;
  yield DashboardReportIds.ARTA_TLARTA;
  yield DashboardReportIds.SOAT_TLSOAT;
  yield DashboardReportIds.PHOD_TLPHOD;
}

Iterable<DashboardReportIds> getPieChartModels() sync* {
  yield DashboardReportIds.SSP_LSSP;
  yield DashboardReportIds.ISDP_VISDP;
  yield DashboardReportIds.SFAT_CSFAQ;
  yield DashboardReportIds.PHOD_LPHOD;
}

Iterable<DashboardReportIds> getSingleBarChartModels() sync* {
  yield DashboardReportIds.SSP_CSSP;
  yield DashboardReportIds.SSP_SSSP;
  yield DashboardReportIds.CDSP_CCDSP;
}

Iterable<DashboardReportIds> getDualBarChartModels() sync* {
  yield DashboardReportIds.SSTA_CSSTA;
  yield DashboardReportIds.SSTA_SSSTA;
  yield DashboardReportIds.SPP_LSPP;
  yield DashboardReportIds.ISDP_LISDP;
  yield DashboardReportIds.ISDP_CISDP;
  yield DashboardReportIds.ISDP_SISDP;
  yield DashboardReportIds.ITAG_CMCITAG;
  yield DashboardReportIds.ITAG_L1MCITAG;
  yield DashboardReportIds.ITAG_L2MCITAG;
  yield DashboardReportIds.ARTA_LARTA;
}

Iterable<DashboardReportIds> getStackedChartModels() sync* {
  yield DashboardReportIds.SITO_LSITO; //with only label
  yield DashboardReportIds.ZSIC_LZSIC; //with label and section
  yield DashboardReportIds.AROD_LAROD; //with label and section
  yield DashboardReportIds.AODP_LAODP; //with label and section
  yield DashboardReportIds.SOAT_LSOAT; //with label and section
}

Iterable<DashboardReportIds> getGrowthDeGrowthChartModels() sync* {
  yield DashboardReportIds.SSTA_LSSTA;
  yield DashboardReportIds.ITAG_LITAG;
}
