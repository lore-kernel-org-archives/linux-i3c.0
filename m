Return-Path: <SRS0=yDPd=FD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02853C3E8C5
	for <linux-i3c@archiver.kernel.org>; Sun, 29 Nov 2020 14:22:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1591F20727
	for <linux-i3c@archiver.kernel.org>; Sun, 29 Nov 2020 14:22:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q/qTTGmx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="WviHwpT3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="LYX6xE8v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1591F20727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hvvJ5gvdfzCgvez1gUPjxvt52rWUZCLPlc4M4gxuW/o=; b=Q/qTTGmx3K7Xhbes/3oCJLewS
	nBG4kmfXid6d9MfMz4RM/303PuOGnAcUJoUEHuS959mKcDG902Ajqf8DLF6Ny3e+PyxwpLR73zy3r
	7zoZex9pPPWHA+3r3H/fhx104kVcuWyU2EG7/GqxypmLpGEuPDfYYW3MkyqAp4R50kCq/hL32VoM9
	HQvAP3YJc0zMdXM1S9JwRA6aY9lGHZ3HsE+Py03uttVZFsaZivAwgX2cmawfJFVemiGOIe/FnCPjM
	oGOjly/ELjRo4dthnVpoC8dCMsrXGw1Jmw4rNYT5h9aD6yK4ecrwf7/IrcvG7x+iO8RmQYuQTT+Ly
	T9Na3Qejw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjNb5-0005EO-Uw; Sun, 29 Nov 2020 14:22:40 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjNb3-0005E2-AK
 for linux-i3c@lists.infradead.org; Sun, 29 Nov 2020 14:22:38 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ATEKKR4010861; Sun, 29 Nov 2020 06:22:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=ruawUC7L5j1CY4fCnDgudQjMdcRdTHF3WLOvJVbTgJA=;
 b=WviHwpT3l688K2j//JPLqlui7UBNETF9Wi/v4V1mhsBcmS2AlRWzwWmWdv5TUt+Y17nE
 W/V2An1s7o/WwfzJI8SYXJUISDfohSNjbalJ9XNOgGR0M2SRgCQ0NmGM8D1Lom406oHZ
 7CqBwRduEVNXgDhIjrtfPQAwPrJEu4Liu4kq+Uh8WdVZ8Mw+0WWBxuhTwcCO7tfaEfi3
 iCz38sYO/C8fZLAWj0YogFRyRbtckS89oOaBdHWR5H/zi/mOLn6aSq/PblPMMaKIyidW
 NkRnFRISpxv25LXaeo2OXLAQsfHB+doUE6qsIaKlQgyM/uksGvEy3NGNIHljhg1ZTatz hw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by mx0b-0014ca01.pphosted.com with ESMTP id 353k12jj6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Nov 2020 06:22:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIUtbUPiEnOcLAU+WrNTA9o7lC8rgz5Z/nLz5tVJI4sUTEMk43XsPgi89ZhQcDUOtTz2cTn6ThXZmMZFNpxQt3yMHjTDGj+qGMe4N5ZfysEzXDRGAVgElJ/gJFrjzZdZw/6hG0sEn/bmkpRjHUTRhOEFQBxxoeUHd8vTexGZdLeKGDKlcd6/7izYnnVSSk/Dv6uKdJQYUp0jZA8zBsOckIgWxwTc1UV5fxwFlZr0V5ZswW17NOMct46oYjoGvOcwvXMfT8yh37y/k0ayyWid9pqoYPapvRv/Wt1foidNZNYo9qrZHT3PgsjXSU4ff6frQcf6sBXNnAo55sg+Znt86Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruawUC7L5j1CY4fCnDgudQjMdcRdTHF3WLOvJVbTgJA=;
 b=LybipwvUOL8JA4JvfTmlS7Mp95SoKnrF5uFNaDJKiEOJKEvaHilTRzryhpxl19UEHSU7rIaatdM2IcoclLPmJHPLaHbxjbA1BvT0VrQJAIZX3VmUK2r/O7/qvUbyx7GkYWsajsdGMT0Z2/3/pKE/UhnJfQW57qbnP+H3K+851T0RwVv2tbmo/qqbTgSZqPu5g6a+n5CvceRqCbFPY0msienVfMY5BDJDl/yZ/KAzoTHsa95aOwlXrzOcIXm/KxYya+Qd5rpbkSdDYohUhAuRnrw1gixCrDM12qOGzKkHO8C8I8tSZMzCBYXR/HzivTGiVJ7atF8pXs9OYXXc7fkFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.147) smtp.rcpttodomain=synopsys.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruawUC7L5j1CY4fCnDgudQjMdcRdTHF3WLOvJVbTgJA=;
 b=LYX6xE8vSGlSVUZqhY393A23hU9qBxCWDAXhWI7ZuIJoNsR+Uu6SWgf6S05Y82jUCcrjiqV8MYK3tDtX+9XIYnz9Tyk9c7ZKBob7DYa98Eza9mjM8Nl4AFxwu6QwojnC+EvrQWxZx2PuNxfkGnpiL4XOrXWr3wyCkkQXpqT9tkE=
