Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D64CCF9E3
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Nov 2025 07:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m73YophM7bp73GnB5jMVwPF+Tvp4shmFPzjdj4YAUfs=; b=YSw6Sf4VBatTyF
	VdBrG0zUqN4qwUFJ9c1k7hOmDKDMPdwR/+ENu60Au+jfqLBLJ4yLVZW1Krn41R+GDzs9EUgD2i+tR
	zP3Ry5pkd9sud7tfl4JyODEEz6zaVxYvtRq+yLu98iBh7dvk5DzCa6jdcAbBye1666JduY/5uewrD
	aaO8ZcYKe8N42/i/xjCvl6CPbTyKemQpPOmwCPiqjkR8x/1nbiL5qTtOnnL5Pjx5kbCbRuEc6hl7K
	3JFR/lLP7wxp0JmUkxv2Oc+iDFuwrYXXk8yEXfuEQzqe4qxV9lPo/bnIUAdq3I4N6sIAZsyXyiIZE
	krsrY3yKEh18UwEmn7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBVt-0000000BKlL-1nbw;
	Tue, 04 Nov 2025 07:31:33 +0000
Received: from mail-centralusazon11011039.outbound.protection.outlook.com ([52.101.62.39] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBVr-0000000BKkU-2EdX
	for linux-i3c@lists.infradead.org;
	Tue, 04 Nov 2025 07:31:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSn9lLzGiUq/kjHXUrFHLSBsFBtey0AgRFQ7rUKzJjXIcdz87nYe6ifLlYLAdKW8DwWeJ6tMfSrOeTYhNgH+YzCkjcowgok5GG8BYit3JDiTYDLKuk0Am48H9/Rk9GrfK4nD/ErLNtHJwrkET4ALPYgTjaRdWiOHLeSN5zh6CQM9n0Pd01AYiZQOFvPUYelyp5g2inZdz2TfnSIqkbSNRIFysZ9h5LKktx7Zqa1el32UaGJj8CW1mLnCfm7Yps96kRhn4KS7TMWr8JgCQYP5Cu25JfxakKEZeMQJ/hz3k9JKvSIiAsGiftWW9+WUxGrkpYybpsyHwEGRwD5dlUp0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukWl9JWXL3JdBvct6OgDQH9cv4oC+ooiBUqWCWVfJec=;
 b=eZKePUEDIs6AogTmYKMD/VWN1RaVtQiX0XV+7pKPy9pfRVR71qtumzl4UeK59fCU/LoN9LSxVcSFLG/8650U4PFqwc2L7VMsLZNFgYBWUmgzySVjG13CzeVRqqU+svhtAz19AxTJv1Vrk70jW/cKU4G+ihjWHq1GZMcHdJzCqrOoD6rBo7Y1h4erUFCJi+g1PpFV80EuZpw7ro2656ODb+ocAxe8GD1Xnk4mjZDbgD2V+A8btL4QW60GWmYOR5JwWm06hqAfMpmH24LQwa1aH0sdIwduaLREPyjH4YBErKf2AG+3dQcUNX+F1pXJeNw6b4JIAQpxC0+WSutgDIM8ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukWl9JWXL3JdBvct6OgDQH9cv4oC+ooiBUqWCWVfJec=;
 b=vY3D4WC3WrTQZ2s52Xmbbx9yQ4mPqCsKB9Ki1wqWjeeG55gveNrYbMfCcQRz6tSma0PBzraCmM/T2t6PYKsqj6C1q43q90dEaZF0MchIL9+W+Sdxt9mqSAFuu+ROOnSX2Qg3BlwQrAtGEziJXny9LWtAXeFPtqgYvMmf2ltfpEdi61yEC1hn/wr/TlQJOUiTAvHBVWlZPThCsaQt7kteYAq7eEAOscQrBSKHRDDujPHakX4crXqu6n6GLS7NwmfzfCtw5pLDwS9BHU0tThR5iVCK/XP9ZNnPWovnAxScOv6av0fFVO7iS6gg43zsUefj52fTgqig6jl8ZM73LmFYYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH7PR03MB7509.namprd03.prod.outlook.com (2603:10b6:510:2f1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 07:31:27 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 07:31:27 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	wsa+renesas@sang-engineering.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: i3c: snps: Add Altera SoCFPGA compatible
Date: Tue,  4 Nov 2025 15:29:06 +0800
Message-ID: <4ef059b129e9457eaadcfa6b996b9b6b000c7dba.1762237922.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1762237922.git.adrianhoyin.ng@altera.com>
References: <cover.1762237922.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU2P306CA0016.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH7PR03MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f972d1-2232-4cbf-273b-08de1b742a80
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IAAeppMlJD+0OOcZhLstRp2A7oVrjwwqSM3+/Z1DJ0yg+CilaI702gAwd7OX?=
 =?us-ascii?Q?kTwYiMSXU24qrLgBd4SwE0XqFwPce5XtLn3NdFQZ2L7SPF/+Bh+z2lh5oNCT?=
 =?us-ascii?Q?24ccJ53CqXhh/ivPUI/a8s5CaLNcolKTjNita1wyGEudg7eEMQ6EHI3T3l3f?=
 =?us-ascii?Q?jsNoNWL18MDL0G/3xCwO6JrU+C109DSAUNWhGzIOiPR11GOa4TQVAYv6OE0N?=
 =?us-ascii?Q?x0m3Czg3doTPEkaY4wOiC4Y3m7c/bjFj92tIrWxxBp1hkyNUz25jX7EVqta6?=
 =?us-ascii?Q?nWP7vceQrd87bdTYJBNoWjG71O5K1WDFlrCKD0/Kzcqp/1s6d+h9mj5bnlmm?=
 =?us-ascii?Q?B9op+cjbRqtNCXfoK/S89WhZGh5AOSI0xfwSClkuHVdsvYCmEb2pn1uN8z3d?=
 =?us-ascii?Q?aqGfPx613LxsU1utBZQ9K8690Xc3v4IAUhMcu0XjsNjC4Jw0IGr5RkdbZGlc?=
 =?us-ascii?Q?jELNVEl2lD0DQDoq6FM80urLrMhHYeYq6/aFxtX7CYiu6TvgbI6dRVcsO2+j?=
 =?us-ascii?Q?z+QQ9ugt6InLUp9Chk2bcQjU+5Xu6H1F9nJHATXgehOuwbWECL3nFf45q2CS?=
 =?us-ascii?Q?1VX8X6zs0vNQKMNX51thJZ0XThtE/h0GyZBHB6rAjcAK6tAJxKimVjPW3AEi?=
 =?us-ascii?Q?qWNxfOpKtTpYnYxXFZU6J8XAtkrAGG8VCj82mIYdtYnOSugS3zwFDPjLPyIi?=
 =?us-ascii?Q?FGRfYk5ywzBkJkSd4td8fGHUeY/koKYkDud1cfyZ1S1wfEb5XuVFbQfN7cRv?=
 =?us-ascii?Q?iNoM2o7T8CxBEZz1S5MZo+w4T2xQKtv2u9UXP0kpvRa3gOBAPrZvSWeipWii?=
 =?us-ascii?Q?KZ5CeDdoHXIdBWPgqzywew352TGpiEZtvXEeX0HzU3L0s6DuDdgFjy5KDyeP?=
 =?us-ascii?Q?No+VpLmwptg41TgOOtQxyoN9PFjGAeDleLT13EdxNaI7GI35hEgICvVMmjrC?=
 =?us-ascii?Q?u2XjTtDChgUqbN8Vm4nX4HOeojKdllHe0VcSHmbb5k+4ETjxE2hPGWJe9aNF?=
 =?us-ascii?Q?VVLp7UEd6K3zENWYvIqBN3+wFllZr6TG2GVr/I1ubTL0m2XhT6BXg+NLAoWj?=
 =?us-ascii?Q?uRivAwzNE67SoWU2kfRu6UvXPMZgxyLDaFWYKb1WZ+lq3cXji065WhVBIu9p?=
 =?us-ascii?Q?ePArOJ4WRYg/rdFfiY3eq6D2Li9rmp5E16JiA+8PO2/M5KSiSiLRZVfapcDo?=
 =?us-ascii?Q?WrS+sC2ATPsdXUX5MT0cUdIAagrziElTS/L3aaRN72LzvHACv1bC5Icb6n+V?=
 =?us-ascii?Q?2bsndgLzjZDVJn1E1YakwF1t4KA+XQgtun5VWE4RggMpzX0LRQQB37oi3ivv?=
 =?us-ascii?Q?hv2e1hLfBjdYADa7OZbD7yUf9EsR9ZeaL1ARWKFU8NHZejpxLy2QWgbUAoyd?=
 =?us-ascii?Q?psxXHW+vGEqSyfwmEl8hu4i9SXkRAyeBr5Dr2n5cRBuZlW/8WqjIf5h5D+9o?=
 =?us-ascii?Q?EC9dy/rLcPkpt8FBOwb118m+cT0WNqQJeVdp6RLYGMSEYPoJSoFtQB9Nc+3A?=
 =?us-ascii?Q?xHvWCE+id8mFseY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nsIlwTi45CWRRWCU3SrhBSNYIJOQF4+145q5S4EMLuy+G/bVBLw/pI+ySwY/?=
 =?us-ascii?Q?vw4XcEgJx09tseO6EjlgYCuwTuQ4h1kChiTVu+gsPIESVnPokcgBDCW083UD?=
 =?us-ascii?Q?JneP/SFNkTLIcmVCQhYkYonucpj+yPH/wjFF204fQMDb3kuO0GuCprqREqIR?=
 =?us-ascii?Q?yEBZ7haiyfxcfBY/+pkZHpa+Y2D3CO5AN/Tq1004thwdzU5Yl7U/lTkAkI8E?=
 =?us-ascii?Q?Bm5cfjauH9OkZocRaznDgWrPHEIUO1Sed5NYyivHCnBKXTi3FWWIYtRTsHFk?=
 =?us-ascii?Q?ImB7cWnTFtzRlKjmHXmuiGHH2dMaBXXXeeFAeVxMWphw4Xl5DL1AO9zssWpp?=
 =?us-ascii?Q?4mHn3p5cNhgOJ1gdo35PoDgzxti0F5usKZejjXakAhiLgNwCMhphIalld246?=
 =?us-ascii?Q?ZeTOWcHY2N/EsXkp3koKsG/RCUjZodUsWQYdYF2l9SWSgxdNeK+Fwr+g7qW5?=
 =?us-ascii?Q?voX0iq0chwyKYsPn0hcxGXH9inTk9ip4rDc4hjQTGMFhPNKR822Am3AH9uPW?=
 =?us-ascii?Q?pHbOjX/ubT9no1BQv/kxgzxNJ3LuSfrn8leC4GDfoJW2C8s1TxPluZBYEW8r?=
 =?us-ascii?Q?gnRbEIAA6okKC0bHAgRNR4MGt/Z0Gjt8GugNcHnr6KqUrzyImieCyRvrRLd8?=
 =?us-ascii?Q?6djB+qzOtXxl1jcJ6A4F0IKxrQef2c209TFzHTUg72Sd7f0FixfhVwhf6EWo?=
 =?us-ascii?Q?MQFTsXxZScEYcZH3PtI9DITNAxFjvxgtVK0HqBRb3+asJVL1I/2mJhgIG+IH?=
 =?us-ascii?Q?9sdPTeCjUSa5i51G3kxrDFS5DrGAGMp3dIEovsoxB9RlLADTytcoVkj1JDsy?=
 =?us-ascii?Q?XRhflnhi1LvwYWqWqN8GItIaQVUAjKM+2Y8xjqwmTrMZkrLgnS2fEdbeDq9k?=
 =?us-ascii?Q?LPLVNoYq4eU8FykLi5QNGg4Xu1qYAQkmVBL2DeIhbcxdNe6iGIO4dwbRac4I?=
 =?us-ascii?Q?x4Qh/lbsgwBLxFljPEfAGR6/yBV9d6yNpfWWRWuLED8u40Q8I3z5eb4Xs7Pk?=
 =?us-ascii?Q?qviSB2Jx7WwY9V2kP0HoDCMma1Ud6HaIVtpBJ55J93AZrCImjz5K4asDQcWa?=
 =?us-ascii?Q?txBHGt6Op2dzpSw53xz4yreuK8EgXrN/0WBuNvokKxdqzXefhkvE6/SOLa4T?=
 =?us-ascii?Q?iGJLpCdRHqMjVzJMhCpVb5W0QHwQFwVyfx8bV5yv9SETJaTqulpb8dxbFG1Q?=
 =?us-ascii?Q?6iOU/wZFXgDQvAhkaNxkLVasS2HpU1NGlw2nxDmV341NQidA8yu+hNQ5Gklj?=
 =?us-ascii?Q?EJnhKQuB1gvFnfcyeZzOmy1n2hbnBaZb7BvTZZ9fUrAOO+E6AOZyLbPj7FUG?=
 =?us-ascii?Q?j4AaNfMjqrJ57IedTUiOZAt6nCpjYPJJ9RdW6liYOp7ADWhvIuhrgBLvfDdI?=
 =?us-ascii?Q?o2lmgQAQQPEF9f12qqKeOgl9aAzJAtBxj8L0i5jnasUYRVwqpXczCKZdVhLo?=
 =?us-ascii?Q?DQTy9uOuoQQawWJTL6iWADvwP1BRl6/G3OPsmqN8BC+yDLRg7Uy5975fOo9i?=
 =?us-ascii?Q?k+0fmQG+TFy+DT+UtcM88Q3gL3CzlPki+4/NhEqlpab28W22wPE2uB4A7vLM?=
 =?us-ascii?Q?URf3lV1t4MUnf/baybKjm0ZkcKVcHMPNSazj1VgjiPyvkCRy66IVqJa+okSi?=
 =?us-ascii?Q?bg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f972d1-2232-4cbf-273b-08de1b742a80
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 07:31:27.7324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mrc1ubDtVOgcZZ5H4mBAXjHpvDJmajWiAJP08oX8fc/jvoO9tIDyGnGUtxDbxCoglZfybiqtThZTCSZbF1MhaNAHwC1QV4gQESDGcaih/LU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7509
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_233131_567780_22F444ED 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Add the "altr,agilex5-dw-i3c-master" compatible string to the
Synopsys DesignWare I3C master binding. This allow Agilex5 to
use the generic DW I3C master controller while applying any
required platform-specific quirks.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml         | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index 5f6467375811..e803457d3f55 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -14,7 +14,11 @@ allOf:
 
 properties:
   compatible:
-    const: snps,dw-i3c-master-1.00a
+    oneOf:
+      - const: snps,dw-i3c-master-1.00a
+      - items:
+          - const: altr,agilex5-dw-i3c-master
+          - const: snps,dw-i3c-master-1.00a
 
   reg:
     maxItems: 1
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
