Return-Path: <SRS0=+2zm=ZK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9138C432C0
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Nov 2019 15:01:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94AA120878
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Nov 2019 15:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oPRzwmrp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="gGEb+86d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="cFisRzWJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94AA120878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xKP8hFQtVvt/sffNvuHXm1f/NKbCAZXQBrmqUhTEkhQ=; b=oPRzwmrpgBgdB0
	ueD5Bt2ca0IcsOhjisZn0uzQgn42V54YNaGiqGRU7hKqDIjVobdmc6n6JQ8jLENIv6v+XlWvcrzi7
	Vy7kmVKNPOGGVA/7RPHoUyYF2MfZ0wM6lp9Hq+n9T5G1Vn1yuhkzWGXKoSYhyMVFRKsl8kRwH3QHS
	4lRxccjPsoG/LIXmlqaZLnsc4sPw54qfzNUiXxR37e+8AlyJGIALnKs5m8dQSUCymxix9rYXd1BUT
	he6v+7asvmkrobWTGeQgC/usCwdrAodxP4LFOIK2lDLHBpQb1IO2O0472Z1rU7SCBg/D2QSUzCh6A
	mfam+ykj+PRk7zcOxBSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWiXI-0007pi-6K; Mon, 18 Nov 2019 15:01:52 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWiXE-0007fw-75
 for linux-i3c@lists.infradead.org; Mon, 18 Nov 2019 15:01:50 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAIEi1m1024934; Mon, 18 Nov 2019 07:01:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=jFQeC6A4ioECYMKQCswH2NOc2lqxRlZn1RmMSfxE6Jc=;
 b=gGEb+86dfV3vjqFUxL5TOWqEdAgORLAvHG9kXBmkgnd+/cGp4lw9QKjoc5P7Bh4WcV4A
 L3DnUEhDrJrRBln0mUoN5gfiQF3ridyMvi/lYiwdtXP0RGVkvF4vwbSBMwyIpccv7O1s
 boN8Np01ZIBayAhyRyd3mazzKFC6EdrwWUJGAct63yXTrcLZ/e5B6P5J8ucnnCa2Noh/
 ZVzNLYz26oyX+6oW2FyH3H9NU5kPKN1pAK3UDbgHH0z7u8HY8FspwgPbUKCKCtyU+UVB
 1BhQqBm3LCMXgF+dS0m6+xaM11f1rzR3NNlB8iJ9tIckLkpQ5SN+JzII73uP26J5HsWc Ug== 
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2056.outbound.protection.outlook.com [104.47.44.56])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2wadjy6qc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2019 07:01:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFw7U2kLF+b4yyqOQwevzcfOlY4PpU9g6cm8nNbiQf88iATei22EWpMF3dGIvHBfEmUcPSUg9ihJNPMPjwbMuMOdUZUwEeKJrNF7mx22OYiUcs9pCEeYeqz58ielX+OPzF1Lt9T7bzmtncHpEUKtwfjpqOmkdyfVDOMmKEIOwoRyfkK28QUztE27f1ZEjjE5HrtIf+S95R4W5pieFkLXlEdINPnmpQVAumoDiO2d42BOFs+iw0XOGB4Jqc5hacs71zTdArAYeqntFOsIp9mL3BZEntbA4IK+57EOpJAGKpDEqA1ev7qlKWMNagwxFINJBqdbSYtXHeEXQ1KPmAZjog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFQeC6A4ioECYMKQCswH2NOc2lqxRlZn1RmMSfxE6Jc=;
 b=SQGnoTxd+cB4KVo3BMlebuvMHyfJfRDrUYn/8ovsv08M5Ss93ExFAQgv44seBfRQme1IhQF9pbfYc5A+mwfFsEGBvybppl2dfFSmyKFDRX6KMqp7aB/u/zL/WhPvJ0OPiO0xwqCOplCafNEjLS3WQVqk9FOGZ52IOaZe4RJWzd1OrtGz9l5ijhmImUM6zhmXIO+8LzVgsgWiBmELqYNB8s7jUnpMJgt8r694XyXoXNXgydOgbqo+WtGPrx/7HHyGDYvnQpraDsVolCogYGbJ9PLi/SXk0t1fwGoICxm5iQ+LCiDaExOzOpWsfEeywhsx2J1XJtlM1hLWlXma8yf6fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFQeC6A4ioECYMKQCswH2NOc2lqxRlZn1RmMSfxE6Jc=;
 b=cFisRzWJ7/ZFJ1hxlOuH0j8r0I3cdGCSlcqR7XxwQtYHdjNYOe5yIDo1p7iAE02jEdrr/qH0t3MLOzqb12dcP+GLj3NKhcz/oDImTWkOz5Jrw+Qq2k32m9RSCNw5a05RJDjcyV5ycPZVspzWCehobwBE0DWTsu+LaGxeGABT0cU=
