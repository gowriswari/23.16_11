---
- dashboard: locale_testing_bug_repro
  title: locale testing bug repro
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: ImRQqJZczUCS1oCVcVDR6F
  elements:
  - title: locale testing bug repro
    name: locale testing bug repro
    model: 1_vinay_project
    explore: order_items
    type: table
    fields: [orders.status, orders.count, orders.created_date]
    sorts: [orders.created_date desc]
    limit: 500
    column_limit: 50
    listen:
      Created Date: orders.created_date
    row: 0
    col: 0
    width: 14
    height: 8
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: 1_vinay_project
    explore: order_items
    listens_to_filters: []
    field: orders.created_date
