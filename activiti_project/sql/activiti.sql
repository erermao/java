/*
SQLyog Ultimate v8.32 
MySQL - 5.7.20 : Database - activitiproject
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`activitiproject` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `activitiproject`;

/*Table structure for table `a_employee` */

DROP TABLE IF EXISTS `a_employee`;

CREATE TABLE `a_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `role` varchar(64) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `a_employee` */

insert  into `a_employee`(`id`,`name`,`password`,`email`,`role`,`manager_id`) values (1,'王中军','$2a$04$hyFuUQPnhLBBi8jezBHnke060LbqL.Hkk8iPzSTMi8RLHLsQF4Rka','wangzhongjun@163.com','boss',NULL),(2,'冯小刚经纪人','$2a$04$6JAIqLUwRDD3ZE5Xf9jMDu98jE11GE1WiWApqEy64X0bJmAm4LYYm','fengxiaogangManager@163.com','manager',1),(3,'范冰冰经纪人','$2a$04$uvhK0Su35cEJzosKCZt14u8g5WKKwMwLJOUImRIZTX4TGbFfZTlUK','fanbingbingManager@163.com','manager',1),(4,'冯小刚','$2a$04$wg99g2L/PmWXkvWaV1BWT.ZZjKX3TLhO1UDrIGJNsAjxE5ZvKUQN2','fengxiaogang@163.com','user',2),(5,'范冰冰','$2a$04$BQz2a2IMqVbxUnJ5KbbpBeiceoUyibM81zDONmasRs07J5qlAmNgm','fanbingbing@163.com','user',3),(6,'test','$2a$04$zr/kqC0y/1VyvaTk0wbeT.iNzQ21iEaGp0bKswHwF5VgqKpTtT.DO','124@123','user',4);

/*Table structure for table `a_leavebill` */

DROP TABLE IF EXISTS `a_leavebill`;

CREATE TABLE `a_leavebill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `days` int(11) DEFAULT NULL,
  `content` varchar(128) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `leaveDate` timestamp NULL DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `a_leavebill` */

