WITH base_events AS (
  -- Витягуємо session_id один раз, щоб використовувати його всюди
  SELECT 
    *,
    (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') AS session_id
  FROM 
    `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE 
    _TABLE_SUFFIX BETWEEN '20201101' AND '20210131'
),

sessions_info AS (
  -- Перший підзапит: атрибути сесії та чистка URL
  SELECT
    CONCAT(user_pseudo_id, '.', IFNULL(CAST(session_id AS STRING), '0')) AS user_session_id,
    user_pseudo_id,
    session_id,
    geo.country AS country,
    device.operating_system AS device_os,
    REGEXP_EXTRACT((SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_location'), r'^https?://[^/]+(/[^?#]*)') AS landing_page_location,
    traffic_source.source AS source,
    traffic_source.medium AS medium,
    traffic_source.name AS campaign,
    device.category AS device_category,
    device.language AS device_language
  FROM
    base_events
  WHERE
    event_name = 'session_start'
),

events_raw AS (
  -- Другий підзапит: всі події та трансформація часу
  SELECT
    CONCAT(user_pseudo_id, '.', IFNULL(CAST(session_id AS STRING), '0')) AS user_session_id,
    event_timestamp, 
    TIMESTAMP_MICROS(event_timestamp) AS event_datetime,
    event_name,
    COALESCE(ecommerce.purchase_revenue, 0) AS revenue
  FROM
    base_events
  WHERE
    event_name IN (
      'session_start', 'view_item', 'add_to_cart', 'begin_checkout', 
      'add_shipping_info', 'add_payment_info', 'purchase'
    )
)

-- Основний запит: об'єднання за допомогою LEFT JOIN
SELECT
  s.user_session_id,
  s.user_pseudo_id,
  s.session_id,
  s.country,
  s.device_os,
  s.landing_page_location,
  s.source,
  s.medium,
  s.campaign,
  s.device_category,
  s.device_language,
  e.event_timestamp,
  e.event_datetime,
  e.event_name,
  e.revenue
FROM
  sessions_info s
LEFT JOIN
  events_raw e USING(user_session_id)