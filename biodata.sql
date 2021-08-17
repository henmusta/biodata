/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.18-MariaDB : Database - biodata_app
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`biodata_app` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `biodata_app`;

/*Table structure for table `tb_admin` */

DROP TABLE IF EXISTS `tb_admin`;

CREATE TABLE `tb_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(120) DEFAULT NULL,
  `full_name` varchar(120) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `id_level` int(11) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `is_active` enum('Y','N') DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_admin` */

insert  into `tb_admin`(`id`,`username`,`full_name`,`password`,`id_level`,`image`,`is_active`) values (1,'admin','Administrator','$2y$05$3oQlxl8wMGd8VecO4nFXre3SjeHWqFN79oMy/.pdEj5Q89xopj4oi',1,'admin.png','Y');

/*Table structure for table `tb_aplikasi` */

DROP TABLE IF EXISTS `tb_aplikasi`;

CREATE TABLE `tb_aplikasi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama_owner` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tlp` varchar(50) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `nama_aplikasi` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `copy_right` varchar(50) DEFAULT NULL,
  `versi` varchar(20) DEFAULT NULL,
  `tahun` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_aplikasi` */

insert  into `tb_aplikasi`(`id`,`nama_owner`,`alamat`,`tlp`,`title`,`nama_aplikasi`,`logo`,`copy_right`,`versi`,`tahun`) values (1,'Gink','Enggal, Jl. Way Pengubuan No.16, Pahoman, Engal, Kota Bandar Lampung, Lampung 35132','089506016186','Kepegawaian','Kepegawaian','gink.png','Copy Right &copy; Gink Technology','1.0',2021);

/*Table structure for table `tb_diklat` */

DROP TABLE IF EXISTS `tb_diklat`;

CREATE TABLE `tb_diklat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `nama_diklat` varchar(150) DEFAULT NULL,
  `tahun_lulus` date DEFAULT NULL,
  `tempat_diklat` varchar(150) DEFAULT NULL,
  `penyelenggara` varchar(150) DEFAULT NULL,
  `jenis` enum('Struktural','Fungsional') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tb_diklat_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_diklat` */

/*Table structure for table `tb_huk_disiplin` */

DROP TABLE IF EXISTS `tb_huk_disiplin`;

CREATE TABLE `tb_huk_disiplin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `jenis_huk` varchar(50) DEFAULT NULL,
  `nama_huk` varchar(50) DEFAULT NULL,
  `Tmt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_huk_disiplin` */

/*Table structure for table `tb_keluarga` */

DROP TABLE IF EXISTS `tb_keluarga`;

CREATE TABLE `tb_keluarga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `nama_ibu` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `pekerjaan` varchar(150) DEFAULT NULL,
  `jenis` enum('Ibu','Ayah','Pasutri','Anak') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tb_keluarga_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_keluarga` */

/*Table structure for table `tb_kepangkatan` */

DROP TABLE IF EXISTS `tb_kepangkatan`;

CREATE TABLE `tb_kepangkatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `pangkat` varchar(150) DEFAULT NULL,
  `gol_ruang` varchar(20) DEFAULT NULL,
  `Tmt_pangkat` date DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tb_kepangkatan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_kepangkatan` */

/*Table structure for table `tb_kepegawaian` */

DROP TABLE IF EXISTS `tb_kepegawaian`;

CREATE TABLE `tb_kepegawaian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `tmt_pangkat` date DEFAULT NULL,
  `pangkat_lanjut` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tb_kepegawaian_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_kepegawaian` */

/*Table structure for table `tb_pendidikan` */

DROP TABLE IF EXISTS `tb_pendidikan`;

CREATE TABLE `tb_pendidikan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `tingkat_pendidikan` varchar(150) DEFAULT NULL,
  `jurusan` varchar(150) DEFAULT NULL,
  `nama_sekolah` varchar(150) DEFAULT NULL,
  `tgl_lulus` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_pendidikan` */

/*Table structure for table `tb_penghargaan` */

DROP TABLE IF EXISTS `tb_penghargaan`;

CREATE TABLE `tb_penghargaan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `nama_jasa` varchar(150) DEFAULT NULL,
  `asal_perolehan` varchar(150) DEFAULT NULL,
  `tahun` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tb_penghargaan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_penghargaan` */

/*Table structure for table `tb_prestasi` */

DROP TABLE IF EXISTS `tb_prestasi`;

CREATE TABLE `tb_prestasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `tahun` int(100) DEFAULT NULL,
  `nilai_skp` decimal(15,2) DEFAULT NULL,
  `nilai_perilaku` decimal(15,2) DEFAULT NULL,
  `nilai_prestasi` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tb_prestasi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_prestasi` */

/*Table structure for table `tb_settings` */

DROP TABLE IF EXISTS `tb_settings`;

CREATE TABLE `tb_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `nama_kepala` varchar(100) DEFAULT NULL,
  `Nip` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_settings` */

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` int(50) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `ttl` date DEFAULT NULL,
  `agama` enum('Islam','Kristen','Konghucu','Budha','Hindu','Dll') DEFAULT NULL,
  `jenis_kelamin` enum('Pria','Wanita') DEFAULT NULL,
  `status_nikah` enum('Sudah','Belum') DEFAULT NULL,
  `pangkat_last` varchar(150) DEFAULT NULL,
  `pendidikan_last` varchar(150) DEFAULT NULL,
  `jabatan_sekarang` varchar(150) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_user` */

/*Table structure for table `tbl_jabatan` */

DROP TABLE IF EXISTS `tbl_jabatan`;

CREATE TABLE `tbl_jabatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `jabatan` varchar(150) DEFAULT NULL,
  `eselon` varchar(150) DEFAULT NULL,
  `Tmt jabatan` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tbl_jabatan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_jabatan` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
