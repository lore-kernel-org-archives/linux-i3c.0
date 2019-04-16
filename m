Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E99C10F14
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 08:36:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FCA52073F
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 08:36:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qcpjj4/8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="ql4UMZDX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="TfLPp3rH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FCA52073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fwe7KnV68BWptyFxrgdtf9LH3ig7rlw6J5nlzvcRhZM=; b=Qcpjj4/8luFBCj
	XzsnqrFOtljAnUQtVbKalUsbrnvbTqw1nI+5Wi85d36MtiEo+85kHToHimZlyfCqifRzA7hKwz6I5
	oHAVryh/PaGUlfRLfokG7NjAtBEZLRmh0m/e/GXMXsw7JEC8Q4tS++sG+bg9PQRr4KTeOghmaNlDl
	xfyVu7M/wmOT2LRWxIqlVlrGR6kEckTWTTgm4uUWZwuBc9QV/aHM2kJw2oFn4omc+E6fOIKf/zCOt
	qxCzLoJMflhsLdZRA0gBG0bc6JH/tIKAt5zr9Jk8fAd3hsU5XQjXn4ssOfY1kx4FLopYDi5ehncAq
	qxugV3kWYkqp+YRYZiBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGJa7-0002sr-Nw; Tue, 16 Apr 2019 08:36:43 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGJZx-0002gd-Li
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 08:36:40 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3G8TMPd028353; Tue, 16 Apr 2019 01:36:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=VFVZNPjotgIQuHDvGNPCWG6v9VIpUAbRu3qCMH7noAU=;
 b=ql4UMZDX5o13hX27+ZERt/4JCgU62m21QqwXjs2pusnnm4tjbGBvnToE3Ko8McSfm8H8
 BwZCp/lS3kuOTaeuGy4hKVyJ8l1ZNg9ach4YB8wc070SyXb3Xz+fHaGd2cocPx6moCBY
 9U8pDFZt7TQHPXHfBPntvBx7CPOLGig6ZpnAiSeNEIOMb70WX2k1dtXCKSggtHjqN+Ic
 gRU7qGmwhY0EnZPW5sdNKpQbEcM7iYqgGhcnW/LdZzsbsjvKIV67WoKtPa1nyNMUPKw/
 eQjAqOpaCdUFeUg4YrTcaqzl93+UoQoSOGN1hrjo1CUR1lWmtbGGBpkcVZWRvt4qoiaN /g== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2059.outbound.protection.outlook.com [104.47.41.59])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2rw7d9h1jy-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Apr 2019 01:36:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFVZNPjotgIQuHDvGNPCWG6v9VIpUAbRu3qCMH7noAU=;
 b=TfLPp3rHtcQYtEPWVLiyEKTUANLLVGaBRzHEBa35oTYA86iUWrVQ8QybrSl6+VwjLrxqrCmlOmZbTB+Ke5NPfGdnI5MHTxfuc6QNhN+dPipCuPychbjcLksrM6gXOnQMsVhxgnAP5jvNaDDNTsTKyG52ui56PMrhunHw+lo+j5g=
