Return-Path: <SRS0=eT1m=FE=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EADC63777
	for <linux-i3c@archiver.kernel.org>; Mon, 30 Nov 2020 06:18:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7278A20757
	for <linux-i3c@archiver.kernel.org>; Mon, 30 Nov 2020 06:18:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UtQv2UU9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="oUQMNyXg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="7UF674cL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7278A20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=//bEt4t+EfGz/ilS31h18cIZx30JvTUAkTALsAyZL80=; b=UtQv2UU9Oss0/LRdLQDasz8jU
	od8Pq9s5DAjSOEEHh8CQDA3d2K8QampcckpQEYEF/QBph8f5x74/EGUDuQ4lT9HMPbkw8vSlQ5Y0F
	40mUHh9b2VryExMXOC+OlIV8CFFQBIfRf6h0LQrDP0hqPFf2L6Cq/8iT4a+qcvUgQTr+k9dVf+INI
	4nWNm/iFqo4nrftfjEXcqww9WrgYsGlDjO9Lr/nPVqJXg+0FSTeiMeDsePWalQiLirtih+a6Le7Lf
	lGrz44pyYxYD3EzXuoujrjtccwE7wRJXFAf40FHpJHHVdtjjXoxKzGFTfZM7BT/DaM+Y7fW5r6U4G
	FKjyD0pnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjcVf-0008Tk-9n; Mon, 30 Nov 2020 06:18:03 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjcVd-0008TO-9K
 for linux-i3c@lists.infradead.org; Mon, 30 Nov 2020 06:18:02 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AU6AVZA015661; Sun, 29 Nov 2020 22:17:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=GK0qaWwFk/t+ObKCHu0hqiNOA3gYkwxzkNbeuZ+me8w=;
 b=oUQMNyXgm7/NZLMs5XbTWEf5OkIOm4EuXo5Hu1bh4sOkR769So3JqEcpK5vyopHUdy8F
 IPD+ceHESnsmYQ1HYUpewrGTBixhDGsLmzrVtcLMSPx+kqM0yc43ltQEqYFmMNw2hmek
 bRu+uHUai88xRth+zbCvm07bIrYbtAU38jfEW/seYT+8koAHOxCsKi1FxV1iYlStWirS
 IQP7mHddIkzmtZeD7RAe+2BkVKDUXhs/gBbXPaJGUakupvPnBi36qpk3XSLCPSNlfZjv
 63lenfwrvSr/jQLkB4z5uqJ3Qbhwjg4V39HxBeINL7eF6CtOMlgZ0355cpXN5fOK0j28 Aw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by mx0b-0014ca01.pphosted.com with ESMTP id 353k12m4tf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Nov 2020 22:17:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIQHHbj/ZKb1WwXnAHELj/pQEVqzj6acfo4H8dYvBp8k5xssMim+ZH/M58BT9zIwatvSAI53trohiTzY3CVx7rDuxPdn8lretRuU/iA2bNAXdUGUVZNC+qzWz4YQeu+qZoOVawq7Op6hmlowup8y2reSJNWd/HjAZq4bf89/q4OT6ThYfU9kKuohhfhVfQPQrZCJK3bfIZjxkQq+VYIGSQbCHao2gGSvhvnK21dyfO5urtYVxsfu2FIrPfsAWb0GIa6HF4dHfv33PL9XlaiHwJrEsHJnN3tpj7vnBrn/ObsyZ2u4+Jm1Uws4Melih9T+ZU4QnkbJrO5vSzVMqG2jlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GK0qaWwFk/t+ObKCHu0hqiNOA3gYkwxzkNbeuZ+me8w=;
 b=ZU0FhohWzWhTsgGU3z/KHsT4xPQliC8m3wkFh1MnJGMlRv2zI9dL3PvAu7X8TZPF7QXPCriL0lcoqiGP7r5xeqHO4lKfoNIQxx9n2TM+hG9JmlH+3V4BEXihw4zLZxkiU8vKN/roQaDUrqKkZn351p9n/KwrJNKGY7C9/6EaCVG3S2CqYPjzr8sW4MqenfDzarGhXVKheXU1mN2yDWVxaOfTl+NZcwH3SGDIHTHtPd2FZMiF+8mgp+PI1FfYjXOYSR7VzUPyu6fe9WH9CGeDSLXv60zQrWO9ctMjW1uoigyI6FFpktMU5dPBVXjy9bmELABmBvPb1h5qWhMlPKdLUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.148) smtp.rcpttodomain=synopsys.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GK0qaWwFk/t+ObKCHu0hqiNOA3gYkwxzkNbeuZ+me8w=;
 b=7UF674cLSXoG5vYMVYs6ncMcbDZRpYrUsFNrVbaV4DnlGcHrFQZ8RQa5DmhyuX4sX5cXmbGjSg8DG2avQkatIlQsKRKfgIpwY5R4tBZdxurCWHaGi0kKtdKPptgXj3G36Bq6qELaOpHXifzIl/ci5QazgRiCoN7QDz2lJyw1Zn0=
