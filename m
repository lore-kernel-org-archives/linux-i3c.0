Return-Path: <SRS0=3/jM=UV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27BFC43613
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2019 20:56:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8258020657
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2019 20:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U/lbAWNp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="Tp/FpnfG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="nBBuaQs9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8258020657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5hnesz8M3xspIjw4aWhBbsrdrUFqCCP6bM6Sxv9yf0s=; b=U/lbAWNprl4I/y
	zZBKcNIQ9xhFIpdJvktFLavHLJXhPPkZwCEPyGEDNY41PPeSKfQgnYVxHGlJgi1jUCeAMk8hfpYKD
	e4DV2peRb0IrOFiVZFnwqQWpe5jgFPTi6hxIz/Fn24iIDTML5l5nTwxCEVS6F+nCEV41lHaJPG0Bt
	cVe8xihaVuqHA0w1kXiiXZxu5Xas3cMm05BEhUSpuhXIxJxrvPCDOaDbL8hTPBBjZdJ1xgNUOqlu0
	qkV1mYnk5/+tR2Mv0ISvAhdKNiKSMJZMODkml4Ek8BUWXlPipKZ7mfX5Lv3uuzOq+pIFPv3RXGfND
	e4J/DqFUft2cJMJU/Ilg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hen3L-00079l-45; Sat, 22 Jun 2019 20:56:03 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hen3H-000793-W8
 for linux-i3c@lists.infradead.org; Sat, 22 Jun 2019 20:56:01 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5MKnN6a001690; Sat, 22 Jun 2019 13:55:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=Qh/zvB4YRyENv3qKzI/l6omu1Y9L2LhwEUPDAhl6KDE=;
 b=Tp/FpnfGGNM9hYPa/7uurXeKwCOkmibuTxUNu36bEkBj/7fwimzzOLPUptDwUCju7Hn8
 YrIPnhGdilR9yPyxaruuL7CuiB85t4aXTwXUCxh16i0rI6EzBb94gIwBWzT+41Ltkfx/
 fV7neNjNXIxcZUuRt0z3yMTZRhlRAVisAjNtSlNA9BPbvTwGB/towvo6DXjEcoXrS30r
 xlWyy4BKwhNso9K4l2WRT2xcUJhLq5nliNLv3xs1kPLilj6tYLWB+1NiNC/iYw37LRMK
 TjXbejdhBnj4GLNb5LbdA548hVW+RtU9SiYssKe04YxBeiFs7FLJzfgzLmfBQDa554Cm +A== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2058.outbound.protection.outlook.com [104.47.41.58])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2t9fwthj91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Jun 2019 13:55:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qh/zvB4YRyENv3qKzI/l6omu1Y9L2LhwEUPDAhl6KDE=;
 b=nBBuaQs9oUyhxBR0crN4Ad9bBujFzjE9wNIhiP8SI8FxlKDyNZ0KFQKy5KAKmBrqYUegQrKDxe3+VLHdbMhtrTfQ3fLWW4p0jzF0mXbI+bHC8HmY12HCYZ+2g/DjV4TXlkwjx+eAHlSXkJ+PXwcVbiw65kprlVdDLPretJVgz3g=
Received: from DM6PR07CA0032.namprd07.prod.outlook.com (2603:10b6:5:94::45) by
 CY1PR07MB2490.namprd07.prod.outlook.com (2a01:111:e400:c63a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Sat, 22 Jun
 2019 20:55:52 +0000
Received: from BY2NAM05FT004.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::201) by DM6PR07CA0032.outlook.office365.com
 (2603:10b6:5:94::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Sat, 22 Jun 2019 20:55:51 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BY2NAM05FT004.mail.protection.outlook.com (10.152.100.141) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.6 via Frontend Transport; Sat, 22 Jun 2019 20:55:51 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x5MKtmG2007056
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sat, 22 Jun 2019 13:55:49 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sat, 22 Jun 2019 22:55:47 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sat, 22 Jun 2019 22:55:47 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x5MKtlDG009812;
 Sat, 22 Jun 2019 21:55:47 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x5MKtldX009807;
 Sat, 22 Jun 2019 21:55:47 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v5 2/7] i3c: split i3c_master_register into init - register
 pair