insert  into `a_leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (1,21,'在家睡觉了','最近太辛苦了，好好休息','2018-08-15 12:12:12',2,6),(2,4,'回家睡觉','顺便吃饭！！','2018-08-16 22:33:05',1,6);

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'leaveBill2.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"LeaveBill\" name=\"LeaveBillProcess\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"提交申请\" activiti:assignee=\"${inputUser}\" activiti:formKey=\"/audit\"></userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"经纪人审批\" activiti:formKey=\"/audit\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.yue.utils.ManagerTaskHandler\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <userTask id=\"usertask3\" name=\"老总审批\" activiti:formKey=\"/audit\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.yue.utils.ManagerTaskHandler\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow3\" name=\"批准\" sourceRef=\"usertask2\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'批准\'}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <sequenceFlow id=\"flow4\" name=\"批准\" sourceRef=\"usertask3\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'批准\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"驳回\" sourceRef=\"usertask2\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'驳回\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" name=\"驳回\" sourceRef=\"usertask3\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'驳回\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_LeaveBill\">\n    <bpmndi:BPMNPlane bpmnElement=\"LeaveBill\" id=\"BPMNPlane_LeaveBill\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"290.0\" y=\"60.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"255.0\" y=\"140.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"255.0\" y=\"230.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"255.0\" y=\"327.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"290.0\" y=\"420.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"307.0\" y=\"95.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"307.0\" y=\"140.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"307.0\" y=\"195.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"307.0\" y=\"230.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"307.0\" y=\"285.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"307.0\" y=\"327.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"307.0\" y=\"382.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"307.0\" y=\"420.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"360.0\" y=\"257.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"475.0\" y=\"257.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"475.0\" y=\"167.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"360.0\" y=\"167.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"255.0\" y=\"354.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"355.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"265.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"167.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"255.0\" y=\"167.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('3',1,'leaveBill2.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0\"];�\0\0-\0IDATx���}l[W���hk�W1-�A���4���E�\"\Z#�Ĵ��Q,Ml�&F���-��DF����V,PMi-큰�#��}H�vݼ>���0�Osi��&Nr~7�z�ډk\'�����~�ȍ�������O��$\0\0\0�Ѥz\0\0\0�C�\0\0!�\0\0\0�}\0\0�A�>\0\0� D\0\0`�\0\00�\0\0��\0\0B�\0\0!�\0\0\0�}\0\0�A�>\0\0� D\0\0`�\0\00�\0\0��\0\0B�\0\0!�\0\0\0�}\0\0�A�>\0\0� D\0\0`�\0\00�\0\0��\0\0B�\0\0!�\0\0\0�}\0\0�A�>\0\0� D\0\0`�\0\00�\0\0��\0\0B�\0\0!�\0\0\0�}\0\0�A�>\0\0� D\0\0`�\0\00�\0\0��\0\0B�\0\0!�\0\0\0�}\0\0�A�>\0\0� D\0\0`�\0\00�\0\0��\0\0B�\0\0!�\0\0\0�}\0\0�A�>\0\0� D\0\0`�\0\00�\0\0��\0\0B�\0\0!�\0\0\0�}��`YV2����D\"������D\"��fUo \04����x������c���\r���R�^|�G�F����.���7\0�G���Bv�#�Hn�rm۾c�������^�\0\Z#�\0jtvv�9f�W�z�k���E��X�²,�{\0\0Z\"�\0^�SK4\Zmoo�)���z*\ne2ջ\0�!�\0��s��Ĵs������t:�z�\0@3D�S�ht��y��N?��\05!�\0������\\��ݽ!���-\0�	�����@0t1��\\�v��\0m}\0�عg��~ף��\'o����^\0P%���d2�D\\�=�z��vuu��E\0���B(��+|j:���Ңz@D@�l6���,)�j��}}}�w\04@�����XLj�y|͚��v�;\n\0\Z �\0ҭX�b�ڵR���-��B!�;\n\0\Z �\0҅��j�@�L��ѣ���W��\0�� �������!�ϧzG@D@�����\'NJ�>v55q8���+���k}\0��+�~�����}\0�b�س��I�>۶�X�`��\0\r}\0麺�~��R����/���\0\r}\0�����\Z}���zzzT�(\0h��xA�;�/577����\ZD�R_���O�+W��\0���˲�~��o��88t�m�L&�z@D�#�D��e�8�\0j}\0�|��7��{^;x��������=\0m}\0�d����~�3g�ٹ��ѣ�w\0tB�<�J���c留�o�}�/��z�\0@3D�k���۶���\\v~\"�\0�4}\0���E�y��3g��z.���\'\n����	\0��Pò,;��qG��2v��&�<�n������L�7\0tE�T�d2�V�jnn���w��f�����c�f����w�2{��˿�N�Uo2\0���gYV2���b���Mײc�D\"��fUo&\04�P���z\0�1}�z��ı	\0R�^�zD�\0Ih�@=\"�\0�$�W�}\0@�+P��>\0 	��GD\0���\n�#�\0HB{��\0$�����\0��^�zD�\0Ih�@=\"�\0�$�W�}\0@�+P��>\0 	��GD\0���\n�#�\0HB{��\0$�����\0��^�zD�\0Ih�@=\"�\0�$�W�}\0@�+P��>\0 	��GD\0���\n�#�\0HB{��\0$�����\0��^�zD�\0Ih�@=\"�\0�$�W�}\0@�+P��>\0 	��GD\0���\n�#�\0HB{��\0$�����\0��^�zD�\0Ih�@=\"�\0�$�W�^$	;��|�`0h_hii�Ν;7�J��4\0hD�^lܸ����ŋ�ɤ�M��A��eYs��)�=���oii�f��7\r\0\Z��#�W��5k�}V�\\��ޮz�\0��}��2o޼B�Y�l���,K�@C!�\0�e�֭�g϶�O8�]>\0�:�Pw�,YR�>�7\0\Z��;�LƎ>|�\0d �\0���4\0Ih���,�J$�h4\n����o�1����#�D��8��`�>�zzz�)��=�ׯ߼eˑ�GGr93��w����^�|����H��\0�k�>��f��X�������#���Μ=c ���d2�\n\0\\@�����]��Hn���^x���i��\03E��b�X>�\\�*��-�-������\"��h===mmKs�UM��?^��1Ճ\03B�,����\'N�s���jjp�����|�\0�}`�x<��r���Z�f��.��Q�f�/���\0�F�\"�H����{���+��c�pN�>,�\r�݃�]^y�䅝#⿖�i�m�Ħ+���<��A�)DI������\0���s����F�\n���4(�и�0*Ώ�KB��g�6��хK#\'s���8~E�-qdT<�����!kp���S=t\00}D�����칓���B�i�Ҙ��jt|���/���_�����GŅ�8�Y!6�ڟ�>�fVd��ha0W>�\\t���Ш8wY��}�@6��ݓO?��\'����6�ܸ�G�{���֨\"�\0�\Z-��Ǘ�95}�ęK�A�bdx8p�MM765���������[r[���@k�0�+_.8Ux���eq�8}E�>�ּy�n����n�5z�5�gמ���\ZUD\0Z���\\���u����qqޚ8�s�ز+���;o��\'oi���y�������\r���*��QE��5Z�eOᣣ�;U����s!\'��.�vH�~��_���a�%N[�ܰ��϶��JnkT}\0h�s�ė��E��8��@�o ��?�}����k��8������ܾ�;}�~�?��wٽ�#�\0��s����z���*���sO�\r�*�\0���`�|�9G�ZD\0Z���\\�g�,Uk}\0h�s����\"�\0�\Z-��G��T�E��5Z̕�>�Q����hahp�D\"�NOzU>�d�Zk��S���A�A#;t�P���7�|swwwɵDW�O6����\n��>�)��:G�A#�,�n(�ʳg����X<1�ϻT�U}֮]���\n��}���%��(i\0�\Z�\rΞ�����n�����H$��gl�Uk�O*����?_��.\\�����p\0��O#�\'���ގ���U�Tͷcl�$Ukُ��S=tڰF���Ҟ��l6��g\0F#���N<�H����j�U���q�-�8�P$�~�R�����	��jʟ���c_���>���:��7�Uxݱ(����p8���l?	�ɤ�ME��U&�)�?�Z����¬�����?��sm>��QΚKN\0T^��^���v��.�ǰ����n��g>S��9s�^LDe����I���x��%{��gq�{�ސz���o�|>���~�����䅆|JxGF9k.���_VVa�S]U�z�ڻ���:�������900�� k�~���8��\0�G?�d2\n�v�*�W<��@�$yT�\"��IWU}���x��>�#l?Μ����Ѩ�Щ�� D�����Dr�+�)�m嬹�.J���+,Pa=�/\'KH��N��5;�������S�!�)ha�Y�p!-�-�`<-�>HW/|�E�p~V�͔g}�������S�w�z�\Z��_�@ �ۤ\0o��t�L&#���h��p����H*-Pr��r�k\'�<EBr�\n��z�\ZЪU����To`Z�N��pOO��h�p�UX��s�8R�p�����zY�>���J����\0�@�F&�iiiQ�\r%���(gͅ��_�*����%�Z�T]c��l��0m�j�������r�\\�PG*-\\�\n\'�}����9��S=t��׼\0o�´A[t]>�Q�5;?��#�\n����\Z��E1Kʮ�H��5&�{x���P(�w�KF>�4|��r�tR!�T�>׽L��o��A��p�=����j-��$�t�����\n���´a�D�(�����M��\"���cx��L���|�����\'E�ZL�����0�=�u���Uk�T����\0��6艮��|�/����x*��cx��L�D����c�^?H�T<��<�a�\rz�����?z֎�ר����|\0[s�fڠ\'�������~�aB��s��X,�z�\Z�9�3m�]�N���/[����ʊD�$�I�Cװ8�p�i��(CǄ�b?UM�-��h4�z�\Z�9�3m�e�,+����B�*W&�%�=�ݦz�\Z�9�3m�%I�R���TR�j��s��{{�Q=\\\r���\0��6������駳�B��+�|\"����I�@5>s�fڠ\'JeYV{{,�3�E&�I�~*��w\"�h�-	ٗU�8�p�i������X�[--oBSSs����R;���4q��q�i��h�;�L�8̴AO4\n�m&��\0��6�Fa��ĸ�0�=�(��w�fڠ\'\Z��6�x��L�D�0�fb�p�i��h��L�;�3m���p��q<�a�\rz�Qn31�8̴AO4\n�m&��\0��6�Fa��ĸ�0�=�(��w�fڠ\'\Z��6�x��L�D�0�fb�p�i��h��L�;�3m���p��q<�a�\rz�Qn31�8̴AO4\n�m&��\0��6�Fa��Tyܛ��,\\r�y��@�,�0�f�rܝ��3P���G#�,�0�f��Oz���Ԅ�@�,�0�f�5��_(^��u.�W� �h��e��L5E��N�Tx\'�+@}4B�2\n�m�j�ϤoX���O��<�\0A��=�(�����^���\\��6�YFa��T͸��\n�|q��\n��6�Y\r/�Hأ������}�����9w��T*�z���ʇ���o�o�\'���8�A�jx7nl*�x��d2�z�����U~֧׷���6�Y\rϲ�9s��R���oii�f��7\r��m΢�%�j^բ�\0��z�	V�^=k�,gz[�re{{�ꍂw8�p�i��h�y��rϲe��~�eY����0<�a�\rz�!�n�:{�l{���0��1\r�9�3m�ͱdɒB�Q�!�\Z�9�3m�͑�d���3��0<�a�\rz�Qn31�8̴AO�eY�D\"\Z��B!��_��Q\Z����#�D��8��R�9 ��6色����S��{֯_�y˖#G���rf����#��ݽ|�r�1����1�9�3m���f��X�������#���Μ=c ���d2���q��0�=Q;���g�=3����^|a���tZ�p58s�fڠ\'J����\nU�6oٴh�WUW��0<�a�\rz�===mmKs�UM��?^��1Ճ��8�p�i���:˲�~������e��\Zz��u>_8$�9�3m�]��c�Xn��S��߬���ŷ2�֬�%QUs�fڠ\'�.�to����giۻB�=&����b߰�=8ڵᕗO^�9\"�k����vIl�\"~���+T�B�Ԟ��`0�z�\Z�9�3m�]ܛ*��\n14..���#�?�٣M7|t���ɜ8>,�_iKϽ�/�g��\Z:���T]��0<�a�\rz�뚛�Ϟ;�,��_\Z�cW��O�|��~�_����⨸��s\"+Ħ]���g���(�-�3m�]��/���94*�]#c,��f��ӏ����&��/7.F�hǞ}%�5�x*��cx��L�D��������>c��%�ޠ�	12<�㎦���|�|wy�\rw��-��Q�SQ[�fڠ\'�._.8Ux���eq�8}E�>�ּy�n����n�5z�5�gמ���\ZU<��<�a�\rz����%������5q����eW�˭w���O��������!�ť�n��Ur[����$�L���E�V\0���\r�������Na;�\\ȉ�Gĩ��ҭ_�k�׿qzX�g�Ӗ87,��m箒�\ZU<%I��~�_�V\0���\r�וė��E��8��@�o ��?�}����k��8������ܾ�;}�~�?��wٽ�#ѧ�����a�[4>Z�6�o\\��>�롇�櫜�s�=%74�x*Jґ�z+��G������Uk�T�$�����\n���´�|㺉�3v���x*ʐ�d�~�eY�7h|�0m0߸.}�P�OE���V�Z�z+\0#�´�|�|�9M�Z<]gY����d2�70-L�7��G���Z����b�X<W��)ha�`�q]>�d�Z�������V�X�z+\0��´�|�:��G-˲b���-L�7��G�w�Z����e�ٮ�.����\\��ha�`�q�������j-����������D�гj�*��(A������$Ukُ[(��k�Q�~���ۓ�d6�U����l��&��ۚ&��	���@k�0m0߸.}�ϼ\n�)�/~�2�ް��W��sU���W�����´�|�| xg�U��\n��,!]���p���W��dU\0L-L�7�s%T�3��j�\r�>�\\[���>\0P�����M�W�p��\n�m|}���gR�\Z�/\\MS.S~U���r�I����V�ת�\0����*�g��Ty%�gQ`<=��0�\\�g�US-s͹�)V[���Mzs�\n�5��V=t\00}�0m\\w�)�:��r�>��i��̫���9�)��w:��*��d�Ag�\rpeU\0L-L�F�����r��\'ޚaV����L̇_[�\n˯����$wQ~��2����´QS���dϤg��\\����3���q�/+,s݅���µS�d�;��^�:\0�>Z�6��>%\'r�oH�)�G\\����˕�����x�g��.8���>U\04Z�6��o��x�K��׵�Q��L�(y\\�˩�,�����7����\\Ur�3�_g���\0����j��4S~�g�_}ܪ)N�|�?�Zr�e�3S5ѧ$��d �\0��F*�7���)�I��8�ٻ<>~���|�\0h$�0mT?�T>�S���\\����M��2����´q����ծ��_w%�g�蓢j-�*\0\Z	-L�7��G�7�Z��\"\0��´�|�:��w�����ש���\"\0��´�|�:�����������\"\0��´�|�p8������5��z#�| P=t\00}̦� ��������~�aB��s��X,�z�\0`��M�A�q]:�n�l��*+Y�L&U\0L��6�>2tLX1.�S�����Fê\r\0f��TD,�\n��������ʕ�l	n�f��4\0�fSm}$I�R���TR�j��s��{{�Q=\\\00Ș� �����g������*�d�@����\'�\0.`6��G*˲��c�Н��/2�MB�S���_E�m�HȾ�z�\0�̦� �x���7�VK��+��WC47��.�ӏ�a\071�j���c�;\0$a6���(7\0HB{�s�Qn\0����\r�B�0�\0 	�U̅Fa�@ګ6���p�$�Wm0\Z��\0Ih��`.4\n�\r\0��^��\\h�\0$��j���(7\0HB{�s�Qn\0����\r�B�0�\0 	�U̅Fa�@ګ6���p�$�Wm0\Z��\0Ih��`.4\n�\r\0��^��\\h�\0$��j���(7\0HB{�s�Qn\0����\r�B�0�\0 	�U̅Fa�@ګ6���p�$�Wm0\Z���v�)�0��<�\0�>�\r&-��<��d�\0����e����TDL}֧x�rҶ\0�\Z�O�UF��Y���\0�����e�Z�O�ٝ�&=���	��h�`�2J���/xMu\0�E���Q�|�O��%�|�>\0P�>�\r&-������W�x�\0�G#�UF�F����g}\0�A���Q��6gA�����`�2ʴ��3�Y��\0ڟ6��\Z^\"��G����A�BKK��s�ܹ�TJ��@�`6�ѧ�mܸ�����ŋ�ɤ�M���l�\r�Oó,kΜ9Źg���---�lV��@�`6����W��5k�}V�\\��ޮz�\0��0�j��c�y��rϲe��~�eY��\0\Z\n��6�>�غu��ٳ���ü�\0\\�l�\r��9�,YR�>�7\0\Z��6�>��d2�p�v\0���TD�0�\0 	�U̅�,+�HD��P(���\'�d��n?�H$���z\0\r��TMD�zzz�)��=�ׯ߼eˑ�GGr93��w����^�|����H��\0�k�M�A��\'���b�����\'���F��:s����\'�ɨ(\0p��6�>�ع\'>��05U���,H�Ӫ�\0f��TDIb�X>�\\�*��-�-������b6��G��������Q���~���Y��A�a6���u�e���\'ӹ��T558�~k�|�p�֘M�A�q]<��b��KN-�ʏ�ʨZ���EU\0Zc6���u�H�{��?�=K����1q8\'^�����Ѯ\r��|����_K�ĶKb���mX��������A�C\0��l�\r�������{s�C���A!��ŅQq~D\\�G?{�醏.\\\Z9�Ǉ��+\"m�#��W��O�X�C�|>����c6���u���gϝ̍�~�/��᱉�F�\'~>��??��/���ߎ\nqqT\\ȉ�9�bӮ���3hf�T�5Z�6�o\\��/���94*�]#c,��f��ӏ����&��/7.F�hǞ}%�5�x*�\Z-L�7��Ǘ�95}�ęK�A�bdx8p�MM765���������[r[���\"\0��´���,�R�\r%_.8Ux���eq�8}E�>�ּy�n����n�5z�5�gמ���\ZUD\0Z��i����gܕ�/Y��^等�>g��-�R_n���O|��=���18,.\rO�p[߮��\ZUD\0Z��i#�ފ�bOᣣ�;U����s!\'��.�vH�~��_���a�%N[�ܰ��϶��JnkT}\0h���P(��۫z+\ZJI|	-^���û��R��S��ڱ��v���c[������{���w���w���{�ݫ<�}\0`\Zhaڈ�b�x\\�V4�|�9_\\=�`5_���{�)��QE��5Z�6\nuA�V4�|�9G�ZD\0Z��i#�J�[�P&���Y��\"�\0�\Z-L\'���]��s����>\0�F�IWWתU�ToE��G��T�E��5Z�N,�����LF��4�|�y����>\0�F�Looo(R�\r\"}2T�E��5Z�~:::x��D�\0�´�����٬�\r�[>��K�ZD\0Z��骧����wtt�֟i���ST�E��5Z�Ʋ٬}�\0�����E�K��x�KB.�G��T�E��5Z��,����)�j�C����X̭��V\Z�G�T�E��5Z̕�>ǥV�(���%�������R=t\00}�0�+ޑZ�w1��~Y~�u�ƕ������R=t\00}�0�KRD�nX�f������[}\0�\Z�0�+ޖZ�����e��_UrA��}\0h�sM���u�������լjқ8W�/��>�:\0�>Z̕�ǤV���:�Lr۩.;�)����\"�\0�\Z-��G��䕳����O��Y���d���飅�\\��pTR]�T�\\��Y|���S]���R���~�C\0�G���ሌ*��d���,Y��B���g}&Y���I��ݽS=t\00}�0�+�[W���K�*�<��nU�M-���5��;�T\0L-���ȵgk&	+�T}��Z�\0����\\�>>~����>\0�F�����M��\"�\0�\Z-��G�Uk}\0h�s��T�E��5Z����._�;>�:US}\0h�s���c�^?H�TD\0Z���\\�p�=k��kT��F��@ �z�\0`��>0Wggg{���Ä^����XL����}`�t:�~��=.PUV$�$�L�:\0�>���1aŸ�OUSK�:\Z\r�4\0���fYV(tW_�_��GU�LfK p{6�M����}`�T*ޑJ%���*;�������\03E�D__��~:; �^����\'o�T\0���L�,��=\n���\"��$D?���;��U4����˪�\0�A�>����}����Mhjjn�9\Z]j���\0n\"�\0����\0I�>@=j�E\0��W�}\0@�+P��>\0 	��GD\0���\n�#�\0HB{��\0$�����\0��^�zD�\0Ih�@=\"�\0�$�W�}\0@�+P��>\0 	��GD\0���\n�#�\0HB{��\0$�����\0��^�zD�\0Ih�@=\"�\0�$�W�}\0@�+P��>\0 	��G�Dg��S-L�\0� P�f}J��\0\n�@=��Q������/PNڶ@]���h&g}�{�\0LF�Q�ѧ��N����!0��GUF���5�\00}�GU�קd�S>D\0(G�+n/yE��\0@}��4��S��/��\0��>ԋD\"aG���---�Ϲs�R�I���m΂�\0��z�q���/^�L&K���^�I_��/\0p���zaY֜9s������[ZZ�٬�M��A����իg͚�D��+W�����(\0h(D��̛7��{�-[���-�R�E\0�P�>@}ٺu��ٳ������\0�!�Pw�,YR�>�7\0\Z��;�LƎ>S}�\00D���s\0���\n�˲��dGGG$	]������L&�z�A}\0���cǝI�u�X0\\�v-��\"�\0����.\\�𺡧����c_\00D@˲b�X�y������6oyũGy����d�H$�W<��}\0�e2���=?��#G���F��3g��ᩧ\n��9�300�zW\0@?D�S�t�N-N�	�ÕCOI\0z�G���|���>�;\0�!�\0ޱ,��|��k�Tz�k����C�s�@M�>�w�Ѩ�{��7L#�j�������zB����\0�}\0�$����)�^|�Y[WW��\0m}\0��A��=3�=�r��������\0@��>�������\'N�}.9��Z�j��]\0=}\0/�B!�s��B=�n]a���ͪw\0�@���f���r�:���m�}�Q���^�;\n\0\Z �\0���q��X���x�������U�(\0h��H�b�\n�>�U^���RX�U�(\0h��H���_r=�9z��zC�;\n\0\Z �\0�9k߽����c��F\"�;\n\0\Z�W�9A���u�T��U�(\0h�^	H\n�䵃eD�Oz��Q\0�\0����R��[^q=��9{�����}\0�b�X!��ᩧ\\�>�<XXy0T��\0�� ]ggg!�,_�=ף��k�V�FU�(\0h��H�J��פ.�}-ZTXy<W��\0������?7�ݽ����|��-�ͪ�K\0�\0��B{{{!�����x���w�]Xm$Q��\0����l6�|��[�b���)���ջ\0z �\0���*���7�O�9z��R+V�P�s\0�\r�����Zf����Z[[�Ue2�{\0� �\0�I�����Nd�ޟ�:~⤓{|>_oo���\0�}\0O�I�y��\\j���m�w8�sٺ��T�\0h��x-�L:�~\n��z�ŗ�9�s�eME�=\00\rD@�T*��MS\'\0=�ȣ���N<xꩶ�������\\\00=D@�l6�������,��h4���`ڈ>�Jv�q���u�B���>՛\0z#�\0�Y��H$�K���D\"k׮�L\0���\0\0B�\0\0!�\0\0\0�}\0\0�A�>\0\0� ��rO�ٱ�.\0\0\0\0IEND�B`�',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','47501',20),('schema.history','create(5.22.0.0)',1),('schema.version','5.22.0.0',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('11','LeaveBill:1:4','5','5','usertask1','12',NULL,'提交申请','userTask','test','2018-08-16 15:28:34.065','2018-08-16 21:44:58.893',22584828,''),('35002','LeaveBill:1:4','5','5','usertask2','35003',NULL,'经纪人审批','userTask','冯小刚','2018-08-16 21:44:58.894','2018-08-16 23:38:25.241',6806347,''),('37502','LeaveBill:1:4','37501','37501','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-08-16 22:33:08.169','2018-08-16 22:33:08.180',11,''),('37507','LeaveBill:1:4','37501','37501','usertask1','37508',NULL,'提交申请','userTask','test','2018-08-16 22:33:08.181','2018-08-16 22:48:51.501',943320,''),('40002','LeaveBill:1:4','37501','37501','usertask2','40003',NULL,'经纪人审批','userTask','冯小刚','2018-08-16 22:48:51.502','2018-08-16 23:38:38.358',2986856,''),('42504','LeaveBill:1:4','5','5','usertask3','42505',NULL,'老总审批','userTask','冯小刚经纪人','2018-08-16 23:38:25.242','2018-08-16 23:43:19.216',293974,''),('42510','LeaveBill:1:4','37501','37501','usertask1','42511',NULL,'提交申请','userTask','test','2018-08-16 23:38:38.358','2018-08-16 23:41:07.019',148661,''),('45002','LeaveBill:1:4','37501','37501','usertask2','45003',NULL,'经纪人审批','userTask','冯小刚','2018-08-16 23:41:07.020',NULL,NULL,''),('45006','LeaveBill:1:4','5','5','endevent1',NULL,NULL,'End','endEvent',NULL,'2018-08-16 23:43:19.217','2018-08-16 23:43:19.217',0,''),('6','LeaveBill:1:4','5','5','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-08-16 15:28:34.051','2018-08-16 15:28:34.063',12,'');

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('20001','comment','2018-08-16 21:18:15.888','test','12','5','AddComment','同意请假','同意请假'),('22501','comment','2018-08-16 21:26:26.417','test','12','5','AddComment','同意请假！！','同意请假！！'),('25001','comment','2018-08-16 21:32:13.706','test','12','5','AddComment','回来带好吃的','回来带好吃的'),('27501','comment','2018-08-16 21:36:21.756','test','12','5','AddComment','1111','1111'),('30001','comment','2018-08-16 21:39:28.235','test','12','5','AddComment','1222','1222'),('32501','comment','2018-08-16 21:43:03.471','test','12','5','AddComment','123','123'),('35001','comment','2018-08-16 21:44:58.776','test','12','5','AddComment','1452','1452'),('37510','comment','2018-08-16 22:33:25.031','test','37508','37501','AddComment','回来带吃的','回来带吃的'),('40001','comment','2018-08-16 22:48:51.388','test','37508','37501','AddComment','21231','21231'),('42501','comment','2018-08-16 23:38:25.067','冯小刚','35003','5','AddComment','123','123'),('42507','comment','2018-08-16 23:38:38.244','冯小刚','40003','37501','AddComment','2','2'),('45001','comment','2018-08-16 23:41:06.888','test','42511','37501','AddComment','回来带好吃的给你','回来带好吃的给你'),('45004','comment','2018-08-16 23:43:19.121','冯小刚经纪人','42505','5','AddComment','同意！！','同意！！');

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

insert  into `act_hi_detail`(`ID_`,`TYPE_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`ACT_INST_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`TIME_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('10','VariableUpdate','5','5',NULL,'6','inputUser','string',0,'2018-08-16 15:28:34.052',NULL,NULL,NULL,'test',NULL),('37504','VariableUpdate','37501','37501',NULL,'37502','objId','string',0,'2018-08-16 22:33:08.170',NULL,NULL,NULL,'LeaveBill.2',NULL),('37506','VariableUpdate','37501','37501',NULL,'37502','inputUser','string',0,'2018-08-16 22:33:08.171',NULL,NULL,NULL,'test',NULL),('42503','VariableUpdate','5','5',NULL,'35002','outcome','string',0,'2018-08-16 23:38:25.215',NULL,NULL,NULL,'批准',NULL),('42509','VariableUpdate','37501','37501',NULL,'40002','outcome','string',0,'2018-08-16 23:38:38.354',NULL,NULL,NULL,'驳回',NULL),('45005','VariableUpdate','5','5',NULL,'42504','outcome','string',1,'2018-08-16 23:43:19.203',NULL,NULL,NULL,'批准',NULL),('8','VariableUpdate','5','5',NULL,'6','objId','string',0,'2018-08-16 15:28:34.051',NULL,NULL,NULL,'LeaveBill.1',NULL);

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('13',NULL,'participant','test',NULL,'5'),('35004',NULL,'participant','冯小刚',NULL,'5'),('37509',NULL,'participant','test',NULL,'37501'),('40004',NULL,'participant','冯小刚',NULL,'37501'),('42506',NULL,'participant','冯小刚经纪人',NULL,'5');

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('37501','37501','LeaveBill.2','LeaveBill:1:4','2018-08-16 22:33:08.168',NULL,NULL,NULL,'startevent1',NULL,NULL,NULL,'',NULL),('5','5','LeaveBill.1','LeaveBill:1:4','2018-08-16 15:28:34.051','2018-08-16 23:43:19.218',29685167,NULL,'startevent1','endevent1',NULL,NULL,'',NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('12','LeaveBill:1:4','usertask1','5','5','提交申请',NULL,NULL,NULL,'test','2018-08-16 15:28:34.067',NULL,'2018-08-16 21:44:58.880',22584813,'completed',50,NULL,'/audit',NULL,''),('35003','LeaveBill:1:4','usertask2','5','5','经纪人审批',NULL,NULL,NULL,'冯小刚','2018-08-16 21:44:58.894',NULL,'2018-08-16 23:38:25.224',6806330,'completed',50,NULL,'/audit',NULL,''),('37508','LeaveBill:1:4','usertask1','37501','37501','提交申请',NULL,NULL,NULL,'test','2018-08-16 22:33:08.183',NULL,'2018-08-16 22:48:51.492',943309,'completed',50,NULL,'/audit',NULL,''),('40003','LeaveBill:1:4','usertask2','37501','37501','经纪人审批',NULL,NULL,NULL,'冯小刚','2018-08-16 22:48:51.502',NULL,'2018-08-16 23:38:38.357',2986855,'completed',50,NULL,'/audit',NULL,''),('42505','LeaveBill:1:4','usertask3','5','5','老总审批',NULL,NULL,NULL,'冯小刚经纪人','2018-08-16 23:38:25.242',NULL,'2018-08-16 23:43:19.208',293966,'completed',50,NULL,'/audit',NULL,''),('42511','LeaveBill:1:4','usertask1','37501','37501','提交申请',NULL,NULL,NULL,'test','2018-08-16 23:38:38.358',NULL,'2018-08-16 23:41:06.993',148635,'completed',50,NULL,'/audit',NULL,''),('45003','LeaveBill:1:4','usertask2','37501','37501','经纪人审批',NULL,NULL,NULL,'冯小刚','2018-08-16 23:41:07.020',NULL,NULL,NULL,NULL,50,NULL,'/audit',NULL,'');

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('37503','37501','37501',NULL,'objId','string',0,NULL,NULL,NULL,'LeaveBill.2',NULL,'2018-08-16 22:33:08.170','2018-08-16 22:33:08.170'),('37505','37501','37501',NULL,'inputUser','string',0,NULL,NULL,NULL,'test',NULL,'2018-08-16 22:33:08.171','2018-08-16 22:33:08.171'),('42502','5','5',NULL,'outcome','string',1,NULL,NULL,NULL,'批准',NULL,'2018-08-16 23:38:25.215','2018-08-16 23:43:19.219'),('42508','37501','37501',NULL,'outcome','string',0,NULL,NULL,NULL,'驳回',NULL,'2018-08-16 23:38:38.354','2018-08-16 23:38:38.354'),('7','5','5',NULL,'objId','string',1,NULL,NULL,NULL,'LeaveBill.1',NULL,'2018-08-16 15:28:34.051','2018-08-16 23:43:19.219'),('9','5','5',NULL,'inputUser','string',1,NULL,NULL,NULL,'test',NULL,'2018-08-16 15:28:34.052','2018-08-16 23:43:19.219');

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('1','请假流程',NULL,'','2018-08-16 15:27:55.795');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('LeaveBill:1:4',2,'leaveBill2.zip','LeaveBillProcess','LeaveBill',1,'1','leaveBill2.bpmn','leaveBill2.png',NULL,0,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`LOCK_TIME_`) values ('37501',4,'37501','LeaveBill.2',NULL,'LeaveBill:1:4',NULL,'usertask2',1,0,1,0,1,2,'',NULL,NULL);

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('37509',1,NULL,'participant','test',NULL,'37501',NULL),('40004',1,NULL,'participant','冯小刚',NULL,'37501',NULL);

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`) values ('45003',1,'37501','37501','LeaveBill:1:4','经纪人审批',NULL,NULL,'usertask2',NULL,'冯小刚',NULL,50,'2018-08-16 23:41:07.020',NULL,NULL,1,'','/audit');

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('37503',1,'string','objId','37501','37501',NULL,NULL,NULL,NULL,'LeaveBill.2',NULL),('37505',1,'string','inputUser','37501','37501',NULL,NULL,NULL,NULL,'test',NULL),('42508',1,'string','outcome','37501','37501',NULL,NULL,NULL,NULL,'驳回',NULL);

/*Table structure for table `persistent_logins` */

DROP TABLE IF EXISTS `persistent_logins`;

CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `persistent_logins` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (1,0,'业务管理',NULL,NULL,0,NULL,NULL,NULL,NULL),(2,0,'流程管理',NULL,NULL,0,NULL,NULL,NULL,NULL),(3,1,'请假管理','/home',NULL,1,NULL,NULL,NULL,NULL),(4,2,'任务管理','/task',NULL,1,NULL,NULL,NULL,NULL),(5,2,'部署管理','/deployHome',NULL,1,NULL,NULL,NULL,NULL);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values (1,6,1),(2,5,1),(3,4,1),(4,3,1),(5,2,1),(6,1,1);

/*Table structure for table `sysrole` */

DROP TABLE IF EXISTS `sysrole`;

CREATE TABLE `sysrole` (
  `id` int(11) NOT NULL,
  `name` varchar(64) CHARACTER SET utf32 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sysrole` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
