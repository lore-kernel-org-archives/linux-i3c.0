Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D27D606A332
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Oct 2026 09:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t9cy4PTP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BmfKe5cC;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=a3HqN3oX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qKCH+ipHSFQJwkyJqvTTsypv6F3h0fr3K0oc4qT17UU=; b=t9cy4PTP/ljdM6
	5lcdFrfQdaYQpOYmcxVDMJ7K/eeqf5FDi8i3d7QtFxB3ovx8sHwtfDHp+Aik6nKJYD7Agl09zeiEV
	LC/Ev1A+7bOp1Ith+FoQOFxnH4otulTsiF1WSvcylZ8Tjhj97YBI2fOoneX27yLmaez5jjmVCTAlA
	c5FmCKnaAQFXhrc/1Enhyd5YJiAZ991kf6j2pV4/srZWReXyQ0j32tIwhtm3mdJG8gnmn6ggqH3eI
	G7jPXQBq5j/k9a2v4DDnSxMwB9Ui822TvctexrH2AZOJn4WXIXpSWdYMq5WCPZbf2Z6BPOxN5c3QF
	MfTuI09pIhyKavmAG88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5xE-00000009H85-0iLM;
	Tue, 20 Oct 2026 09:16:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5xD-00000009H6v-0Afe
	for linux-i3c@bombadil.infradead.org;
	Tue, 20 Oct 2026 09:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bZzOn36/p4Sb8ty4X49VOmTzaKipBcBNakVoqmFsSjc=; b=BmfKe5cC38z9O+x0vROEPCESsz
	H9BDnGnvwljCMT7EvSJB3n9rFiOQwKqINP8GGUEoMH+mkrSPTylRLQuskbtAdh5QbO8jElWmESU/M
	UxDVGu4rV0O6D0H9Ax0gGLNsI2iGy+SeHjK6Q541Q/HJAM2bXtAu5akD2x1eT79EH2RGXK7kUX/bn
	5DC8npdjpc1/ozM6w0AbNxFfOqXv4UErWuJFGWYNya5l0mwCz7tXy4nManz0v76TJDMKCvJDWF9T2
	x7UWH6NQsfWnRUMm84RASEC+Ajk9LeprT8plg0urslMKOMtWNCK7KIEeXwx8F3cSPVi2tvgwtY3Ov
	NKlnoLVg==;
Received: from mail-japaneastazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJ5x9-00000004WBn-3XV5
	for linux-i3c@lists.infradead.org;
	Tue, 20 Oct 2026 09:16:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sf7BgBqBfMk8SV48mdyTI1huHDkOV5hK1qTxQhm6t1BkIy+EnnQf0Ocd9aUtl8hx3QUxkLZQwFNS37BSNeLETgli6rnGODMT99vA+0b4SjSbgHA+VoCqVZ6u5eGUb2Nc7IT6PAqpNYbWu7ATfRXoJETCcVgkiHSn+SiEYdPgPPDzOm9z8dzuxsVnUD+9Lo56dui5MWaEnGSA3xfNQFCiAZQtfh2Lq07cSo4L8k/eM3Ofk8BBgZY12kz+Ldq9ulaTRgSNt/AFrMbkOKXlQmFM00UlRxRAVEGlMVORe7OTspHEDeHFOvwk7B3HWIMJ8zoNl9IyLmHxIdqsXwbjsHvgCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZzOn36/p4Sb8ty4X49VOmTzaKipBcBNakVoqmFsSjc=;
 b=q0+RLH329PV8XkcT4WM8r7b15hETnHeHIaafpex3qtRRe7QIZcIrdVn/EG6CWWnjomXqO5bOHSe4IxgGONoIMW8JgQ9m5VEUX/CMGPFRICZG7G0NFpi9XBoYWNZvEN0qRZ/DVroeDU4uo+Vfb1Qvxb7NTVJSIBAg5E4rYi5cRpApS/KKOUaV6S9CcXXM/VlAcz5xx5fZgZkKq6GJtSzWrJftpVT6C/sQosY2BmDur5jnS7WRha1YWEY2hLyrzkYpA2Hp5sUiwsrA4njETHPQHXI/hD9JCcDRTCBtCyHowJjtXKhcZBBLqaZdUf0HKzVrfrndVQfj97yvzma/sGEWnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZzOn36/p4Sb8ty4X49VOmTzaKipBcBNakVoqmFsSjc=;
 b=a3HqN3oXLWS9YyHtO4yWeNDl7TYsPoZ8XbcQYmAskUbnkhz24CSVqhzUTQCCgvIG1/DqYvl9RvWBzjdPe73cxUGh/Zub4t3uSLHH2ToA5FnJDZMseZkOSe2cHClqaH52ZScUsQk6xHpRB0K5C955NKFQ7XmjRtDqp5mtqmXd9Uo=
