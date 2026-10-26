Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4017C606A33E
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Oct 2026 11:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dAL3BMvH;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=UQ7Nhm46
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rCLlx5mPoLGbY0j080bzv7Qp40kIgMEilCrMIY13hgs=; b=dAL3BMvHDGmPTRi4v4t9M30a0X
	U56yiMOKGIFcPUc0jUJJhPUCAZ5i9T8FCUp4NW69KEaVZWeKS/Gc9ekmZkXG7V9oAZTpj5MkvWr/3
	MFAKo144iNagWKtCjNvFDXOxLk13eneMVzs8en99wF+MTLEcNr1XGa1jyFmutXXuMTJ9xUevXFT9L
	UlWhrtdEnNKWuElGH/LL8zA3/9Tbrp8LgA9BN/YCYSXPZxKddFNYURQqVU5TbPOhVREH2ZOf+bsQ0
	JRugDBrOupbJTSdogzvVq+Kmi8q50pfhEhQelTkC0vKFn9nMDqsz3fWXR43VdVxE7T3Y4nuNJEU7X
	qOunx7Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJ0V-00000002OM5-012S;
	Mon, 26 Oct 2026 11:36:51 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJ0T-00000002OLh-25CX
	for linux-i3c@lists.infradead.org;
	Mon, 26 Oct 2026 11:36:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COosIdVCSCDAIHRqx5amPyWaiw+FNSByv8jS7dTyd5OADClzjAbEaYtLU3mBc0JvmU5AZS5bHvlKDbe6bKQIZ15YHsXndCFWbm0cldTxvC4nwdxRfNWA6kmqsn8qDlKaei9fSmU+AthNtl7FjsH83aI/hxkrkVqaUDFEdGbR2+sbsp23WSzi2Wt1d+jR5aoL4rtCBpNUe8WSFVFJAypyuhWlEsi43Bl5T6PrIrVa8hUa5mZ0e0rCqSyRpHIcVN74Vy6RJ5q+PoS/nUi2mFhMdw8uUHX5Hh/eI78ZLdzeinS0qMwQJOl0IOHadRbffXNRUYI1/QeWEOEK5lbbW6WjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBq4ljD0JBjrOPYPos7Q6pP8UbqWlhgc2nYN2PIGiCM=;
 b=kXO5LL0C44pkoEvnnWtZaAa+Fe1DO3olxZfz9LbQCx82SmCqCxfnJyqGkcmaBnZxzOYp6QVOhv2RRZHb2fYcrNG0IJ/TPbpqbuQtw1hubyfxiwh2JlMwEYS0uiv7hqlvdTZalarX7A/UmHxFRdWGIK6jDXHVKzpm2xv0g+bSWGPunMasu5ZmcR+i2RB1XjuLaRra5XOCjKqe3dfFaLQ3IwHI56JjEiDivntmeEhy3pDSoX/wfdosiQIjEui34O0LhHwfmLXStnucNMIkCgXS/dBsuzIt7Rw0EKDeRyYlzfSNYIjS3TK0NFhN3nmQczpa8HZxxEPzQDBJssnONTvCOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBq4ljD0JBjrOPYPos7Q6pP8UbqWlhgc2nYN2PIGiCM=;
 b=UQ7Nhm46qiijUbx79dHapDpleHwdMnI0MBus0TZaVbuZxCF4mdvSN5NALOpnRZgv/7tIEYReiNc26HLk2SCmSTk8w7GD2X2RXTeGsiqxCowZDtQjz9FsIH5bnNfGOWek8Z+8My6fZu7FWbe4KlW0dQ7p3kCoyo76fW7VUP96yTg=
