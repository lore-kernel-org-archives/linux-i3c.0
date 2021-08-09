Return-Path: <SRS0=LFUb=NA=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDE9C4338F
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Aug 2021 06:36:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DBCF60527
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Aug 2021 06:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DBCF60527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CzfbD7m1U3jp5TTliZDOuFBtfadV7uIY47K0QrX3rVA=; b=r8C5JglrmXf/yf
	+w9Z0XC84zAuOXQDFiwcfWlGjBnMtD9bMjLuQop0ups4fPpq0uo6OnAdu8zPpVbE7ZFPg+RIyP74v
	p5fN2UpV0WJIE5CHaeMuWQh9z7FQH9QfjoNMR7MAoCgXgD1Ux0kV0aReKcIwstOu2SSOZmyplKhx2
	ENaAzfJXir1CBiJaGRKj+pMAGUmF9zDr7nLTIJJlGeqMSiv7ipUav3g4poSPNHshI9AT9loOmHcvr
	CP64XHR8qj8jN6bLlh9hEINC4dCF8ODtZFYddnwuqs3ISeMKnWtyaDSfhfPO4SFVJUFoRUsgZ/tOJ
	kEYvyTC5p/iUa0V5HLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCytc-00HGFT-2j; Mon, 09 Aug 2021 06:36:24 +0000
Received: from mail-eopbgr40056.outbound.protection.outlook.com ([40.107.4.56]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCytZ-00HGA9-Nn
 for linux-i3c@lists.infradead.org; Mon, 09 Aug 2021 06:36:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVqx0MAlPdXKguh3pJmyoKTOYQvARYQYVfFTqE4v38Afhau/TGHtAf+r8AjNNEXq16I8z7IZo8ZkP8qakkl+z4PQ7Kq1xg8nD09YSctHKxYZNe1fH3DIVP539m5UTI437nEehBfF3C3RB3JrnzqPkCWIC8ydleHeb/NwgDNYU/ONm2G1NvZSREqG625CvbzzoBMd/InknjAmvqAarvfgNB37yfWTO3JpMJIO/iRNo6A9oPU0AHWcKc3UqkRFstoUHmMrJRqK+GKY+D4Lw1qOYUHvxemL6l21tvgZsI2qAlaQ6nFUsN7WU90pMJXbai7pKN9RuvVOphvA8eGlENo4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cwS0C8kyFR/MiM7Y9xJZjC6zbKdcENBDINfpZwUwpY=;
 b=Y6ed6ph5CBGgZdSh3wqwRjKJiWzo5jDQcCrIXCR89h5Gw9zpmkR3/P8W7JEPgH0VWKmq5PRQZZc7N1ZnoWj4u9TpqA25elPdwXSiWFqT221biCfesZ3cOYZRO7PVbOkNoVopewplFn2wGoAL+AXQuGGUQ5HmnSTZ2k43zNCNEyB6IplEt96+IVrVxGHs+Fa+6yaEJVFr7Qbp8W4M9tZBx5r8klrBmePajLGA1nwgZ9q5pDe/x08zanWC5InR6PljjM4+UxgkX/b4K9rU2NnMG+EPp1kqf9ioMrhKxUWriLKGHSt86e6aTIDAXR0uzZtUmrGadpEKrxJtGesuvqDPbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cwS0C8kyFR/MiM7Y9xJZjC6zbKdcENBDINfpZwUwpY=;
 b=G3nJyZSogf8Wl+uN6gz2MB+/Y84SyBYZm333QTwTRXxPZLXQCsfjOlZVWo//Mr+O9d2M2KpMu77SIm+R4/xLM6ayj3VzPXSNiXLmW5VFA2ID4/qXAZvOkU1n3h5R4a/Btf8Qc06RH+JU9tObFciKG31mLmGBFxb/+GHXHoEoDTo=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AS8PR04MB7653.eurprd04.prod.outlook.com (2603:10a6:20b:299::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.20; Mon, 9 Aug
 2021 06:36:16 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265%5]) with mapi id 15.20.4394.022; Mon, 9 Aug 2021
 06:36:16 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
 alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-imx@nxp.com
