Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2724CA1011
	for <linux-i3c@archiver.kernel.org>; Tue,  5 Sep 2023 21:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fpMwEEl2LMfG9mHTirvEfc8ty3TbdHV+WxFHQGdY6I=; b=E8dp+7CvOpTW82
	d9fWkJUODFINfdlw0r6f6uueuchN+LB5X5vQNYJGLNaJwXWFA100Rw6pF0hrQatWPsy2t4nWxLZYF
	KritAqS03/O6t8pLjt9rxJLPalpbPg2VlpG6XW46L37wK0mAAnmgRovO2QRjmIQ5QgMfuaAbyr/Kb
	xMiuXu2ER7EDkeosQp3baNXtAHJMBeyi5gG6SVaHdyGPJWdSV4xYJGnEibGNc7n+AoqAYfG1EXVC3
	aKUnerGWtL5OkeFw86cBSFP4EtWzbgVRaztNH+RlMdepeor3bUwyCK6BPR5IsZan5ksa43X0gjpxD
	nvhe+UDQ3bsBKkVWnrMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qddlV-006lj1-0v;
	Tue, 05 Sep 2023 21:39:17 +0000
Received: from mail-db3eur04on061b.outbound.protection.outlook.com ([2a01:111:f400:fe0c::61b] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qddlS-006lfI-0X
	for linux-i3c@lists.infradead.org;
	Tue, 05 Sep 2023 21:39:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjRkvqMjIyAo8bDace0a76AHOJLB39o5DaaZOtolfsxcZ14tFWf/Ypl2EiM4aGJu63kvr2PsTwRnEsTvMnoQ6st5v1Wr73KhRD/M83u1sdl1pjD57G43UpowHsP+xAO4YNf77Gh+R4FDD0xvdp8sh+OmQsRKGaIsRJCrx+Du0k1a+uLllehn0dJC95+XI7c7KutOr8HgQtOBBQLgeDLiLv6n5iup5TTbqKUtVEpll5pzEEv3tXMfYrK8C5CxWY8pQLNk1DWF5yVL+zrlYE4KcRIc0GpuDlH/BG7/UEcaPb2vdJS4RSBZmDFWS4WtvgAcGSxfYCYIj9wx4c0n8ddqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Gz6GFr5dSdKV1RrerMs7k1IQ4bqOyJkUlukRjdjics=;
 b=hF6NnpTQolxe+TVk8iX1KKyMyUWLZ5G3hssv8E1g93pIcHev5Anyv599G4QHmC7985irpJi0sbqYoS5RRrkh9VekziDyFAmE/royEpJDwvuefHZW41J/yP4MZ2i+dRlU5V8n2sPsiyzlLnSW7SH0NxxfIUMp/e+hc6f00GCyzEt+XMrPRtyBwraCELHZppaLRnBihxfbyvU4J/MqZE8KbpIY9p0KuwxTQ6WsJX+TTHz6TeuL3iea+HXZtlaVNQpUZY6Sl+mP57WsMrFt80RhOuSNw2QLrYzdbWHVbqBE44MaoV0WYXulbZgpH42QzcmWjvnHWmf8ZHoCsgFO1YifbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Gz6GFr5dSdKV1RrerMs7k1IQ4bqOyJkUlukRjdjics=;
 b=USp6DRQoZgTEPKjlqiHUlEsavv7dIhwUfmFrf1MYps+p51WgpEEwDno57ZnBrl1vN7l3EezVesFDOm7ByzpuXpjf5UeWRzKlBlBd8sUywan+/HcF0jPEM7jMGhvio+qe/hZeY89ABOCS815pCDX4/j474cequ0LdquRGdLMnod4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAXPR04MB9256.eurprd04.prod.outlook.com (2603:10a6:102:2ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Tue, 5 Sep
 2023 21:39:05 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::aa90:117d:c1d0:346a]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::aa90:117d:c1d0:346a%3]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 21:39:05 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/9] i3c: svc: rename read_len as actual_len
