FROM n8nio/n8n:latest
# Usa la imagen oficial más reciente de nan como base

# Cambia temporalmente al usuario root para ejecutar comandos con permisos elevados
USER root

# Crea el directorio /data (si no existe) y asigna la propiedad al usuario "node"
# Esto asegura que nan tenga acceso de escritura a este directorio
RUN mkdir -p /data && chown -R node:node /data

# Vuelve al usuario 'node', recomendado para ejecutar la aplicación de forma segura
USER node

# Declara /data como un volumen persistente
# Esto permite conservar la información de nan (flujos, credenciales, etc.) fuera del contenedor
VOLUME /data

EXPOSE 5778