Received: from BYAPR07CA0003.namprd07.prod.outlook.com (2603:10b6:a02:bc::16)
 by BYAPR07MB5814.namprd07.prod.outlook.com (2603:10b6:a03:12d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1792.15; Tue, 16 Apr
 2019 08:36:25 +0000
Received: from CO1NAM05FT032.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::203) by BYAPR07CA0003.outlook.office365.com
 (2603:10b6:a02:bc::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1813.11 via Frontend
 Transport; Tue, 16 Apr 2019 08:36:25 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 CO1NAM05FT032.mail.protection.outlook.com (10.152.96.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1792.7 via Frontend Transport; Tue, 16 Apr 2019 08:36:25 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x3G8aKGg020581
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 16 Apr 2019 01:36:24 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 16 Apr 2019 10:36:21 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 16 Apr 2019 10:36:21 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x3G8aKUC011104;
 Tue, 16 Apr 2019 09:36:20 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x3G8aKUX011103;
 Tue, 16 Apr 2019 09:36:20 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v6 1/2] i3c: Drop support for I2C 10 bit addresing
Date: Tue, 16 Apr 2019 09:36:14 +0100
Message-ID: <20190416083615.6894-2-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190416083615.6894-1-pgaj@cadence.com>
References: <20190416083615.6894-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(199004)(189003)(36092001)(106466001)(426003)(50466002)(2351001)(48376002)(8676002)(86362001)(446003)(50226002)(5024004)(11346002)(5660300002)(76130400001)(105596002)(126002)(476003)(2616005)(4326008)(14444005)(486006)(336012)(246002)(8936002)(47776003)(26005)(76176011)(51416003)(16586007)(42186006)(186003)(107886003)(305945005)(87636003)(7636002)(6916009)(36756003)(2906002)(26826003)(478600001)(54906003)(6666004)(356004)(316002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB5814; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.Cadence.COM; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81cb79c7-dbdd-4b28-6b95-08d6c2469ce9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BYAPR07MB5814; 
X-MS-TrafficTypeDiagnostic: BYAPR07MB5814:
X-Microsoft-Antispam-PRVS: <BYAPR07MB58144FA486B6183BAE87FBABC2240@BYAPR07MB5814.namprd07.prod.outlook.com>
X-Forefront-PRVS: 000947967F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ib86d1I9I51hQyliZ3ARFz5xP6HpTUBGuFF+PPGhlLIIgaQKa7y4mepsPjBZelrROUuuRFCMH9AMqGhJvd507U6vcJFYBMiUquFByaf+ju4LvKNUZrBBCVlcHZC/9xyzcssb5lrhns0OR9xQI9ZvWhgLa1EDJEhzUuyfB7DZM/UR3E1/tNRlqMb8j3fi9BsboV3h2bx2u9pKtyblX6bnlkQ9vPktnPtlzWjHcHIG+Gn9K4y6VhCLC0CSqFl9qo/62ZzID/V94GemDuQCZeAW28ZMaQkAYSNcmwZ66kRYQNuvnZWlovUow6XWc//NegAR+rPAK6OWQNN6988Kj8XOkj9dyMkxvilBoZ/ZpnKzEgMn0cJhTTaKiFAOTB0v6dV//Te5EvTVD9sZgltrzkVRtSs2ecBmGrEgqUFvD48dIPM=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2019 08:36:25.4105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81cb79c7-dbdd-4b28-6b95-08d6c2469ce9
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB5814
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-16_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904160060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_013634_651223_30A5035C 
X-CRM114-Status: GOOD (  18.41  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
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

This patch drops support for I2C devices with 10 bit addressing. When I2C
device with 10 bit address is defined in DT, I3C master registration fails.

Address space for I2C devices has been reduced and ->i2c_funcs() hook has been
removed.

Because this patch series dropped support for 10 bit I2C devices, support is
also dropped in Cadence I3C master driver and Synopsys DesignWare I3C master
driver.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>

---

Main changes between v5 and v6 are:
- Fix typo in commit message

Main changes between v4 and v5 are:
- Merge HC driver changes into this patch to get rid of NULL pointer
dereference after applying first two patches

Main changes between v3 and v4 are:
- Add i3c_master_i2c_funcs() which reflects current I2C devices functionality.

Main changes between v2 and v3 are:
- Remove i2c_funcs() hook.
- Reduce address space for I2C devices.

Main changes between v1 and v2 are:
- Add error message when registering I2C device with 10 bit address.
---
 drivers/i3c/master.c                 | 21 ++++++++++++++-------
 drivers/i3c/master/dw-i3c-master.c   |  6 ------
 drivers/i3c/master/i3c-master-cdns.c | 10 +---------
 include/linux/i3c/master.h           |  5 +----
 4 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2dc628d..8800514 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1962,6 +1962,16 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	if (ret)
 		return ret;
 
+	/*
+	 * The I3C Specification does not clearly say I2C devices with 10-bit
+	 * address are supported. These devices can't be passed properly through
+	 * DEFSLVS command.
+	 */
+	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
+		dev_err(&master->dev, "I2C device with 10 bit address not supported.");
+		return -ENOTSUPP;
+	}
+
 	/* LVR is encoded in reg[2]. */
 	boardinfo->lvr = reg[2];
 
@@ -2111,16 +2121,14 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
 	return ret ? ret : nxfers;
 }
 
-static u32 i3c_master_i2c_functionalities(struct i2c_adapter *adap)
+static u32 i3c_master_i2c_funcs(struct i2c_adapter *adapter)
 {
-	struct i3c_master_controller *master = i2c_adapter_to_i3c_master(adap);
-
-	return master->ops->i2c_funcs(master);
+	return I2C_FUNC_SMBUS_EMUL | I2C_FUNC_I2C;
 }
 
 static const struct i2c_algorithm i3c_master_i2c_algo = {
 	.master_xfer = i3c_master_i2c_adapter_xfer,
-	.functionality = i3c_master_i2c_functionalities,
+	.functionality = i3c_master_i2c_funcs,
 };
 
 static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
@@ -2379,8 +2387,7 @@ EXPORT_SYMBOL_GPL(i3c_generic_ibi_recycle_slot);
 static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
 {
 	if (!ops || !ops->bus_init || !ops->priv_xfers ||
-	    !ops->send_ccc_cmd || !ops->do_daa || !ops->i2c_xfers ||
-	    !ops->i2c_funcs)
+	    !ops->send_ccc_cmd || !ops->do_daa || !ops->i2c_xfers)
 		return -EINVAL;
 
 	if (ops->request_ibi &&
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index bb03079..9934a12 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1069,11 +1069,6 @@ static void dw_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
 	kfree(data);
 }
 
-static u32 dw_i3c_master_i2c_funcs(struct i3c_master_controller *m)
-{
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
-}
-
 static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 {
 	struct dw_i3c_master *master = dev_id;
@@ -1108,7 +1103,6 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.attach_i2c_dev = dw_i3c_master_attach_i2c_dev,
 	.detach_i2c_dev = dw_i3c_master_detach_i2c_dev,
 	.i2c_xfers = dw_i3c_master_i2c_xfers,
-	.i2c_funcs = dw_i3c_master_i2c_funcs,
 };
 
 static int dw_i3c_probe(struct platform_device *pdev)
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 8889a4f..237f24a 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -864,11 +864,6 @@ static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	return ret;
 }
 
