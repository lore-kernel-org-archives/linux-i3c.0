Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB4460A382F
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Oct 2026 09:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dxWxu9xk;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=mqD+cVm0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QW1GPANW3l6P1TbZupx1MtCCl9ay7rDg4FSQQ1IKeVE=; b=dxWxu9xkgjg+dM
	+ihtUWHFZSxARJ6EpetVJ8cDLR0yQB1/kq3ZHnu1ZJ0KBq13UJ7dY5e9+uiiOl++nf1D4lQlJkaF5
	0LPy2XaTuOAn212QiprOfZyXgC7mLIekBI0N6p240MBfhWrGffv8Q/L4eEDfDkEKqfd+wZEQMNogZ
	DxBOHDq5T0YxV/Fj9t8OSjoaECgeXUS4lWxSpvydIEHPinJmQoIVRQeOCnDh3uvlBSbQehbFXh2Vr
	JdIyVOOoUZtWCq6E10zvlRPE0n2UFcM/DPicFXqsbzJ95fCjWpvczs7IAHPjHZiYzqeZkuVjHFqcH
	7KN1xzWVqS1bgpIl3wKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6HX-00000009IXB-2ddB;
	Tue, 20 Oct 2026 09:37:19 +0000
Received: from mail-japaneastazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6HT-00000009IUo-2F4b
	for linux-i3c@lists.infradead.org;
	Tue, 20 Oct 2026 09:37:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMDguOLJGyGRwCpUsatXF0OUNdHGHOz5vFqjvSHCtPum6Nr9q1n5XTI1S8v9e/XYxr7Od/HxVVjD5W/1w5Ea/A8Xj3s65tJ1unYEzs9qnVbIzShYnd0jZSDKnuv8U4R1WP0eJaZLUaavAA+JHqgUUScgqjLxh9IFif7iGcZ/EDYw0jxFn0UXbOhZPROZqvEQq69C0IxT7UQIwhG/xMxgXazfWgkedp3XaCB2GI0u4qAH5cSbaY5TW2Ui3fE7Y5NEk9ePS0ISfVIy1AHOcHcl8YPTtUfxNzzy7uKC1OeY0ZVw6jRZtfkrqCcP1BnXUuUsnIRLMW0n0ghn6CBZCR4TjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN07oYTNHpgrWHpr4dT00mwXmigBoQA2gSJgLQQ5k1Q=;
 b=L1f+poFfwbdZtuO3AB7Zni9Si5RPSi4Vgr+jmbq1H0ZjwboYA0QGauS4NQnzwCCAJ+mXc9cmcWapogVKIC4MowQr79nDIhIMuvrJLgH+RsRP4yDqOjLUTFY9ron0bRTP2fVRCp8X/VKiyX3iD40vo/IfForakrmsbi/pqDqyUoLVUW75ekM37WZPEqmBfAiYq9KAFsgfhwunlrdtuc2SEsyk6x6gMuIPnTY8a3SED7886np9t4I55Uo5wP76P1rrSi19zOgFeI8LYomC0Fn0OoxtVBkAb8Gw4lMZ+MssWpaK7+QCk5qPNGQOJ7TylV15WqYk5VJ9kJfoCNd+BVqgdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NN07oYTNHpgrWHpr4dT00mwXmigBoQA2gSJgLQQ5k1Q=;
 b=mqD+cVm0vrOiZ1E/eZ5WAJBnGrjAzGh0gCrsgqUabnpSzoLO8JKLUAuvSxZ36DV9sAhvOPDgqL7p205dJ6nl7bqEXyQFC27JKpf5DKkAFZDfKLRHVnzLdKZHVEJ7zP9R5iOMxKRGhpxQHgjl2PpwBJydVI8ePfYNnnFFEO0xNKM=
