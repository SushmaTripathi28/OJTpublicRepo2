resource "google_monitoring_dashboard" "new_dashboard" {
  dashboard_json = jsonencode({
    displayName     = "New Dashboard -DemoOJT"
    dashboardFilters = []
    mosaicLayout    = {
      columns = 48
      tiles   = [
        {
          widget = {
            title   = "VM Instance - CPU utilization [MEAN]"
            xyChart = {
              chartOptions = {
                mode = "COLOR"
              }
              dataSets = [
                {
                  minAlignmentPeriod = "60s"
                  plotType           = "LINE"
                  targetAxis         = "Y1"
                  timeSeriesQuery    = {
                    timeSeriesFilter = {
                      aggregation = {
                        alignmentPeriod   = "60s"
                        perSeriesAligner  = "ALIGN_MEAN"
                      }
                      filter = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" resource.type=\"gce_instance\""
                    }
                  }
                }
              ]
              thresholds = []
              yAxis      = {
                label = ""
                scale = "LINEAR"
              }
            }
          }
          height = 16
          width  = 24
        }
      ]
    }
    labels = {}
  })
}
