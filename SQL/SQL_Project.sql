-- Question 7
select carton_id ,min(carton_vol) 
from(select carton_id,len*width*height as carton_vol
 from carton
where len*width*height>=
(select sum(volume) from
(select product_quantity * len * width * height as volume
from order_items inner join product on order_items.product_id=product.product_id
where order_id=10006) as A )) as C;

-- Question 8

select online_customer.customer_id,order_header.order_id,concat(customer_fname,' ',customer_lname) as cutomer_fullname,
 sum(product_quantity) as totalquantity
from order_items
inner join order_header on order_header.order_id=order_items.order_id
inner join online_customer on online_customer.customer_id=order_header.customer_id
where order_status='Shipped' 
group by order_id having sum(product_quantity)>10 ;

-- Question 9

select online_customer.customer_id,order_header.order_id,concat(customer_fname,' ',customer_lname) as cutomer_fullname,
 sum(product_quantity) as totalquantity
from order_items
inner join order_header on order_header.order_id=order_items.order_id
inner join online_customer on online_customer.customer_id=order_header.customer_id
where order_status='Shipped'
group by order_id having order_id>10060;

-- Question 10


select product_class_desc,sum(product_quantity) as total_quantity,product_quantity*product_price as total_value 
from product
inner join order_items on product.product_id=order_items.product_id
inner join product_class on product_class.product_class_code=product.product_class_code
inner join order_header on order_header.order_id=order_items.order_id
inner join online_customer on online_customer.customer_id=order_header.customer_id
inner join address on address.address_id=online_customer.address_id
where country<>'India' and country<>'USA'
group by product_class_desc 
order by total_quantity DESC limit 1;