Received: from BN6PR11CA0034.namprd11.prod.outlook.com (2603:10b6:404:4b::20)
 by BN8PR07MB6212.namprd07.prod.outlook.com (2603:10b6:408:b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Mon, 30 Nov
 2020 06:17:53 +0000
Received: from BN8NAM12FT063.eop-nam12.prod.protection.outlook.com
 (2603:10b6:404:4b:cafe::44) by BN6PR11CA0034.outlook.office365.com
 (2603:10b6:404:4b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Mon, 30 Nov 2020 06:17:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.148)
 smtp.mailfrom=cadence.com; synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.148 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.148; helo=sjmaillnx2.cadence.com;
Received: from sjmaillnx2.cadence.com (158.140.1.148) by
 BN8NAM12FT063.mail.protection.outlook.com (10.13.182.194) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.11 via Frontend Transport; Mon, 30 Nov 2020 06:17:52 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 0AU6HnNh006489
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sun, 29 Nov 2020 22:17:50 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 30 Nov 2020 07:17:48 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 30 Nov 2020 07:17:48 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0AU6HmMd003822;
 Mon, 30 Nov 2020 07:17:48 +0100
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0AU6HmrW003821;
 Mon, 30 Nov 2020 07:17:48 +0100
From: Parshuram Thombare <pthombar@cadence.com>
To: <alexandre.belloni@bootlin.com>, <slongerbeam@gmail.com>,
 <vitor.soares@synopsys.com>
Subject: [PATCH v10 2/7] i3c: master: use i3c_master_register only for main
 master
Date: Mon, 30 Nov 2020 07:17:46 +0100
Message-ID: <1606717066-3785-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1606716983-3645-1-git-send-email-pthombar@cadence.com>
References: <1606716983-3645-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3928b815-095d-437f-f200-08d894f7abae
X-MS-TrafficTypeDiagnostic: BN8PR07MB6212:
X-Microsoft-Antispam-PRVS: <BN8PR07MB6212FEC7078BC046824880C2C1F50@BN8PR07MB6212.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bV0wmc2vYs2h+y6hVnX3RdoF3eACUTwQOjGKzbedn2EUbmK1f44uwcWQ3c6pw1Is/4MNX4CWV+JgAlavrQTX1U+9/hxhBLSO0i0mjhBNNxv12MoIEjFhrY4Vm8KjB0dNlX2b1errx/lJq0tFuRe4IVuNJNcRTB7y4DdDHRrVLf/CUT3qZzY1EHoJP07R0RWhJawvdBkPu1+NtENrnkC7cNGzZmc58Dn1r08V3WpP9TDOkc2sP5ffTQnuECDPzjCarL2vN5LDnm68XqBD0SIxlgmp9t58q3fZbiJYKcHnastlx97H6oFz70vResoV3mrUXNl6PaEtIKSs0lSebsq9u+DGqoi19BfDgVxx3Jv2BZtVVW6yW9Sv33d4Mv3AIoa+gcIfT2DY6MqdrCrZi+YxbQcpWVMagfvvaRXtLO0el/g=
X-Forefront-Antispam-Report: CIP:158.140.1.148; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx2.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(36092001)(46966005)(478600001)(186003)(70586007)(70206006)(8936002)(36756003)(336012)(82310400003)(2616005)(8676002)(426003)(54906003)(107886003)(5660300002)(110136005)(26005)(42186006)(83380400001)(36906005)(4326008)(316002)(82740400003)(47076004)(86362001)(7636003)(2906002)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 06:17:52.9768 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3928b815-095d-437f-f200-08d894f7abae
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.148];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT063.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB6212
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-30_01:2020-11-26,
 2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=2 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011300041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_011801_461145_0135B3CC 
X-CRM114-Status: GOOD (  22.91  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: praneeth@ti.com, mparab@cadence.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, Parshuram Thombare <pthombar@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Removed last argument 'secondary' and restructured i3c_master_register
to move code that can be common to i3c_secondary_master_register
to separate function i3c_master_init.

Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
---
 drivers/i3c/master.c                   |   78 +++++++++++++++++++-------------
 drivers/i3c/master/dw-i3c-master.c     |    4 +-
 drivers/i3c/master/i3c-master-cdns.c   |    4 +-
 drivers/i3c/master/mipi-i3c-hci/core.c |    4 +-
 include/linux/i3c/master.h             |    7 +--
 5 files changed, 56 insertions(+), 41 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index b61bf53..56e8fe4 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1637,7 +1637,7 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
 }
 
 /**
- * i3c_master_bus_init() - initialize an I3C bus
+ * i3c_primary_master_bus_init() - initialize an I3C bus
  * @master: main master initializing the bus
  *
  * This function is following all initialisation steps described in the I3C
@@ -1668,7 +1668,7 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
  *
  * Return: a 0 in case of success, an negative error code otherwise.
  */
-static int i3c_master_bus_init(struct i3c_master_controller *master)
+static int i3c_primary_master_bus_init(struct i3c_master_controller *master)
 {
 	enum i3c_addr_slot_status status;
 	struct i2c_dev_boardinfo *i2cboardinfo;
@@ -2441,31 +2441,10 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
 	return 0;
 }
 
