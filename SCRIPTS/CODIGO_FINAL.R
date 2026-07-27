#===========================================================#
# PROYECTO ANALISIS DATOS "R                                #
# CRÉDITO DIRECTO DEL SISTEMA FINANCIERO POR DEPARTAMENTO   #
# PERÚ, 2016-2025                                           #
#                                                           #
# Fuente: Banco Central de Reserva del Perú - BCRPData      #
# Fuente original: Superintendencia de Banca, Seguros y AFP #
#===========================================================#


#===========================================================#
# 1. PAQUETES                                               #
#===========================================================#

paquetes <- c(
  "dplyr",
  "readr",
  "ggplot2",
  "tidyr",
  "scales",
  "patchwork",
  "geodata"
)

faltantes <- paquetes[!paquetes %in% rownames(installed.packages())]

if(length(faltantes) > 0)+
  {install.packages(faltantes, repos = "https://cloud.r-project.org")}

library(dplyr)
library(readr)
library(ggplot2)
library(tidyr)
library(scales)
library(patchwork)
library(geodata)
options(scipen = 999)

#===========================================================#
# 2. CREAR CARPETAS                                         #
#===========================================================#

dir.create("figures", showWarnings = FALSE)

dir.create("results", showWarnings = FALSE)
#===========================================================#
# 3. IMPORTACIÓN DE DATOS                                   #
#===========================================================#
library(readr)

df <- read_csv("credito_departamental_bcrp_2016_2025.csv")
dim(df)

glimpse(df)

summary(df)

df %>%
  is.na() %>%
  colSums()

#===========================================================#
# 4. LIMPIEZA Y PREPARACIÓN                                 #
#===========================================================#

df <- df %>%
  
  mutate(anio = as.numeric(anio),credito_millones_soles =
      as.numeric(credito_millones_soles),
    macroregion = case_when(
      departamento %in% c(
        "Amazonas",
        "Cajamarca",
        "La Libertad",
        "Lambayeque",
        "Piura",
        "Tumbes"
      ) ~ "Norte",
      departamento %in% c(
        "Áncash",
        "Callao",
        "Huancavelica",
        "Huánuco",
        "Ica",
        "Junín",
        "Lima",
        "Pasco"
      ) ~ "Centro",
      departamento %in% c(
        "Apurímac",
        "Arequipa",
        "Ayacucho",
        "Cusco",
        "Moquegua",
        "Puno",
        "Tacna"
      ) ~ "Sur",
      departamento %in% c(
        "Loreto",
        "Madre de Dios",
        "San Martín",
        "Ucayali"
      ) ~ "Oriente",
      TRUE ~ "Otro") ) %>%
  
  group_by(departamento) %>%
  
  arrange(anio, .by_group = TRUE) %>%
  
  mutate(crecimiento_anual =
      100 * (credito_millones_soles /
          lag(credito_millones_soles) - 1)) %>%
  
  ungroup()

glimpse(df)
#===========================================================#
# 5. ESTADÍSTICAS DESCRIPTIVAS                              #
#===========================================================#
# Estadísticas generales del crédito
estadisticas <- df %>%
  summarise(promedio = mean(credito_millones_soles,
      na.rm = TRUE ),
    mediana = median( credito_millones_soles,
      na.rm = TRUE),
    desviacion = sd(credito_millones_soles,
      na.rm = TRUE),
    minimo = min(credito_millones_soles,
      na.rm = TRUE),
    maximo = max(credito_millones_soles,
      na.rm = TRUE))
estadisticas
# Crédito total nacional por año
resumen_anual <- df %>%
  group_by(anio) %>%
  summarise(credito_total = sum(credito_millones_soles,
      na.rm = TRUE),
    promedio_departamental = mean(credito_millones_soles,
      na.rm = TRUE), .groups = "drop")
resumen_anual
# Estadísticas por departamento para 2025
resumen_2025 <- df %>%
  filter(anio == 2025) %>%
  arrange(desc(credito_millones_soles)) %>%
  
  mutate(participacion =
      credito_millones_soles /
      sum(credito_millones_soles))

resumen_2025
# Crecimiento acumulado entre 2016 y 2025
crecimiento_periodo <- df %>%
  
  filter(anio %in% c(2016, 2025)) %>%
  
  select(anio, departamento,macroregion,credito_millones_soles) %>%
  pivot_wider(names_from = anio,values_from = credito_millones_soles,
    names_prefix = "credito_") %>%
  
  mutate(crecimiento_2016_2025 = 100 * (credito_2025 /credito_2016 - 1)) %>%
  arrange(desc(crecimiento_2016_2025))
crecimiento_periodo

# Guardar resultados

write_csv(estadisticas,"results/estadisticas_descriptivas.csv")

write_csv(resumen_anual,"results/resumen_anual.csv")

write_csv(resumen_2025,"results/resumen_departamental_2025.csv")

write_csv(crecimiento_periodo,"results/crecimiento_2016_2025.csv")

ggsave(filename ="figures/01_evolucion_credito.png",plot = P1,
  width = 10,height = 6,dpi = 300,bg = "white")
ggsave(filename ="figures/01_evolucion_credito.png",
  plot = P1,width = 10,height = 6,dpi = 300,bg = "white")