Date: Sat, 22 Jun 2019 21:55:00 +0100
Message-ID: <1561236905-8901-3-git-send-email-pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
References: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(396003)(376002)(136003)(2980300002)(199004)(189003)(36092001)(426003)(486006)(476003)(2616005)(126002)(356004)(51416003)(6666004)(14444005)(5660300002)(70206006)(70586007)(76130400001)(48376002)(50466002)(26826003)(86362001)(30864003)(2906002)(4326008)(50226002)(87636003)(478600001)(246002)(8676002)(8936002)(7636002)(107886003)(305945005)(76176011)(26005)(42186006)(316002)(54906003)(16586007)(186003)(36756003)(2351001)(11346002)(446003)(336012)(47776003)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR07MB2490; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75f69204-da2c-4da0-607f-08d6f75402bf
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY1PR07MB2490; 
X-MS-TrafficTypeDiagnostic: CY1PR07MB2490:
X-Microsoft-Antispam-PRVS: <CY1PR07MB24903712221E67A9819752EBC2E60@CY1PR07MB2490.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:312;
X-Forefront-PRVS: 0076F48C8A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 2LdQ+VNQtrMdLe6eQzqdufsUQJHPOVcMJtE+3nSoqJSgUchQn7Nx13MgWVp4VaqwYPhOgksGXt3QJKqIC0IPUX2rRRqQJyrGxxCW8Y1Pz9bk3Mjo5TblqZLBBZL0AWuDphEfeLYvSVoQU2gNV84fX417QKA3meRBpWhPbACGbvmIjMnIAHeaZKMbuuowOn/8vIrF84aVmV3icwY9wCM7PO1+3JaxILX64MjXR6k45TUGVwL5fdrklH2jtyu9Jftkr2kEi9cCtnPAbQzzObGGemcqHfp+d2WnXgqdVgIfBjtZKWDP3eXF7EsZnjokvFT6gQyPjHiHzg/fgNINV5NO4GMMGXfTloVewf+Zbx0feCNkOmtDYq4IMnEm9vpxqPvZMyWsvCC35IUlZSOQeXqc4FuQ9aX7nJSIm6C1UqsgEDw=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2019 20:55:51.4323 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f69204-da2c-4da0-607f-08d6f75402bf
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2490
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-22_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906220190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190622_135600_167730_65BAFC6D 
X-CRM114-Status: GOOD (  17.95  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, agolec@cadence.com,
 Przemyslaw Gaj <pgaj@cadence.com>, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch is base for mastership takeover where secondary master is
initialized at probe time but register may be postponed till dynamic address is
assigned to our device.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master.c                 | 86 ++++++++++++++++++++----------------
 drivers/i3c/master/dw-i3c-master.c   | 34 +++++++-------
 drivers/i3c/master/i3c-master-cdns.c | 45 ++++++++++---------
 include/linux/i3c/master.h           | 12 ++---
 4 files changed, 94 insertions(+), 83 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 0f7c31e..759078f 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1528,32 +1528,9 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
 }
 EXPORT_SYMBOL_GPL(i3c_master_do_daa);
 