Received: from CY1PR07CA0035.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::45) by MN2PR07MB5950.namprd07.prod.outlook.com
 (2603:10b6:208:ac::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.30; Mon, 18 Nov
 2019 15:01:32 +0000
Received: from DM6NAM12FT017.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::205) by CY1PR07CA0035.outlook.office365.com
 (2a01:111:e400:c60a::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23 via Frontend
 Transport; Mon, 18 Nov 2019 15:01:32 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM6NAM12FT017.mail.protection.outlook.com (10.13.178.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2451.23 via Frontend Transport; Mon, 18 Nov 2019 15:01:32 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 xAIF1Rs7012377
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 18 Nov 2019 10:01:28 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 18 Nov 2019 16:01:26 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 18 Nov 2019 16:01:26 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xAIF1QBY014848;
 Mon, 18 Nov 2019 16:01:26 +0100
Received: (from pgaj@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xAIF1QOv014825;
 Mon, 18 Nov 2019 16:01:26 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v3] i3c: master: cdns: add data hold delay support
Date: Mon, 18 Nov 2019 16:01:14 +0100
Message-ID: <20191118150115.13839-1-pgaj@cadence.com>
X-Mailer: git-send-email 2.14.0
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(189003)(199004)(36092001)(2351001)(8936002)(50226002)(54906003)(4326008)(70586007)(356004)(6666004)(51416003)(47776003)(26005)(336012)(76130400001)(16586007)(1076003)(316002)(426003)(42186006)(26826003)(81166006)(8676002)(81156014)(50466002)(2906002)(5660300002)(186003)(126002)(70206006)(305945005)(476003)(486006)(6916009)(2616005)(87636003)(48376002)(107886003)(478600001)(86362001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR07MB5950; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e0abb35-13c7-4f61-407c-08d76c3832bc
X-MS-TrafficTypeDiagnostic: MN2PR07MB5950:
X-Microsoft-Antispam-PRVS: <MN2PR07MB5950E8A426C5616419F6BCBBC24D0@MN2PR07MB5950.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 0225B0D5BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y7kd1aVHgkfTNNpWGfeCLCBOLj42jJSCQY2X8DbOwI0NCXvunB3kkmIgR/I02qeiUIfjztXW6lsxmxZrvkp0FxBpJL5EDxlSO0HJ59SCK30PnoWgI08vRKxOB6ZtWJ4lLgGPCf00zTfN+0fwj6KUiO1mgJ57+taedZHrgJUFb6I/lpVztlDPZkJRNvBnPeN1fFINE4Bv4oEFwgIQrYsRF7cm86LvKrSwl1YBonqt/2HGzF6drBvsR3PUsWbJaR4NRfX0DANGyQrH+kZNgENfVdgX/eG2PviJNhGJaqCz2hiC2yAGR3JqBkWlHrEBYVFfZgI+YvviC6dNDGoVtx0CUkh5EBWTC+CbnnBkLX/fIG8/etBTNPOUav8AKP708o9I4/nqwxu4qUMDum9m4LxTAjd5D8n3m6U6A8Clvmt52XQhHDKObIxh/afcFzkNJhWu9hCa5iygwHI/memHkg1TqQ==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2019 15:01:32.0580 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0abb35-13c7-4f61-407c-08d76c3832bc
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB5950
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-18_03:2019-11-15,2019-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911180136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_070149_273808_1B980EF8 
X-CRM114-Status: GOOD (  16.93  )
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

Main changes between v2 and v3:
- Add thd_delay_ns value and calculate register value depending on that

Main changes between v1 and v2:
- Add device-specific data which holds the thd_del value
- Remove device tree property
---
 drivers/i3c/master/i3c-master-cdns.c | 49 ++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 10db0bf0655a..81756b60a1a9 100644
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
+#define CTRL_THD_DELAY(x)		(((x) << 24) & GENMASK(25, 24))
 #define CTRL_HJ_DISEC			BIT(8)
 #define CTRL_MST_ACK			BIT(7)
 #define CTRL_HJ_ACK			BIT(6)
@@ -70,6 +72,7 @@
 #define CTRL_MIXED_FAST_BUS_MODE	2
 #define CTRL_MIXED_SLOW_BUS_MODE	3
 #define CTRL_BUS_MODE_MASK		GENMASK(1, 0)
+#define THD_DELAY_MAX			3
 
 #define PRESCL_CTRL0			0x14
 #define PRESCL_CTRL0_I2C(x)		((x) << 16)
@@ -388,6 +391,10 @@ struct cdns_i3c_xfer {
 	struct cdns_i3c_cmd cmds[0];
 };
 
+struct cdns_i3c_data {
+	u8 thd_delay_ns;
+};
+
 struct cdns_i3c_master {
 	struct work_struct hj_work;
 	struct i3c_master_controller base;
@@ -408,6 +415,7 @@ struct cdns_i3c_master {
 	struct clk *pclk;
 	struct cdns_i3c_master_caps caps;
 	unsigned long i3c_scl_lim;
+	const struct cdns_i3c_data *devdata;
 };
 
 static inline struct cdns_i3c_master *
@@ -1181,6 +1189,20 @@ static int cdns_i3c_master_do_daa(struct i3c_master_controller *m)
 	return 0;
 }
 
+static u8 cdns_i3c_master_calculate_thd_delay(struct cdns_i3c_master *master)
+{
+	unsigned long sysclk_rate = clk_get_rate(master->sysclk);
+	u8 thd_delay = DIV_ROUND_UP(master->devdata->thd_delay_ns,
+				    (1000000000 / sysclk_rate));
+
+	/* Every value greater than 3 is not valid. */
+	if (thd_delay > THD_DELAY_MAX)
+		thd_delay = THD_DELAY_MAX;
+
+	/* CTLR_THD_DEL value is encoded. */
+	return (THD_DELAY_MAX - thd_delay);
+}
+
 static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 {
 	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
@@ -1264,6 +1286,15 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
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
+	ctrl |= CTRL_THD_DELAY(cdns_i3c_master_calculate_thd_delay(master));
 	writel(ctrl, master->regs + CTRL);
 
 	cdns_i3c_master_enable(master);
@@ -1521,6 +1552,15 @@ static void cdns_i3c_master_hj(struct work_struct *work)
 	i3c_master_do_daa(&master->base);
 }
 
+static struct cdns_i3c_data cdns_i3c_devdata = {
+	.thd_delay_ns = 10,
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
@@ -1532,6 +1572,10 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	if (!master)
 		return -ENOMEM;
 
+	master->devdata = of_device_get_match_data(&pdev->dev);
+	if (!master->devdata)
+		return -EINVAL;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	master->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(master->regs))
@@ -1631,11 +1675,6 @@ static int cdns_i3c_master_remove(struct platform_device *pdev)
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
