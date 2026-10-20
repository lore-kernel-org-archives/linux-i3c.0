Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B8160A2606
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Oct 2026 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JdKU1bQz;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=AyzFlQ/x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JrD6/njku5lKVIB+PYNSmtQP+v3xuj30/0q1FoGp0es=; b=JdKU1bQz1WSg5m
	2vv+xWAIzHb0pqA6EjRMHnyTPkD8MxrFNLADMrBXDRQr8ikAMDsA9koEq7lc3l02H1nRLDkJgU6KC
	midJjzv/WLUjgAZKZO8iilFIQhjiX3B59cHCl0X5wtGXBR8u47/nwFCHVfQ6Vgsvq1Rb2PkF37bUJ
	48qImzQzF/AdSJQKUSybvA8avlpjMk8GTlqqi3/WCVqGdZeByqfyiTTwITjOaDdy0xdCAVjhSgkfi
	iSIBPIvnoZMa6PIyOwzCMg5HD5TsuWI0I4DrmZfrUM6NokWsoUfjoutSpYU9qBYDLHOUg+uY+/JpC
	qDZ+ce1ka5INXv4PRGdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5wT-00000009Gx9-2qfb;
	Tue, 20 Oct 2026 09:15:33 +0000
Received: from mail-japaneastazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5wM-00000009GvF-0dPz
	for linux-i3c@lists.infradead.org;
	Tue, 20 Oct 2026 09:15:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0Z7gqAzdNVZT1SMKX6UanfOqpTCTP1BMAAQQTtLXIsT6rTvzCKoA2XYolAgmZcCzpH4gg0Dqk28Qu14WJ0lArhL8PYxXWt0z0b7O9aiIJrq8D5rqyeVMBS6MxvwD4C5IM6HghACxwe0BEeCTLlTGuGtgPCKnxR/xotRPgmeXoWWISbewv4VBgq/ocV8HT8H0CLY3UiClATcZgoYHUM1qcPdv6JyVWvKKUlDkVy13fUkuYAAIv2Hlt6sCl8SU3aVnQVDE4azJ/zeo2IVW1hHHorYBNNVIPm1CWfHFf7MN517pICTAkYZ+k2oLhbgdQ6gR5t4iB9G5UG+sijsfikjcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZpEklQFlZftDzyu+g1J0oQl/lBuCj4SNCFhY2wE+Ns=;
 b=MCnGZLoL6ivYHiQfeTwy28FPzZgiuA6nf5z0/BdShLyu2RWH1Y1pBUJ9GTQ6ALt6Uw3gCt2oDevUHJKQPXtkIyLAZvI7gb2bfeeu9uA3bDCm/+i3x6cDTzDfCU6hANrLFKjeKLHjaDFi6KIFvGgr2V7sHwohRqoJZJIoiEnRZzYFL4xClfEwn8/6Q7Seu6auVotuUDB9nxT0x5eXONkc0llEiIhSVMukbgeigHKvpZxh39mPIevTJjxhiGCtDUhwmkgS7ni1iTqEzWyoQ3v1bgLOzI8/x8vTjQJrjjNNcL5pZIGsX0RMRhDQN9/rpA6oCuYEVhhr9DhECA7a/K6OLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZpEklQFlZftDzyu+g1J0oQl/lBuCj4SNCFhY2wE+Ns=;
 b=AyzFlQ/xqeU2qNM128hXWPVrVMeaEF3Og3YXHWiJJY9K91F2uuypnwLJ/R4ujMuHMK0xYkRtFum8KyKo0jsMQWuULC2dWwEZ95r7lhaJhCjTx7hRVpzt3kmNr0hMAoVaJcBTSPICq+Dja+u+nzMl3chVbVGs78tAjsS1PB2IgQI=