Subject: [PATCH V4 4/8] i3c: master: svc: add support for slave to stop
 returning data
Date: Mon,  9 Aug 2021 14:36:41 +0800
Message-Id: <20210809063645.2289988-5-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809063645.2289988-1-xiaoning.wang@nxp.com>
References: <20210809063645.2289988-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To AM6PR04MB5623.eurprd04.prod.outlook.com
 (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by
 SG2PR02CA0103.apcprd02.prod.outlook.com (2603:1096:4:92::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Mon, 9 Aug 2021 06:36:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4fb22ff-d770-42c9-1f7d-08d95afffd8e
X-MS-TrafficTypeDiagnostic: AS8PR04MB7653:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB7653C5A4CE4B8F4FD686264EF3F69@AS8PR04MB7653.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AA+mZksjXNEQQZD+H1Kgl2H4DptMmObx+Ibse55R2+4QgSEHil9ydw+Ms7nvZf0JxDwkwFxrTgJPTeYgjDUd6TTcZMa4pXYJR6fyI77NlajP0B03joBxXZn0KzcL8t3xAZ6JqOKeElUdfYetN2hwP91Q6frWYehflyD8Sd9mkpTySppLF3ovxzPgrlYiI4xPIUnimCtATak4kA+G3aqIW6wnCe6Unqboo7NMH58FVPzmOhBlfyCdqpSspi/YkFxtOZFIf5sZo9mQJEPlZ9RROTr7ZV1Gwac+IdvRJdNAaPUip5dNK4vb0eOgmief9hnf9X22BWhIRB4VY27Sv2OUuhGphG3SV2AQuypFXMpDrhMEpgNIaKgATkLFxRimp1nY6/b7M8fefjPVzhzC2LLGB1ixAmm/4AuEDecv0pc5GtjaKirSQLBcyrr53Ju2XzhNjrOtmnMXI0vzHJb+tgI2gbHZlVTUbVV49jPf2fzf1YuI2GmAvkOq1JtHLEnWg4sk0vap1zmXonU9VyoZr+KJogwcTkn1E3wY6d+2doXsuefM6pemyy8lApCrnXOM3EBB91u7rfTX45qJnWc7lqZozDJobQ8M5DkpFtSquVbHUpqkDnrqkp05U44aNsth5JaJr38qSPqn/mF7wFLRlcKPJ/wcclLtX7+ZwyonZnzVG3lNWrkKvscfwrZXTR2lHiX+qpY17vVxY0b1lcVmoU9buA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5623.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(38100700002)(38350700002)(478600001)(86362001)(36756003)(316002)(186003)(2906002)(8676002)(83380400001)(2616005)(956004)(6506007)(4326008)(26005)(52116002)(8936002)(6512007)(1076003)(5660300002)(6486002)(66476007)(66556008)(66946007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5ldX/i25twtpqoGMliQz3DCpsZFyb3sryHgzf3X8xOE+IGIo69Lv4jFw71i/?=
 =?us-ascii?Q?igR5kRjnNlGBl1d1rorSNJyZUWCJzcpIbJD0UJUtYAZfDx/LeYBGobmlG/jK?=
 =?us-ascii?Q?q8drM9ZhfCg276h3mqk9ZMzFwuBWGp2ussGUArCxQeOQpFZOQdgKggNYzuv7?=
 =?us-ascii?Q?YCHsh941YY/QZTDulkXId6D9WzENNUeViOS6KDi69WUQWlmeFo246o4NO7Mv?=
 =?us-ascii?Q?Q61AHqcjUeOh4m88kZPGk0bqgpdYNuffCXxpaWTJjslg9sYVoDT70bAsdHPn?=
 =?us-ascii?Q?LmzLPf4G68P5tcvF8k3LMmWtuseqgkYzDdq+xidvYXmIa6cmRJeTPC8T9HbX?=
 =?us-ascii?Q?mvAF0RvN26XXpi42SV3nVoiywBiJu9xg7EZjMcPrRlW9u0VPnd1QCSx/SRym?=
 =?us-ascii?Q?eLZmOjShhsVBW74L9eT79OS8Pe6MeyxUwFAYSCxsPfTNNyW4njgyGL3R3B8E?=
 =?us-ascii?Q?djVQqr4Yk4cDwAkcUNIkN5U0ID95wv9kyo2H6MlGiFHiwTF77kw1FwpmNRFb?=
 =?us-ascii?Q?iJ+9fC9Q72vBI6kHn7aYziLpP6PU7pA5rtu78EKMVu2RgqsRAhWwl9KapKvg?=
 =?us-ascii?Q?hRXbVMh4jj1PklVBA/RnXNex4aVWtBnnHPBA5RU4CiHApZQpKhQSvr9GmPJ4?=
 =?us-ascii?Q?3y00l9e62cNigUn+MWKAW6FVIgauMFPS10LjTIPdhho7b1lRUYNgPTOurBaU?=
 =?us-ascii?Q?D79IcG/UTnewFQou3ind5yxa8p37pNXoVZgSt5sLPwIh29Up8F2CYM9fQU6K?=
 =?us-ascii?Q?atktT6IeusrV2bZk+cTsBv7G0Czo51+K+/QGr1YGKtjvxL4Qh9btlg51X5Hj?=
 =?us-ascii?Q?xRceC6DfQHHX04IKg/EMX0aEXEgMD98pG63PYS/4SteOLy+294/xolnGA6/Z?=
 =?us-ascii?Q?lqGmoegriB4a0aCIdXlvm+PKUyJkBBLXT0WMyqaHDENptzdZOZLb0va584CM?=
 =?us-ascii?Q?v5BAGLDr77Lk3KaDlljE9KlV2bZvyx4S9DnYxxOu6J5OnXbB5p8NO+CJXYyB?=
 =?us-ascii?Q?MACF7w8QIWlQvPxffxdx/4jyH0qc9WfdlYUga+eUvGTRLJ8lJPMG/+zbfELR?=
 =?us-ascii?Q?PXbsRFhpfnRsyQOyzOIbOgCTThBevshLb1pNp0vmLWWl6SEZrA3AKBw3UDHL?=
 =?us-ascii?Q?OPtlnieiLWpXK14rwbjqBP4QJ1irw09HEHuR9fCpnRgCoZtD1v07rzPLAkPN?=
 =?us-ascii?Q?OjTA22E6ni/LOQXxawBbOoRSFXIAjUqayHOgHmmGBT+K9exAen8RZPVa5NTu?=
 =?us-ascii?Q?+2o2ox17Xk4t0nSK9WwQMxvorcfY1XFES9fdrcCrjBm0atJsBX9wtn7m3qNj?=
 =?us-ascii?Q?7BVf50c1vwrPoswZC13OQg5S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fb22ff-d770-42c9-1f7d-08d95afffd8e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 06:36:16.8984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HoMgovNsusQPp8zGqN1rqhKTr2n/5M7ZRMp/zbeNmolEgYl0mewVX87RaKlR3SuKHuabkjrEzQmYj39GmmV6mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7653
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_233621_809114_416E04D2 
X-CRM114-Status: GOOD (  18.89  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

When i3c controller reads data from slave device, slave device can stop
returning data with an ACK after any byte.
Add this support for svc i3c controller. Otherwise, it will go TIMEOUT
error path when the slave device ends the read operation early.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Reviewed-by: Jun Li <jun.li@nxp.com>
---
V4 changes:
 - Only use COMPLETE flag in the read function.
 - Add a reset before each transfer.
V2/V3: No change.
---
 drivers/i3c/master/svc-i3c-master.c | 56 ++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 4e69c691253d..e767f307db2d 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -896,27 +896,35 @@ static int svc_i3c_master_do_daa(struct i3c_master_controller *m)
 static int svc_i3c_master_read(struct svc_i3c_master *master,
 			       u8 *in, unsigned int len)
 {
-	int offset = 0, i, ret;
-	u32 mdctrl;
+	int offset = 0, i;
+	u32 mdctrl, mstatus;
+	bool completed = false;
+	unsigned int count;
+	unsigned long start = jiffies;
 
-	while (offset < len) {
-		unsigned int count;
+	while (!completed) {
+		mstatus = readl(master->regs + SVC_I3C_MSTATUS);
+		if (SVC_I3C_MSTATUS_COMPLETE(mstatus) != 0)
+			completed = true;
 
-		ret = readl_poll_timeout(master->regs + SVC_I3C_MDATACTRL,
-					 mdctrl,
-					 !(mdctrl & SVC_I3C_MDATACTRL_RXEMPTY),
-					 0, 1000);
-		if (ret)
-			return ret;
+		if (time_after(jiffies, start + msecs_to_jiffies(1000))) {
+			dev_dbg(master->dev, "<%s> timeout\n", __func__);
+			return -ETIMEDOUT;
+		}
 
+		mdctrl = readl(master->regs + SVC_I3C_MDATACTRL);
 		count = SVC_I3C_MDATACTRL_RXCOUNT(mdctrl);
+		if (offset + count > len) {
+			dev_err(master->dev, "<%s> recv len too long!\n",
+				__func__);
+			return -EINVAL;
+		}
 		for (i = 0; i < count; i++)
 			in[offset + i] = readl(master->regs + SVC_I3C_MRDATAB);
-
 		offset += count;
 	}
 
-	return 0;
+	return offset;
 }
 
 static int svc_i3c_master_write(struct svc_i3c_master *master,
@@ -949,7 +957,7 @@ static int svc_i3c_master_write(struct svc_i3c_master *master,
 static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 			       bool rnw, unsigned int xfer_type, u8 addr,
 			       u8 *in, const u8 *out, unsigned int xfer_len,
-			       unsigned int read_len, bool continued)
+			       unsigned int *read_len, bool continued)
 {
 	u32 reg;
 	int ret;
@@ -959,7 +967,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 	       SVC_I3C_MCTRL_IBIRESP_NACK |
 	       SVC_I3C_MCTRL_DIR(rnw) |
 	       SVC_I3C_MCTRL_ADDR(addr) |
-	       SVC_I3C_MCTRL_RDTERM(read_len),
+	       SVC_I3C_MCTRL_RDTERM(*read_len),
 	       master->regs + SVC_I3C_MCTRL);
 
 	ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
@@ -971,17 +979,25 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 		ret = svc_i3c_master_read(master, in, xfer_len);
 	else
 		ret = svc_i3c_master_write(master, out, xfer_len);
-	if (ret)
+	if (ret < 0)
 		goto emit_stop;
+	if (rnw)
+		*read_len = ret;
 
 	ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
 				 SVC_I3C_MSTATUS_COMPLETE(reg), 0, 1000);
 	if (ret)
 		goto emit_stop;
+	writel(SVC_I3C_MINT_COMPLETE, master->regs + SVC_I3C_MSTATUS);
 
-	if (!continued)
+	if (!continued) {
 		svc_i3c_master_emit_stop(master);
 
+		/* Wait idle if stop is sent. */
+		readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
+				   !SVC_I3C_MSTATUS_STATE(reg), 0, 1000);
+	}
+
 	return 0;
 
 emit_stop:
@@ -1039,12 +1055,15 @@ static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
 	if (!xfer)
 		return;
 
+	svc_i3c_master_clear_merrwarn(master);
+	svc_i3c_master_flush_fifo(master);
+
 	for (i = 0; i < xfer->ncmds; i++) {
 		struct svc_i3c_cmd *cmd = &xfer->cmds[i];
 
 		ret = svc_i3c_master_xfer(master, cmd->rnw, xfer->type,
 					  cmd->addr, cmd->in, cmd->out,
-					  cmd->len, cmd->read_len,
+					  cmd->len, &cmd->read_len,
 					  cmd->continued);
 		if (ret)
 			break;
@@ -1173,6 +1192,9 @@ static int svc_i3c_master_send_direct_ccc_cmd(struct svc_i3c_master *master,
 	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
 		svc_i3c_master_dequeue_xfer(master, xfer);
 
+	if (cmd->read_len != xfer_len)
+		ccc->dests[0].payload.len = cmd->read_len;
+
 	ret = xfer->ret;
 	svc_i3c_master_free_xfer(xfer);
 
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
