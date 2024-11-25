; functions.clp

(deffunction count-orders (?customer-id)
  (length$ (find-all-facts ((?o order)) (eq ?o:customer-id ?customer-id)))
)

(deffunction count-purchases (?product-name)
  (bind ?product-fact (find-fact ((?p product)) (eq ?p:name ?product-name)))
  (if (neq ?product-fact FALSE) then
    (length$ 
      (find-all-facts ((?li line-item)) 
        (eq ?li:part-number (fact-slot-value ?product-fact part-number))))
  else
    0)
)