Received: from TYCP286CA0207.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:385::20)
 by TYCPR01MB7218.jpnprd01.prod.outlook.com (2603:1096:400:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 11:36:43 +0000
Received: from TY1PEPF0000BAD7.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385:cafe::2b) by TYCP286CA0207.outlook.office365.com
 (2603:1096:400:385::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 11:36:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD7.mail.protection.outlook.com (10.167.240.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Mon, 26 Oct 2026 11:36:42 +0000
Received: from [192.168.1.82] (unknown [10.226.92.223])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id A1EE23000278;
	Mon, 26 Oct 2026 20:36:34 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Mon, 26 Oct 2026 11:35:48 +0000
Subject: [PATCH v2 5/7] pinctrl: renesas: rzg2l: Split SoC-specific masks
 in struct rzg2l_register_masks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-5-2e76b87209bb@renesas.com>
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793014549; l=1929;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=eEsbuMwbCmlwZj1kXhIWUry4TAcI2XXVkhanKObD2wY=;
 b=nOc37G8KQ1UO6gLTDtCaSHixo0hS3dmCMzpkqzBK4Ep8nT3CTizvsv5BVgALD1gVpj19gX+Jp
 mOMqTwou1WsDT+Ew/hmyCg7xDYPzvbuW2KAcU+bI47e9Q9+RukPrsoz
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD7:EE_|TYCPR01MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ba5a09-3cee-4ce1-50db-08df3355688c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|7416014|376014|82310400026|261009223027099003|261021121427099003|261021123027099003|10067099003|56012099006|3023799007|22082099003|18002099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info: FCdxetM74CY48Ghv9Wb815RD8YHUg02L5YM1C2aSfpc89CYalGXDllbiRXZ1IiUFzo1wxkrZvD0d15Iiekhjv74w5he5q+QktHBv01m0BPKAekDUwVKujFxkuLHknUlz6cHwxm+U82VXGwLZrXHxcBCN6qhqIAth2tjnLoZjm7TYxDkYiHRzagbyn+gLTDimByS8zbZPT4qku8W7n6fytBqTxUal6KUp4ooQv/zbPJfDXxFSDL+6zm21B5IEC+CCRdPcwwdQfsXlgXU45m0+DNtsMnhsmw05nzuJZrtOn8bJL57M1086rrqnMeAJhUUkRw4QpZiE/Qsh4vwk3Zg9X7jg0CRX3f5+eOo3fyxm3CilhxTeLrQ6dmExvFhUcmCCR5smuGr9Kean0aUQINo7bWzsaly5catTjjq8rG3Tp1n6wU9Nc+nzw3ZHsb9K6IwSoxkpzNBYqJapiJgEERZYT+yTxhyBWHKJ51e+Ia8FPvVaDYq/+QTPGTR+4tSbQ7MNY7Xq6aRM4nIJCNL53rG06DuQMfKCZPNs2gk0TNtL0IsIRy+qygiskqLnxfkzK9HJLMbR/8tGbge8/5bCa+VOSpTGC2YMp979S3J1yk3B31aTXy6AKtVPl6ZJgeiiGMmOrbTt+OHc92gHBvG0hSBW2aIcH5HoEPj6bD/mrdSjirJ+jfqE+sn6ike8JdwzjwDjRYtK25ImbFPr9sB6Lf73HyS8XFZwk1dpT1qYYnqjml2J90jIVizEWvfUZhZlfVmV
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(7416014)(376014)(82310400026)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DXUvZMJ7ExI6tc8YA0vBa7Sq35pDDSCTZs8bv95m75aSOryYw1c/iNLKaX8pqyjZTiUL0tRoSivGTTCqcb4i7DST/DnaUH1KZPySLkm2NYkDEqWNs8JAZ1yQIwvldAnR3SmB/fXwqmWVudBNwxnCg8FV286odcsQJSaY6iNug8Di0nJncfWc5wPI3KJdWBwC+KsBncXU51cfzfyiYJtgDdwlBlgx/h96770ue0AwXLyeeWSLTHcuz5eVNO3Py03u8CZoRre8vL+8ciw1uXvDimYL3KBIgg7pVV3c1P1zTmcGimPr3q94GmvN+9rUlTn91VP4WmrBH4t+YefYeb7sNZ7+0iUT30vu+juNDIbOpQF/SfZbbPW3dZYNNDAABo6KH0Qsi+PGkiTYaK12TWr28vl7u32Rrn94jHn7/mMvxT6YVMClxvnYmkcWvVe5YDWz
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:36:42.8660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ba5a09-3cee-4ce1-50db-08df3355688c
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD7.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_043649_542718_A725C2A6 
X-CRM114-Status: GOOD (  12.77  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
Changes in v2:
 - No changes
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
