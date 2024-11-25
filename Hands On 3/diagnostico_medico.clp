; Definición de la estructura para las enfermedades
(deftemplate enfermedad
    (slot nombre)       ; Nombre de la enfermedad
    (slot tipo)         ; Tipo: viral o bacteriana
    (slot sintomas)     ; Lista de síntomas
)

; Definición de la estructura para los síntomas
(deftemplate sintoma
    (slot nombre)       ; Nombre del síntoma
)

; Base inicial de enfermedades
(deffacts enfermedades
    (enfermedad (nombre "Influenza") (tipo "viral") (sintomas "fiebre tos dolor de garganta fatiga dolores musculares"))
    (enfermedad (nombre "COVID-19") (tipo "viral") (sintomas "fiebre tos dificultad para respirar perdida de olfato o gusto"))
    (enfermedad (nombre "Neumonía bacteriana") (tipo "bacteriana") (sintomas "tos fiebre dolor en el pecho dificultad para respirar"))
    (enfermedad (nombre "Dengue") (tipo "viral") (sintomas "fiebre alta sarpullido dolores articulares hemorragias"))
    (enfermedad (nombre "Tuberculosis") (tipo "bacteriana") (sintomas "tos persistente sudores nocturnos perdida de peso"))
    (enfermedad (nombre "Hepatitis B") (tipo "viral") (sintomas "ictericia fatiga nauseas dolor abdominal"))
    (enfermedad (nombre "Meningitis bacteriana") (tipo "bacteriana") (sintomas "fiebre alta rigidez en el cuello confusion"))
    (enfermedad (nombre "Tetanos") (tipo "bacteriana") (sintomas "espasmos musculares rigidez dificultad para tragar"))
    (enfermedad (nombre "Brucelosis") (tipo "bacteriana") (sintomas "fiebre recurrente sudoracion nocturna fatiga"))
    (enfermedad (nombre "Gripe Aviar") (tipo "viral") (sintomas "fiebre alta dificultad respiratoria conjuntivitis"))
)

; Reglas para diagnosticar enfermedades
(defrule diagnosticar-influenza
    (sintoma (nombre "fiebre"))
    (sintoma (nombre "tos"))
    (sintoma (nombre "dolor de garganta"))
    =>
    (printout t "Es posible que el paciente tenga Influenza." crlf)
)

(defrule diagnosticar-covid
    (sintoma (nombre "fiebre"))
    (sintoma (nombre "tos"))
    (sintoma (nombre "perdida de olfato o gusto"))
    =>
    (printout t "Es posible que el paciente tenga COVID-19." crlf)
)

(defrule diagnosticar-neumonia
    (sintoma (nombre "tos"))
    (sintoma (nombre "fiebre"))
    (sintoma (nombre "dificultad para respirar"))
    =>
    (printout t "Es posible que el paciente tenga Neumonía bacteriana." crlf)
)

(defrule diagnosticar-dengue
    (sintoma (nombre "fiebre alta"))
    (sintoma (nombre "sarpullido"))
    (sintoma (nombre "dolores articulares"))
    =>
    (printout t "Es posible que el paciente tenga Dengue." crlf)
)

(defrule diagnosticar-tuberculosis
    (sintoma (nombre "tos persistente"))
    (sintoma (nombre "sudores nocturnos"))
    (sintoma (nombre "perdida de peso"))
    =>
    (printout t "Es posible que el paciente tenga Tuberculosis." crlf)
)

(defrule diagnosticar-hepatitis-b
    (sintoma (nombre "ictericia"))
    (sintoma (nombre "fatiga"))
    (sintoma (nombre "nauseas"))
    =>
    (printout t "Es posible que el paciente tenga Hepatitis B." crlf)
)

(defrule diagnosticar-meningitis
    (sintoma (nombre "fiebre alta"))
    (sintoma (nombre "rigidez en el cuello"))
    (sintoma (nombre "confusion"))
    =>
    (printout t "Es posible que el paciente tenga Meningitis bacteriana." crlf)
)

(defrule diagnosticar-tetanos
    (sintoma (nombre "espasmos musculares"))
    (sintoma (nombre "rigidez"))
    (sintoma (nombre "dificultad para tragar"))
    =>
    (printout t "Es posible que el paciente tenga Tetanos." crlf)
)

(defrule diagnosticar-brucelosis
    (sintoma (nombre "fiebre recurrente"))
    (sintoma (nombre "sudoracion nocturna"))
    (sintoma (nombre "fatiga"))
    =>
    (printout t "Es posible que el paciente tenga Brucelosis." crlf)
)

(defrule diagnosticar-gripe-aviar
    (sintoma (nombre "fiebre alta"))
    (sintoma (nombre "dificultad respiratoria"))
    (sintoma (nombre "conjuntivitis"))
    =>
    (printout t "Es posible que el paciente tenga Gripe Aviar." crlf)
)

; Función para agregar una enfermedad nueva
(deffunction agregar-enfermedad (?nombre ?tipo ?sintomas)
    (assert (enfermedad (nombre ?nombre) (tipo ?tipo) (sintomas ?sintomas)))
    (printout t "Enfermedad agregada: " ?nombre crlf)
)

; Función para actualizar una enfermedad
(deffunction actualizar-enfermedad (?nombre ?nuevo-tipo ?nuevos-sintomas)
    (bind ?facts (find-all-facts ((?f enfermedad)) (eq ?f:nombre ?nombre)))
    (if (> (length$ ?facts) 0) then
        (retract (nth$ 1 ?facts))
        (assert (enfermedad (nombre ?nombre) (tipo ?nuevo-tipo) (sintomas ?nuevos-sintomas)))
        (printout t "Enfermedad actualizada: " ?nombre crlf)
    else
        (printout t "Enfermedad no encontrada: " ?nombre crlf)
    )
)

; Función para borrar una enfermedad
(deffunction borrar-enfermedad (?nombre)
    (bind ?facts (find-all-facts ((?f enfermedad)) (eq ?f:nombre ?nombre)))
    (if (> (length$ ?facts) 0) then
        (retract (nth$ 1 ?facts))
        (printout t "Enfermedad borrada: " ?nombre crlf)
    else
        (printout t "Enfermedad no encontrada: " ?nombre crlf)
    )
)