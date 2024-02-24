/*These queries are to delete data in tables in which we will remove old order data*/
/* we are only deleting orders older then 2023-07-01*/


DELETE FROM wp_commentmeta WHERE comment_id IN (SELECT comment_ID FROM wp_comments WHERE comment_type = 'order_note' AND comment_post_ID IN ( SELECT ID FROM wp_posts WHERE post_type = 'shop_order' AND post_date < '2023-07-01 00:00:00'));


DELETE FROM wp_comments WHERE comment_type = 'order_note' AND comment_post_ID IN ( SELECT ID FROM wp_posts WHERE post_type = 'shop_order' AND post_date < '2023-07-01 00:00:00');

DELETE FROM wp_woocommerce_order_itemmeta WHERE order_item_id IN (SELECT order_item_id FROM wp_woocommerce_order_items WHERE order_id IN ( SELECT ID FROM wp_posts WHERE post_type = 'shop_order' AND post_date < '2023-07-01 00:00:00'));

DELETE FROM wp_woocommerce_order_items WHERE order_id IN ( SELECT ID FROM wp_posts WHERE post_type = 'shop_order' AND post_date < '2023-07-01 00:00:00');


DELETE FROM wp_postmeta WHERE post_id IN ( SELECT ID FROM wp_posts WHERE post_type = 'shop_order' AND post_date < '2023-07-01 00:00:00');


DELETE FROM wp_posts WHERE post_type = 'shop_order' AND post_date < '2023-07-01 00:00:00';