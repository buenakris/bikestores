/* 
Generate primary BikeStores dataset containing order, customer, product, store, and staff data 
for further analysis in Excel & Tableau.
*/

select
	ord.order_id,
	concat(cus.first_name, ' ', cus.last_name) as customer,
	cus.city,
	cus.state,
	ord.order_date,
	prd.product_name,
	ctg.category_name,
	stor.store_name,
	concat(stf.first_name, ' ', stf.last_name) as sales_rep,
	sum(ite.quantity) as total_units_sold,
	sum(ite.quantity * ite.list_price) as revenue
from sales.orders ord
	join sales.customers cus on ord.customer_id = cus.customer_id
	join sales.order_items ite on ord.order_id = ite.order_id
	join production.products prd on ite.product_id = prd.product_id
	join production.categories ctg on prd.category_id = ctg.category_id
	join sales.stores stor on ord.store_id = stor.store_id
	join sales.staffs stf on stor.store_id = stf.store_id
group by
	1,2,3,4,5,6,7,8,9
order by
	ORDER_ID, SALES_REP;