-/**
- * i3c_master_set_info() - set master device information
- * @master: master used to send frames on the bus
- * @info: I3C device information
- *
- * Set master device info. This should be called from
- * &i3c_master_controller_ops->bus_init().
- *
- * Not all &i3c_device_info fields are meaningful for a master device.
- * Here is a list of fields that should be properly filled:
- *
- * - &i3c_device_info->dyn_addr
- * - &i3c_device_info->bcr
- * - &i3c_device_info->dcr
- * - &i3c_device_info->pid
- * - &i3c_device_info->hdr_cap if %I3C_BCR_HDR_CAP bit is set in
- *   &i3c_device_info->bcr
- *
- * This function must be called with the bus lock held in maintenance mode.
- *
- * Return: 0 if @info contains valid information (not every piece of
- * information can be checked, but we can at least make sure @info->dyn_addr
- * and @info->bcr are correct), -EINVAL otherwise.
- */
-int i3c_master_set_info(struct i3c_master_controller *master,
-			const struct i3c_device_info *info)
+static int i3c_master_set_info(struct i3c_master_controller *master,
+			       const struct i3c_device_info *info,
+			       bool secondary)
 {
 	struct i3c_dev_desc *i3cdev;
 	int ret;
@@ -1586,7 +1563,6 @@ int i3c_master_set_info(struct i3c_master_controller *master,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(i3c_master_set_info);
 
 static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
 {
@@ -2403,7 +2379,7 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
 }
 
 /**
- * i3c_master_register() - register an I3C master
+ * i3c_master_init() - initializes all the structures required by I3C master
  * @master: master used to send frames on the bus
  * @parent: the parent device (the one that provides this I3C master
  *	    controller)
@@ -2417,16 +2393,14 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
  * - creates and initializes the I3C bus
  * - populates the bus with static I2C devs if @parent->of_node is not
  *   NULL
- * - registers all I3C devices added by the controller during bus
- *   initialization
- * - registers the I2C adapter and all I2C devices
+ * - set bus mode when registering I2C devices.
  *
  * Return: 0 in case of success, a negative error code otherwise.
  */
-int i3c_master_register(struct i3c_master_controller *master,
-			struct device *parent,
-			const struct i3c_master_controller_ops *ops,
-			bool secondary)
+int i3c_master_init(struct i3c_master_controller *master,
+		    struct device *parent,
+		    const struct i3c_master_controller_ops *ops,
+		    bool secondary)
 {
 	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
 	enum i3c_bus_mode mode = I3C_BUS_MODE_PURE;
@@ -2488,10 +2462,47 @@ int i3c_master_register(struct i3c_master_controller *master,
 		ret = -ENOMEM;
 		goto err_put_dev;
 	}
+	return 0;
+
+err_put_dev:
+	put_device(&master->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_init);
+
+void i3c_master_cleanup(struct i3c_master_controller *master)
+{
+	put_device(&master->dev);
+}
+EXPORT_SYMBOL_GPL(i3c_master_cleanup);
+
+/**
+ * i3c_master_register() - register an primary I3C master
+ * @master: master used to send frames on the bus
+ * @info: master info, describes this device
+ *
+ * This function takes care of everything for you:
+ *
+ * - updates this master info
+ * - registers all I3C devices added by the controller during bus
+ *   initialization
+ * - registers the I2C adapter and all I2C devices
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int i3c_master_register(struct i3c_master_controller *master,
+			struct i3c_device_info *info)
+{
+	int ret;
+
+	ret = i3c_master_set_info(master, info, master->secondary);
+	if (ret)
+		return ret;
 
 	ret = i3c_master_bus_init(master);
 	if (ret)
-		goto err_put_dev;
+		return ret;
 
 	ret = device_add(&master->dev);
 	if (ret)
@@ -2522,9 +2533,6 @@ int i3c_master_register(struct i3c_master_controller *master,
 err_cleanup_bus:
 	i3c_master_bus_cleanup(master);
 
-err_put_dev:
-	put_device(&master->dev);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_master_register);
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 22ac305..8e91364 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -593,7 +593,6 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 {
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
 	struct i3c_bus *bus = i3c_master_get_bus(m);
-	struct i3c_device_info info = { };
 	u32 thld_ctrl;
 	int ret;
 
@@ -623,20 +622,6 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	writel(INTR_MASTER_MASK, master->regs + INTR_STATUS_EN);
 	writel(INTR_MASTER_MASK, master->regs + INTR_SIGNAL_EN);
 
-	ret = i3c_master_get_free_addr(m, 0);
-	if (ret < 0)
-		return ret;
-
-	writel(DEV_ADDR_DYNAMIC_ADDR_VALID | DEV_ADDR_DYNAMIC(ret),
-	       master->regs + DEVICE_ADDR);
-
-	memset(&info, 0, sizeof(info));
-	info.dyn_addr = ret;
-
-	ret = i3c_master_set_info(&master->base, &info);
-	if (ret)
-		return ret;
-
 	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_SIR_REQ_REJECT);
 	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
 
@@ -1109,6 +1094,7 @@ static int dw_i3c_probe(struct platform_device *pdev)
 {
 	struct dw_i3c_master *master;
 	struct resource *res;
+	struct i3c_device_info info = { };
 	int ret, irq;
 
 	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
@@ -1160,8 +1146,22 @@ static int dw_i3c_probe(struct platform_device *pdev)
 	master->maxdevs = ret >> 16;
 	master->free_pos = GENMASK(master->maxdevs - 1, 0);
 
-	ret = i3c_master_register(&master->base, &pdev->dev,
-				  &dw_mipi_i3c_ops, false);
+	ret = i3c_master_init(&master->base, &pdev->dev,
+			      &dw_mipi_i3c_ops, false);
+	if (ret)
+		goto err_assert_rst;
+
+	ret = i3c_master_get_free_addr(&master->base, 0);
+	if (ret < 0)
+		goto err_assert_rst;
+
+	writel(DEV_ADDR_DYNAMIC_ADDR_VALID | DEV_ADDR_DYNAMIC(ret),
+	       master->regs + DEVICE_ADDR);
+
+	memset(&info, 0, sizeof(info));
+	info.dyn_addr = ret;
+
+	ret = i3c_master_register(&master->base, &info);
 	if (ret)
 		goto err_assert_rst;
 
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 5aee315..9706426 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1193,8 +1193,7 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 	unsigned long pres_step, sysclk_rate, max_i2cfreq;
 	struct i3c_bus *bus = i3c_master_get_bus(m);
 	u32 ctrl, prescl0, prescl1, pres, low;
-	struct i3c_device_info info = { };
-	int ret, ncycles;
+	int ncycles;
 
 	switch (bus->mode) {
 	case I3C_BUS_MODE_PURE:
@@ -1247,22 +1246,6 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 	prescl1 = PRESCL_CTRL1_OD_LOW(ncycles);
 	writel(prescl1, master->regs + PRESCL_CTRL1);
 
-	/* Get an address for the master. */
-	ret = i3c_master_get_free_addr(m, 0);
-	if (ret < 0)
-		return ret;
-
-	writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
-	       master->regs + DEV_ID_RR0(0));
-
-	cdns_i3c_master_dev_rr_to_info(master, 0, &info);
-	if (info.bcr & I3C_BCR_HDR_CAP)
-		info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
-
-	ret = i3c_master_set_info(&master->base, &info);
-	if (ret)
-		return ret;
-
 	/*
 	 * Enable Hot-Join, and, when a Hot-Join request happens, disable all
 	 * events coming from this device.
@@ -1531,6 +1514,7 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 {
 	struct cdns_i3c_master *master;
 	struct resource *res;
+	struct i3c_device_info info = { };
 	int ret, irq;
 	u32 val;
 
@@ -1606,13 +1590,32 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	writel(MST_INT_IBIR_THR, master->regs + MST_IER);
 	writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
 
-	ret = i3c_master_register(&master->base, &pdev->dev,
-				  &cdns_i3c_master_ops, false);
+	ret = i3c_master_init(&master->base, &pdev->dev, &cdns_i3c_master_ops, false);
 	if (ret)
-		goto err_disable_sysclk;
+	goto err_disable_sysclk;
+
+	/* Get an address for the master. */
+	ret = i3c_master_get_free_addr(&master->base, 0);
+	if (ret < 0)
+		return ret;
+
+	writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
+	       master->regs + DEV_ID_RR0(0));
+
+	cdns_i3c_master_dev_rr_to_info(master, 0, &info);
+	if (info.bcr & I3C_BCR_HDR_CAP)
+		info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
+
+	ret = i3c_master_register(&master->base, &info);
+
+	if (ret)
+		goto err_cleanup;
 
 	return 0;
 
+err_cleanup:
+	i3c_master_cleanup(&master->base);
+
 err_disable_sysclk:
 	clk_disable_unprepare(master->sysclk);
 
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 42bb215..df3d769 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -530,13 +530,13 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 				  u8 addr);
 int i3c_master_do_daa(struct i3c_master_controller *master);
 
-int i3c_master_set_info(struct i3c_master_controller *master,
-			const struct i3c_device_info *info);
-
+int i3c_master_init(struct i3c_master_controller *master,
+		    struct device *parent,
+		    const struct i3c_master_controller_ops *ops,
+		    bool secondary);
+void i3c_master_cleanup(struct i3c_master_controller *master);
 int i3c_master_register(struct i3c_master_controller *master,
-			struct device *parent,
-			const struct i3c_master_controller_ops *ops,
-			bool secondary);
+			struct i3c_device_info *info);
 int i3c_master_unregister(struct i3c_master_controller *master);
 
 /**
-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