Date: Tue,  5 Sep 2023 17:38:35 -0400
Message-Id: <20230905213842.3035779-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230905213842.3035779-1-Frank.Li@nxp.com>
References: <20230905213842.3035779-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PAXPR04MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 20dcb33f-345b-4fae-c475-08dbae588739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nuTtVyBjgVHmt/styeByVSsUiPsatE08RlzeCM78tWvUDYDn0qYBDl40VDZMuEMz4nkCESkvJnUoZbGQ/M3XLnjOb0ZtqCpINEdOXC5i7Vzk4XODSaRzdP0nK2SQ4KoYO0P7B692Z9XJc57Qeu3YyptaVK5kriyL+9oPP0HJXxpSqNjs3aMiFKd9C3IN6WjvT7hkI/7cejKKrZzy2aAlkQy9iir2dFtOozVZEcVaY1RJtD+53PojopRIjkXPIlNIoytUyO2Ar8WPzIUpAVA1M6J4WsYJXHv/m6POltd9LG8xdqYV7/yyEX+K3pNiGWRRxWHCkgyrH8VCslTxL9a9okrq6G2xjhvcohi88IxoVGmr2DSKeQCj6gdTVNeNLnXGrU0d2IXII+fC5r0W4wLK/rxqeEIWa52jaFLlkCfSYpjxn7K8lbum3sWFQKdWdmNApggx4BbZiJ+RfM0LTd0PmsT3JWaIu/ZR8AVaDdlgrp7o89UJu8+6/PN8pR4kpzEPuLiasHl3YAEyc5S0nskTh4pf/F+xK9w0xmeDnDFPrtDxHbKsEHQxXA0e3cHzeN6m1IkLPEN3FCtFkAc+sLjz5eKdpjCNi3aPg7zKER7SRp1cv+PGL39Y9VzD12Cnv0Oy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(366004)(346002)(136003)(186009)(1800799009)(451199024)(2906002)(83380400001)(6486002)(52116002)(6506007)(6916009)(316002)(66946007)(66556008)(66476007)(478600001)(26005)(6666004)(5660300002)(1076003)(41300700001)(8676002)(8936002)(6512007)(2616005)(4326008)(36756003)(38100700002)(38350700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MeCmOOB5gt27zTaghh8iJWXsrj4PMoTWh64TJP0rFlInHrPO+iK/GW6Scboi?=
 =?us-ascii?Q?X+4E1FyKQKLbRA3jMg0yaYFRZH5aIPgB4Z3NutFqG/Rz1KzS0KAU+UVvTR7U?=
 =?us-ascii?Q?ccr3xe5UTgGZgBZBVroAwxAnYNZ/oaFbSoL+HFTxK4lWoh4Bxk0OzH5La2BT?=
 =?us-ascii?Q?Wq/tQh7jRE0KsISxfgVRclzbDJTf+uTvPEim9gxUp/Z+immJ97fgOx298Ptr?=
 =?us-ascii?Q?Mu9GQQrwuRvizvPRLhf3jFiPnAOw6WD43K3KZw+sOBw+eO8fCCwLfgyHIsLR?=
 =?us-ascii?Q?YmA0ZRyGOVKio33bhQpDTYaTb8qnZgWz/W0OGPgk+oPEboGR+wTfyO+AO/du?=
 =?us-ascii?Q?hBofTXQ5dTRopSFg7B/S1dia2uLE1+Wb3q9DmZ8gzlPCE/a0IDTPlKrirWbe?=
 =?us-ascii?Q?SFcdjUrS1VurPzVuPO/XcVdkOdWmBmLhUxVMgtrrfGzyNf76NiGoPvn0q1f6?=
 =?us-ascii?Q?9JKkFwiZlbV03GlFkHHhFdILN4iS5rYas6zQ4ADJwHh4D7fDoONFCrEMGZDU?=
 =?us-ascii?Q?L3/IJ2zIIm2BDQUVxcQ3VWazHbzyl9h3ng0Q2K+qHJ15Pi41vMr5bulvSmc9?=
 =?us-ascii?Q?UXMVkUqO4jajoVHLIO/fz0DToQi6zKXucpq1Pue6EPKeY9hqeNvyULFpttlG?=
 =?us-ascii?Q?AdCfSNGx5bE66e6Bh6U8Ir+97x3q14k6wmBlGU6gf4HFOwY8Kz/6oF62JOf/?=
 =?us-ascii?Q?YYGkgdfg1tDNwAQwuuW7Dut7T46Ma0VeQL5Gg7wFbxpkuva1HOA9GhjGWIhT?=
 =?us-ascii?Q?+t0VJXtCjULpdCsAjI6iL9bkuzuTTLkbTskiVnoyGyq3hsc1Le1eonR5Qo/y?=
 =?us-ascii?Q?RkdQNy1mwh9Yto4Kch3qVd/t/8ITtaaOuMcmkYOsiCb9l2OQxJEu6It2AgHx?=
 =?us-ascii?Q?RBROaf7da2K9kBtIr7loDKQtqIHpjvXRbrp9+UJVruzkognENBxpSXyPZfHN?=
 =?us-ascii?Q?0zD4xfXa0H+I2INjvc3/BuqAb34mh1L1cuhTAQXYHjQ39e6xmEyc/iLyQlSh?=
 =?us-ascii?Q?LyuzqqFJQl/vphZkb9jM5IWJFZqORPT2a6ibfVqxvmxVmtH+J/psBewZlT/F?=
 =?us-ascii?Q?zpkg3XcQ7jbEJgdnQWfkRRtwm9OrZzzmZpz2bczekLA6lh10aDjrnWeGamZA?=
 =?us-ascii?Q?tymYOaSHLEOawImpCmEv/2OjQTKcK+PYsTZf7bBVNJXK5W3mGfQ7U1gr44SI?=
 =?us-ascii?Q?PeFgJcJShI69iHfVHr7xjk0DM31jfwTUobafBmxkToDaIXu3yXnoFgtB4sdp?=
 =?us-ascii?Q?niSm/lspbO7DeKMBQTxHqFmyU+OwfvWu6tj6JIBjg0wRVBPFWn0UF64RExWB?=
 =?us-ascii?Q?auFvzjfqLsTIKgFHFowh3HAWhm5xycaU/c+9G14QoUI6piliHqtAKJSVRRfr?=
 =?us-ascii?Q?cSeKuG+pWAMNp598F8Pw80hUuMdrq0L196fpEvRc2HIEnox/tCEWPDhTGqib?=
 =?us-ascii?Q?GCs4jNoxkjRz6QP7Nqdtryo4qvt0O8jMrJICazvidMVp0rWg5rGqTsYRpM+e?=
 =?us-ascii?Q?8uqxCXVNxXq3gRa4/e9pe42GW/fmygS0WVdoJ1j2g2m1e3m1T25NQ/AdY2uW?=
 =?us-ascii?Q?ZnZvnmGU5YDXgcE4fO2hDdEn30Zk1dfL9V0emTto?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20dcb33f-345b-4fae-c475-08dbae588739
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 21:39:05.3526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQWy1bP87XjKqn7LpradKg5VOT2jIN9n16/KGre27sC9SQW1q/3lNrw8Nc0i1N2kXWtUQFIoQvD3yjP37ACInw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_143914_206957_BB8DCCC8 
X-CRM114-Status: GOOD (  12.02  )
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

Device may NACK data transfer because FIFO full. Master side need know how
much already transferred. Driver can reuse variable 'read_len', so rename
it to void confuse.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/svc-i3c-master.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index c308e22f0ac5e..14185ee7dd19b 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -133,7 +133,7 @@ struct svc_i3c_cmd {
 	u8 *in;
 	const void *out;
 	unsigned int len;
-	unsigned int read_len;
+	unsigned int actual_len;
 	bool continued;
 };
 
@@ -1001,7 +1001,7 @@ static int svc_i3c_master_write(struct svc_i3c_master *master,
 static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 			       bool rnw, unsigned int xfer_type, u8 addr,
 			       u8 *in, const u8 *out, unsigned int xfer_len,
-			       unsigned int *read_len, bool continued)
+			       unsigned int *actual_len, bool continued)
 {
 	u32 reg;
 	int ret;
@@ -1011,7 +1011,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 	       SVC_I3C_MCTRL_IBIRESP_NACK |
 	       SVC_I3C_MCTRL_DIR(rnw) |
 	       SVC_I3C_MCTRL_ADDR(addr) |
-	       SVC_I3C_MCTRL_RDTERM(*read_len),
+	       SVC_I3C_MCTRL_RDTERM(*actual_len),
 	       master->regs + SVC_I3C_MCTRL);
 
 	ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
