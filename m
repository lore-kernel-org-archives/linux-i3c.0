Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B469606A319
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Oct 2026 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HD/re0L4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hNpPxZZX;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=QC2hMfvO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VrbOWDhAG2908tIGGREdxaSx+IKHen1iVLpKG3ElR4=; b=HD/re0L4H33F9L
	AY65BUWjgEBmcIzXK1WYas/xC6aq9Ce2eq+Goym02SGBHgzhZhkJ098YV+nivw0isP6gfExJZHiON
	CuiOUIYhTvHERFT/qfeVNDHdY7LLsnAssw4V894GeSU4dCctRT7vupoXIwOJi7kfmXSPOkIYAF45Z
	gho/UCU6aAKfZMzsT21VVRU/Q45umRBVixGilgvRErxr/tMYXACEUcqPXSUJGCUIws7WOqVLmhLXn
	BwedV2GbwjShurtXA0PZI/2N8W55qdH3Ejeof+B9req0yYtgXRA0DCoSMNhgTmIwOKX4rYNRYHk7+
	JOTEFLlekVmlEu+5Cgiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5xD-00000009H76-0BeT;
	Tue, 20 Oct 2026 09:16:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5xB-00000009H6W-2Oee
	for linux-i3c@bombadil.infradead.org;
	Tue, 20 Oct 2026 09:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jr+G/p8XMQAY9tyUfmyaX6KaIuJsbczzoCGevSxt9cw=; b=hNpPxZZXiu7yJKLJzwsvzLmKKe
	77WBo1KNXklgEef5HrT+KvmoT0qyMa/xSqQR4u6HYhTjwoQXZzF7Bv1MQOBQ7HtAAJgaJis5vTByK
	isGN4Ea/3nSash7PJoWk3P+8RXiYyaGinx9dBxjy7dLG10zawFjBhEX9t6+UMLLaKxSN5fCIi+oJF
	Zl1ouP4rTG3+aoEoqvEuwpKzz11LoJlaT4qywt6co0Al6w7Du0Q78WPlyU6o+THKgXByJx3X9grXF
	sF3B5lFMOdGqnFqENXNiP/EguUbkkA9GjtUGZlrcYhxUKuNO6+N8KDb5Tl5J4bvb+SCnKkcZM9peo
	KoG1Y5Bw==;
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJ5x0-00000004W9g-2uh2
	for linux-i3c@lists.infradead.org;
	Tue, 20 Oct 2026 09:16:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwFjxn6AIiJjrO0wStgInBrHIwlWj5XEkfcx0zUPzDh8drnAtayYWVBGSC8dlBLMByyh3520iOEuwIE/vsmy04ce1gprD9TBV8iQme+LGKTICkb4Cl5Q8P1Fak4+J8TqAyROonxjIfe/xL1WHROsvf7eKtKeXdesz8K9MhI4mTPtRDmDatClkT1EG52vyxWjtOObQW+l3WfSRg4SFJIgIzDOlMcQsbqYHc5AjSMcIO52tuUKfPhmmpPZKhI5NDWMWOixdcZGSBtUnKbfqpgk0mqQfbPWAt1dXb+qzc4+WdQH1QG91InRJ0+Pv/ybmKynAU2sY10gNelhGMEhfmf5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jr+G/p8XMQAY9tyUfmyaX6KaIuJsbczzoCGevSxt9cw=;
 b=lL03/mV7mRvppVaiNJcHg18LV6djJlRwQnuc1hvTXtC2n6wmztslKwcujQQdObKq7l+/ytSWGdjlpeELxGiHCy2ppdlMpqCEarkixEaVisFbxKOvvQGCTstAF6HuQhreE5JFV8KBcWCvVP6MvA+/ty6hLdvxv2Pw83p6//I4hpxA3xSUYp70S0Yz+7bzqTs2283c5a/vdkuBg9ThUjpc9G8uf6XINHDN+gos2ZlGwv5vEv4UPs0krk7VJ8hNz+4glC5ZoiZhfsoRRbPK4P4LYAvKfylrsHXzQQoq/gIkNCGOmkIh6BDGBoaMf5qczIvMxid56YsVvDujc+nOocnyeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jr+G/p8XMQAY9tyUfmyaX6KaIuJsbczzoCGevSxt9cw=;
 b=QC2hMfvOksScXttBouaDPHfd9SP8iMy+duGx2OGarhObbzGhMtUOWa1Iexvo6i79CFPcc+EtJxtFbEXiGJbPyUesRcA995GqRfRx+VnMX1SYc0FBqaZoXNlEcoLqtoaQaCGa40uRdSMgT4Y5aH4+4/vzV0TneFj1OaoRhMBBXrk=
