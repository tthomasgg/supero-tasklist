/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : supero

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 17/01/2019 15:06:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_tasks
-- ----------------------------
DROP TABLE IF EXISTS `tb_tasks`;
CREATE TABLE `tb_tasks`  (
  `cd_task` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `de_titulo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `de_descricao` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `de_status` enum('INICIADA','FINALIZADA','REMOVIDA') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'INICIADA',
  `dt_criacao` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `dt_edicao` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `dt_conclusao` datetime(0) NULL DEFAULT NULL,
  `dt_remocao` datetime(0) NULL DEFAULT NULL,
  `nr_posicao` int(9) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`cd_task`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_tasks
-- ----------------------------
INSERT INTO `tb_tasks` VALUES (1, 'Finalizar aplicativo de tasks', 'Finalizar aplicativo de tasks.', 'INICIADA', '2019-01-16 18:16:44', '2019-01-17 11:01:05', NULL, NULL, 1);
INSERT INTO `tb_tasks` VALUES (2, 'Finalizar adicao', 'Finalizar adicao de novas tarefas no aplicativo', 'FINALIZADA', '2019-01-16 18:17:25', '2019-01-17 14:24:00', '2019-01-17 11:41:00', NULL, 2);
INSERT INTO `tb_tasks` VALUES (3, 'Finalizar status', 'Finalizar funcionalidade de status concluida/nao concluida', 'INICIADA', '2019-01-16 18:19:18', '2019-01-17 11:01:06', NULL, NULL, 3);
INSERT INTO `tb_tasks` VALUES (5, 'Finalizar exclusão de task', 'Finalizar funcionalidade de exclusão da task', 'INICIADA', '2019-01-16 18:21:30', '2019-01-17 11:01:08', NULL, NULL, 5);
INSERT INTO `tb_tasks` VALUES (6, 'Subir para git', 'Subir o projeto todo para o git', 'FINALIZADA', '2019-01-16 18:22:02', '2019-01-17 13:09:08', '2019-01-17 13:09:08', NULL, 6);
INSERT INTO `tb_tasks` VALUES (4, 'Finalizar edição da task', 'Finalizar funcionalidade de edição da task', 'REMOVIDA', '2019-01-16 18:20:17', '2019-01-17 14:41:56', NULL, '2019-01-17 14:41:56', 4);

SET FOREIGN_KEY_CHECKS = 1;
