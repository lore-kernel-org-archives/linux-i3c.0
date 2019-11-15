Return-Path: <SRS0=ua2+=ZH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2361C432C3
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Nov 2019 06:27:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C14AA20637
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Nov 2019 06:27:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LCb0KDS9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="HNbC4fAy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="ao4E2iuH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C14AA20637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6RJknrkkTYrIDEB1ZxV0+YsZz1qKx7lPGijVQsHnm+g=; b=LCb0KDS9zwspC8
	ObUTdRiIlx9JLxfmqL4Dp3G7i81sbjEtImff4ayv9G8fNIm9ob/JEfgZEnVrQ+NqZfOcuzwCqCq3V
	fu7jgTbIgPxzQjzGtjtxR1bdCfLRiRetzKBzvbH/zchku9I4bK0IKqJyggOFhiIKaLi4VNNd913Zf
	zvBHzOH3pq3uNTVpcw268Qi0SnJNV7Tx13cDlnebN2JJihKhiK/7aMDmB+DyK3q0b6u5yP0KrJ424
	0IzWwfwRhs6hsgHyoieiI5NuzsBEqXr7253GmutT3a8VYbWupVi1/9X6Z5LYJPCgMrvIymYChE6Zl
	V5f41YUo6favvy48tICQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVV5A-0007ss-Fb; Fri, 15 Nov 2019 06:27:48 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVV56-0007s6-Am
 for linux-i3c@lists.infradead.org; Fri, 15 Nov 2019 06:27:47 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAF6RCMq032228; Thu, 14 Nov 2019 22:27:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=SMf71ujRNfrv1JMykv1bUODNNivwRwpKEWQlv/vmbJI=;
 b=HNbC4fAyRm+nrmLadUn1/TxyLSaM2zdsW4mwAYO6TJFch0phMwDkbbTr3EwvCTkVwIMo
 x7A+5LoNiXy+e8v5IpXSXukoyzeK7vXZHGwydUYmjLrH7EDv9Lywr9CkfI09twrhdI5r
 31vbss3O4mSkM5dDCv4dy5fggnaJfl/KemL9TwwEopmj+rPSXNLkV957lKYnRMyGE4EU
 akk7coB8QVdcJHUTcZOm5WgyNVOF6LKET9lTDCEnullDbBgSAHGPDnEAM9N1aZ8FdSRg
 AHHDRKnf17Pz2vBRDME9AczRz1/Ndo9SIi2fK0qjY1bVGs1ctkA+Nvhu+RJNdgrgTaOR dw== 
Received: from nam05-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam05lp2050.outbound.protection.outlook.com [104.47.49.50])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2w7prydusg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Nov 2019 22:27:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQIK8NK7AQI02Jm2RBNwkR319dXq2d9SI8jaZM/0qT70clQ/LTFRr3LOE4wSBbXNSGPwhboHtIrHHjpZLJHqb2VglOj25mTKed/btX+anYMdBdDnd0XqZw4lIJ7jfzCB5pVzbIF1TGcjavwPE6nIiRFNVoul8E0IvgK4TxXdGDwLZGrq5WcXv5JPRvuS35AzBfpC+wKfSC29dbhqEGG9oGoSPjdn+ez66j4yqspfkVKRzT+Qji1ZU4WGbEdR+HHwjLq/Fxd8baJm7xeoF/pvWyPKN9L4Dg/QTYCLeyqj8dhnhv5CW310+DJi1f+6826o638L5ltNwokhAgJAOQD1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMf71ujRNfrv1JMykv1bUODNNivwRwpKEWQlv/vmbJI=;
 b=jIzcerzlSpBbWteU1SZ16OqHfyjmt+TVvoOUlDYwaafznWyg/qQ1L7ymK6zOHHJrZpit97eI8TlARPlFN/tMn59b6Q/tpG8MSM28uUFNcKdB7hjBl/ReWUzOj9TlIsBRzvnlEL8PhHdRw5HD+3ZGuwZ2C/1oXaMX4PkOYCOeHjYDht9teZacPuIGjfW23Hb3HK8OGb+OgjkYQL5midV6i5mR7unnb23rweb/XzDgCVSu59E25jSQnzXdLvl4hRMb2rChcNYIWZBoVXPv6AoPvAS/KxTNiuB5o3RmNtcKK12o7YYMS1eMWc9H79s+zR6Ao3hGiGanPQYVNtlCklVMbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.243) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMf71ujRNfrv1JMykv1bUODNNivwRwpKEWQlv/vmbJI=;
 b=ao4E2iuH8GSCk0ArsojqH/mpqg/CcP1t6cyZrJ4XVOYA0gp72IRRgFnbm45KIETIllS2mXEzZ+8X4JyArAwZdHG8D7J0Z6g8rhxSdRXYfG2AgWSSac7bfPpbyEIzMvNDDNvbJvFa1foLUQoW03RoqzCezFeMTN/SStC8DtZZlYI=