-static u32 cdns_i3c_master_i2c_funcs(struct i3c_master_controller *m)
-{
-	return I2C_FUNC_SMBUS_EMUL | I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR;
-}
-
 struct cdns_i3c_i2c_dev_data {
 	u16 id;
 	s16 ibi;
@@ -1010,9 +1005,7 @@ static int cdns_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
 	master->free_rr_slots &= ~BIT(slot);
 	i2c_dev_set_master_data(dev, data);
 
-	writel(prepare_rr0_dev_address(dev->boardinfo->base.addr) |
-	       (dev->boardinfo->base.flags & I2C_CLIENT_TEN ?
-		DEV_ID_RR0_LVR_EXT_ADDR : 0),
+	writel(prepare_rr0_dev_address(dev->boardinfo->base.addr),
 	       master->regs + DEV_ID_RR0(data->id));
 	writel(dev->boardinfo->lvr, master->regs + DEV_ID_RR2(data->id));
 	writel(readl(master->regs + DEVS_CTRL) |
@@ -1518,7 +1511,6 @@ static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
 	.send_ccc_cmd = cdns_i3c_master_send_ccc_cmd,
 	.priv_xfers = cdns_i3c_master_priv_xfers,
 	.i2c_xfers = cdns_i3c_master_i2c_xfers,
-	.i2c_funcs = cdns_i3c_master_i2c_funcs,
 	.enable_ibi = cdns_i3c_master_enable_ibi,
 	.disable_ibi = cdns_i3c_master_disable_ibi,
 	.request_ibi = cdns_i3c_master_request_ibi,
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index f13fd8b..eca8337 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -48,7 +48,7 @@ struct i3c_i2c_dev_desc {
 #define I3C_LVR_I2C_INDEX(x)		((x) << 5)
 #define I3C_LVR_I2C_FM_MODE		BIT(4)
 
-#define I2C_MAX_ADDR			GENMASK(9, 0)
+#define I2C_MAX_ADDR			GENMASK(6, 0)
 
 /**
  * struct i2c_dev_boardinfo - I2C device board information
@@ -390,8 +390,6 @@ struct i3c_bus {
  *	       and i2c_put_dma_safe_msg_buf() helpers provided by the I2C
  *	       framework.
  *	       This method is mandatory.
- * @i2c_funcs: expose the supported I2C functionalities.
- *	       This method is mandatory.
  * @request_ibi: attach an IBI handler to an I3C device. This implies defining
  *		 an IBI handler and the constraints of the IBI (maximum payload
  *		 length and number of pre-allocated slots).
@@ -437,7 +435,6 @@ struct i3c_master_controller_ops {
 	void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
 	int (*i2c_xfers)(struct i2c_dev_desc *dev,
 			 const struct i2c_msg *xfers, int nxfers);
-	u32 (*i2c_funcs)(struct i3c_master_controller *master);
 	int (*request_ibi)(struct i3c_dev_desc *dev,
 			   const struct i3c_ibi_setup *req);
 	void (*free_ibi)(struct i3c_dev_desc *dev);
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
