SELECT  u.guid                 AS user_guid
,       u.first_name           AS first_name
,       u.last_name            AS last_name
,       COALESCE(
            ROUND(SUM(p.price), 2)
            , 0)               AS total_spend
,       SUM(v.time_on_site)    AS time_on_site
FROM    users u
    LEFT JOIN orders o
        ON u.guid = o.user_guid
    LEFT JOIN products p
        ON o.product_guid = p.product_guid
    LEFT JOIN visits v
        ON u.guid = v.user_guid
GROUP BY u.guid
,        u.first_name
,        u.last_name
