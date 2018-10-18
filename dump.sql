CREATE TABLE `anuncio` (
  `id_anuncio` int(11) NOT NULL COMMENT 'Identificador Anuncio',
  `titulo_anuncio` varchar(250) NOT NULL COMMENT 'Título del anuncio',
  `alter_titulo_anuncio` varchar(250) DEFAULT NULL COMMENT 'Título alternativo en otro idioma del anuncio',
  `detalle_anuncio` varchar(600) NOT NULL COMMENT 'Detalles del Anuncio',
  `alter_detalle_anuncio` varchar(600) DEFAULT NULL COMMENT 'Detalles Alternativos en otro idioma del anuncio',
  `fecha_anuncio` datetime NOT NULL COMMENT 'Fecha de publicación del anuncio',
  `fecha_cierre_anuncio` datetime DEFAULT NULL COMMENT 'Fecha de cierre del anuncio',
  `estado_anuncio` tinyint(4) NOT NULL COMMENT 'Estado Actual del Anuncio',
  `user_ptr_id` int(11) NOT NULL COMMENT 'Identificador FK de usuario',
  `id_idioma_alter` int(11) DEFAULT NULL COMMENT 'Idioma de Anuncio Alternativo',
  PRIMARY KEY (`id_anuncio`),
  KEY `id_idioma_alter_idx` (`id_idioma_alter`),
  KEY `user_ptr_id_idx` (`user_ptr_id`),
  CONSTRAINT `id_idioma_alter` FOREIGN KEY (`id_idioma_alter`) REFERENCES `idioma` (`id_idioma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_ptr_id` FOREIGN KEY (`user_ptr_id`) REFERENCES `usuarios_empresa` (`user_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de Anuncios';
