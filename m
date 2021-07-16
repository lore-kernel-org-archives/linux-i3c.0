Return-Path: <SRS0=KHFp=MI=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C85C636CB
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 08:52:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D3F061404
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 08:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D3F061404
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FicxAXLlS3lDUdw1+inyLRLUmhoLyBtJYRky1gfQymE=; b=E8Oy950vGqw/M3
	Dv7RwJihpL/zrCOJ9xi4sc+CyMEqQiJr62yhxWd/RoFERGMZp7pUhsAratoHlPPEmxsr0mLuBThTA
	278pMcURYhcJikAV4ndclodGiMSkFNv2g/lhKySZNTkF/8fnpRRpZaEex96upvHejyKvZ21FnyAg9
	qq72wyO/7ktBIcDywJkgSyEj6m86ls5Nb5gzI3F7FwfwRZ3K333QtnWCxdEkCp8/9cDg7IftR/HuK
	b9+N7I7lyBdT42QjHZnQCAu5RHNehwfnAG+oLbAxe7ZJRMEAQDkmEbPX88PcJ1YhGDK292Z/5Ite/
	kk2oF2pajDEokuW7Eljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4JZy-003rUF-Na; Fri, 16 Jul 2021 08:52:18 +0000
Received: from mail-eopbgr140074.outbound.protection.outlook.com
 ([40.107.14.74] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4JZw-003rSM-QI
 for linux-i3c@lists.infradead.org; Fri, 16 Jul 2021 08:52:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+SVFz23RyFV4Iy4HL/bQVGDxA2jcHjC/40TDFItglBEOw9DEJKDJ2tt2sYHm44jPQKWcusVZjtC+fFWSEptixlHI1mHtV3hnCn/4mty8PNbxwusCizT6eTPQj+IVTYBZA7cKhcfFxPw4vhTYy7tvP0N54af+xl/hquFtJLp74dg20/qvOPhrW9nyp4AZZR7QTj56i8Z+y5EoqsSKdIVsgnuL2FQwmzLNHN7P1oykgRqgFDzyrHZKVZDmGTPjqyuy2t8ory8q62siZ+42QJt62pxN5Bs32boMBUfIePCqhS8pl7rYNvxIvqx6+H4FseWNBxWFmlN9ECMHpsgkx4GCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8iJASn+k+hE36e7mucUotmHPbltM93635xrofcgJXE=;
 b=kZMXe8dfVpJ8lzx2TIrcClmWyfZgNyEukZq36sV2LRxqksvW/e17a2ie68DVTulZmdmDyeKQGFkVAtYMucwaVwCl0wkrmjEP6oNAq+AgyEMXIefcIgFlzFVJIAv3SEPch+96hW2Iv2X7vxnq47SJ/XWXKm2G4uTi78EnOIZ9V8l0c3zFXvswmTqJ1iDi6uFc67NufsSoRextDgKZ4ssQyfrk63c4S3Hs6bXIfmh69r0kuOcODSRkqbtxNNyiU03c+sP6SrQ7eoFVjjZEvCRxE2Tl+yf/vDGpsKqNwSWf8GMn09xFaGRtw+vYUq5spL3vlTw/Lw7zr+iOkY70ZHETFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8iJASn+k+hE36e7mucUotmHPbltM93635xrofcgJXE=;
 b=WCwxBOiDPctp4G8KVW8USvTanERZudNKhhxiuazAc6XOjz2ryLPj/HgmyWkBbfDEfAqfG9wJbJwweSUmETMQEvH1IXnG9XPqgUiZwT/RsdZchJGvrKUbkM5bfb5JXagnsjy58B+hl+h0pZYdWYZzXpLwMTSWzMv3eFWV403+1mI=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Fri, 16 Jul
 2021 08:52:12 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265%5]) with mapi id 15.20.4308.027; Fri, 16 Jul 2021
 08:52:12 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
 alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaoning.wang@nxp.com
Subject: [PATCH V3 2/5] i3c: master: svc: fix atomic issue
Date: Fri, 16 Jul 2021 16:53:14 +0800
Message-Id: <20210716085317.3572224-3-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716085317.3572224-1-xiaoning.wang@nxp.com>
References: <20210716085317.3572224-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by
 SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 08:52:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f812006c-92a5-4901-3d5a-08d94836ff3e
