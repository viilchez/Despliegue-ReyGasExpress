# Despliegue-ReyGasExpress

## 1. Integrantes:
- Ruiz Sanchez Fabricio Augusto.
- Vilchez Zavaleta Edwin Valentino

## 2. Descripción del Proyecto:

**ReyGasExpress** es un sistema integral diseñado para optimizar la gestión de pedidos de "REY GAS EXPRESS", una empresa distribuidora de gas y agua en Trujillo. La plataforma centraliza el registro eficiente de pedidos, capturando detalles cruciales como la ubicación del cliente y las marcas específicas solicitadas de gas y agua.

La funcionalidad clave de **ReyGasExpress** radica en su capacidad para analizar las preferencias de marca por sector geográfico dentro de la ciudad de Trujillo. Al identificar las marcas de gas y agua con mayor demanda en cada zona, el sistema proporciona información valiosa para la optimización de inventarios y la anticipación de la demanda por marca en cada sector.

El objetivo final de **ReyGasExpress** es mejorar significativamente la eficiencia operativa de "REY GAS EXPRESS" y aumentar la satisfacción del cliente, asegurando la disponibilidad de las marcas preferidas en cada área de Trujillo. Adicionalmente, el sistema facilitará la gestión de los pedidos diarios a los proveedores, basándose en la demanda anticipada.

La arquitectura de la plataforma se está desarrollando con un enfoque en la escalabilidad, la seguridad y el bajo mantenimiento.

## 3. Servicios AWS Utilizados:

Este proyecto utiliza los siguientes servicios de Amazon Web Services (AWS) para construir una infraestructura robusta y escalable:

- **API Gateway:** Gestiona y protege la API de la aplicación.
- **CloudWatch:** Monitoreo y registro de logs para la aplicación y la infraestructura.
- **Cognito:** Proporciona autenticación y autorización seguras para los usuarios.
- **IAM (Identity and Access Management):** Control de acceso y permisos para los servicios de AWS.
- **Lambda:** Ejecución de código sin servidor para la lógica de la aplicación y el backend.
- **S3 (Simple Storage Service):** Almacenamiento escalable para archivos estáticos y otros datos.
- **CloudFront:** Red de entrega de contenido (CDN) para una distribución rápida y segura de activos.
- **RDS (Relational Database Service):** Servicio de base de datos relacional para almacenar los datos de la aplicación.
- **EC2 (Elastic Compute Cloud):** Servidores virtuales escalables en la nube (puede ser utilizado para ciertos componentes si es necesario).
- **VPC (Virtual Private Cloud):** Red virtual privada aislada para los recursos de AWS.
- **WAF (Web Application Firewall):** Protección contra ataques web comunes a nivel de la aplicación.