Received: from PN4PR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:266::16)
 by OS3PR01MB9833.jpnprd01.prod.outlook.com (2603:1096:604:1eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:15:55 +0000
Received: from OS1PEPF0000D213.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:c01:266:cafe::5c) by PN4PR01CA0111.outlook.office365.com
 (2603:1096:c01:266::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 09:15:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D213.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Tue, 20 Oct 2026 09:15:54 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id CE4B03000274;
	Tue, 20 Oct 2026 18:15:47 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Tue, 20 Oct 2026 10:15:00 +0100
Subject: [PATCH 6/8] pinctrl: renesas: rzg2l: Split SoC-specific masks in
 struct rzg2l_register_masks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-6-30a47f25e515@renesas.com>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Diogo Ivo <diogo.ivo.sx@renesas.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792487702; l=1838;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=CDeb1CJCC0Vsr6riXKFKBKBPCOPr9AB+2PPgnhx2P3I=;
 b=nM7L4jFsp/4e/JBk07KBChVNsJVmTFh0m16RvAs3/P9hEbHX8jeimyB9vT1N7VUy8TRSoLRqo
 IYsVit0SwS0CHww1PFahXwXgfIN9mYaN0XsilLONMaghjD6KGQxlM2P
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D213:EE_|OS3PR01MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b7bbfc-da9a-48f0-3aa7-08df2e8abe79
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|23010399003|921020|22082099003|18002099003|10067099003|3023799007|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: srkuPyhtGob58C403OX2kt8SIMohEGHTVXEY5fv4tilIh4+biRxV1MekYbFzXByulrjpQAXdmnnJOaI+k+YFQbW5ozbStBNMxOKzhDJc1vK8BqXdB5IoYgCtJfBZlWDg/FAAiC8l9W0Az6rDrLZ5uAKge25/saQpp+gDzwQSS6kFLXsbrf/B8e9GLbSahcBFYJxjdaxZBD72eqb9980o4RAifHmZw8+nBINQIK2EX8zk4rQ0bEkSIDJMkUTb9mj5bN3mGUYYLnl9K+BINx6usKb7GTK9W7ffaTAEOUoLzRfx46WGuFfuq7OQRib65FhZJiOPJJfntMd/Q0pu9YmA/Ixo63XZNd1pn/l6ItXKY2cMzR/MqivtSbxAAcfN7CSutmu5IE/RFGFEQN4+iiHSDixpiyyocc61W7i4jHtHXuOcNNz6sS0By8wzf9mCNv6qQ+pQHtIFC37xVVitpVwS+9G57V9WAUtHGG2e82k5TvoZYBplNRC6hhbXswB8e4IyVMmebCflhS/kVNXfZK99kth6P0K0cdwgovKYaAS/gyZ16xa8ZzndHLlaIhUQOeeHAXT4tyU73gf213IHzs5Os4ZI5pH4D/HPe4PmnEZ/adtI9w4BqPudDl6K1yGopKdCTJ2M5J0s2h+wlQBcsmt4xbQmadoirE9ismY/2CAizidps5JuDh/tZEkqRMO8Gj/JKn5cMgPNYzgH+VDWU1TYuzX8a1A0po2b9qkybPA+nCYnX/ddKTFwO+LBCKuKnAHz
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(23010399003)(921020)(22082099003)(18002099003)(10067099003)(3023799007)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +64yicCkc3jBk+152QOS/O1epJg8Fdd3qErkcpt17z/yrbFhNxnIJjZJzVH9azhj82eKw62xZJedogt8G4iEC8zMQV0L8SlChgMmQGldimH2h7Hp53nyFTNXTMoNHnVXjug7cSkfq2/9RuaTQPv8s27fgv7CijKTSd6Ht4uDJbUZW6P/deQ2OB+ttunl2EKbkPSyq+m3Te4i/KR2LdIx/UopQ3bWudsGms6WS9m3DTb97uQL+THWIDn04PAgmgmygQcog1DFz537bF+Mx/AKv5G0J1hVWyPhHYunBiSwRoB81XXqZ0tDi0a3iiXy4BDQaRUdXu/Y1ikHs+YUJHtlJ/3kzuRnr4pxKH5GIM/gbuPU8YIlx4WrI5QD8rYNGyMIovjGbKeylg0LAJvd0lsNtnij8X0i53fyH6wWrQIoU1a5bgH85Vc0jHfs0EqOTFNe
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:15:54.5254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b7bbfc-da9a-48f0-3aa7-08df2e8abe79
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D213.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9833
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_101616_075538_ABB3DEB1 
X-CRM114-Status: GOOD (  12.68  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

struct rzg2l_register_masks declares the masks of the OTHER_POC register
of RZ/G3L and of the I3C_SET_POC register of RZ/G3S in two branches of an
anonymous union. As both branches share the same storage, initializing both
other_poc_pvdd1833_oth_awo_poc and i3c_set_poc on RZ/G3L would have the
designated initializers override each other, ending up with the I3C_SET_POC
value in the PVDD1833_OTH_AWO_POC mask.

Split the union into a common area, for masks shared by multiple SoCs, and
per-SoC areas: the RZ/G3S and RZ/G3L I3C_SET_POC mask moves to the common
area, and the RZ/G3L OTHER_POC masks stay in a dedicated RZ/G3L area. This
way every mask gets its own member, and new SoCs can be described by
adding their own struct (possibly inside a union).

The existing RZ/G3S data only initializes i3c_set_poc, so it is not
affected by this change.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 9bf3743dc1ce..f73d273df362 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -278,18 +278,14 @@ struct rzg2l_register_offsets {
  * @i3c_set_poc: I3C_SET_POC mask
  */
 struct rzg2l_register_masks {
-	union {
-		/* RZ/G3L masks */
-		struct {
-			u8 other_poc_pvdd1833_oth_awo_poc;
-			u8 other_poc_pvdd1833_oth_iso_poc;
-			u8 other_poc_wdtovf_n_poc;
-		};
-
-		/* RZ/G3S masks */
-		struct {
-			u8 i3c_set_poc;
-		};
+	/* Masks common to multiple SoCs */
+	u8 i3c_set_poc; /* RZ/G3S, RZ/G3L */
+
+	/* RZ/G3L masks */
+	struct {
+		u8 other_poc_pvdd1833_oth_awo_poc;
+		u8 other_poc_pvdd1833_oth_iso_poc;
+		u8 other_poc_wdtovf_n_poc;
 	};
 };
 

-- 
2.56.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