X-MS-TrafficTypeDiagnostic: AM7PR04MB7142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7142D03522F6847377AC5B81F3119@AM7PR04MB7142.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R7rChvOnNm7R4I33kOPSf+E5OkdHW0a/d1CEcV60S8Q9VEhzuacUtf6lmjj4fui5MBva1IZGRkJyyS2WCztWybqUeFtniUO0M7B6oD1YbuyPL+579ff8bbzf3voEhLMCMe1Kcj6sX0k5DRHQmJzEwiKPcQSKEywUeElN4gHtEG8tE4+JE8c5g49O0+kh9vEXnPE7AbUJEpYgqk0oqtfbyIexssB15eW7gEsFcsQ8dq72Wqza/emgPon9KNb7GYNCoCDVH4w5hTZ/myTry79GvB6lkXQRsMkRLhH3Ye5i62H4nTUmjzWz9HGWjKIQFLxWh/y0xSeK4i6efbe4lev19wQg+MYzuJ9l4dU3D+20OOKxJhF6CRxPGivQk/zJerZwEOlPBi63qm7NDGNWbrWH6r6l8PEW+dCktERL1EA4XQLh/hk4O7HDHliYfzyUXt4oxympn2bmmrW1u0WQGGBDUgQlwwQ1RmCHk0vbdxdDlYpj+HyttL8dASw612H6QnpGOx4fNb49SACgLeUGKfCTxdbD5UJw/+eDL71NUaAdFrw+jba4QuJWFhzioWj9+Hw7w/M214/nvM0F2j3cBN+0R6pRb4ACk2Zb0Ri020HKvLcdhtbdDrYyM2vhFC6VBlsU7oP5QGKn6f0tVvAey12NduTuxGNzwnBsKvOUKWJKMtgyK23cRA5z3kHD8o8YiSHTLFh3dQnQIqAA3f/fEOsCaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5623.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(36756003)(478600001)(5660300002)(8936002)(316002)(66556008)(66476007)(8676002)(4326008)(86362001)(6512007)(1076003)(66946007)(26005)(2616005)(956004)(6506007)(52116002)(2906002)(6486002)(6666004)(186003)(83380400001)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iH7SRjtUtiQ9RiwhJoQfeylX+bEInCQSesoJ0kunokdcuWFKnsnRsCXGtkyo?=
 =?us-ascii?Q?A/HFe1mdoAzd125dAHlljGtGIUkZUpMePZhSKMi7dR3J6G3gE63jvQVp825F?=
 =?us-ascii?Q?mFen7RJiHS/dKp+/prZGRV4K28RnNPOYIAXkxLwwAEBt/ZZwZ4CQiNYiAJCd?=
 =?us-ascii?Q?YIjoJXK5KNrJDs+sX9nvL1x4PX4NyFlrZoBoiko4a+LN9hrSucJ6+qxd5VOr?=
 =?us-ascii?Q?Gt0WzV3vUpd3IPnZuyExTWC/g5Y2elMZz6S+uMKgOzUQGIF0bsdQ/HvK+0S1?=
 =?us-ascii?Q?066iy1mFhREpyfP1nsDha2frLXNgReK4m0WEyEFhqOXZWWlUD5sN6nFL69BU?=
 =?us-ascii?Q?0PJb5WpD8QNKE32yjzAErns2EtwZnRhwLpFdLBx7/qk1efwDtYJOxviwzbWL?=
 =?us-ascii?Q?C4U3NQHCylkXigx3/TG7YYRPfb8nqCknvXAji5K3xoJeaMxmjYDnKwF7S4J7?=
 =?us-ascii?Q?bwMzqg8JayFWR0uLXVPciQ1PX/331fTLpU4JqIFzm5YF7I9lvDw2H+BSfDVo?=
 =?us-ascii?Q?5Fujiz3bbLS6+w4Njpz/gO+BfvtI750l+WaMRx0mC/RL+xD/NxdKLTI6Bcbm?=
 =?us-ascii?Q?8Lc6MJ1zBpgFT54F492XLMB3ZjUfrgZK1sJ5OYc0by6qGB9MM/dfATo+AZKR?=
 =?us-ascii?Q?61GkVGdti0ORI8K1A8+aMEkSV4uLm7lDc/bNPZx06UB/omOtZB+5k7GLq1eJ?=
 =?us-ascii?Q?VyjFH4RXzumtFe+84Q0xut6sugiXzxavSDmhlKnr467iwIDiTsz/ouYuqEjQ?=
 =?us-ascii?Q?5l303Safp5QW31vlKUbHVCKHr5Uy2W1qZySD1vsGiuh4tHJGyr2CRxuEZXxw?=
 =?us-ascii?Q?f6KHtigxVlK3X8LVBlEXJ1EMY0TSplZY/xXQCPgJ8lSv39NDPXYpYX/oEQZN?=
 =?us-ascii?Q?6NN/Tv7oyLhlV6pqk01Saf9FqkKVHkae3V9YNcEQ5CfT7S6c29ylg6yq3QVG?=
 =?us-ascii?Q?WsYdIfZoXQ7tI038E1E8TpEICCjpPo/YaqL4vFKz7eglJq8f5pzr7IT1JG1i?=
 =?us-ascii?Q?i9wLLhHL69HgSiVYwYGNScEHUDVLi57Jlq7RrbV3mXAJSInhmiMa/x11k5cY?=
 =?us-ascii?Q?192ffCEfhgMzAo2ETAO/lRVUAbQYkVsgugkQj8t7G3jQMpJYfQkpf9d9dIDt?=
 =?us-ascii?Q?JpoJO7EhpAayC+1fxhILCSndFOhKjj44somvXpUkVFGuRkeuY+4SxxXTDPqn?=
 =?us-ascii?Q?cP22mGeZCAkbPklcBkoybv47LU8v0nqEEB8UFdQqzZsF5R7KrBMeQL0t5DqL?=
 =?us-ascii?Q?d8EXrd9KWDwmEwXHl2sqhPNG6sY/LKnmHHSKsUun70Fc0Y6i5HshytFot4WO?=
 =?us-ascii?Q?EKj/Nuw9ipC5oGP8f5pHVUhi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f812006c-92a5-4901-3d5a-08d94836ff3e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 08:52:10.0756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: keboCUMzk3rHY1X6f9VkppmqgWpHG7NRlcmvbv/dAW4sgpLqv5ZFn+8Dk2EWJDKhX04uogLQPnpFHHWOaLU+uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_015216_880942_2C84EA59 
