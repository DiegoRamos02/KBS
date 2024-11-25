; facts.clp

(deffacts products 
  (product (name USBMem) (category storage) (part-number 1234) (price 199.99))
  (product (name Amplifier) (category electronics) (part-number 2341) (price 399.99))
  (product (name "Rubber duck") (category mechanics) (part-number 3412) (price 99.99))
  (product (name "Smartphone") (category electronics) (part-number 4455) (price 599.99))
  (product (name "Laptop") (category electronics) (part-number 5566) (price 999.99))
  (product (name "Desk Lamp") (category home) (part-number 6677) (price 49.99))
  (product (name "Backpack") (category accessories) (part-number 7788) (price 89.99))
  (product (name "Water Bottle") (category accessories) (part-number 8899) (price 29.99))
  (product (name "Bluetooth Speaker") (category electronics) (part-number 9900) (price 149.99))
  (product (name "Running Shoes") (category footwear) (part-number 1010) (price 129.99))
)

(deffacts customers
  (customer (customer-id 101) (name "Joe Smith") (address "123 Main St, Cityville") (phone "3313073905"))
  (customer (customer-id 102) (name "Mary Johnson") (address "456 Elm St, Townsville") (phone "3332223456"))
  (customer (customer-id 103) (name "Bob Brown") (address "789 Oak St, Villageville") (phone "3315678901")) 
  (customer (customer-id 104) (name "Alice Davis") (address "321 Pine St, Hamletville") (phone "3324567890"))
  (customer (customer-id 105) (name "Charlie Wilson") (address "654 Maple St, Boroughville") (phone "3345678901"))
)

(deffacts orders 
  (order (order-number 300) (customer-id 102))
  (order (order-number 301) (customer-id 103))
  (order (order-number 302) (customer-id 101))
  (order (order-number 303) (customer-id 104))
  (order (order-number 304) (customer-id 105))
)

(deffacts items-list
  (line-item (order-number 300) (customer-id 102) (part-number 1234))
  (line-item (order-number 301) (customer-id 103) (part-number 2341) (quantity 10))
  (line-item (order-number 302) (customer-id 101) (part-number 4455) (quantity 2))
  (line-item (order-number 303) (customer-id 104) (part-number 5566) (quantity 1))
  (line-item (order-number 304) (customer-id 105) (part-number 6677) (quantity 3))
  (line-item (order-number 304) (customer-id 105) (part-number 8899) (quantity 5))
)