@@ -1032,7 +1032,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 		goto emit_stop;
 
 	if (rnw)
-		*read_len = ret;
+		*actual_len = ret;
 
 	ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
 				 SVC_I3C_MSTATUS_COMPLETE(reg), 0, 1000);
@@ -1114,7 +1114,7 @@ static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
 
 		ret = svc_i3c_master_xfer(master, cmd->rnw, xfer->type,
 					  cmd->addr, cmd->in, cmd->out,
-					  cmd->len, &cmd->read_len,
+					  cmd->len, &cmd->actual_len,
 					  cmd->continued);
 		if (ret)
 			break;
@@ -1200,7 +1200,7 @@ static int svc_i3c_master_send_bdcast_ccc_cmd(struct svc_i3c_master *master,
 	cmd->in = NULL;
 	cmd->out = buf;
 	cmd->len = xfer_len;
-	cmd->read_len = 0;
+	cmd->actual_len = 0;
 	cmd->continued = false;
 
 	svc_i3c_master_enqueue_xfer(master, xfer);
@@ -1218,7 +1218,7 @@ static int svc_i3c_master_send_direct_ccc_cmd(struct svc_i3c_master *master,
 					      struct i3c_ccc_cmd *ccc)
 {
 	unsigned int xfer_len = ccc->dests[0].payload.len;
-	unsigned int read_len = ccc->rnw ? xfer_len : 0;
+	unsigned int actual_len = ccc->rnw ? xfer_len : 0;
 	struct svc_i3c_xfer *xfer;
 	struct svc_i3c_cmd *cmd;
 	int ret;
@@ -1236,7 +1236,7 @@ static int svc_i3c_master_send_direct_ccc_cmd(struct svc_i3c_master *master,
 	cmd->in = NULL;
 	cmd->out = &ccc->id;
 	cmd->len = 1;
-	cmd->read_len = 0;
+	cmd->actual_len = 0;
 	cmd->continued = true;
 
 	/* Directed message */
@@ -1246,15 +1246,15 @@ static int svc_i3c_master_send_direct_ccc_cmd(struct svc_i3c_master *master,
 	cmd->in = ccc->rnw ? ccc->dests[0].payload.data : NULL;
 	cmd->out = ccc->rnw ? NULL : ccc->dests[0].payload.data,
 	cmd->len = xfer_len;
-	cmd->read_len = read_len;
+	cmd->actual_len = actual_len;
 	cmd->continued = false;
 
 	svc_i3c_master_enqueue_xfer(master, xfer);
 	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
 		svc_i3c_master_dequeue_xfer(master, xfer);
 
-	if (cmd->read_len != xfer_len)
-		ccc->dests[0].payload.len = cmd->read_len;
+	if (cmd->actual_len != xfer_len)
+		ccc->dests[0].payload.len = cmd->actual_len;
 
 	ret = xfer->ret;
 	svc_i3c_master_free_xfer(xfer);
@@ -1304,7 +1304,7 @@ static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 		cmd->in = xfers[i].rnw ? xfers[i].data.in : NULL;
 		cmd->out = xfers[i].rnw ? NULL : xfers[i].data.out;
 		cmd->len = xfers[i].len;
-		cmd->read_len = xfers[i].rnw ? xfers[i].len : 0;
+		cmd->actual_len = xfers[i].rnw ? xfers[i].len : 0;
 		cmd->continued = (i + 1) < nxfers;
 	}
 
@@ -1342,7 +1342,7 @@ static int svc_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 		cmd->in = cmd->rnw ? xfers[i].buf : NULL;
 		cmd->out = cmd->rnw ? NULL : xfers[i].buf;
 		cmd->len = xfers[i].len;
-		cmd->read_len = cmd->rnw ? xfers[i].len : 0;
+		cmd->actual_len = cmd->rnw ? xfers[i].len : 0;
 		cmd->continued = (i + 1 < nxfers);
 	}
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