-/**
- * i3c_master_register() - register an I3C master
- * @master: master used to send frames on the bus
- * @parent: the parent device (the one that provides this I3C master
- *	    controller)
- * @ops: the master controller operations
- * @secondary: true if you are registering a secondary master. Will return
- *	       -ENOTSUPP if set to true since secondary masters are not yet
- *	       supported
- *
- * This function takes care of everything for you:
- *
- * - creates and initializes the I3C bus
- * - populates the bus with static I2C devs if @parent->of_node is not
- *   NULL
- * - registers all I3C devices added by the controller during bus
- *   initialization
- * - registers the I2C adapter and all I2C devices
- *
- * Return: 0 in case of success, a negative error code otherwise.
- */
-int i3c_master_register(struct i3c_master_controller *master,
-			struct device *parent,
-			const struct i3c_master_controller_ops *ops,
-			bool secondary)
+static int i3c_master_init(struct i3c_master_controller *master,
+			   struct device *parent,
+			   const struct i3c_master_controller_ops *ops,
+			   bool secondary)
 {
 	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
 	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
@@ -2535,10 +2514,49 @@ int i3c_master_register(struct i3c_master_controller *master,
 		goto err_put_dev;
 	}
 
-	ret = i3c_master_bus_init(master);
+	ret = i3c_primary_master_bus_init(master);
 	if (ret)
 		goto err_destroy_wq;
 
+	return 0;
+
+err_destroy_wq:
+	destroy_workqueue(master->wq);
+
+err_put_dev:
+	put_device(&master->dev);
+
+	return ret;
+}
+
+/**
+ * i3c_primary_master_register() - register an I3C master
+ * @master: master used to send frames on the bus
+ * @parent: the parent device (the one that provides this I3C master
+ *	    controller)
+ * @ops: the master controller operations
+ *
+ * This function takes care of everything for you:
+ *
+ * - creates and initializes the I3C bus
+ * - populates the bus with static I2C devs if @parent->of_node is not
+ *   NULL
+ * - registers all I3C devices added by the controller during bus
+ *   initialization
+ * - registers the I2C adapter and all I2C devices
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int i3c_primary_master_register(struct i3c_master_controller *master,
+				struct device *parent,
+				const struct i3c_master_controller_ops *ops)
+{
+	int ret;
+
+	ret = i3c_master_init(master, parent, ops, false);
+	if (ret)
+		return ret;
+
 	ret = device_add(&master->dev);
 	if (ret)
 		goto err_cleanup_bus;
@@ -2568,15 +2586,13 @@ int i3c_master_register(struct i3c_master_controller *master,
 err_cleanup_bus:
 	i3c_master_bus_cleanup(master);
 
-err_destroy_wq:
 	destroy_workqueue(master->wq);
 
-err_put_dev:
 	put_device(&master->dev);
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(i3c_master_register);
+EXPORT_SYMBOL_GPL(i3c_primary_master_register);
 
 /**
  * i3c_master_unregister() - unregister an I3C master
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 8513bd3..4f4d41f 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1166,8 +1166,8 @@ static int dw_i3c_probe(struct platform_device *pdev)
 	master->maxdevs = ret >> 16;
 	master->free_pos = GENMASK(master->maxdevs - 1, 0);
 
-	ret = i3c_master_register(&master->base, &pdev->dev,
-				  &dw_mipi_i3c_ops, false);
+	ret = i3c_primary_master_register(&master->base, &pdev->dev,
+					  &dw_mipi_i3c_ops);
 	if (ret)
 		goto err_assert_rst;
 
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 3f22269..f1d6d68 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1644,8 +1644,8 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	writel(MST_INT_IBIR_THR, master->regs + MST_IER);
 	writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
 
-	ret = i3c_master_register(&master->base, &pdev->dev,
-				  &cdns_i3c_master_ops, false);
+	ret = i3c_primary_master_register(&master->base, &pdev->dev,
+					  &cdns_i3c_master_ops);
 	if (ret)
 		goto err_disable_sysclk;
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 113c4c9..b288245 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -757,8 +757,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = i3c_master_register(&hci->master, &pdev->dev,
-				  &i3c_hci_ops, false);
+	ret = i3c_primary_master_register(&hci->master, &pdev->dev,
+					  &i3c_hci_ops);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 9cb39d9..e543f68 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -538,10 +538,9 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 int i3c_master_set_info(struct i3c_master_controller *master,
 			const struct i3c_device_info *info);
 
-int i3c_master_register(struct i3c_master_controller *master,
-			struct device *parent,
-			const struct i3c_master_controller_ops *ops,
-			bool secondary);
+int i3c_primary_master_register(struct i3c_master_controller *master,
+				struct device *parent,
+				const struct i3c_master_controller_ops *ops);
 int i3c_master_unregister(struct i3c_master_controller *master);
 
 /**
-- 
1.7.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