Received: from BYAPR07CA0095.namprd07.prod.outlook.com (2603:10b6:a03:12b::36)
 by BN7PR07MB4147.namprd07.prod.outlook.com (2603:10b6:406:b6::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Fri, 15 Nov
 2019 06:24:03 +0000
Received: from BN8NAM12FT013.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5b::203) by BYAPR07CA0095.outlook.office365.com
 (2603:10b6:a03:12b::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23 via Frontend
 Transport; Fri, 15 Nov 2019 06:24:03 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.243 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.243; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.243) by
 BN8NAM12FT013.mail.protection.outlook.com (10.13.182.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2451.23 via Frontend Transport; Fri, 15 Nov 2019 06:24:01 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 xAF6NuVt136968
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Thu, 14 Nov 2019 22:23:58 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 15 Nov 2019 07:23:56 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 15 Nov 2019 07:23:56 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xAF6NuVt018512;
 Fri, 15 Nov 2019 07:23:56 +0100
Received: (from pgaj@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xAF6NtKc018491;
 Fri, 15 Nov 2019 07:23:55 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v2] i3c: master: cdns: add data hold delay support
Date: Fri, 15 Nov 2019 07:23:26 +0100
Message-ID: <20191115062326.16476-1-pgaj@cadence.com>
X-Mailer: git-send-email 2.14.0
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:64.207.220.243; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39850400004)(396003)(346002)(36092001)(189003)(199004)(4326008)(186003)(6916009)(2351001)(6666004)(107886003)(356004)(305945005)(36906005)(54906003)(42186006)(16586007)(316002)(1076003)(5660300002)(26005)(106002)(51416003)(478600001)(70206006)(47776003)(70586007)(476003)(126002)(8936002)(50466002)(86362001)(87636003)(36756003)(2906002)(2616005)(336012)(81166006)(8676002)(486006)(48376002)(426003)(81156014)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR07MB4147; H:wcmailrelayl01.cadence.com;
 FPR:; SPF:Pass; LANG:en; PTR:ErrorRetry; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ceede31-b35d-4d40-5a91-08d769946812
X-MS-TrafficTypeDiagnostic: BN7PR07MB4147:
X-Microsoft-Antispam-PRVS: <BN7PR07MB414783A8B396375E99F2EFCCC2700@BN7PR07MB4147.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 02229A4115
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X1+V2O7YT+K4RyZ53WlqAjOYkIw8KYmGB7M8NggTW6VdXEJhvFtUhZFyy29M8VG48cYprPC9YTtJs3RJhQPeRwnFJWfBRw8o4BP5x1SQAdUkLCCxGW7TA32N1MMhA0VR9hkC63JoYcJ+j6OCBLvuwxTYOnb2HbAPq/7Z1I9ZTRU09mncS6hKCnvF9J0OCJG2wJRfxmKST9o+OVLpSquJQ2BITiWd29JzQ/jCDbhsFP26OtYqD0nkxLqxWoa3uXS0It2qRljDoDcn22wxbhToi+LJ8MeqNJjDqBs8RsHc9BvRhXVWoXi6DC0DXl3Zrvz3CSktPGnMjm2/sisr08INU1bwoyLPydZaixkOd3e+K6W2gXHIXAMIiW1C+oPamGUC2bhRaeMF9Vrq/Dx0ElAwABwQqYBn0nfNWabC+Ee2t+6ZJnUPBGcN1SWtDGjt2WfMtuJXUbaP6TnuLSmP2FEulw==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 06:24:01.6702 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ceede31-b35d-4d40-5a91-08d769946812
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.243];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB4147
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-14_07:2019-11-14,2019-11-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=1 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=966 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911150056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_222745_574840_354345B8 
X-CRM114-Status: GOOD (  15.67  )
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

