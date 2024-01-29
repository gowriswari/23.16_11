
view: sql_runner_query {
  derived_table: {
    sql: SELECT
          `orders`.`status` AS `orders.status`,
              (DATE(`orders`.`created_at`)) AS `orders.created_date`,
          COUNT(DISTINCT orders.id ) AS `orders.count`
      FROM
          `demo_db`.`order_items` AS `order_items`
          LEFT JOIN `demo_db`.`orders` AS `orders` ON `order_items`.`order_id` = `orders`.`id`
          LEFT JOIN `demo_db`.`users` AS `users` ON `orders`.`user_id` = `users`.`id`
      WHERE ((( `orders`.`created_at` ) >= ((DATE_ADD(TIMESTAMP(DATE_FORMAT(DATE(NOW()),'%Y-01-01')),INTERVAL -6 year))) AND ( `orders`.`created_at` ) < ((DATE_ADD(DATE_ADD(TIMESTAMP(DATE_FORMAT(DATE(NOW()),'%Y-01-01')),INTERVAL -6 year),INTERVAL 7 year))))) AND `users`.`gender` = 'f'
      GROUP BY
          1,
          2
      ORDER BY
          2 DESC
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: orders_status {
    type: string
    sql: ${TABLE}.`orders.status` ;;
  }

  dimension: orders_created_date {
    type: date
    sql: ${TABLE}.`orders.created_date` ;;
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}.`orders.count` ;;
  }

  set: detail {
    fields: [
        orders_status,
	orders_created_date,
	orders_count
    ]
  }
}
