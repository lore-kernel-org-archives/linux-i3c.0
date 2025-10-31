Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68308CCFA00
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Oct 2025 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+qenUQ6KMCBJ+HcZ0PGrww1aLok8vsY77vh3Klw89oI=; b=eLwyFCGr3e16FV
	VropgQHXzenVyWmWJSNa9fHWUorYCC8H6BjbOw9j72CS4W3Z+QcOPTOWkCNV+bYjsIG8C0OerM4d+
	/qI6MTt6656KY2iabWjAGYZ/0kkTwk8n2DATboRceBAQPVzGCaK3nO3Qd0LoDHkQA65ZcCpa06/wT
	un3IizESxShV8/i5djIn9p8pi4a2u8TQunCU3T8JGXbyzdNiUMmqPnF06clfafe5NmiRUjv147Ol7
	iWCDqSSx1hjIPcjmtGJYVm5fQAB21vFGQ3R81CNLgD5WMmJBZMZblGgXtuPtvo5AaW7Rxd++QvK4p
	B0LQA/zhE4j2P2SsSOwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkWB-00000005edD-0QmQ;
	Fri, 31 Oct 2025 08:29:55 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkW9-00000005ebM-1Wx1
	for linux-i3c@lists.infradead.org;
	Fri, 31 Oct 2025 08:29:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKm6dUl6XgmuIpvzPIM4wd5AdqAvRWWtuQhxS9L3DlPHxDz0d5JoKitzXTHwGi7sfsnOMxLa+958lWQV3A6T2QKsWSGJOaO9L1fZ53HZNBA5qJsYa+/rg8o8KBItHzq1buVF7p88nMAFlvZI7Dq/rRb8+WOyqb+wbd5fVYhkOA9X2SxjWrO/bpRXI0iGtiIfFtxL608bKpPfMixwXmvtG/oiMGxbcroxB9PznbfVTRfM+B3HWrNVmiCjdTdi5qv1oCXE5mlXUPyNQt9lprsOVkMIiUn5lvORDhZWi0Jh0fNhBt0wFLPVKK0bI41mXpDL7l5F8s3CGkLqaciVy6MXWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvXuEzQXcGIkAmxhp878cRyz4xuE5lVARetjfFS4oTE=;
 b=Lykv+K21eXYEGB2AmYqdD13jylaLWfQTN0DkksW69XMpBZ/E3Iq9RTc8UOp0/PbWp0tZQoC45MnwhjyPK3eChKTxmuQe+yQriiuUO4LjnZeTKbBlwJ/csEMdWYOVTnU/IbcYlhzHDDpd0d5xehcnXGp6Uh1UeMcgs/+dHcqvtZXouF+UqlEBzLx6GkJB9iHr8pSv5UiVmzq/nLqaPqqqK8AeJGlwPceidb/leKaepxSoFFfQCzswD5YEDF8U8IkeyBCLDDwa3JIgeOvNFNk6Wy/3CuRvpGro9YW9yFC4GnceEhql9s91GzFrT3aLVuWc67qwZVpoZGkbQuovgv46Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvXuEzQXcGIkAmxhp878cRyz4xuE5lVARetjfFS4oTE=;
 b=WyQSM1OwmMjQAkzRBRiKG1f2t1N/u5J+ZrBM58dLcb1ckGSOWkkuGCO7+U+4TfojsR1SXCrLX/M0JJzmHWHfYnQ3UEGPGPyNk12LaFfny+XqE7Yo8uGsc7BGrIN/Z40PeUfFxGsuxhpFKWsMkx9m6oUDZQ4D0rhA4dF6Oor/jHdcT4N5Yd1VD4z+JAG80gwPu4fO1sUITLeZL27NSE+BF1CGLeyHPzFkAPoUjc8fqfHvcu6i+rFBrKyfxzY/H3VEeWa1hPZjU/crtOdvSa3y2ktIRNCXFFU3BTr/QjLhH5FFzsOcXCls+t9Nhd292qcD8YBNvVfIiHJ4cu5MsLWR3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH0PR03MB5862.namprd03.prod.outlook.com (2603:10b6:510:42::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.12; Fri, 31 Oct 2025 08:29:48 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 08:29:48 +0000
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
Cc: adrianhoyin.ng@altera.com
Subject: [RFC PATCH-v2 1/3] dt-bindings: i3c: snps: Add Altera SoCFPGA compatible
Date: Fri, 31 Oct 2025 16:27:29 +0800
Message-ID: <60ff012d292be895cc2dd058fa78de647ee087c2.1761893824.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1761893824.git.adrianhoyin.ng@altera.com>
References: <cover.1761893824.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: BYAPR07CA0053.namprd07.prod.outlook.com
 (2603:10b6:a03:60::30) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH0PR03MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: 22240216-0f05-4aec-cf46-08de1857a716
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zXFd8WN+BOU7PP2ljXX7H0pwzP9E6CXdSO2lZH00InM9yowYvABe32BLKzFG?=
 =?us-ascii?Q?lsBld0HaOZ9sNDKep3KdvdZL1N8AE2ex9WrFFmeL+8bvyUkdH/PNb8nnDRE2?=
 =?us-ascii?Q?siSBB8210k1+Nwci2gd9dsHUyemGJBS6ncZD9TSmpqncNlmVvO78rC06W05F?=
 =?us-ascii?Q?A0FGlXLSAQY9JIng3Q8FMAnueAjuMPiej0TXVd5M1DJ6r+5HukTtSR8QEqPg?=
 =?us-ascii?Q?NePPYzAM8nWDeVzn2CbMo6o82ryhCrJJPBJlyG3uKNdVJWSEK9lhsNXSHCgm?=
 =?us-ascii?Q?+IH4YTSqf9bYPD67htsVsQva/H8SzirnG1C2bSRJSkctaRbpZUjLw9wdB9ur?=
 =?us-ascii?Q?AFKy4dI/qhCGHLjoXxpVLdZwi3964tDuTZxlsBRO2VIR1n1/d+Ni6Zx7WUEn?=
 =?us-ascii?Q?I8lBaGb0LR2TdBNuwBspRGMX6/Pp0lOVoUsQsllEV6oYe75JoN04mTlEL/vy?=
 =?us-ascii?Q?zi7LP+bcUKIWAdZkE95sZZ4Db82AeuITVL44IlXlhRga9W+E8KcKWOBdO59V?=
 =?us-ascii?Q?4SFVQG9XZI0KyOv/rfZFR7u78sYCIhe/ZJXRMlZmpALknTQMc6ml64/yIox4?=
 =?us-ascii?Q?XUcjNxiUclQg5qXobrLNCi9FTHqvyXi4VuNOj0wsbCCCKflMBf3nMGS4/E2l?=
 =?us-ascii?Q?92MxohUZTFYgEXji5IHmTAsMXunH2Ez+KBsHhGKYBnqcqmUYIBeYtsn6ykKJ?=
 =?us-ascii?Q?dcWSUXJOqTLg6zBI6bCdEFM8qF+ju2865O9I8N5pbntgZcC+CHH6HRTUX9PV?=
 =?us-ascii?Q?cT1zge8xSnHMN8UtOkR7sA74nsFPKe/B8/abXU7v5GAezNwxFKaLAvTzV8Cw?=
 =?us-ascii?Q?WSw2YWwzKFQ1eUAlEikkURBXpImW+qPmYL/S5V7PfhCwsvm0WP8xKqhGUJV1?=
 =?us-ascii?Q?RUMoKAmIO+Pr2vx7sQ55/EbnTFgM2a9/z3MMu4ch1x0wn8MmSHS8tIgj6aXs?=
 =?us-ascii?Q?tdJRc8pkyLbjenn6jeCpeg2ZzE7qvoqNVpIlNJ829lJ9DqvxdqRTK3zLgNtJ?=
 =?us-ascii?Q?v9pfz5RlRHLtH6edhrN59PYqVke9bWNixNt+gEt8r6S48kCVEx8+9bGOv7VL?=
 =?us-ascii?Q?nE11zNdpA9YsW/SOgOHUVt5QjpGcscX+TB6Aprf9A6g9sBNIRMfoZKBiaSmH?=
 =?us-ascii?Q?1xUhK76r7p1YxkiBlS7hZuYQ2AJ2RBp/WK7poRPeLVY6ggIy5YadtDpdwD2r?=
 =?us-ascii?Q?ctduFFSVPXXXIKt9SnGvioiGFg9jU86iIpbbY/iNBDHbGVA/sKW9M6VMo/+n?=
 =?us-ascii?Q?sNfs1Mss/wF/Bw8VgjsYnon0GDQ6a+ooRbYMwZJA53wlCJwu3ODoN3xYIoW4?=
 =?us-ascii?Q?9lCRR0y3xIzjS0y5UFe2M+LPSU2tEWU8Bk3XT6HWvIqGxGtnYf8u0IE2QoJy?=
 =?us-ascii?Q?Bh1B7PYkxrxVNQdYHti4z9jyTaLCYRjPWxFP3k3exo9pZAsZ7DE8wr4BmoZN?=
 =?us-ascii?Q?kFpYHkVOMorLEMG2RdyKXZltWEY3Zlfv/IIL8HG7Es8Afp27/f0wrWrwDaHc?=
 =?us-ascii?Q?/DbN6P1PRLXx1q8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?16IntP8jWKGhXVoRIgONUN/Ki5EUYa6AJ9gftz4rQpgGQ+1QRx+N9Eh1dYPm?=
 =?us-ascii?Q?q0z2CQ3YTSFIvHWkZ9rLi+2e1gXwHcXELLdbF/kDjNCDj6mYPmAhFFOArM8z?=
 =?us-ascii?Q?Pp/XZzzxhUwgyieNAfFLwKBr0wlYLnZ7Aw7cP3iarq25AOaBN3ju4B5Jg8lG?=
 =?us-ascii?Q?qT9a7ZNNL63apRuwGKULDFv6tQjj28YA/DHIcvRJd5iNJPlgFC+teaNV9Q9t?=
 =?us-ascii?Q?jBtsRGwy+HTy8vrjfWyv8g7rDnY5LXhHa6jeXS1iPq8e1jz5x+ghchRlEjjg?=
 =?us-ascii?Q?csKMr3mTWkxgvkNMpSfXtCkuItFd9wVtmVEpk+EHMImm9VdrOBJevbBrdXYt?=
 =?us-ascii?Q?f1Sw3Ci++eRyWjqIg60KTEdGm8ywiw/873bQpqsfFwRSKpvSXOzyLFHcypc9?=
 =?us-ascii?Q?0vREVo/ntN3l9qsW+igEfxfT3m3SdVBr16iKJf5AvATFUzbsiSmmzKHvTgXr?=
 =?us-ascii?Q?yCdicXv/qHXXhVpZTVcsscR3cacxh5WeyJomaUoOY4m2u/tcsRBq718Gcarn?=
 =?us-ascii?Q?PUUlLGF6ry/P0yPAY8Dp8i51YgFIGxZ4q3lM16UAnhfgQmRAKPdqp1fDJQ1u?=
 =?us-ascii?Q?QWboS4kLK/szMTSNnbQwfODOTAJi+6ZVeCCiO+lSuIGMxAJzqFG4u0O1guYB?=
 =?us-ascii?Q?+mJkb/58svgeaPvD+xewFxGy9+H7qFAfa7Fva8XKb7kflPRbZTmaLTPU9rjp?=
 =?us-ascii?Q?kpvEBACp9Fi3vt2BLr+mbz9wnM4dqPTcfIwEVBsk89higrB3jyfD/bn3iMAM?=
 =?us-ascii?Q?wZf5WLocGnC0clX+U9vb6QY5qYcQjjrComcaA3OE+xMbdYQpeUmqiJ+kDJZJ?=
 =?us-ascii?Q?MwIw8k9Y8LXQh+W6rpH9HGmWjuiFreD5zk99RcRTxIjIh9azSzO7F8/PfmpL?=
 =?us-ascii?Q?n5yL43zN9gn1SHB+ei//VM1ryy6WpNDbejfuXnzIBsgmgF9CaLDoNxyA+Wm4?=
 =?us-ascii?Q?r02CxCv9NqAIG0qIRlNpvUmAVX1qwoXkKkorUZ5A9fM8BZMCZkJ0xmtVHPYf?=
 =?us-ascii?Q?RLr1nwbQr4ArK+xwaqK7vEsu1SV/a5K4sSWdzhEcnwRW9Se81CwaVoPgP2LD?=
 =?us-ascii?Q?eSeKBsZ3EsavjHxC012gkG6w46yyQy+ffE9fe8HGC31QDaBPwDh3sdzmxxt8?=
 =?us-ascii?Q?nglmpFAlrCvewbMrDSCQQLmI7uBBQSPA23Tc9jX51Wl5qLdKV7Ulbj13gCEU?=
 =?us-ascii?Q?Zlg/UljIkq/p6djt7W7mlVJ6tnJWziSPEX7XPh6uhZu5rIRoDKHXFahVyYPk?=
 =?us-ascii?Q?55XlD0dUaDOen6tw1BjUPggGt5ITyoUSC9IakKc23genQ7quY+L20FkMD5hF?=
 =?us-ascii?Q?ny71968AbWKkLRyNOr8I2JAezVZ8JDsx83puWgJIMo+C1+zx1OWXqDBHZMSL?=
 =?us-ascii?Q?VTW29tmkk7ikuIbxNCGUOtBVw/IdzpWodmoGZAwyPwWWt77/FQDJsmky1HcY?=
 =?us-ascii?Q?v9MNfAE8ySRkc0HFT8Sj62Q+tc6Xuy+w+8VLbn9uJuEGoEIZZ14EvP7W17iE?=
 =?us-ascii?Q?oGSi6ERxkfbK/HO/HGOWTfboX1hsMBtABCIYOIVm7BjAgdxoXMsb9kjd0oe/?=
 =?us-ascii?Q?igNCdRCNRSa3YGCfP7nhp7k3+AT/LDfrtErsbl7onbxl7JV2vpVGqztncoP0?=
 =?us-ascii?Q?jg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22240216-0f05-4aec-cf46-08de1857a716
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 08:29:48.0427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePr3ZNdGrUPewvpqeTCnqwAfZX6XUldfPuYSb6BZUsKCPLtXnRdwoCzKqtWPV15TJZ2bCtiKGK36pyxpuSaGu4naFshInDqLuiibuJsnE1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_012953_425890_A135C2C1 
X-CRM114-Status: UNSURE (   6.56  )
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

Add the "altr,socfpga-dw-i3c-master" compatible string to the
Synopsys DesignWare I3C master binding. This allows SoCFPGA
platforms such as Agilex5 to use the generic DW I3C master
controller while applying any required platform-specific quirks.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml         | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index 5f6467375811..b382d3a72bf7 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -14,7 +14,11 @@ allOf:
 
 properties:
   compatible:
-    const: snps,dw-i3c-master-1.00a
+    oneOf:
+      - const: snps,dw-i3c-master-1.00a
+      - items:
+          - const: altr,socfpga-dw-i3c-master
+          - const: snps,dw-i3c-master-1.00a
 
   reg:
     maxItems: 1
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
