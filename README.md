	Análisis Exploratorio del Crédito Directo del Sistema Financiero en el Perú (2016–2025)
	Descripción del proyecto

Este proyecto desarrolla un Análisis Exploratorio de Datos (EDA) utilizando R sobre la evolución del crédito directo otorgado por el sistema financiero peruano entre los años 2016 y 2025.

El objetivo principal es identificar patrones espaciales y temporales del crédito en el país, evaluando si el crecimiento observado durante la última década ha beneficiado de manera homogénea a todos los departamentos o si continúa existiendo una fuerte concentración financiera en determinadas regiones.

El análisis fue desarrollado empleando herramientas del ecosistema tidyverse, complementadas con técnicas de visualización mediante ggplot2, siguiendo principios de Data Storytelling, donde cada gráfico busca responder una pregunta económica concreta y comunicar un mensaje claro.

	Fuente de datos

Institución: Banco Central de Reserva del Perú (BCRP)

Fuente original: Superintendencia de Banca, Seguros y AFP (SBS)

Base utilizada:

Crédito directo del sistema financiero al sector privado por departamentos (Series Anuales)

Periodo:

2016–2025

Unidad de medida:

Millones de soles (saldo al cierre del año)

Objetivo del análisis

Responder la siguiente pregunta:

¿El crecimiento del crédito en el Perú ha sido un fenómeno distribuido entre todas las regiones o continúa concentrándose en Lima y unos pocos departamentos?

	Variables analizadas

La base contiene las siguientes variables principales:

Año
Departamento
Crédito directo (millones de soles)

Durante el proceso de limpieza se construyeron variables adicionales como:

Crecimiento anual del crédito
Participación porcentual de cada departamento
Crecimiento acumulado 2016–2025
Agrupación por macrorregiones
Preparación de los datos

	Principales resultados
1. El crédito al sector privado creció de forma importante durante la última década

Entre los años 2016 y 2025, el crédito directo otorgado por el sistema financiero al sector privado pasó de aproximadamente S/ 264 mil millones a S/ 422 mil millones, lo que representa un crecimiento acumulado cercano al 60 % durante el período analizado. Este resultado refleja una expansión significativa del financiamiento en el país, impulsada por una mayor intermediación financiera y por el crecimiento de la demanda de crédito en distintos sectores de la economía. Sin embargo, dicha evolución no fue completamente uniforme. Durante el año 2023 se registró una ligera reducción del crédito total, seguida de una recuperación moderada en 2024 y 2025, comportamiento que coincide con un contexto económico marcado por una menor inversión privada, incertidumbre política, condiciones financieras más restrictivas y una desaceleración del crecimiento económico nacional. En consecuencia, aunque la tendencia de largo plazo continúa siendo positiva, la dinámica reciente evidencia que el mercado crediticio también responde a los cambios del entorno macroeconómico.

2. Lima concentra la mayor parte del crédito nacional

El principal hallazgo del análisis corresponde a la elevada concentración territorial del crédito en el Perú. En 2025, el departamento de Lima concentró aproximadamente el 73 % del crédito directo nacional, mientras que los otros 24 departamentos compartieron únicamente el 27 % restante. En términos prácticos, esto significa que casi tres de cada cuatro soles prestados por el sistema financiero se encuentran registrados en Lima, evidenciando un fuerte proceso de centralización financiera. Esta situación pone de manifiesto que el crecimiento del crédito observado durante la última década no ha estado acompañado por una distribución territorial más equilibrada. Por el contrario, la expansión del financiamiento continúa concentrándose principalmente en la capital, lo que limita las oportunidades de acceso al crédito para empresas y hogares ubicados en otras regiones del país y plantea importantes desafíos para la inclusión financiera y el desarrollo regional.

3. El crecimiento porcentual no significa mayor importancia económica

Otro resultado relevante es que los departamentos con las mayores tasas de crecimiento porcentual no necesariamente son aquellos con mayor participación dentro del sistema financiero nacional. Regiones como Amazonas, Madre de Dios, Apurímac y Huancavelica registraron los mayores incrementos relativos del crédito entre 2016 y 2025; sin embargo, estos resultados deben interpretarse con cautela, ya que partían de niveles iniciales de crédito considerablemente bajos. En consecuencia, aunque su crecimiento porcentual fue elevado, su participación dentro del total nacional continúa siendo reducida. Este hallazgo demuestra que un alto crecimiento relativo no implica necesariamente una mayor importancia económica, pues el análisis debe considerar simultáneamente el volumen absoluto del crédito y el peso que cada departamento representa dentro del sistema financiero peruano.

4. Existe una marcada desigualdad territorial

El análisis también evidencia una persistente desigualdad territorial en la distribución del crédito. Los departamentos con mayor volumen de financiamiento continúan siendo Lima, Arequipa, La Libertad, Piura y Junín, mientras que regiones como Huancavelica, Madre de Dios, Tumbes y Pasco mantienen niveles considerablemente inferiores. Esta diferencia prácticamente no ha cambiado a lo largo del período analizado, lo que indica que la estructura territorial del crédito permanece altamente concentrada. En consecuencia, las regiones con menor acceso al financiamiento enfrentan mayores limitaciones para impulsar la inversión, fortalecer su actividad empresarial y mejorar su productividad, contribuyendo a la persistencia de brechas económicas y financieras entre Lima y el resto del país. Estos resultados sugieren que el crecimiento del crédito, por sí solo, no garantiza una distribución más equitativa de los recursos financieros, sino que debe complementarse con políticas orientadas a ampliar la inclusión financiera y fortalecer el acceso al crédito en las regiones con menor desarrollo relativo.

	Hallazgos principales

