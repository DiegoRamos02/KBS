; rules.clp

;; Regla para identificar clientes que no han realizado ninguna compra
(defrule cust-not-buying
  (customer (customer-id ?id) (name ?name))
  (not (order (order-number ?order) (customer-id ?id)))
  =>
  (printout t ?name " no ha realizado ninguna compra." crlf)
)

;; Regla para listar los productos que han sido comprados
(defrule prods-bought
  (order (order-number ?order))
  (line-item (order-number ?order) (part-number ?part))
  (product (part-number ?part) (name ?pn))
  =>
  (printout t ?pn " ha sido comprado." crlf)
)

;; Regla para listar los productos que han sido comprados con una cantidad mayor a 5
(defrule prods-qty-bgt
  (order (order-number ?order))
  (line-item (order-number ?order) (part-number ?part) (quantity ?q&:(> ?q 5)))
  (product (part-number ?part) (name ?p))
  =>
  (printout t ?q " unidades de " ?p " han sido compradas." crlf)
)

;; Regla para mostrar la información de compra de los clientes
(defrule customer-shopping
  (customer (customer-id ?id) (name ?cn))
  (order (order-number ?order) (customer-id ?id))
  (line-item (order-number ?order) (part-number ?part))
  (product (part-number ?part) (name ?pn))
  =>
  (printout t ?cn " ha comprado " ?pn crlf)
)

;; Regla para identificar clientes que han comprado más de 3 productos en total
(defrule cust-5-prods
  (customer (customer-id ?id) (name ?cn))
  (test (> (count-orders ?id) 3))
  =>
  (printout t ?cn " ha comprado más de 3 productos." crlf)
)

;; Regla para enviar mensajes de texto a clientes que no han comprado nada
(defrule text-cust
  (customer (customer-id ?cid) (name ?name) (phone ?phone))
  (not (order (order-number ?order) (customer-id ?cid)))
  =>
  (assert (text-customer (name ?name) (phone ?phone) (message "Tienes un 25% de descuento en tu próxima compra.")))
  (printout t "Texto enviado a " ?name " (" ?phone "): Tienes un 25% de descuento en tu próxima compra." crlf)
)

;; Regla para llamar a clientes que no han comprado nada
(defrule call-cust
  (customer (customer-id ?cid) (name ?name) (phone ?phone))
  (not (order (order-number ?order) (customer-id ?cid)))
  =>
  (assert (call-customer (name ?name) (phone ?phone) (message "Tienes un 25% de descuento en tu próxima compra.")))
  (printout t "Llamada realizada a " ?name " (" ?phone "): Tienes un 25% de descuento en tu próxima compra." crlf)
)

;; Regla para aplicar promociones a productos específicos
(defrule apply-promotions
  (product (part-number ?pn) (name ?pname) (category ?cat) (price ?price&:(> ?price 100)))
  =>
  (printout t "Promocion aplicada a " ?pname ": 10% de descuento." crlf)
)

;; Regla para identificar y enviar promociones a clientes frecuentes
(defrule promote-frequent-customers
  (customer (customer-id ?id) (name ?name) (phone ?phone))
  (test (> (count-orders ?id) 3))
  =>
  (assert (text-customer (name ?name) (phone ?phone) (message "Gracias por ser un cliente frecuente. Disfruta un 20% de descuento en tu próxima compra.")))
  (printout t "Mensaje de texto enviado a " ?name " (" ?phone "): Gracias por ser un cliente frecuente. Disfruta un 20% de descuento en tu próxima compra." crlf)
)