#===========================================================#
# GRÁFICO 1                                                 #
# EVOLUCIÓN DEL CRÉDITO NACIONAL                            #
#===========================================================#
df_2025 <- df %>%
  filter(anio == 2025) %>%
  mutate(DEPARTAMENTO = chartr("ÁÉÍÓÚ", "AEIOU", toupper(departamento)))
mp <- geodata::gadm(country = "PER",level = 1,path = tempdir()) %>%
  sf::st_as_sf()
mp$DEPARTAMENTO <- chartr("ÁÉÍÓÚ", "AEIOU", toupper(mp$NAME_1))
mapa_credito <- mp %>%
  left_join(df_2025, by = "DEPARTAMENTO")
P1 <- mapa_credito %>%
  ggplot() +
  geom_sf(aes(fill = log(credito_millones_soles)),color = "white",linewidth = 0.3)+
  geom_sf_text(aes(label = DEPARTAMENTO),size = 2,color = "black")+
  scale_fill_gradient(low = "#FEE6CE",high = "#E6550D",na.value = "gray90") +
  labs(title = "Concentración del crédito financiero en el Perú",
    subtitle = "Crédito directo del sistema financiero por departamento, 2025",x = "",
    y = "",fill = "Log del\ncrédito",caption = "Fuente: BCRPData.") +
  theme_minimal()
P1
ggsave(filename = "figures/01_mapa_credito_2025.png",plot = P1,width = 10,height = 8,dpi = 300,bg = "white")
#===========================================================#
# GRÁFICO 2                                                 #
# CONCENTRACIÓN DEL CRÉDITO EN LIMA                         #
#===========================================================#
concentracion_2025 <- df %>%
  filter(anio == 2025) %>%
  mutate(zona = ifelse(departamento == "Lima","Lima","Resto del país")) %>%
  group_by(zona) %>%
  summarise(credito_total = sum(credito_millones_soles,na.rm = TRUE),
  .groups = "drop") %>%
  mutate(participacion =credito_total /sum(credito_total))

P2 <- concentracion_2025 %>%
  ggplot(aes(x = zona,y = participacion,fill = zona))+
  geom_col(width = 0.65,show.legend = FALSE)+
  geom_text(aes(label = percent(participacion,accuracy = 0.1)),
  vjust = -0.5,size = 5,fontface = "bold")+
  scale_fill_manual(values = c("Lima" = "#D7301F","Resto del país" = "#74A9CF"))+
  scale_y_continuous(labels = percent,limits = c(0,1),
  expand = expansion(mult = c(0,0.08)))+
  ggthemes::theme_fivethirtyeight() +
  labs(title ="Concentración del credito",subtitle ="Participación de Lima frente al resto del país en 2025",
  x = "",y ="Participación en el crédito total",caption ="Fuente: BCRPData.")
P2
  ggsave(filename ="figures/02_concentracion_lima.png",plot = P2,width = 9,height = 6,
  dpi = 300,bg = "white")
#===========================================================#
# GRÁFICO 3                                                 #
# DEPARTAMENTOS CON MAYOR Y MENOR CRECIMIENTO               #
#===========================================================#
crecimiento_departamental <- df %>%
  filter(anio %in% c(2016,2025)) %>%
  select(anio,departamento,credito_millones_soles) %>%
  pivot_wider(names_from = anio,values_from =credito_millones_soles,
  names_prefix ="credito_") %>%
  mutate(crecimiento =100 * (credito_2025 /credito_2016 - 1))
# Seleccionar solo los cinco mayores y cinco menores
# para evitar que el gráfico se vea saturado.
crecimiento_seleccionado <- bind_rows(
  crecimiento_departamental %>%
    slice_max(crecimiento,n = 5,with_ties = FALSE),
  crecimiento_departamental %>%
    slice_min(crecimiento,n = 5,with_ties = FALSE) )%>%
  distinct(departamento,.keep_all = TRUE) %>%
  mutate(grupo = ifelse(crecimiento >=median(crecimiento_departamental$crecimiento,
  na.rm = TRUE),"Mayor crecimiento","Menor crecimiento"))

P3 <- crecimiento_seleccionado %>%
  ggplot(aes(x = reorder(departamento,crecimiento),y = crecimiento, fill = grupo))+
  geom_col(width = 0.70)+
  geom_text(aes(label = paste0(round(crecimiento,1),"%")),hjust = -0.10,size = 3.2)+
  coord_flip() +
  scale_fill_brewer(palette = "Set2")+
  scale_y_continuous(labels = label_number(suffix = "%"),
  expand = expansion( mult = c(0,0.18)))+
  theme_bw() +
  theme(legend.position = "none")+
  labs(title ="Crecimiento del credito",subtitle ="Cinco departamentos con mayor y menor crecimiento",
  x = "",y ="Crecimiento acumulado",fill = "",caption ="Fuente: BCRPData.")

P3
ggsave(filename ="figures/03_crecimiento_departamental.png",
  plot = P3, width = 8, height = 6, dpi = 300,bg = "white")

#===========================================================#
# COLLAGE DE LOS CUATRO GRÁFICOS                            #
#===========================================================#
collage <- P1 | (P2/P3)  
collage
ggsave(filename ="figures/collage_graficos.png",plot = collage,width = 17,
height = 12,dpi = 300,bg = "white")
  