Received: from BN1PR14CA0018.namprd14.prod.outlook.com (2603:10b6:408:e3::23)
 by BYAPR07MB5173.namprd07.prod.outlook.com (2603:10b6:a03:6c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Sun, 29 Nov
 2020 14:22:31 +0000
Received: from BN8NAM12FT059.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::90) by BN1PR14CA0018.outlook.office365.com
 (2603:10b6:408:e3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Sun, 29 Nov 2020 14:22:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.147)
 smtp.mailfrom=cadence.com; synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.147 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.147; helo=sjmaillnx1.cadence.com;
Received: from sjmaillnx1.cadence.com (158.140.1.147) by
 BN8NAM12FT059.mail.protection.outlook.com (10.13.183.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.11 via Frontend Transport; Sun, 29 Nov 2020 14:22:30 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 0ATEMSZp021259
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sun, 29 Nov 2020 06:22:29 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sun, 29 Nov 2020 15:22:26 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sun, 29 Nov 2020 15:22:26 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0ATEMQA8019461;
 Sun, 29 Nov 2020 15:22:26 +0100
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0ATEMQkC019459;
 Sun, 29 Nov 2020 15:22:26 +0100
From: Parshuram Thombare <pthombar@cadence.com>
To: <alexandre.belloni@bootlin.com>, <slongerbeam@gmail.com>,
 <vitor.soares@synopsys.com>
Subject: [PATCH v9 2/7] i3c: master: use i3c_master_register only for main
 master
Date: Sun, 29 Nov 2020 15:22:25 +0100
Message-ID: <1606659745-19420-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1606659554-19229-1-git-send-email-pthombar@cadence.com>
References: <1606659554-19229-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10119bd2-09fa-4981-f347-08d894723516
X-MS-TrafficTypeDiagnostic: BYAPR07MB5173:
X-Microsoft-Antispam-PRVS: <BYAPR07MB517397ABF7CEB90F88A9355EC1F60@BYAPR07MB5173.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i2wZtiu4bab5wzHX4PEGZBs8h0gAA8DjaEJ/g52RNLxPseAYkCd55lWPxKatw8LDjbK8XMromOamzhALhJLEVe4ppfrgaxcqV7EMBBappAOj3NY8unCvlGM2CYHD9tERjoIZ49ZkZh8zzDUf27qCF6iIAEoq0Mj9sKawJh+4pcgUah210xVPkB6PsRCPHFt8NRE3ZBoo3AD3YlbmLKZfiYUeDnLDGgUKlyENIeo7Wj/WrmBOy+PXMLgHs0PMrzMSnxLPyRP7mWQ2LsrRinHdSoLRKuzuzuYtiHdEfT2pNihhktytatpw36D7SsW+KdWMcaKLQhjvupmNZEvaned87Eo3v5qhsH5g6xIRsLdMiU1PLuv8Wfpc5K3ub0ND8H2Etl5jFlmI29cT/xGbet/SJKD87EPz0tEaXBmLe4bsLEI=
X-Forefront-Antispam-Report: CIP:158.140.1.147; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx1.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(36092001)(46966005)(36756003)(2616005)(8936002)(42186006)(356005)(8676002)(316002)(110136005)(107886003)(336012)(478600001)(54906003)(82740400003)(7636003)(426003)(186003)(36906005)(2906002)(4326008)(26005)(47076004)(86362001)(5660300002)(70586007)(82310400003)(83380400001)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2020 14:22:30.9495 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10119bd2-09fa-4981-f347-08d894723516
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.147];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT059.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB5173
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-29_07:2020-11-26,
 2020-11-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=2 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011290097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_092237_507597_8546D2D7 
X-CRM114-Status: GOOD (  22.00  )
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

Removed last argument 'secondary' and restructured
i3c_master_register to move code that can be common
to i3c_secondary_master_register to separate function
i3c_master_init.

Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
---
 drivers/i3c/master.c                 |   78 ++++++++++++++++++++-------------
 drivers/i3c/master/dw-i3c-master.c   |    4 +-
 drivers/i3c/master/i3c-master-cdns.c |    4 +-
 include/linux/i3c/master.h           |    7 +--
 4 files changed, 54 insertions(+), 39 deletions(-)

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