Received: from OSTP286CA0117.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:225::7)
 by TYRPR01MB15089.jpnprd01.prod.outlook.com (2603:1096:405:224::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:36:55 +0000
Received: from OS1PEPF0000D216.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:225:cafe::af) by OSTP286CA0117.outlook.office365.com
 (2603:1096:604:225::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.18 via Frontend Transport; Tue,
 20 Oct 2026 09:36:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D216.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 09:36:53 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 044F8300024F;
	Tue, 20 Oct 2026 18:36:48 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Tue, 20 Oct 2026 10:36:28 +0100
Subject: [PATCH 3/3] arm64: dts: renesas: r9a08g046: Enable I3C analog
 noise filter
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-3-b7ad60cde650@renesas.com>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Diogo Ivo <diogo.ivo.sx@renesas.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792488992; l=924;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=NKF6tbMMjmvGOAeEsWBOVON2VPeVy4ixWhxfv4jHvFU=;
 b=IeOFsqRLeRP/iDAKA8KgUcr9Yy4VIZkX0zIAGbMv+zD74Owma/YRo/SUj/Snv+0tTLGYpZPuS
 rdXGtjOCJpQC9Z7/689TU5Cd9RtoRz+bHzWN5acWp54zoXsRFs0XR7a
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D216:EE_|TYRPR01MB15089:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e80432-e730-4888-7e4c-08df2e8dad0c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|7416014|18002099003|22082099003|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 8oSZEn7kKB6TJfjLqbl0ZY2zOkqVs1/mb7OP0HwZyDjs8DNzf1959+Df2H3L5uh6noEx+6YFLD1+a8H6jWGoyl+8as/U6+LWy6ti4yovEEU6CR5nfwMrvYed9uYIOaYd328wQS2HcAgydqkhjQe6+44BzazqXTNX72vjcVb8bhcAzDczhTE/xIc3Em4YSlUKSVZe/4E7TAkWeQz7C3moDVUhJjqXEf1C9KjknrPShGEt6GwSSolKnykHjGZWzrB2rIxlyUwPuUAamWp4skXt+VxeWJpGeAlA1PYgYy6puuhYiS757CiOCDLAz7aRt8untCYDopOqtbPlEjVRBAECDwiAs97EY5Pece0gy07uOtBxQeG/LhqOEM0NHAOb3T3fMywBhaTbRT7TwDCZ+LYohWYpL6yGwSELvmrDy9rP+iXwJRNwNmKfrsC+sXMAB4NdxUB0AJp5YFBNcqdAEzjHjc0exTdNCtpZdD0BPsL6dxYZp8+i2EDXIEqmd35GWK0Ciiml8GByV5WFlQWpj47XxUkdzAIALuLg1bKe7wbNBAh7h86PSHjKFACUn6vNESQxnev8v0JmzQ8pNtI1kyx2D+RAZdM6hXDEcZA7loI+RIOTkQM123N/Hx1SXBGewNF2uwxzPOtWZAVT6kshjGr6Zu3+5WNFlq/AbuvtawWiKxTJeT6r/p4trXgVAOhqreKGAwq4Q+Sz2fb2U/28SlCjuA==
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(7416014)(18002099003)(22082099003)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZTC7AejI75TN87JJIRNAVlZX1FLRQOAPmF2UstdM+301SZh0wbfdTEb9f0a4LOIW1abNadwFn3zv4/iwN+i/OqKBI2GLT2FSZjwVJf0f5NBgx/33ePPO3P+I7YmYM3+3VUWTe2hficiHvfn9TNcpq5845tzkFHLoD133WRVR27EXpT7x6bdF3wbVAMOdg5tw6TGbgDBpYnKNt3SqWz1lV8bZpF13pVcn/2xjTMtePmR5gw+ReqOleeY/eyu5MSy8Pdn4kmxTFuJqrFuy5UplGYuzSbSgMZDSUbyPeYSxOMlqUFIBvSBQt6BWiJmwyZpoIwyIL9dwRBulG60+CiLane889JZIMCZs3KqmXnqnJ27D3JyW1Z2RL6oI8C6LnNbPJTuR1oadrGimS6tVWWfiQ6fce80Zw3RUtpNan53XLaCBsaHDwv7PXvlBjV4Sye07
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:36:53.7821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e80432-e730-4888-7e4c-08df2e8dad0c
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D216.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_023715_580251_945E95FB 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

The input terminals of the I3C controller on the RZ/G3L SoC have an
analog filter for noise removal, controlled through the SYS_I3C_CFG
register of the system controller. Enable the filter through the
renesas,analog-noise-filter property.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 1b0b95b12ef8..1968e18fa587 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -650,6 +650,7 @@ i3c: i3c@100e0000 {
 				 <&cpg R9A08G046_I3C_TRESETN>;
 			reset-names = "presetn", "tresetn";
 			power-domains = <&cpg>;
+			renesas,analog-noise-filter = <&sysc 0x440 1>;
 			#address-cells = <3>;
 			#size-cells = <0>;
 			status = "disabled";

-- 
2.56.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