X-CRM114-Status: GOOD (  11.43  )
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

do_daa_locked() function is in a spin lock environment, use
readl_poll_timeout_atomic() to replace the origin
readl_poll_timeout().

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
V2: align the parameters of the function.
V3: no change.
---
 drivers/i3c/master/svc-i3c-master.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index c25a372f6820..47c02a60cf62 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -656,8 +656,10 @@ static int svc_i3c_master_readb(struct svc_i3c_master *master, u8 *dst,
 	u32 reg;
 
 	for (i = 0; i < len; i++) {
-		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
-					 SVC_I3C_MSTATUS_RXPEND(reg), 0, 1000);
+		ret = readl_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS,
+						reg,
+						SVC_I3C_MSTATUS_RXPEND(reg),
+						0, 1000);
 		if (ret)
 			return ret;
 
@@ -687,10 +689,11 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 		 * Either one slave will send its ID, or the assignment process
 		 * is done.
 		 */
-		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
-					 SVC_I3C_MSTATUS_RXPEND(reg) |
-					 SVC_I3C_MSTATUS_MCTRLDONE(reg),
-					 1, 1000);
+		ret = readl_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS,
+						reg,
+						SVC_I3C_MSTATUS_RXPEND(reg) |
+						SVC_I3C_MSTATUS_MCTRLDONE(reg),
+						1, 1000);
 		if (ret)
 			return ret;
 
@@ -744,11 +747,12 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 		}
 
 		/* Wait for the slave to be ready to receive its address */
-		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
-					 SVC_I3C_MSTATUS_MCTRLDONE(reg) &&
-					 SVC_I3C_MSTATUS_STATE_DAA(reg) &&
-					 SVC_I3C_MSTATUS_BETWEEN(reg),
-					 0, 1000);
+		ret = readl_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS,
+						reg,
+						SVC_I3C_MSTATUS_MCTRLDONE(reg) &&
+						SVC_I3C_MSTATUS_STATE_DAA(reg) &&
+						SVC_I3C_MSTATUS_BETWEEN(reg),
+						0, 1000);
 		if (ret)
 			return ret;
 
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
