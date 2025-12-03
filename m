Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5812FD1268E
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Dec 2025 07:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSxodnff+eTKb9a6lMLCSUxCXS9O8UX8hKMTiXWbLHg=; b=NeG/rE00U6C9WH
	YvcMGDJqomBvVXc0PXr9FF9+RIikX8VwpP/Xhiot/h/ZSknFnUWfbsutwXRO9QZeispPcN6Uu0RVv
	apUHctdD4tbi3GY+5NSE5mGLrherstpWn+HoWjFiYF2pXZSvlkfScWqdHnGQf5gQ49yjSkHbb7J1R
	2mJfkmrdBoHpRkz4ZiLh0yioUghFDFhOIB8gejEb2y4495YyvcQZbz+PQbuSb35rMDHZuUMJCZiw3
	Yw/L48LtiPYZtYt3KHPdWCbA3YJziDLPQUbd6HtMpZPgTH17Bnh5cYaxuoAZ3jZJJHl5TnSSr2yy5
	F5XRhRgKvA7Algkn2pbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhDK-00000006For-0OYB;
	Wed, 03 Dec 2025 07:23:50 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhDI-00000006Fkm-0U4y
	for linux-i3c@lists.infradead.org;
	Wed, 03 Dec 2025 07:23:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vePOomp/Iog5z5juhbxTetBVG0SDr1fIyzfdWEWsMW2Q2W1BbIdL+KCHyHhAc1UGiIiW8EKVOQ1/ymKK2jkBYe484q/fi8tgYsD+ekcTB9RAlYcH0j8AplDLIkq6CPruYSOAfgmxuOvCr9Oyjv4rLuDnICfYtSPFur3J7ecqELr/iPZb0zWhA4YoRPMYYnHBJaNRa63pmjiVGUQzRaAHcrZIs3j1paKe8hEyjwUohjbS6WL9VXI5KQycEkn9w+p3DdoY+O6EjRyPY/7Ipj4o5pzTeqsFIkcLq8S4b/enpotSMYg52Ter6KZJUazsm7AIBnrqhK4DsQQ1Z5FtTabNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aMsKiFzOovwEbGnlpIUDSp9/skOmG5vdKnWMxQhsn4=;
 b=L7lTxOeidDF0nTPGI2kuKxWNe3Sst7LGt7yBosC0HRx5uWIFIUdXlPosUyjTPz1caHM5dQPWswzYYXV2Cm8Kc4N7j2OdNrCPt4gw2eNtOUW69Jfq0pV2geAGQZimh81o41dFAswy1jkZGDDexvdaKKW1hk3r58JJVZ+ggw62AOFn9oxoQ951qYoBPDZds/MCezIMe2asxC01TTe5jG/wabgD0MG0eBmoTqsbVfvUaEi7jG+OPUzcIVyBFh/6VIQeBEqHmhfyNPSHBEVr6y89W7EHEwGWCaBCbwjR3042F0gfgg4rsh78MFRwQQ3yMWBmc1h0nL3Y0Bb5XdfybKGFxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aMsKiFzOovwEbGnlpIUDSp9/skOmG5vdKnWMxQhsn4=;
 b=aXEpnwpo5hJeYP0JupqWMsxoHVIe/MUQ++NMC4x6VnemWKQGQq8uCYnYVGEuFnE6/vkenPYbB7CLu/oZ2W1Ypv+iMLo2QXqMEOEN2jFnonz6dwCcW8N3CoLMqEPpxNKVhkdN+/Mx/o3qnLwCmoSqpn46Cp8F4cgE0qCs9yGt3l9CUX5ZYurscRUZb0+cxevM8+CzRD9RXer4Ok3gV41tdSq/xdEE/zmXOLpj9DUErJ1qzQO5Q2bQpcOW9Jo+Du7ICQxH+13fXAnbKwLV38l8UgPCgTIPRxuvzzZiCuGrcQg7BNOAOWWoiiqcd1cZT8elmZxC8VvKYby5rAzMLCXSDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 LV8PR03MB8140.namprd03.prod.outlook.com (2603:10b6:408:297::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 07:23:44 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 07:23:43 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v6 4/5] i3c: dw: use FIELD_PREP for device address table macros