This patch adds support for THD_DEL (Data Hold Delay) to Cadence
I3C master constoller driver.

As per MIPI I3C Specification 1.0, Table 75 (page 142) defines
non-zero minimal tHD_PP timing on master output (Fig 65). This
setting allows to meet this timing on master's soc outputs,
regardless of PCB balancing.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>

---

Main changes between v1 and v2:
- Add device-specific data which holds the thd_del value
- Remove device tree property
---
 drivers/i3c/master/i3c-master-cdns.c | 37 +++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 10db0bf0655a..3531396f04fd 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
+#include <linux/of_device.h>
 
 #define DEV_ID				0x0
 #define DEV_ID_I3C_MASTER		0x5034
@@ -60,6 +61,7 @@
 #define CTRL_HALT_EN			BIT(30)
 #define CTRL_MCS			BIT(29)
 #define CTRL_MCS_EN			BIT(28)
+#define CTRL_THD_DEL(x)			(((x) << 24) & GENMASK(25, 24))
 #define CTRL_HJ_DISEC			BIT(8)
 #define CTRL_MST_ACK			BIT(7)
 #define CTRL_HJ_ACK			BIT(6)
@@ -388,6 +390,10 @@ struct cdns_i3c_xfer {
 	struct cdns_i3c_cmd cmds[0];
 };
 
+struct cdns_i3c_data {
+	u8 thd_del;
+};
+
 struct cdns_i3c_master {
 	struct work_struct hj_work;
 	struct i3c_master_controller base;
@@ -408,6 +414,7 @@ struct cdns_i3c_master {
 	struct clk *pclk;
 	struct cdns_i3c_master_caps caps;
 	unsigned long i3c_scl_lim;
+	const struct cdns_i3c_data *devdata;
 };
 
 static inline struct cdns_i3c_master *
@@ -1264,6 +1271,15 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 	 * We will issue ENTDAA afterwards from the threaded IRQ handler.
 	 */
 	ctrl |= CTRL_HJ_ACK | CTRL_HJ_DISEC | CTRL_HALT_EN | CTRL_MCS_EN;
+
+	/*
+	 * Configure data hold delay based on device-specific data.
+	 *
+	 * MIPI I3C Specification 1.0 defines non-zero minimal tHD_PP timing on
+	 * master output. This setting allows to meet this timing on master's
+	 * SoC outputs, regardless of PCB balancing.
+	 */
+	ctrl |= CTRL_THD_DEL(master->devdata->thd_del);
 	writel(ctrl, master->regs + CTRL);
 
 	cdns_i3c_master_enable(master);
@@ -1521,17 +1537,33 @@ static void cdns_i3c_master_hj(struct work_struct *work)
 	i3c_master_do_daa(&master->base);
 }
 
+static struct cdns_i3c_data cdns_i3c_devdata = {
+	.thd_del = 0x3,
+};
+
+static const struct of_device_id cdns_i3c_master_of_ids[] = {
+	{ .compatible = "cdns,i3c-master", .data = &cdns_i3c_devdata },
+	{ /* sentinel */ },
+};
+
 static int cdns_i3c_master_probe(struct platform_device *pdev)
 {
 	struct cdns_i3c_master *master;
+	const struct of_device_id *of_id = of_match_device(
+		of_match_ptr(cdns_i3c_master_of_ids), &pdev->dev);
 	struct resource *res;
 	int ret, irq;
 	u32 val;
 
+	if (!of_id)
+		return -ENODEV;
+
 	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
 	if (!master)
 		return -ENOMEM;
 
+	master->devdata = of_id->data;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	master->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(master->regs))
@@ -1631,11 +1663,6 @@ static int cdns_i3c_master_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id cdns_i3c_master_of_ids[] = {
-	{ .compatible = "cdns,i3c-master" },
-	{ /* sentinel */ },
-};
-
 static struct platform_driver cdns_i3c_master = {
 	.probe = cdns_i3c_master_probe,
 	.remove = cdns_i3c_master_remove,
-- 
2.14.0


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
