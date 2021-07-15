Return-Path: <SRS0=stO+=MH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3E3C47E48
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jul 2021 08:23:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F17E0611C0
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jul 2021 08:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F17E0611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dk3+0xHkGXshHMCytmIDLzWgb2U4ntmXjtBPblL3E+E=; b=AdDjDIbuEZNco8
	5O07BvW44Q7otmFBsmYXy6ubPhH8SkKSUn5zp9q8/BIQYFpqmb/k9tx+ypVHn/T6ppkz2f6cPNTRT
	ZYO05eDqPPOZhoy1zsesw09vfgywsmOxTiIxq7iWDsTQd8MigD6l8phhboUCiWr6M6+BvrtcKct1J
	mzTWZutgJVmXtOCozuQ8fEdO1kHr8JR/KUoIVZQqYbc1b6MaTD/mW+jBZ1F0/6RWu//9JtUgD5c2d
	/4c5rG4A5ysvb4fxUnnQ2IGesl5E9H9drIhLZZQ3Gl5GxW/3iZKKZR1JEtTkKNZSupadHptPxsggL
	2l6VXpamju+HxfR9ngwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3weH-00HUlu-Gi; Thu, 15 Jul 2021 08:23:13 +0000
Received: from mail-eopbgr70043.outbound.protection.outlook.com ([40.107.7.43]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3weF-00HUjB-GG
 for linux-i3c@lists.infradead.org; Thu, 15 Jul 2021 08:23:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GA8S0d4xDtf5UprxhdP8iMkVXV5pqVzFUbLqOAYPe4Sl99rVhirCBf1UbdRee1FoITWothOF7y29dIZegoCVC9f+M1DpK810I2/Z5sjwsIqCitV4cY+DKLD/9ptpTvZsVvUEtZo8t2Bbwe34Q37foMo09wVlB54JUAA4V6cu9cmmVzbuSfG3iYY+BUHzMHFI3wYCnkm2/IGi40wfDF//bDk2AkvESAP6bdZuXb5soMVDX3Pa9Eb0sUhbYkoUHdXVfQzHySV9AUEe8thN60ajzAwaF7FItrPAElUvqOjBei+OPQHjPScZyQYmxOaf7YiqGIJ2z+nTW9Em9rqBNn1XCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vd2u85EQHfIUwDOF1edyjqV4WPQt8RLvwo+Y9WVIL2I=;
 b=Bxy/6C3UPVI5MOtXpI/ckJrWWvsPvCgtihU7XBpMIy02NNaQmczjxo+FRs9Bobd8oEgDB4717YqnI/VVe5pM/Z1s94LJ8Tqda4nh4+Y9XKBKDrbKkfSqzqO4ZYOMWkQWl+2RQuLWtFvnqx8Dfyfy/stEebiMRcQ+qLPPj76jAFnW4jNyJAK00Fon5rzSSKFeJkj8qk0CZ2kmFZOVQt4xksm73LEk3QNw49bxEnEUmfKzB5Zn+1RP/2wxWn6OmCJ+tThB0OfUwu55sCTUELvtMW2NVm4YnQf2NdlcPCiQUm0m5f18U6YIMZnc7MpkbTQB0lnVHoMinANrxu5OHz4UKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vd2u85EQHfIUwDOF1edyjqV4WPQt8RLvwo+Y9WVIL2I=;
 b=MgdPGoyY0HNa5mP8Gf4+r+RGiCSL1yhL8M5Skq8aP5uzqvHRms8akYPObe5EyqX5lZfF9NKAB6urqT9gQw7MTVEILApnH5rwj+Wm4yYTKAv3fcmpMdK6b+Cyu/SgtIYJLi9jk36Kp6eu5aASwCeT2Ux86qu/R+djgqyil8VRwWM=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR04MB4167.eurprd04.prod.outlook.com (2603:10a6:209:4e::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 08:23:09 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265%5]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 08:23:09 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
 alexandre.belloni@bootlin.com, vitor.soares@synopsys.com,
 boris.brezillon@bootlin.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaoning.wang@nxp.com
Subject: [PATCH 3/4] i3c: master: svc: add support for slave to stop returning
 data
Date: Thu, 15 Jul 2021 16:24:12 +0800
Message-Id: <20210715082413.3042149-4-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715082413.3042149-1-xiaoning.wang@nxp.com>
References: <20210715082413.3042149-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SG2PR03CA0142.apcprd03.prod.outlook.com
 (2603:1096:4:c8::15) To AM6PR04MB5623.eurprd04.prod.outlook.com
 (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by
 SG2PR03CA0142.apcprd03.prod.outlook.com (2603:1096:4:c8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.9 via Frontend Transport; Thu, 15 Jul 2021 08:23:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b43a68a-98a6-4cbe-2092-08d94769c788
X-MS-TrafficTypeDiagnostic: AM6PR04MB4167:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB41673A700917689BE865BAB0F3129@AM6PR04MB4167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZlWHiE0FNkPmUrfnjPycj8AZJTNADQHoBc2BLRYaW8kfpy5lk+lpmZLNn4MVVZ+b2fpjljlEq4QAdeF3g2trswA+IjjrFLeAUYL6g2wzJeK/y3Zbfcn5GsWAd3lcJS/LTiHAG7wqC7saJdDzwiF+Y5Id5NZlkHiyCpl+0+LM1uM++ZTpyog3VyYE99HmG0nkOFSppKRFt51r6MIEOrK62TgskT4uK9iJal1InOHccgCCRAzicItld1cMSYqf7DhJN6/eF21xEjsCufg/i8DHNXgy0Citm7DyptMgzq/WBrqiEnCDos4UZs9nIV68KdBSK08zgn5CrU4xW6cRdWcjr0d7wwwRIwsqWBMz8XGAxs70i8w8+5fnOzJgCeaew/qTh3JJH9gCuP/SR074K/mt9Dn0rHLVL3GrLseIyoFOC5y9oyhljiH4240akN6Qmrvsg34fXkfJ9GtqtbjnUh4OR2aD5GICV8gSB2uviDjj0WFzA/DY9zMABLbAQcdmeVSPV4iTReMAuvHb02gYCHs3JKsOiu5w7fD9mDhgpI6Ay/AgX+v/vwYc1OvTdzothlyI9KdWyZiONI9Hd8edFof2azwRDxVUORJmebdfywAurwonOT3RducFVRWIwdxj7Kj9SvKwpcJr+NbYqY6VW+r4iTrRDFS66Fy/9mRjtaO/cToceSgm9hQ1JfpJ5Wu/qgKoMEZiuSf1dowGM4s355JDQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5623.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(6512007)(478600001)(4326008)(83380400001)(8676002)(6666004)(8936002)(66946007)(86362001)(316002)(36756003)(2906002)(2616005)(52116002)(1076003)(956004)(5660300002)(38350700002)(6506007)(38100700002)(66476007)(186003)(26005)(6486002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yXWR+sA4SmlM6BHdrJ006jheY0t4BjNcUfPws8Ou6BCwKCS/jOGDjqWCEapX?=
 =?us-ascii?Q?sOr9DwsJzuAqO8DFq0dTWRJvNOCrX7XWgkejdLoeoDnG0amRM3SSA0PixGEp?=
 =?us-ascii?Q?Z3T63NmkLAojTSQzBc50xzqfLLZqhh9HoBLBGkjfwn26OT6QNJstApieGKax?=
 =?us-ascii?Q?YMKpLTUSRErkVSN8ulf1uOF2KKGR1/90DFTiHXYt846iS7+Ygwuow85NqQmD?=
 =?us-ascii?Q?Y8Jxtu8DhxA0smMCZ7BOyRNUTUxbKENrme6pjoWCKoaERRF9iXfC3LiQpzM3?=
 =?us-ascii?Q?AYXCFpIExzA1BtkajTk8sn4Dxwms+wdoCrcc3fHmP4CXNAXi3n6EPaZY8C34?=
 =?us-ascii?Q?LpPyNJcFX2dTOIua+CUJm38rKGgPvS7UmtiUBKfZ3vi/JFw/Q1rnQeg1HKWg?=
 =?us-ascii?Q?dRUFQcbvH1l3jB1azlppRv74MVYM7nL8YCSdtH2bHsJuJ5D1ZYBnnIoQdeV3?=
 =?us-ascii?Q?zelrGTm235LlmfA4egDd9MzVMuYDhPRp4oMVTMyuC1+wPz8NmrBohYNuljx4?=
 =?us-ascii?Q?f8RYoW8N6VtJkuIgwL0nDNZenftrIexlsqZ+V0m26xvcKwDmC9Ntt5lPYJMI?=
 =?us-ascii?Q?ttV/XptQ/yzoHYAsrPWtKAgg+UR88LMN16zA2SqIubOEhIaFiPAgtWOdZxDl?=
 =?us-ascii?Q?uMQw6UCzq5/9SLdaPyuSbwf1FvaLKtC3ygQg7WOnRY0IOAtKYWY5gwq/UBnV?=
 =?us-ascii?Q?MMBTpuWDhuhRx4R8C0lbUf/yvEZ8Nakp/TbyiDids/HAMdkGO3fqasCwGun+?=
 =?us-ascii?Q?OD7mBbm1yH1NpxOvvmwwj06eYRYtlcTUqjgdWlxwFCNcsilwHXkn+xWVW9Sf?=
 =?us-ascii?Q?aVfh6a9IfFX71hhExZFEIBrsLI+xWraUVKh0o3RL+9+vBBopC0b9brlGfdpt?=
 =?us-ascii?Q?K5RJXYxf6t8WRBRJJgRwogBPpkFdsnyOrR/NFwuuxJ0jqobVhTMYLFgyA/nK?=
 =?us-ascii?Q?6ecifhQWdcNyCf+Nx/S8DPk4pZQYxyshJhS0A2Q8McVs2oYtuApc47Vs4Dr0?=
 =?us-ascii?Q?jopRwOylQ1keNKDCVM/8AtkVtHmvUFe2sdXs6jgnRhT2TdWdxCElmS+dluPH?=
 =?us-ascii?Q?38Qoa52+hwBrXDHtcd5KVKbi5J02hSFqU5AMiQ8sFDwsTjoCspviVkQJ5Q4k?=
 =?us-ascii?Q?UQ5F2EJk56t3iPj1ZX/ekZ4XDdp2h2Tla75w1MTfGwAJAMOzJGmxCGJEj/5Z?=
 =?us-ascii?Q?eHHXxD8H23wlFGq2yltHxHulEDgBx9FD4HzZxrCf1ZIQEGKOJNkvNH1E7Ami?=
 =?us-ascii?Q?vPu+HLzVbtNCxU+pUNCi0UKbFVC9qrA0vtSsP2sFA+QDPLJG+p5cG2q/C4w9?=
 =?us-ascii?Q?KAx5b3fMVXPPsW/iBvuq6BVw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b43a68a-98a6-4cbe-2092-08d94769c788
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 08:23:09.6360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMy5bXqBpuSQzz45Q2IEkkRUzUX6awUoU8oJN1zcsmO57l3GkCR2SFusyru8kaWv7Rb4NxOYiBnNrg2Fgh+WlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_012311_567937_4C2B340F 
X-CRM114-Status: GOOD (  15.45  )
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
---
 drivers/i3c/master/svc-i3c-master.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 9d80435638ea..892e57fec4b0 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -865,7 +865,7 @@ static int svc_i3c_master_read(struct svc_i3c_master *master,
 			       u8 *in, unsigned int len)
 {
 	int offset = 0, i, ret;
-	u32 mdctrl;
+	u32 mdctrl, mstatus;
 
 	while (offset < len) {
 		unsigned int count;
@@ -874,8 +874,15 @@ static int svc_i3c_master_read(struct svc_i3c_master *master,
 					 mdctrl,
 					 !(mdctrl & SVC_I3C_MDATACTRL_RXEMPTY),
 					 0, 1000);
-		if (ret)
-			return ret;
+		if (ret) {
+			ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS,
+				 mstatus, SVC_I3C_MSTATUS_COMPLETE(mstatus),
+				 0, 1000);
+			if (ret)
+				return ret;
+			else
+				return offset;
+		}
 
 		count = SVC_I3C_MDATACTRL_RXCOUNT(mdctrl);
 		for (i = 0; i < count; i++)
@@ -884,7 +891,7 @@ static int svc_i3c_master_read(struct svc_i3c_master *master,
 		offset += count;
 	}
 
-	return 0;
+	return offset;
 }
 
 static int svc_i3c_master_write(struct svc_i3c_master *master,
@@ -917,7 +924,7 @@ static int svc_i3c_master_write(struct svc_i3c_master *master,
 static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 			       bool rnw, unsigned int xfer_type, u8 addr,
 			       u8 *in, const u8 *out, unsigned int xfer_len,
-			       unsigned int read_len, bool continued)
+			       unsigned int *read_len, bool continued)
 {
 	u32 reg;
 	int ret;
@@ -927,7 +934,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 	       SVC_I3C_MCTRL_IBIRESP_NACK |
 	       SVC_I3C_MCTRL_DIR(rnw) |
 	       SVC_I3C_MCTRL_ADDR(addr) |
-	       SVC_I3C_MCTRL_RDTERM(read_len),
+	       SVC_I3C_MCTRL_RDTERM(*read_len),
 	       master->regs + SVC_I3C_MCTRL);
 
 	ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
@@ -939,8 +946,10 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
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
@@ -1012,7 +1021,7 @@ static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
 
 		ret = svc_i3c_master_xfer(master, cmd->rnw, xfer->type,
 					  cmd->addr, cmd->in, cmd->out,
-					  cmd->len, cmd->read_len,
+					  cmd->len, &cmd->read_len,
 					  cmd->continued);
 		if (ret)
 			break;
@@ -1141,6 +1150,9 @@ static int svc_i3c_master_send_direct_ccc_cmd(struct svc_i3c_master *master,
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