Received: from SY6PR01CA0141.ausprd01.prod.outlook.com (2603:10c6:10:1b9::19)
 by TYWPR01MB11963.jpnprd01.prod.outlook.com (2603:1096:400:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:15:12 +0000
Received: from TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
 (2603:10c6:10:1b9:cafe::c) by SY6PR01CA0141.outlook.office365.com
 (2603:10c6:10:1b9::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 09:15:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BADA.mail.protection.outlook.com (10.167.240.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 09:15:10 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 62D15300027C;
	Tue, 20 Oct 2026 18:15:03 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Subject: [PATCH 0/8] i3c: renesas: Add RZ/G3L support
Date: Tue, 20 Oct 2026 10:14:54 +0100
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1g2Mow7aqxQXTow2pagkKgXx7
 p3W5Vv8f4CxChvcswOUdzGZp4T8lgE9u2lklD4ZvPMhd95hL/uMZqO+FzIl9E0IKAVhpK6uYlk
 PTVlAyhflQT7/9aO9bFt8Ma2/H5znF3HsqWp8AAAA
X-Change-ID: 20261020-divo-ssgrlpcsrc-2966-i3c-bca85b48f943
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
 Diogo Ivo <diogo.ivo.sx@renesas.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792487702; l=2431;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=y20cwsKrQ05gyo0OPWgvPmUkOtiafMhYsjyh2JgVw4k=;
 b=a1pONbv5PVwXYBtAVhAHHtbD79Af1OEFJMPSVBKN0m1HLOczon3rRArXJvEYuVWrHw0N0dhmf
 MWIfSctZ5DnBTN4LEO+Qi9faATZnZxvs+7CYLM872vaBnqjBse/dlnJ
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BADA:EE_|TYWPR01MB11963:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d4fb8d-34a9-4e31-726c-08df2e8aa42f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|7416014|6133799003|18002099003|921020|261009221227099003|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: GExwyHjO4184FL4HLB57eSJ6zjHL0H8jxlEgKMrMeZIlTFxyTyz4wHXCTl9wwk+ruSEk6YKUByOgN0+MHVDL2waD1J0YisT6a6TBhhvqvHqukjkg4/6JNKc/yN7OgiBECx56YoiGFbSGPrqcOvomPZjq3pLXGbySirSb+KwPj5gMEtRR4YFxmaB2ITzr8znvNzwEGVW1A+JO4Qjwl7BRByMStJWcm342zYhRDADAtRH/lA69KMOcXT/8nrXH4XqDahqaEHekC/F2zPBQQBQuqOm0kBABAi5Om/OYHOOh/ghpT27Iog19Q960HkdwU0K90+pRwtO6a4zn7qOqkv126kE1amf3wbXufqKr6WtzJb4gPGK5Ge/dnTl+iFtX7fQLZjfkEkBZD7XURHYhu2oLZ/bL7xKAlNk4jBX6GNUEyS6oHB4Yy+E8CMnGXbldU/eoCoHo2f0FOocaZFWkwZwSTBPk/L0yzeMKrWvCg9AhDEHTAIXD97kkjf3sCjd2xCIVEWVvScjrT/ZBbSlTUvhM5i7v75ro4w/JI/X6afvcTy5nFbdANCInE3/Y4tLqndzxbPpHA0b0KbBwF2Ne7B3N4rgd0P/CqL4IzxsiaVK0hf6sibOk85bwYEktX+SsCYKX8NsEVy53rAMqTRNIceH7mVh06v6Xf79MXg2YRq6NUJVIYyfNCj54AcTyS8d4I0dm3WbhBbBztO041lSL/Gx9dWB33yREmoOJtD74lElFx+Y=
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(7416014)(6133799003)(18002099003)(921020)(261009221227099003)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xIwHOZvuZNHjg3iV1eP7uM/jPrIZ5gBsOozf8kMjNtdUWa1G1WaIzufgOH3ucXiCTNjgMa+z0QTzJ9xLpbXE+7dHSW0Nx3GzQypfZUb3U8XEVUDK/a5HX8IaxNOvN0ALBOaS7+DdRCms+9Paw/0ZWUJRLduqH0pw+xGmzohk7DLT1iqLcmxI20YNYmy0CAIXvaEqMpv0v7fyMAkBMBJVxd573+kfkF19uldQs1BHBQf9/LW4zWxLqtNv4ePVc36rkmfLfdzU6NjDjFeOxfRtg2VwksSKLHefmTmyZVaOOznJn29WqRDPK3FtZEok0HhyTaeVbLAmlGFITRYo4dK6fqyoSuFrVQmsobeiQFbvupxRs7deeiTHmEUO60WT01ix4elKNoRv+w6Fi9ZXBqy/OZRf8RczlDuYZtPkfZRDQi2CENUM3kCWCsdC0TwxoT59
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:15:10.4347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d4fb8d-34a9-4e31-726c-08df2e8aa42f
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11963
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_021526_215361_8ABDBC7D 
X-CRM114-Status: GOOD (  12.35  )
X-Spam-Score: 0.0 (/)
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

Hi,

this series adds I3C support for the Renesas RZ/G3L (R9A08G046) SoC and
enables the controller on the RZ/G3L SMARC EVK.

It starts with a driver fix, which is independently applicable and
marked for stable: on a pure I3C bus, the I3C core leaves the I2C SCL
rate at zero, and the driver used to derive a zero-width open-drain SCL
from it. It now falls back to the 1 MHz FM+ limit instead. There is also
a small cosmetic patch removing a comma after the sentinel in the
compatible table, for consistency.

The rest of the series adds the DT bindings, the driver compatibility
ID, the CPG clocks and resets, and the SoC and board device tree
support for R9A08G046. The board enablement is guarded by the SW_I3C_EN
switch, as the pins are shared with RIIC3 and the audio codec behind
it.

The I3C I/O voltage can be set to 1.2V or 1.8V on the board through
the SYS.3 (I3C_IOVS) switch. As software needs to tell the pin
controller which voltage is in effect, the series also adds pin
controller support for the I3C power source on RZ/G3L together with the
matching board device tree configuration.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
Diogo Ivo (8):
      i3c: renesas: Fix zero I2C SCL rate on pure I3C buses
      i3c: renesas: Drop comma after OF match table sentinel
      dt-bindings: i3c: renesas,i3c: Add RZ/G3L support
      i3c: renesas: Add RZ/G3L support
      clk: renesas: r9a08g046: Add I3C clocks and resets
      pinctrl: renesas: rzg2l: Split SoC-specific masks in struct rzg2l_register_masks
      pinctrl: renesas: rzg2l: Add RZ/G3L support for selecting I3C power source
      arm64: dts: renesas: r9a08g046: Add I3C support

 .../devicetree/bindings/i3c/renesas,i3c.yaml       | 17 +++++++++++
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 35 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 21 +++++++++++++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   |  4 +++
 drivers/clk/renesas/r9a08g046-cpg.c                |  7 +++++
 drivers/i3c/master/renesas-i3c.c                   | 16 ++++++++--
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            | 25 ++++++++--------
 7 files changed, 110 insertions(+), 15 deletions(-)
---
base-commit: 5d13f5297a1bd1fdff5fab7efcdbc9bfe407e457
change-id: 20261020-divo-ssgrlpcsrc-2966-i3c-bca85b48f943

Best regards,
--  
Diogo Ivo <diogo.ivo.sx@renesas.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