Antes de presentar los resultados, el análisis exploratorio permitió identificar cuatro hallazgos principales. En primer lugar, el crédito directo del sistema financiero mostró un crecimiento acumulado cercano al 60 % entre 2016 y 2025, reflejando una expansión importante del financiamiento al sector privado durante la última década. Sin embargo, este crecimiento no estuvo acompañado por una distribución más equilibrada entre los departamentos, ya que la concentración regional prácticamente se mantuvo. En segundo lugar, Lima continuó consolidándose como el principal centro financiero del país, concentrando aproximadamente el 73 % del crédito nacional, mientras que el resto de los departamentos compartieron poco más de una cuarta parte del total. Asimismo, se observó que los departamentos que registraron las mayores tasas de crecimiento porcentual aún mantienen una participación reducida dentro del mercado crediticio nacional, debido a que partían de niveles iniciales de financiamiento considerablemente bajos. En conjunto, estos resultados muestran que el crecimiento del crédito no ha sido suficiente para reducir las diferencias territoriales existentes en el acceso al financiamiento.

La información analizada no permite establecer relaciones de causalidad; sin embargo, la evidencia económica y la literatura especializada permiten plantear algunos factores que podrían explicar la elevada concentración del crédito en Lima. En primer lugar, la capital concentra una proporción importante del Producto Bruto Interno (PBI), así como de la producción industrial, el comercio y los servicios financieros, lo que genera una mayor demanda de préstamos tanto para empresas como para hogares. A ello se suma un mayor grado de formalización económica, ya que las empresas y trabajadores formales suelen contar con historiales crediticios, información financiera verificable y garantías que facilitan el acceso al sistema financiero, mientras que las regiones con mayores niveles de informalidad enfrentan mayores restricciones para obtener financiamiento. Asimismo, muchas empresas nacionales tienen sus sedes administrativas y financieras registradas en Lima, por lo que una parte importante de los créditos se contabiliza en la capital, aun cuando las actividades productivas se desarrollen en otras regiones del país. Del mismo modo, Lima concentra la mayor infraestructura financiera del Perú, incluyendo bancos, agencias, cajeros automáticos, personal especializado y una amplia oferta de servicios financieros, lo que reduce los costos de intermediación y facilita la colocación de créditos. Finalmente, desde la perspectiva de las entidades financieras, los departamentos con mayor actividad económica suelen presentar menores niveles de riesgo e incertidumbre, lo que incentiva una mayor oferta de financiamiento y contribuye a reforzar la concentración territorial del crédito.

	Consecuencias 

La concentración del crédito en pocos territorios puede generar diversos efectos sobre el desarrollo económico regional. En primer lugar, las empresas ubicadas fuera de Lima suelen enfrentar mayores restricciones para acceder al financiamiento formal, lo que limita la ejecución de nuevos proyectos de inversión, la expansión de sus operaciones y la creación de nuevas oportunidades de negocio. Como consecuencia, muchas empresas deben postergar decisiones de crecimiento o depender en mayor medida de recursos propios, reduciendo su capacidad para competir en mercados más amplios.

Asimismo, el acceso limitado al crédito restringe la incorporación de maquinaria, tecnología, innovación y procesos productivos más eficientes, factores fundamentales para incrementar la productividad. Esta situación provoca que numerosas regiones experimenten un crecimiento económico más lento en comparación con aquellas donde existe una mayor disponibilidad de financiamiento. En ese sentido, el crédito constituye uno de los principales motores de la inversión y del crecimiento económico; por ello, cuando permanece concentrado en un número reducido de departamentos, las brechas de desarrollo entre regiones tienden a mantenerse e incluso profundizarse con el paso del tiempo.

Otra consecuencia importante es la mayor dependencia del financiamiento informal. En aquellas zonas donde la presencia del sistema financiero es limitada, tanto hogares como pequeñas empresas pueden recurrir a prestamistas informales, quienes generalmente ofrecen créditos con tasas de interés más elevadas, menores garantías legales y mayores riesgos para los prestatarios. Finalmente, la concentración del crédito también contribuye a reforzar el proceso histórico de centralización económica del país. La mayor disponibilidad de financiamiento en Lima favorece que nuevas inversiones, empresas y oportunidades de empleo continúen localizándose en la capital, mientras que muchas regiones enfrentan mayores dificultades para atraer inversiones productivas, diversificar su estructura económica y reducir sus brechas de desarrollo respecto al resto del país.

	Conclusiones

El crédito directo del sistema financiero peruano mostró un crecimiento importante entre 2016 y 2025.

No obstante, dicho crecimiento estuvo acompañado por una fuerte concentración territorial.

Los resultados evidencian que Lima continúa desempeñando un papel dominante dentro del sistema financiero nacional, mientras que gran parte de las regiones mantiene una participación relativamente baja.

Aunque varios departamentos registraron elevadas tasas de crecimiento, estas no fueron suficientes para modificar significativamente la estructura territorial del crédito.

En consecuencia, uno de los principales desafíos para el sistema financiero peruano consiste en ampliar el acceso al crédito en las regiones mediante políticas que promuevan la formalización, reduzcan los costos de intermediación y fortalezcan la inclusión financiera.

	Autor
Patrick Dann Tacza Condori
Facultad de Economía
Universidad Nacional del Centro del Perú
