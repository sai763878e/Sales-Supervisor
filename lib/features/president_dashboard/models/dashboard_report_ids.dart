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

  //tables
  SSTA_TLSSTA,
  SSTA_TCSSTA,

}

Iterable<DashboardReportIds> getGraphDashboard() sync* {
  yield DashboardReportIds.SSP_LSSP;
  // yield DashboardReportIds.SSP_CSSP;
  // yield DashboardReportIds.SSP_SSSP;
  // yield DashboardReportIds.SSTA_LSSTA;
  // yield DashboardReportIds.SSTA_CSSTA;
  // yield DashboardReportIds.SSTA_SSSTA;
  // yield DashboardReportIds.SPP_LSPP;
  // yield DashboardReportIds.SITO_LSITO;
  // yield DashboardReportIds.CDSP_CCDSP;


}