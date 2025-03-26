enum DashboardReportIds {
  //Graphs
  SSP_LSSP,
  SSP_CSSP,
  SSP_SSSP,
  SSTA_LSSTA,
  SSTA_CSSTA,
  SSTA_SSSTA,
  SPP_LSPP,
  SITO_LSITO,
  CDSP_CCDSP,
  ISDP_VISDP,

  //tables
  SSTA_TLSSTA,
  SSTA_TCSSTA,
  SSTA_TSSSTA,
  SPP_TLSPP,
  SITO_TLSITO,
  TCDSP_TCCDSP,
  ISDP_TVISDP,

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
}

Iterable<DashboardReportIds> getTableDashboard() sync* {
  yield DashboardReportIds.SSTA_TLSSTA;
  yield DashboardReportIds.SSTA_TCSSTA;
  yield DashboardReportIds.SSTA_TSSSTA;
  yield DashboardReportIds.SPP_TLSPP;
  yield DashboardReportIds.SITO_TLSITO;
  yield DashboardReportIds.TCDSP_TCCDSP;
  yield DashboardReportIds.ISDP_TVISDP;
}
