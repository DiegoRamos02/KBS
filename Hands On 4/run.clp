; run.clp

;; 1. Cargar plantillas
(load "C:/Users/diego/OneDrive/Documentos/ConductasConsumo/templates.clp")

;; 2. Cargar hechos
(load "C:/Users/diego/OneDrive/Documentos/ConductasConsumo/facts.clp")

;; 3. Cargar funciones
(load "C:/Users/diego/OneDrive/Documentos/ConductasConsumo/functions.clp")

;; 4. Cargar reglas
(load "C:/Users/diego/OneDrive/Documentos/ConductasConsumo/rules.clp")

;; 5. Inicializar el sistema
(reset)

;; 6. Ejecutar el motor de inferencia
(run)

