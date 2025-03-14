-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-02-2025 a las 00:37:33
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_centromedico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alergias`
--

CREATE TABLE `alergias` (
  `id_alergia` bigint(20) UNSIGNED NOT NULL,
  `id_paciente` bigint(20) UNSIGNED NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `severidad` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `alergias`
--

INSERT INTO `alergias` (`id_alergia`, `id_paciente`, `tipo`, `descripcion`, `severidad`, `created_at`, `updated_at`) VALUES
(1, 2, 'aasa', 'asas', 'moderada', '2025-02-13 07:58:15', '2025-02-13 07:58:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anamnesis`
--

CREATE TABLE `anamnesis` (
  `id_anamnesis` bigint(20) UNSIGNED NOT NULL,
  `id_historial` bigint(20) UNSIGNED NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `anamnesis`
--

INSERT INTO `anamnesis` (`id_anamnesis`, `id_historial`, `descripcion`, `fecha_creacion`, `created_at`, `updated_at`) VALUES
(1, 1, 'Antecedentes: La anamnesis es el proceso de la exploración clínica que se ejecuta mediante el interrogatorio para identificar personalmente al individuo, conocer sus dolencias actuales, obtener una retrospectiva de él y determinar los elementos familiares, ambientales y personales relevantes.\nSíntomas Actuales: dolor de cabeza, dolor de estomago, pies inflamados\nHábitos: Bizcocho con gaseosa\n', '2025-02-13 04:50:59', '2025-02-13 04:50:59', '2025-02-13 04:50:59'),
(2, 1, 'Antecedentes: qqq\nSíntomas Actuales: qqq\nHábitos: qq\n', '2025-02-13 04:51:11', '2025-02-13 04:51:11', '2025-02-13 04:51:11'),
(3, 2, 'Antecedentes: aadada\nSíntomas Actuales: adada\nHábitos: dadad\n', '2025-02-13 07:58:05', '2025-02-13 07:58:05', '2025-02-13 07:58:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos_adjuntos`
--

CREATE TABLE `archivos_adjuntos` (
  `id_archivo` bigint(20) UNSIGNED NOT NULL,
  `id_historial` bigint(20) UNSIGNED DEFAULT NULL,
  `id_consulta` bigint(20) UNSIGNED DEFAULT NULL,
  `id_examen` bigint(20) UNSIGNED DEFAULT NULL,
  `tipo_archivo` varchar(50) NOT NULL,
  `nombre_archivo` varchar(255) NOT NULL,
  `ruta_archivo` varchar(255) NOT NULL,
  `fecha_subida` timestamp NOT NULL DEFAULT current_timestamp(),
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id_transaccion` bigint(20) UNSIGNED NOT NULL,
  `id_centro` bigint(20) UNSIGNED NOT NULL,
  `id_factura` bigint(20) UNSIGNED DEFAULT NULL,
  `fecha_transaccion` date NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `tipo_transaccion` enum('INGRESO','GASTO') NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centros_medicos`
--

CREATE TABLE `centros_medicos` (
  `id_centro` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(191) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `ruc` varchar(20) NOT NULL,
  `color_tema` varchar(7) DEFAULT NULL,
  `estado` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `centros_medicos`
--

INSERT INTO `centros_medicos` (`id_centro`, `nombre`, `direccion`, `logo`, `ruc`, `color_tema`, `estado`, `creado_en`, `created_at`, `updated_at`) VALUES
(1, 'Centro Médico Prueba', 'Av. Ejemplo 123', 'logo.png', '123456789', '#FF5733', 'ACTIVO', '2025-02-12 14:45:48', '2025-02-12 19:45:48', '2025-02-12 19:45:48'),
(3, 'Clinica Salud Integral', 'Av. 28 de Julio 123, Lima , Peru', NULL, '20123456789', '#3067c0', 'ACTIVO', '2025-02-12 15:53:09', '2025-02-12 20:53:09', '2025-02-12 20:53:13'),
(4, 'Cínica Juan Pablo II', 'Manuel Villavicencio 376, Chimbote', 'logos/S9esrc4J24FY8gZX3egiv758AxBRQfMRNs0vbHc7.jpg', '20602529046', '#394e13', 'ACTIVO', '2025-02-12 15:54:12', '2025-02-12 20:54:12', '2025-02-13 07:53:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cirugias`
--

CREATE TABLE `cirugias` (
  `id_cirugia` bigint(20) UNSIGNED NOT NULL,
  `id_historial` bigint(20) UNSIGNED NOT NULL,
  `tipo_cirugia` varchar(100) NOT NULL,
  `fecha_cirugia` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cirujano` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `complicaciones` text DEFAULT NULL,
  `notas_postoperatorias` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id_consulta` bigint(20) UNSIGNED NOT NULL,
  `id_historial` bigint(20) UNSIGNED NOT NULL,
  `id_medico` bigint(20) UNSIGNED NOT NULL,
  `fecha_consulta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `motivo_consulta` text NOT NULL,
  `sintomas` text NOT NULL,
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id_consulta`, `id_historial`, `id_medico`, `fecha_consulta`, `motivo_consulta`, `sintomas`, `observaciones`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-02-13 04:53:33', 'gripe', 'gripe', NULL, '2025-02-13 04:53:33', '2025-02-13 04:53:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico`
--

CREATE TABLE `diagnostico` (
  `id_diagnostico` bigint(20) UNSIGNED NOT NULL,
  `id_historial` bigint(20) UNSIGNED NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donadores_sangre`
--

CREATE TABLE `donadores_sangre` (
  `id_donador` bigint(20) UNSIGNED NOT NULL,
  `id_paciente` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre` varchar(191) NOT NULL,
  `apellido` varchar(191) NOT NULL,
  `tipo_sangre` varchar(5) DEFAULT NULL,
  `estado` enum('POR_EXAMINAR','APTO','NO_APTO') NOT NULL DEFAULT 'POR_EXAMINAR',
  `ultima_donacion` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedades`
--

CREATE TABLE `enfermedades` (
  `id_enfermedad` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidad` bigint(20) UNSIGNED NOT NULL,
  `id_centro` bigint(20) UNSIGNED NOT NULL,
  `nombre_especialidad` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id_especialidad`, `id_centro`, `nombre_especialidad`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 4, 'cardiologia', 'especialista en el corazon', '2025-02-12 21:07:47', '2025-02-12 21:07:47'),
(2, 4, 'pediatria', 'para los niños', '2025-02-12 21:08:14', '2025-02-12 21:08:14'),
(3, 4, 'radiologia', NULL, '2025-02-12 21:08:59', '2025-02-12 21:08:59'),
(4, 4, 'odontologia', NULL, '2025-02-12 21:09:09', '2025-02-12 21:09:09'),
(5, 4, 'urologia', NULL, '2025-02-12 21:09:23', '2025-02-12 21:09:23'),
(6, 4, 'traumatologia', NULL, '2025-02-12 21:09:36', '2025-02-12 21:09:36'),
(7, 4, 'reumatologia', 'wffwfw', '2025-02-13 07:55:14', '2025-02-13 07:55:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenes_medicos`
--

CREATE TABLE `examenes_medicos` (
  `id_examen` bigint(20) UNSIGNED NOT NULL,
  `id_historial` bigint(20) UNSIGNED NOT NULL,
  `tipo_examen` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_examen` date NOT NULL,
  `resultados` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` bigint(20) UNSIGNED NOT NULL,
  `id_paciente` bigint(20) UNSIGNED NOT NULL,
  `id_centro` bigint(20) UNSIGNED NOT NULL,
  `id_personal_caja` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `impuesto` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL,
  `fecha_factura` date NOT NULL,
  `estado_pago` enum('PENDIENTE','PAGADA') NOT NULL DEFAULT 'PENDIENTE',
  `metodo_pago` enum('EFECTIVO','TARJETA') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_servicios`
--

CREATE TABLE `factura_servicios` (
  `id_factura_servicio` bigint(20) UNSIGNED NOT NULL,
  `id_factura` bigint(20) UNSIGNED NOT NULL,
  `id_servicio` bigint(20) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_clinico`
--

CREATE TABLE `historial_clinico` (
  `id_historial` bigint(20) UNSIGNED NOT NULL,
  `id_paciente` bigint(20) UNSIGNED NOT NULL,
  `id_centro` bigint(20) UNSIGNED NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_clinico`
--

INSERT INTO `historial_clinico` (`id_historial`, `id_paciente`, `id_centro`, `fecha_creacion`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2025-02-13 04:47:33', '2025-02-13 04:47:33', '2025-02-13 04:47:33'),
(2, 2, 4, '2025-02-22 05:00:00', '2025-02-13 07:57:49', '2025-02-14 19:49:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_enfermedad`
--

CREATE TABLE `historial_enfermedad` (
  `id_historial` bigint(20) UNSIGNED NOT NULL,
  `id_enfermedad` bigint(20) UNSIGNED NOT NULL,
  `fecha_diagnostico` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_medicos`
--

CREATE TABLE `horarios_medicos` (
  `id_horario` bigint(20) UNSIGNED NOT NULL,
  `id_personal_medico` bigint(20) UNSIGNED NOT NULL,
  `dia_semana` enum('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES','SABADO','DOMINGO') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `horarios_medicos`
--

INSERT INTO `horarios_medicos` (`id_horario`, `id_personal_medico`, `dia_semana`, `hora_inicio`, `hora_fin`, `created_at`, `updated_at`) VALUES
(2, 1, 'LUNES', '10:00:00', '16:00:00', '2025-02-13 04:20:30', '2025-02-13 04:20:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos_receta`
--

CREATE TABLE `medicamentos_receta` (
  `id_medicamento_receta` bigint(20) UNSIGNED NOT NULL,
  `id_receta` bigint(20) UNSIGNED NOT NULL,
  `medicamento` varchar(100) NOT NULL,
  `dosis` varchar(50) NOT NULL,
  `frecuencia` varchar(50) NOT NULL,
  `duracion` varchar(50) NOT NULL,
  `instrucciones` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medicamentos_receta`
--

INSERT INTO `medicamentos_receta` (`id_medicamento_receta`, `id_receta`, `medicamento`, `dosis`, `frecuencia`, `duracion`, `instrucciones`, `created_at`, `updated_at`) VALUES
(1, 1, 'paracetamol', '250 mg', '2', '2', NULL, '2025-02-13 04:53:04', '2025-02-13 04:53:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2024_11_08_05_create_centros_medicos_table', 1),
(5, '2024_11_08_13_create_roles_table', 1),
(6, '2024_11_08_14_create_usuarios_table', 1),
(7, '2024_11_08_16_create_especialidades_table', 1),
(8, '2024_11_08_17_create_permisos_table', 1),
(9, '2024_11_08_18_create_enfermedades_table', 1),
(10, '2024_11_08_20_create_personal_medico_table', 1),
(11, '2024_11_08_21_create_pacientes_table', 1),
(12, '2024_11_08_22_create_historial_clinico_table', 1),
(13, '2024_11_08_23_create_recetas_table', 1),
(14, '2024_11_08_24_create_roles_permisos_table', 1),
(15, '2024_11_08_25_create_diagnostico_table', 1),
(16, '2024_11_08_26_create_alergias_table', 1),
(17, '2024_11_08_27_create_anamnesis_table', 1),
(18, '2024_11_08_28_create_historial_enfermedad_table', 1),
(19, '2024_11_08_29_create_tratamiento_table', 1),
(20, '2024_11_08_30_create_consultas_table', 1),
(21, '2024_11_08_31_create_medicamentos_receta_table', 1),
(22, '2024_11_08_32_create_triaje_table', 1),
(23, '2024_11_08_33_create_cirugias_table', 1),
(24, '2024_11_08_34_create_examenes_medicos_table', 1),
(25, '2024_11_08_35_create_solicitudes_sangre_table', 1),
(26, '2024_11_08_36_create_donadores_sangre_table', 1),
(27, '2024_11_08_37_create_reportes_table', 1),
(28, '2024_11_08_38_create_servicios_precio_table', 1),
(29, '2024_11_08_39_create_horarios_medicos_table', 1),
(30, '2024_11_08_40_create_vacunas_table', 1),
(31, '2024_11_08_45_create_archivos_adjuntos_table', 1),
(32, '2024_11_08_46_create_facturas_table', 1),
(33, '2024_11_08_47_create_caja_table', 1),
(34, '2024_11_10_201445_add_id_centro_to_roles_table', 1),
(35, '2024_11_10_201533_add_id_centro_to_permisos_table', 1),
(36, '2024_11_10_201607_add_id_centro_to_roles_permisos_table', 1),
(37, '2024_11_10_41_add_id_centro_to_personal_medico_table', 1),
(38, '2024_11_11_213848_update_id_especialidad_nullable_in_personal_medico', 1),
(39, '2024_11_11_215619_update_numero_colegiatura_nullable_in_personal_medico', 1),
(40, '2024_11_12_110634_add_id_centro_to_especialidades_table', 1),
(41, '2024_11_12_150651_update_pacientes_columns_to_string', 1),
(42, '2024_11_27_42_create_factura_servicios_table', 1),
(43, '2024_11_30_080959_create_sessions_table', 1),
(44, '2024_12_13_171700_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` bigint(20) UNSIGNED NOT NULL,
  `id_centro` bigint(20) UNSIGNED NOT NULL,
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` enum('MASCULINO','FEMENINO') NOT NULL,
  `dni` varchar(20) NOT NULL,
  `direccion` text NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `grupo_sanguineo` varchar(5) NOT NULL,
  `nombre_contacto_emergencia` varchar(191) NOT NULL,
  `telefono_contacto_emergencia` varchar(20) NOT NULL,
  `relacion_contacto_emergencia` varchar(50) NOT NULL,
  `es_donador` varchar(20) NOT NULL DEFAULT 'NO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `id_centro`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `fecha_nacimiento`, `genero`, `dni`, `direccion`, `telefono`, `email`, `grupo_sanguineo`, `nombre_contacto_emergencia`, `telefono_contacto_emergencia`, `relacion_contacto_emergencia`, `es_donador`, `created_at`, `updated_at`) VALUES
(1, 4, 'JANETH', 'FRANCISCA', 'ACOSTA', 'ZEGARRA', '2025-02-11', 'MASCULINO', '32932928', 'La Victoria\r\nPsj Amazonas', '912798111', 'jhanet@gmail.com', 'O+', 'Ruben Gonzalo', '329010', 'Celular fijo', 'SI', '2025-02-13 04:46:33', '2025-02-13 04:46:49'),
(2, 4, 'RUBEN', 'GONZALO', 'CRUZ', 'ACOSTA', '2025-02-02', 'MASCULINO', '76138093', 'xaxaxa', 'axaxaxax', 'xaxaxaxa@gmail.com', 'A-', 'axaxax', 'axaxaxa', 'axaxa', 'SI', '2025-02-13 07:57:23', '2025-02-13 07:57:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permiso` bigint(20) UNSIGNED NOT NULL,
  `id_centro` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre_modulo` varchar(50) NOT NULL,
  `tipo_permiso` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permiso`, `id_centro`, `nombre_modulo`, `tipo_permiso`, `created_at`, `updated_at`) VALUES
(1, 1, 'usuarios', 'crear_usuarios', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(2, 1, 'usuarios', 'editar_usuarios', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(3, 1, 'usuarios', 'eliminar_usuarios', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(4, 1, 'usuarios', 'visualizar_usuarios', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(5, 1, 'pacientes', 'crear_pacientes', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(6, 1, 'pacientes', 'editar_pacientes', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(7, 1, 'pacientes', 'eliminar_pacientes', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(8, 1, 'pacientes', 'visualizar_pacientes', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(9, 1, 'donaciones', 'crear_donadores', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(10, 1, 'donaciones', 'editar_donadores', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(11, 1, 'donaciones', 'eliminar_donadores', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(12, 1, 'donaciones', 'visualizar_donadores', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(13, 1, 'donaciones', 'solicitar_donaciones', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(14, 1, 'historial', 'crear_historial', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(15, 1, 'historial', 'editar_historial', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(16, 1, 'historial', 'visualizar_historial', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(17, 1, 'consultas', 'crear_consultas', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(18, 1, 'consultas', 'editar_consultas', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(19, 1, 'consultas', 'visualizar_consultas', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(20, 1, 'diagnosticos', 'crear_diagnosticos', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(21, 4, 'Gestión de Pacientes', 'visualizar', '2025-02-13 04:01:19', '2025-02-13 04:01:19'),
(22, 4, 'Gestión de Pacientes', 'crear', '2025-02-13 04:01:29', '2025-02-13 04:01:29'),
(23, 4, 'Gestión de Donaciones de Sangre', 'solicitar_donaciones', '2025-02-13 04:02:16', '2025-02-13 04:02:16'),
(24, 4, 'Gestión de Donaciones de Sangre', 'visualizar', '2025-02-13 07:54:04', '2025-02-13 07:54:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_medico`
--

CREATE TABLE `personal_medico` (
  `id_personal_medico` bigint(20) UNSIGNED NOT NULL,
  `id_centro` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `id_especialidad` bigint(20) UNSIGNED DEFAULT NULL,
  `dni` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo_contacto` varchar(100) NOT NULL,
  `sueldo` decimal(10,2) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `fecha_alta` date NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `banco` varchar(100) NOT NULL,
  `numero_cuenta` varchar(50) NOT NULL,
  `numero_colegiatura` varchar(191) DEFAULT NULL,
  `direccion` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_medico`
--

INSERT INTO `personal_medico` (`id_personal_medico`, `id_centro`, `id_usuario`, `id_especialidad`, `dni`, `telefono`, `correo_contacto`, `sueldo`, `codigo_postal`, `fecha_alta`, `fecha_baja`, `banco`, `numero_cuenta`, `numero_colegiatura`, `direccion`, `created_at`, `updated_at`) VALUES
(1, 4, 11, 4, '76138093', '996701532', 'mario123@gmail.com', 1400.00, '02802', '2025-02-28', NULL, '123456789', '123456789', '2020', 'Calle Ricardo Palma', '2025-02-13 04:04:40', '2025-02-13 04:04:40'),
(2, 4, 12, NULL, '72138093', '987654321', 'vegas234@gmail.com', 1300.00, '02802', '2025-02-28', NULL, '9817631111', '908174777', NULL, 'Calle Ricardo Palma', '2025-02-13 04:06:48', '2025-02-13 04:06:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id_receta` bigint(20) UNSIGNED NOT NULL,
  `id_historial` bigint(20) UNSIGNED NOT NULL,
  `id_medico` bigint(20) UNSIGNED NOT NULL,
  `fecha_receta` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id_receta`, `id_historial`, `id_medico`, `fecha_receta`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-02-27 05:00:00', '2025-02-13 04:52:35', '2025-02-13 04:52:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id_reporte` bigint(20) UNSIGNED NOT NULL,
  `id_centro` bigint(20) UNSIGNED NOT NULL,
  `tipo_reporte` enum('INGRESOS_DIARIOS','INGRESOS_MENSUALES','GASTOS','PACIENTES','DONACIONES') NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_reporte` date NOT NULL,
  `contenido` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`contenido`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` bigint(20) UNSIGNED NOT NULL,
  `id_centro` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `id_centro`, `nombre_rol`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 1, 'Administrador Global', 'Rol de administrador con acceso total al sistema', '2025-02-12 14:56:55', '2025-02-12 14:56:55'),
(2, 1, 'Administrador Centro Médico', 'Administrador Centro Médico del centro médico', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(3, 4, 'Médico/a', 'especialista en medicina general', '2025-02-12 21:03:03', '2025-02-12 21:04:02'),
(4, 4, 'Técnico', 'ayudante del medico', '2025-02-12 21:03:15', '2025-02-12 21:03:15'),
(5, 4, 'Enfermero/a', 'el que cuida al enfermo', '2025-02-12 21:03:28', '2025-02-12 21:03:28'),
(7, 4, 'Personal Administrativo', 'facturacion, asesoria?', '2025-02-12 21:04:25', '2025-02-12 21:04:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_permisos`
--

CREATE TABLE `roles_permisos` (
  `id_rol` bigint(20) UNSIGNED NOT NULL,
  `id_centro` bigint(20) UNSIGNED DEFAULT NULL,
  `id_permiso` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles_permisos`
--

INSERT INTO `roles_permisos` (`id_rol`, `id_centro`, `id_permiso`, `created_at`, `updated_at`) VALUES
(2, NULL, 1, NULL, NULL),
(2, NULL, 2, NULL, NULL),
(2, NULL, 3, NULL, NULL),
(2, NULL, 4, NULL, NULL),
(2, NULL, 5, NULL, NULL),
(2, NULL, 6, NULL, NULL),
(2, NULL, 7, NULL, NULL),
(2, NULL, 8, NULL, NULL),
(2, NULL, 9, NULL, NULL),
(2, NULL, 10, NULL, NULL),
(2, NULL, 11, NULL, NULL),
(2, NULL, 12, NULL, NULL),
(2, NULL, 13, NULL, NULL),
(2, NULL, 14, NULL, NULL),
(2, NULL, 15, NULL, NULL),
(2, NULL, 16, NULL, NULL),
(2, NULL, 17, NULL, NULL),
(2, NULL, 18, NULL, NULL),
(2, NULL, 19, NULL, NULL),
(2, NULL, 20, NULL, NULL),
(3, NULL, 21, NULL, NULL),
(3, NULL, 22, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_precio`
--

CREATE TABLE `servicios_precio` (
  `id_servicio` bigint(20) UNSIGNED NOT NULL,
  `id_centro` bigint(20) UNSIGNED NOT NULL,
  `nombre_servicio` varchar(191) NOT NULL,
  `categoria_servicio` enum('DIAGNOSTICO','CONSULTA','EXAMEN') NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estado` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Nmsu9HSKzIdHkst3ssvbpslJI7jhyS099JvMAcuQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicHlYcUJUcHgwd0l0VEExOHRhcno5dVUya0htNW5DUktnMlBOYWRlbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=', 1739552214);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_sangre`
--

CREATE TABLE `solicitudes_sangre` (
  `id_solicitud` bigint(20) UNSIGNED NOT NULL,
  `id_paciente` bigint(20) UNSIGNED NOT NULL,
  `tipo_sangre` varchar(5) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `urgencia` enum('BAJA','MEDIA','ALTA') NOT NULL,
  `estado` enum('PENDIENTE','COMPLETADA','CANCELADA') NOT NULL DEFAULT 'PENDIENTE',
  `fecha_solicitud` date NOT NULL,
  `fecha_completada` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `id_tratamiento` bigint(20) UNSIGNED NOT NULL,
  `id_historial` bigint(20) UNSIGNED NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `triaje`
--

CREATE TABLE `triaje` (
  `id_triaje` bigint(20) UNSIGNED NOT NULL,
  `id_historial` bigint(20) UNSIGNED NOT NULL,
  `id_personal_medico` bigint(20) UNSIGNED NOT NULL,
  `presion_arterial` varchar(20) NOT NULL,
  `temperatura` decimal(4,2) NOT NULL,
  `frecuencia_cardiaca` int(11) NOT NULL,
  `frecuencia_respiratoria` int(11) NOT NULL,
  `peso` decimal(5,2) NOT NULL,
  `talla` decimal(5,2) NOT NULL,
  `imc` decimal(4,2) NOT NULL,
  `fecha_triaje` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `id_centro` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(191) NOT NULL,
  `id_rol` bigint(20) UNSIGNED NOT NULL,
  `estado` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_centro`, `nombre`, `email`, `password`, `id_rol`, `estado`, `fecha_creacion`, `created_at`, `updated_at`) VALUES
(4, 1, 'Prueba', 'prueba@gmail.com', '$2y$12$0hoGUnVIPRYiJ.sKfZSaaec0sIPfHhzxt7XR9YAE5uuSbhmXOm.7e', 1, 'ACTIVO', '2025-02-12 15:01:07', '2025-02-12 20:01:07', '2025-02-12 20:01:07'),
(6, 1, 'Nuevo Usuario', 'nuevo_usuario@gmail.com', '$2y$12$S2Pi6.mrUaKkG/NBypvH.ue6gL2BHH8GgqNle94m/.88an/0sgIPG', 1, 'ACTIVO', '2025-02-12 15:07:53', '2025-02-12 20:07:53', '2025-02-12 20:07:53'),
(7, 1, 'Sara Cespedes', 'cespedes800@gmail.com', '$2y$12$sO16D3vYyE1IxrPGFfQd2OvKc0WjHaU8JSG1CwiemUiBeA5PZGeae', 2, 'ACTIVO', '2025-02-12 15:56:18', '2025-02-12 20:56:18', '2025-02-14 19:29:34'),
(9, 4, 'carlos', 'carlos12@gmail.com', '$2y$12$3bi4R3ya9V.thmtYNM.X5OlH1SfITpByhk5mizVn72RZ0Qgeu0YB2', 4, 'ACTIVO', '2025-02-12 16:05:34', '2025-02-12 21:05:34', '2025-02-13 07:54:28'),
(10, 4, 'Yuriko Ramos', 'yuri_ramos09@gmail.com', '$2y$12$AqcZnpgUOrr8U5RURy8LU.LzP6X9OwyWcYb/dhI.7ahV7At8TNuV.', 2, 'ACTIVO', '2025-02-12 22:38:18', '2025-02-13 03:38:18', '2025-02-13 03:38:18'),
(11, 4, 'mario', 'mario123@gmail.com', '$2y$12$/AbCPx5D7AQexBpClvU/ZeMpKvnjj0r8tbbaQx7onOBRJXvtBNnuy', 3, 'ACTIVO', '2025-02-12 23:03:34', '2025-02-13 04:03:34', '2025-02-13 04:03:34'),
(12, 4, 'karla', 'vegas234@gmail.com', '$2y$12$YZW7ENjP1EUZ4Q.ljRVR7uiXBLHpj4Q36XwXarnBNb8neSXVk4KkK', 7, 'ACTIVO', '2025-02-12 23:05:57', '2025-02-13 04:05:57', '2025-02-13 04:05:57'),
(13, 1, 'aaa', 'aaa@gmail.com', '$2y$12$FZho0IlQx0vsdUD6hzmmgOWpswdeOKgeahN.Rjeu1w3JjZGxioAL.', 2, 'ACTIVO', '2025-02-14 14:27:06', '2025-02-14 19:27:06', '2025-02-14 19:27:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunas`
--

CREATE TABLE `vacunas` (
  `id_vacuna` bigint(20) UNSIGNED NOT NULL,
  `id_historial` bigint(20) UNSIGNED NOT NULL,
  `nombre_vacuna` varchar(100) NOT NULL,
  `fecha_aplicacion` date NOT NULL,
  `dosis` varchar(50) DEFAULT NULL,
  `proxima_dosis` date DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `vacunas`
--

INSERT INTO `vacunas` (`id_vacuna`, `id_historial`, `nombre_vacuna`, `fecha_aplicacion`, `dosis`, `proxima_dosis`, `observaciones`, `created_at`, `updated_at`) VALUES
(1, 1, 'vacuna covid', '2025-02-28', '10 mg', '2025-02-21', 'ninguna', '2025-02-13 04:51:57', '2025-02-13 04:51:57');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alergias`
--
ALTER TABLE `alergias`
  ADD PRIMARY KEY (`id_alergia`),
  ADD KEY `alergias_id_paciente_foreign` (`id_paciente`);

--
-- Indices de la tabla `anamnesis`
--
ALTER TABLE `anamnesis`
  ADD PRIMARY KEY (`id_anamnesis`),
  ADD KEY `anamnesis_id_historial_foreign` (`id_historial`);

--
-- Indices de la tabla `archivos_adjuntos`
--
ALTER TABLE `archivos_adjuntos`
  ADD PRIMARY KEY (`id_archivo`),
  ADD KEY `archivos_adjuntos_id_historial_foreign` (`id_historial`),
  ADD KEY `archivos_adjuntos_id_consulta_foreign` (`id_consulta`),
  ADD KEY `archivos_adjuntos_id_examen_foreign` (`id_examen`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id_transaccion`),
  ADD KEY `caja_id_centro_foreign` (`id_centro`),
  ADD KEY `caja_id_factura_foreign` (`id_factura`);

--
-- Indices de la tabla `centros_medicos`
--
ALTER TABLE `centros_medicos`
  ADD PRIMARY KEY (`id_centro`),
  ADD UNIQUE KEY `centros_medicos_ruc_unique` (`ruc`);

--
-- Indices de la tabla `cirugias`
--
ALTER TABLE `cirugias`
  ADD PRIMARY KEY (`id_cirugia`),
  ADD KEY `cirugias_id_historial_foreign` (`id_historial`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id_consulta`),
  ADD KEY `consultas_id_historial_foreign` (`id_historial`),
  ADD KEY `consultas_id_medico_foreign` (`id_medico`);

--
-- Indices de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`id_diagnostico`),
  ADD KEY `diagnostico_id_historial_foreign` (`id_historial`);

--
-- Indices de la tabla `donadores_sangre`
--
ALTER TABLE `donadores_sangre`
  ADD PRIMARY KEY (`id_donador`),
  ADD KEY `donadores_sangre_id_paciente_foreign` (`id_paciente`);

--
-- Indices de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  ADD PRIMARY KEY (`id_enfermedad`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_especialidad`),
  ADD KEY `especialidades_id_centro_foreign` (`id_centro`);

--
-- Indices de la tabla `examenes_medicos`
--
ALTER TABLE `examenes_medicos`
  ADD PRIMARY KEY (`id_examen`),
  ADD KEY `examenes_medicos_id_historial_foreign` (`id_historial`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `facturas_id_paciente_foreign` (`id_paciente`),
  ADD KEY `facturas_id_centro_foreign` (`id_centro`),
  ADD KEY `facturas_id_personal_caja_foreign` (`id_personal_caja`);

--
-- Indices de la tabla `factura_servicios`
--
ALTER TABLE `factura_servicios`
  ADD PRIMARY KEY (`id_factura_servicio`),
  ADD KEY `factura_servicios_id_factura_foreign` (`id_factura`),
  ADD KEY `factura_servicios_id_servicio_foreign` (`id_servicio`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `historial_clinico_id_paciente_foreign` (`id_paciente`),
  ADD KEY `historial_clinico_id_centro_foreign` (`id_centro`);

--
-- Indices de la tabla `historial_enfermedad`
--
ALTER TABLE `historial_enfermedad`
  ADD PRIMARY KEY (`id_historial`,`id_enfermedad`),
  ADD KEY `historial_enfermedad_id_enfermedad_foreign` (`id_enfermedad`);

--
-- Indices de la tabla `horarios_medicos`
--
ALTER TABLE `horarios_medicos`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `horarios_medicos_id_personal_medico_foreign` (`id_personal_medico`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `medicamentos_receta`
--
ALTER TABLE `medicamentos_receta`
  ADD PRIMARY KEY (`id_medicamento_receta`),
  ADD KEY `medicamentos_receta_id_receta_foreign` (`id_receta`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `pacientes_dni_unique` (`dni`),
  ADD KEY `pacientes_id_centro_foreign` (`id_centro`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permiso`),
  ADD KEY `permisos_id_centro_foreign` (`id_centro`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `personal_medico`
--
ALTER TABLE `personal_medico`
  ADD PRIMARY KEY (`id_personal_medico`),
  ADD UNIQUE KEY `personal_medico_dni_unique` (`dni`),
  ADD KEY `personal_medico_id_usuario_foreign` (`id_usuario`),
  ADD KEY `personal_medico_id_especialidad_foreign` (`id_especialidad`),
  ADD KEY `personal_medico_id_centro_foreign` (`id_centro`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id_receta`),
  ADD KEY `recetas_id_historial_foreign` (`id_historial`),
  ADD KEY `recetas_id_medico_foreign` (`id_medico`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `reportes_id_centro_foreign` (`id_centro`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD KEY `roles_id_centro_foreign` (`id_centro`);

--
-- Indices de la tabla `roles_permisos`
--
ALTER TABLE `roles_permisos`
  ADD PRIMARY KEY (`id_rol`,`id_permiso`),
  ADD KEY `roles_permisos_id_permiso_foreign` (`id_permiso`),
  ADD KEY `roles_permisos_id_centro_foreign` (`id_centro`);

--
-- Indices de la tabla `servicios_precio`
--
ALTER TABLE `servicios_precio`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `servicios_precio_id_centro_foreign` (`id_centro`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `solicitudes_sangre`
--
ALTER TABLE `solicitudes_sangre`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `solicitudes_sangre_id_paciente_foreign` (`id_paciente`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`id_tratamiento`),
  ADD KEY `tratamiento_id_historial_foreign` (`id_historial`);

--
-- Indices de la tabla `triaje`
--
ALTER TABLE `triaje`
  ADD PRIMARY KEY (`id_triaje`),
  ADD KEY `triaje_id_historial_foreign` (`id_historial`),
  ADD KEY `triaje_id_personal_medico_foreign` (`id_personal_medico`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuarios_email_unique` (`email`),
  ADD KEY `usuarios_id_centro_foreign` (`id_centro`),
  ADD KEY `usuarios_id_rol_foreign` (`id_rol`);

--
-- Indices de la tabla `vacunas`
--
ALTER TABLE `vacunas`
  ADD PRIMARY KEY (`id_vacuna`),
  ADD KEY `vacunas_id_historial_foreign` (`id_historial`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alergias`
--
ALTER TABLE `alergias`
  MODIFY `id_alergia` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `anamnesis`
--
ALTER TABLE `anamnesis`
  MODIFY `id_anamnesis` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `archivos_adjuntos`
--
ALTER TABLE `archivos_adjuntos`
  MODIFY `id_archivo` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id_transaccion` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `centros_medicos`
--
ALTER TABLE `centros_medicos`
  MODIFY `id_centro` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cirugias`
--
ALTER TABLE `cirugias`
  MODIFY `id_cirugia` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_consulta` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  MODIFY `id_diagnostico` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `donadores_sangre`
--
ALTER TABLE `donadores_sangre`
  MODIFY `id_donador` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  MODIFY `id_enfermedad` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id_especialidad` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `examenes_medicos`
--
ALTER TABLE `examenes_medicos`
  MODIFY `id_examen` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura_servicios`
--
ALTER TABLE `factura_servicios`
  MODIFY `id_factura_servicio` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  MODIFY `id_historial` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `horarios_medicos`
--
ALTER TABLE `horarios_medicos`
  MODIFY `id_horario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicamentos_receta`
--
ALTER TABLE `medicamentos_receta`
  MODIFY `id_medicamento_receta` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_medico`
--
ALTER TABLE `personal_medico`
  MODIFY `id_personal_medico` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id_receta` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id_reporte` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `servicios_precio`
--
ALTER TABLE `servicios_precio`
  MODIFY `id_servicio` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudes_sangre`
--
ALTER TABLE `solicitudes_sangre`
  MODIFY `id_solicitud` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `id_tratamiento` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `triaje`
--
ALTER TABLE `triaje`
  MODIFY `id_triaje` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `vacunas`
--
ALTER TABLE `vacunas`
  MODIFY `id_vacuna` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alergias`
--
ALTER TABLE `alergias`
  ADD CONSTRAINT `alergias_id_paciente_foreign` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `anamnesis`
--
ALTER TABLE `anamnesis`
  ADD CONSTRAINT `anamnesis_id_historial_foreign` FOREIGN KEY (`id_historial`) REFERENCES `historial_clinico` (`id_historial`);

--
-- Filtros para la tabla `archivos_adjuntos`
--
ALTER TABLE `archivos_adjuntos`
  ADD CONSTRAINT `archivos_adjuntos_id_consulta_foreign` FOREIGN KEY (`id_consulta`) REFERENCES `consultas` (`id_consulta`),
  ADD CONSTRAINT `archivos_adjuntos_id_examen_foreign` FOREIGN KEY (`id_examen`) REFERENCES `examenes_medicos` (`id_examen`),
  ADD CONSTRAINT `archivos_adjuntos_id_historial_foreign` FOREIGN KEY (`id_historial`) REFERENCES `historial_clinico` (`id_historial`);

--
-- Filtros para la tabla `caja`
--
ALTER TABLE `caja`
  ADD CONSTRAINT `caja_id_centro_foreign` FOREIGN KEY (`id_centro`) REFERENCES `centros_medicos` (`id_centro`),
  ADD CONSTRAINT `caja_id_factura_foreign` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id_factura`);

--
-- Filtros para la tabla `cirugias`
--
ALTER TABLE `cirugias`
  ADD CONSTRAINT `cirugias_id_historial_foreign` FOREIGN KEY (`id_historial`) REFERENCES `historial_clinico` (`id_historial`);

--
-- Filtros para la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_id_historial_foreign` FOREIGN KEY (`id_historial`) REFERENCES `historial_clinico` (`id_historial`),
  ADD CONSTRAINT `consultas_id_medico_foreign` FOREIGN KEY (`id_medico`) REFERENCES `personal_medico` (`id_personal_medico`);

--
-- Filtros para la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD CONSTRAINT `diagnostico_id_historial_foreign` FOREIGN KEY (`id_historial`) REFERENCES `historial_clinico` (`id_historial`);

--
-- Filtros para la tabla `donadores_sangre`
--
ALTER TABLE `donadores_sangre`
  ADD CONSTRAINT `donadores_sangre_id_paciente_foreign` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD CONSTRAINT `especialidades_id_centro_foreign` FOREIGN KEY (`id_centro`) REFERENCES `centros_medicos` (`id_centro`) ON DELETE CASCADE;

--
-- Filtros para la tabla `examenes_medicos`
--
ALTER TABLE `examenes_medicos`
  ADD CONSTRAINT `examenes_medicos_id_historial_foreign` FOREIGN KEY (`id_historial`) REFERENCES `historial_clinico` (`id_historial`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_id_centro_foreign` FOREIGN KEY (`id_centro`) REFERENCES `centros_medicos` (`id_centro`),
  ADD CONSTRAINT `facturas_id_paciente_foreign` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `facturas_id_personal_caja_foreign` FOREIGN KEY (`id_personal_caja`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `factura_servicios`
--
ALTER TABLE `factura_servicios`
  ADD CONSTRAINT `factura_servicios_id_factura_foreign` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id_factura`) ON DELETE CASCADE,
  ADD CONSTRAINT `factura_servicios_id_servicio_foreign` FOREIGN KEY (`id_servicio`) REFERENCES `servicios_precio` (`id_servicio`) ON DELETE CASCADE;

--
-- Filtros para la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  ADD CONSTRAINT `historial_clinico_id_centro_foreign` FOREIGN KEY (`id_centro`) REFERENCES `centros_medicos` (`id_centro`),
  ADD CONSTRAINT `historial_clinico_id_paciente_foreign` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `historial_enfermedad`
--
ALTER TABLE `historial_enfermedad`
  ADD CONSTRAINT `historial_enfermedad_id_enfermedad_foreign` FOREIGN KEY (`id_enfermedad`) REFERENCES `enfermedades` (`id_enfermedad`),
  ADD CONSTRAINT `historial_enfermedad_id_historial_foreign` FOREIGN KEY (`id_historial`) REFERENCES `historial_clinico` (`id_historial`);

--
-- Filtros para la tabla `horarios_medicos`
--
ALTER TABLE `horarios_medicos`
  ADD CONSTRAINT `horarios_medicos_id_personal_medico_foreign` FOREIGN KEY (`id_personal_medico`) REFERENCES `personal_medico` (`id_personal_medico`);

--
-- Filtros para la tabla `medicamentos_receta`
--
ALTER TABLE `medicamentos_receta`
  ADD CONSTRAINT `medicamentos_receta_id_receta_foreign` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id_receta`);

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_id_centro_foreign` FOREIGN KEY (`id_centro`) REFERENCES `centros_medicos` (`id_centro`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_id_centro_foreign` FOREIGN KEY (`id_centro`) REFERENCES `centros_medicos` (`id_centro`) ON DELETE CASCADE;

--
-- Filtros para la tabla `personal_medico`
--
ALTER TABLE `personal_medico`
  ADD CONSTRAINT `personal_medico_id_centro_foreign` FOREIGN KEY (`id_centro`) REFERENCES `centros_medicos` (`id_centro`) ON DELETE CASCADE,
  ADD CONSTRAINT `personal_medico_id_especialidad_foreign` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id_especialidad`),
  ADD CONSTRAINT `personal_medico_id_usuario_foreign` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `recetas_id_historial_foreign` FOREIGN KEY (`id_historial`) REFERENCES `historial_clinico` (`id_historial`),
  ADD CONSTRAINT `recetas_id_medico_foreign` FOREIGN KEY (`id_medico`) REFERENCES `personal_medico` (`id_personal_medico`);

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_id_centro_foreign` FOREIGN KEY (`id_centro`) REFERENCES `centros_medicos` (`id_centro`);

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_id_centro_foreign` FOREIGN KEY (`id_centro`) REFERENCES `centros_medicos` (`id_centro`) ON DELETE CASCADE;

--
-- Filtros para la tabla `roles_permisos`
--
ALTER TABLE `roles_permisos`
  ADD CONSTRAINT `roles_permisos_id_centro_foreign` FOREIGN KEY (`id_centro`) REFERENCES `centros_medicos` (`id_centro`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_permisos_id_permiso_foreign` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id_permiso`),
  ADD CONSTRAINT `roles_permisos_id_rol_foreign` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `servicios_precio`
--
ALTER TABLE `servicios_precio`
  ADD CONSTRAINT `servicios_precio_id_centro_foreign` FOREIGN KEY (`id_centro`) REFERENCES `centros_medicos` (`id_centro`);

--
-- Filtros para la tabla `solicitudes_sangre`
--
ALTER TABLE `solicitudes_sangre`
  ADD CONSTRAINT `solicitudes_sangre_id_paciente_foreign` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD CONSTRAINT `tratamiento_id_historial_foreign` FOREIGN KEY (`id_historial`) REFERENCES `historial_clinico` (`id_historial`);

--
-- Filtros para la tabla `triaje`
--
ALTER TABLE `triaje`
  ADD CONSTRAINT `triaje_id_historial_foreign` FOREIGN KEY (`id_historial`) REFERENCES `historial_clinico` (`id_historial`),
  ADD CONSTRAINT `triaje_id_personal_medico_foreign` FOREIGN KEY (`id_personal_medico`) REFERENCES `personal_medico` (`id_personal_medico`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_id_centro_foreign` FOREIGN KEY (`id_centro`) REFERENCES `centros_medicos` (`id_centro`),
  ADD CONSTRAINT `usuarios_id_rol_foreign` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `vacunas`
--
ALTER TABLE `vacunas`
  ADD CONSTRAINT `vacunas_id_historial_foreign` FOREIGN KEY (`id_historial`) REFERENCES `historial_clinico` (`id_historial`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
