SELECT pid, name FROM products
WHERE discnt_rate > 0.1 AND (qoh - 10) >= qoh_threshold
/