Date: Wed,  3 Dec 2025 15:21:05 +0800
Message-ID: <144c97e13824da55254762ded701f4712ae32fe4.1764746266.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1764746266.git.adrianhoyin.ng@altera.com>
References: <cover.1764746266.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU2P306CA0025.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::16) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|LV8PR03MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: b77907ca-caab-44f3-f084-08de323ce405
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3suhxl9YWCzZppWlNBTdMAeBKOr58aIif2TgqUbbmIaOPT3UIkVHXJ/15rzy?=
 =?us-ascii?Q?BnIf/oh0jOJH89f1APu0uTE8Y4Q+++ARhot2j5F56tSMhrdKyxp++GyXNduA?=
 =?us-ascii?Q?429Tc76bgza4hzWAlN8TwViVFiDJsF0BmrZt+Re3MAYSgUtr/kE/gZ4scTSD?=
 =?us-ascii?Q?3h6rfxvbkp5Xi5v1bja8diZqTJ/SpJ4aAXsPdrlk8HlPJj9BGb5pqB4ip0hD?=
 =?us-ascii?Q?NcOgBzpV4nrigwecaobZpPRFGxAABsSQqlxwt4ozPgAoAA+sRUjtQnQJvWX8?=
 =?us-ascii?Q?QbFt4YzC6DgFjCQBeQ+fsaME33xM+LCLQcco1abbtkYZ0jelxAJFS1tlyJ8V?=
 =?us-ascii?Q?G/I3XubBzxsUt0weOclUqQIxG1niKpv0SMFxt5Zinkk134l7YRmbcRKUZwZd?=
 =?us-ascii?Q?jGCjVFxznh1aELsrNq+GExGabtC7k4BLbljovVnaTc6Mcs7sHwUzk8SxMxJq?=
 =?us-ascii?Q?5MbZkyd2Q20PZ74M4Kp8V5EmEZGt7cKelkWdRuokltsMNJwh1f+h64wpk6Uo?=
 =?us-ascii?Q?w9PCvyiR9OXAac58Pl3IaDcyHfW3zeatvgaSEeUa8JMweW0AIUdmPPOZbOQE?=
 =?us-ascii?Q?W8vvIYeSji2FEPZhzVFULbnxh0lxFefj92btYbWNrRoePTOkHohkmX5AzFPY?=
 =?us-ascii?Q?CAy0LisxC1qlW9/5riF1oR+ZdqqLy+1dy+EVsevFwOiZ6Kvb7G69aKzjLu/h?=
 =?us-ascii?Q?0l9SpmLsFIJtQ3NxqFu2o2rqls6C5mszQiTy0pBZpDYOPYGYppqUDLnfHlaw?=
 =?us-ascii?Q?PVe5bN8WI+seskyayO9WiBiTXuTgbbd+Fu19i9YQKBxURvEMhA8ZYs12AKD3?=
 =?us-ascii?Q?3sJqSVvRhSrjRs6r9ZxmpRBGCpOep6n/Ev99AwQ5L1vfLemIys5hMDMNpqJ+?=
 =?us-ascii?Q?BFVDIVWVLULRp5zZ4bxS64C8J/kKcmdKPqF4ZjW8e0t3+NiCcLDKERgmeitd?=
 =?us-ascii?Q?QG9K4POcnQcHQjWbuSxJeQzfmPKXAXCWVX+DWFnv9RKBFmhIDWCJNQ/4ic3j?=
 =?us-ascii?Q?5scC1UkB+eaNHhERoz+YA12L3l5N/Z2ywVogcwDH8qvD+YyW4cUW4ZePttYB?=
 =?us-ascii?Q?eqvhKzMcyiA1nOsOwxMHhf+t6Syai27Q7TBqiIimVUZXcKtAk5JWM5RN3VVw?=
 =?us-ascii?Q?Ady4nF6EsGRXCzfk5SNYRGHsY/K1keUZvxZxKyrTHGtfD14aqbLiPW1dmIVR?=
 =?us-ascii?Q?EBGXJzZLYGG3qyjxC0e3L/vhp5nXoE7OHpOHWFK8TJSuE32ogYlg2qcZuTIw?=
 =?us-ascii?Q?yGe+f73onaWIOjUYm5fiBXTic1qwGtYjm6oWlEGHxZD1UJP61UWaQ57/KSfc?=
 =?us-ascii?Q?CfdL6LtrW28KxXtxzYSwdA/YV534bq995C0Y1Os3zqE8G9vb32JqkgvhpQMD?=
 =?us-ascii?Q?DYxxZkaVx0Z2xXEDLXoKriOr68px3ZfEkHKmX7l250v4LhRZLLqwaIDOdJrn?=
 =?us-ascii?Q?URNofKqw+bkhga7Zw2SOkDTyBu2NUb8F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CYGojYoTOUkOTdCTd75NPi2GZFL/4f8se6NmDmlU3rEPK5WmNxjXilBR0Zfm?=
 =?us-ascii?Q?obCQKdUYsD1m+KDTN+y3cDavKPdU5SVo80L57RQXec4CjWhbRm6lcnCQ3pmR?=
 =?us-ascii?Q?KUlj7VgzMuFqE7UqFD8M7U4AOhuNEURUFsvUpyl1Wc4LDja7bBhBu5HanJNo?=
 =?us-ascii?Q?+XjyJpN+2lQiKJ5PXnpNQHGhDydqhAzK0PeWUNYI2ElyuQK3bntiZbH7K4Yt?=
 =?us-ascii?Q?MxJ3/fgCQNvLVFuYHYZB/Th7fn2kb9fEhjxkBswcghPAIhl5GT24v7PoL8vv?=
 =?us-ascii?Q?47jvacwvJQ55/a9bXd1nGPgUEBUGy8jY8Z/YNND5PelPbwSAzwR0DlIZWjLo?=
 =?us-ascii?Q?Z7e6pEkXP3TLrvB093y0QFk+p8bBm/X0sRp/SnpA4M/6tx51Ybgl3EFSHIrs?=
 =?us-ascii?Q?/BfbBVjx/BG6Zjf7u5lYl8uvG8W4BHWqe//p5wP+wWfYenQvX7cRr3ECajm+?=
 =?us-ascii?Q?75eSNs+x5ta02vkMxxbCIzTo/uHpJ0SiLQr4tv2DjGk90KD+jqC4xXMBBD5E?=
 =?us-ascii?Q?ZIJBE+fOclZea0iVoXOylhADH3xeTYrUr5HPzHNszc3IRBDHha0aIAp43XWS?=
 =?us-ascii?Q?GcVO0yV3mS1dXvflEQhHRSviQi9ZjqUIAmEbcgw+JjrTpcVz4OgN3ClcLxs/?=
 =?us-ascii?Q?w7WSUMHT8EOWOQpsdXqt/ENTyz/nulRIoInyvcmuf3ezw3tUIpIyD2z8wx5g?=
 =?us-ascii?Q?Ko8Bs2/YOXMDgSciOQt1x72aasFzGOAvE8D8Vbm5jZBsGyL1CuE+OMEf9rWC?=
 =?us-ascii?Q?+aY+qBGE7h25yQZEwhON/PcU1zLEuFBKIws6QDtjfFbJoxS52FuwmWoKlNU4?=
 =?us-ascii?Q?NXQrKnolwLdCppjmboV9AdzF9eqI5lODLolQ6htJdDVxg1u7C3aq7aiGQRWf?=
 =?us-ascii?Q?8QiBiZNHne/xlQ7cVcoj7WBZqKx6H253p9uexvC/LYszxaAFBqqRAhHkoCtI?=
 =?us-ascii?Q?nIT8U9KJdrbvNgcH0kgfWw0sPqm8AbAZGkDJN+p6pBVgw0R8a6rsKSqdWY1F?=
 =?us-ascii?Q?R2FjEz/f61UIv3vI68zmDdXMdxcAoVDsDJpycWD570OEgDlUGkts/zzr2tu4?=
 =?us-ascii?Q?/lUs/Z3Cl9V6AgIlhe+HQNn5S23tQry2f7Fg9d8Q17Y8C0JAvs1m4lcYXYuf?=
 =?us-ascii?Q?+WxwcHogOcsM8i9ivG4enckh5Mu5jq3N2RjFblaJOtD6jlPMInMSnfnogbe4?=
 =?us-ascii?Q?Zno4Fd0lJrn7DZuFE+PigKpaUygZBrW+TwygqhK5SxQZpQvZWdWGOlICjmOh?=
 =?us-ascii?Q?gYjyMpSylxUYNsfX6toBvOqk+x7ta9MNjZ9O5ZL+8lSbJS2pRRKFrDIMqmWA?=
 =?us-ascii?Q?xm9kUSmAlc1Nz0bYFxe8XnXfrVmqxmZaCWVN/XmgknYw7jKuV3/KCJczg5RO?=
 =?us-ascii?Q?0P+M53to2Tdbhs06TduFnyAdqj++LaSfcTQ5ll5y+ygNQKWycDFk+x5eMPow?=
 =?us-ascii?Q?h17zOHBPGTwfzWmacuUsIPZEOIvRuCHnbaKSPBm76l0kmu9nrXjSdTjlCZX3?=
 =?us-ascii?Q?LsItNcEd+oF27iKQgaJMn0x31uV4FkhgvT5T4oewlRxMTvKy/Qd+GDQRZ/jh?=
 =?us-ascii?Q?sKQi3qSlqurlM9hI2uAWQTqqaFVh9KmqU6y5d1+MlAQ7K9sjegVpUa74B10e?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77907ca-caab-44f3-f084-08de323ce405
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 07:23:43.9033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Am6h9Lry9eqgBKkJLijKliF/Eipf3yalcryvIB4WS8nuh+rIuY8g3OqI2f4PmQbcDVtmZBjyw0N1hiXhneTmUQ3M5dS/ouwEnd31aHVUhXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB8140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_232348_171269_E1DF687D 
X-CRM114-Status: UNSURE (   7.55  )
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

Add DEV_ADDR_TABLE_DYNAMIC_MASK / DEV_ADDR_TABLE_DYNAMIC_ADDR(x) for
dynamic device addresses and DEV_ADDR_TABLE_STATIC_MASK /
DEV_ADDR_TABLE_STATIC_ADDR(x) for static device addresses in the I3C
address table. Replace manual shift-and-mask with FIELD_PREP() for both
dynamic and static addresses for clarity and maintainability.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/dw-i3c-master.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 252559ee2afa..be36b3d7b64b 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -207,13 +207,15 @@
 
 #define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
 #define DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK   GENMASK(30, 29)
+#define DEV_ADDR_TABLE_DYNAMIC_MASK		GENMASK(23, 16)
+#define DEV_ADDR_TABLE_STATIC_MASK		GENMASK(6, 0)
 #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
 #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
 #define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x) \
 	FIELD_PREP(DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK, (x))
 #define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
-#define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)	(((x) << 16) & GENMASK(23, 16))
-#define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
+#define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
+#define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
 #define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
 
 #define I3C_BUS_SDR1_SCL_RATE		8000000
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
