/*These queries are to check the count in tables in which we will remove old order data*/
/* we are only deleting orders older then 2023-07-01*/

Select count(ID) FROM wp_posts WHERE post_type = 'shop_order' AND post_date < '2023-07-01 00:00:00';

Select * FROM wp_postmeta  WHERE post_id IN ( Select ID FROM wp_posts WHERE post_type = 'shop_order' AND post_date < '2023-07-01 00:00:00');

Select count(meta_id) FROM wp_postmeta WHERE post_id IN ( Select ID FROM wp_posts WHERE post_type = 'shop_order' AND post_date < '2023-07-01 00:00:00');


Select count(order_item_id) FROM wp_woocommerce_order_items WHERE order_id IN ( Select ID FROM wp_posts WHERE post_type = 'shop_order' AND post_date < '2023-07-01 00:00:00');


Select count(meta_id) FROM wp_woocommerce_order_itemmeta WHERE order_item_id IN (Select order_item_id FROM wp_woocommerce_order_items WHERE order_id IN ( Select ID FROM wp_posts WHERE post_type = 'shop_order' AND post_date < '2023-07-01 00:00:00'));


Select count(comment_ID) FROM wp_comments WHERE comment_type = 'order_note' AND comment_post_ID IN ( Select ID FROM wp_posts WHERE post_type = 'shop_order' AND post_date < '2023-07-01 00:00:00');


Select count(meta_id) FROM wp_commentmeta where comment_id IN (Select comment_ID FROM wp_comments WHERE comment_type = 'order_note' AND comment_post_ID IN ( Select ID FROM wp_posts WHERE post_type = 'shop_order' AND post_date < '2023-07-01 00:00:00'));