Received: from TY4P301CA0093.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:37a::11)
 by TY7PR01MB17942.jpnprd01.prod.outlook.com (2603:1096:405:39e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:15:41 +0000
Received: from TYO1EPF00005022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37a:cafe::2a) by TY4P301CA0093.outlook.office365.com
 (2603:1096:405:37a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 09:15:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005022.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 09:15:40 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 962893000274;
	Tue, 20 Oct 2026 18:15:33 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Tue, 20 Oct 2026 10:14:58 +0100
Subject: [PATCH 4/8] i3c: renesas: Add RZ/G3L support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-4-30a47f25e515@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792487702; l=1536;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=JXlwmCnq7MYGt/F2TDMONgJzT+8Yga+wc61jUHjDORQ=;
 b=c97oD+74nYs0cyzTwK1/7AJsuuVv/UuQngEwH+wdPcHF3FXiJkw5NN+49ucd0f+EwC8KXaO/w
 etwwV6uwaZADO/H8ZtW3wvmHtYUOmnJ+39IxRGagX5DpWRxMe4RiR3D
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005022:EE_|TY7PR01MB17942:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d3ce83c-ec74-4949-6941-08df2e8ab60e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|36860700016|82310400026|23010399003|921020|56012099006|11063799006|261009221227099003|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: PO+P8yX6sOJns13oDk4vbyfsCDcOJlP6rNGW+TlYtMtdyz9H5hKL9rZLPXmpgAKm1npaePflE54RFMPDN4uDos9iyplBR9/2enxmxZwWeWFBExBGreKKtOgtHNCNwabJIZ90j7yepNHy0m5Ip+ytk9/dcc0FlTCbsEOyUOFicGZ93xJJsg08ntsHujEb2xER+gTL1flS8a9rtf5vzRrlXqE8zC53eSn49wjGV/iaWSEBDEkWe2/cKJs4KeDaklze60PcIIu0LUN88kQgqHwdNbFQU2j8aOgCwL0t7v/0auX69wBKBFGCWW0A/jTmlzZPLwKQmKn2Wm0k315qCG1+0iPyP+3rmoQLKJAoneuEJ9I7X9BWteaUezqsEIsVQDnYwrMcH/OALcXlYOogZBvPfBZyWCbc08VRCwcpmuuuIOOqpIhmDmtgkUW71bqv8b42dWHcHNtLjH+wyP91D1+x+6EfZQq0/QYz58fiKDOHo1Oeq02Jf6UAzHh/c+IhqzMALOdWigNnVzMtFZXLHln1jiBE4pg4YB0hYzISxMJ9KWhD4LIu0q3w9Fy8FR2VDLWOZgd/S7g6DF0XSXwDsaYLjyqRE9bF7/wCvTEAiGlwBnfA+YquSel438f+0tw83aWRzruBb/zox1AQl0UNSh6Qbe5jK5mAGos5dmBBRITBloDWP2s9YUEzZ4XYL7rK9dkZyVeuBLdStGRhJJatgKQ3aqukG6sCHHN88G4R/65dBhZwKU3vPZlor0JHaap9DIyN
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(921020)(56012099006)(11063799006)(261009221227099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wAr2BYgylpVgjeDMxj0jIg/1YN+h8uAgz2xGkQH3IHK7KAyPblQLPwn3L4LimRngk7XANASvwHmz80oJZguzQmAtdipM2NBHunjEFBMJzS3Bf15eVB+vJHb7LhMrF3oHlZuVTJjuFJFNI/hY72Vmnbm78M6JAzhZOtvYbOPYH7Sj4P1UWHiTXV1psltHUw+V+wICLBxn8ktdDdjMTBRVUC1VvCUoQs64vMQJrzeyj9102hsK1BEF0USxJOUzJ9jj440n2T1KDssr9moFCrpjZgtSZLr1OB36P7qkpmBAYuP3rdOfOsYmLm3VXIFBGBlwnNKBnj/MUmfYMY25wbOMBwEGoqb3NxXSBPEUMqO4beflJIWJX9nDTcl7CsxGxgaKVBOaKrOsq+eQz+PLioqs835JjEDH/u5MZcR3Q2bvVi1eM67OSDOlyx/YX3WZNBup
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:15:40.4171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3ce83c-ec74-4949-6941-08df2e8ab60e
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005022.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17942
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_101612_405101_57CFA9BB 
X-CRM114-Status: GOOD (  15.43  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the I3C Bus Interface on the Renesas RZ/G3L (R9A08G046)
SoC by adding the renesas,r9a08g046-i3c compatible to the OF match
table.

The controller is very similar to the IP on the RZ/G3S. However, for
instance the RZ/G3L variant has no HDR Exit Pattern detection interrupt:
RZ/G3S exposes 17 interrupts, while RZ/G3L exposes 16. A RZ/G3L node
therefore cannot be described with the RZ/G3S compatible, as its bindings
require at least 17 interrupts. The same point applies to RZ/G3E, that
requires 3 clocks while the RZ/G3L requires 2.

From the driver point of view there is no difference between the two
SoCs: the driver only consumes the tclk clock, the presetn and tresetn
resets and seven named interrupts (resp, rx, tx, st, sp, tend, nack),
all of which are among the 16 shared ones. No driver changes are needed
besides the new compatible.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 4fddc1b4fdbb..80a6df1151bf 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1625,6 +1625,7 @@ static const struct dev_pm_ops renesas_i3c_pm_ops = {
 
 static const struct of_device_id renesas_i3c_of_ids[] = {
 	{ .compatible = "renesas,r9a08g045-i3c" },
+	{ .compatible = "renesas,r9a08g046-i3c" },
 	{ .compatible = "renesas,r9a09g047-i3c" },
 	{ /* sentinel */ }
 };

-- 
2.56.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
