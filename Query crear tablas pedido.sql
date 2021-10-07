CREATE TABLE `opr_pedido_detalle` (
  `id_detalle_pedido` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador Autoincrementable del detalle de pedido',
  `id_pedido_encabezado` int(11) unsigned DEFAULT NULL COMMENT 'ID del pedido encabezado a la que pertenece el detalle',
  `id_codigo_producto` int(11) DEFAULT NULL COMMENT 'codigo del producto',
  `descripcion` varchar(75) NOT NULL COMMENT 'descripcion del producto',
  `cantidad` int(11) DEFAULT NULL COMMENT 'cantidad vendida',
  `precio_venta` decimal(10,2) DEFAULT NULL COMMENT 'precio unitario',
  `valor` decimal(10,2) DEFAULT NULL COMMENT 'total de producto vendido',
  PRIMARY KEY (`id_detalle_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=68018 DEFAULT CHARSET=utf8 COMMENT='Tabla para registrar los detalles de pedidos';


CREATE TABLE `opr_pedido_encabezado` (
  `id_pedido_encabezado` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'identificador autoincrementable del pedido encabezado',
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'fecha de emisión del pedido',
  `id_cliente` int(11) unsigned NOT NULL COMMENT 'identificador del cliente',
  `descripcion` varchar(75) DEFAULT NULL COMMENT 'nombre del cliente o razón social',
  `valor` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'monto total del pedido',
  `valor_iva` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'valor de IVa del pedido',
  `id_operador` int(11) unsigned DEFAULT NULL COMMENT 'identificador del operador que emite el pedido',
  `estado_facturado` enum('S','N') NOT NULL DEFAULT 'N',
  `id_factura_encabezado` int(10) unsigned NOT NULL,
  `estado_registro` enum('A','B') NOT NULL DEFAULT 'A' COMMENT 'El estado del registro, A-Alta y B-Baja',
  PRIMARY KEY (`id_pedido_encabezado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30012 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información de los pedidos emitidos';