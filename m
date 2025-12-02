Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47E2CFD2F6
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 08:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3g8n3q8PGmXwUUQyqua2U6j3F9WYmC8yZEqKvpPF+qs=; b=G/6AqdZJ/tjTEG
	GwwBtoauDQnUMlGo8uqIs5rzAShLNdujlLwYv5oTrZyZzbXKYADsBCC+KGLP4nr8n0GY83hXmy8Bq
	uPfX2NYiI41CY8/vGoa/sxVbx2EA525igBrKRappeUACPiiQpQ/xIX0ddZ9Iq9gBz079tby9QYp2k
	t2dmso8mV8OaO6XBc7TI4LJEhQKGjQtq/4Gny5Gqi9lmFlX5g7Fq+pmgWWC/Saagc9hqG6Nc4NcuM
	/KOOHK7fm9MmYrBYFOl7t4/xxS2pCB4ZYKg6FQW2Pj7FzdXJKQ8g0jvDylpxRUqTzpYRUo026u2aQ
	a46f9lyi+jGbAHkbMX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLku-0000000538G-2OVI;
	Tue, 02 Dec 2025 08:29:05 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLkq-0000000534c-0Lpn
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 08:29:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNicnyhYz2lskjeh4EPl4WHk3SpDnVshjy239PnOot9Kd5uEAN6GUzC3SRKDCl+wYcdY6mHx2EaX9B4dsrS7+8O0rTrxfngRYz8IeX42r2GlprCKtV9GTE+mljpmqb3O2DliVJAgx47k+Ek+b0KH3Nu+OyFYRU9iAUd7Z9yH/DkruX8RMnkMzF18g4YpBjNuGrekc6lBgeEEVeQ7KrSLRFAwQ2g0rr+B2PrRyTUn8pZr08qCeCkZqWRP6+EtIWfKyXH32W1HUGjPYpP/jhvbBgmbFuaQEB7TJF+kf0J0Xw3pRWlUhoYrToDRlAOIU3bi7VuDZlziGIlaz8yKMHXyfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXPQrpA4rEJZNN8UdVgeocGnf9xWNR9GBOWiRTyDoN0=;
 b=pF8OIX6NWp0fswRkdr77ngQMw/VEoFRyIcuExZ4le6Pt3dV7rpi436Rot3vteFixhTrd7WLzi0sGekiO6OLOoFpMtHqzI/qcZ2vjl710JxaOxoFCUjQB7kCTN4UICHuPbyGx+9JepBT0VfwdqGad59PzvryLTG2UXmz/6FDZ/o75puqz01s2qkyk13zqLWaDahLCVvCjR6CF9rrWu9f7F/RoGFsYYdVCz6IjT9V88jILXMtSLOgaEwq+N4FqDcYoqpeQlvcRLlavND51XmysWKEI+n8S8i6sfabyymd4TcAmCODjLycsPt0zZHTCdDbc8NHA2JcXRmn5g23e+hhijQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXPQrpA4rEJZNN8UdVgeocGnf9xWNR9GBOWiRTyDoN0=;
 b=QpYiN+yRyRHdp2h8CvrqkO/slPtX95+vHbEvh1A2PZCCw+VADX0s1rHytsyQ7fiHgnBYhqM2F2Oxib34O9zQ203uCgBiQy10sLAOvyn7H4PCj409gc/8Hoqv1eEEZgaj5VKXhPmhVfl0s9CDizdgvMNGpAeUTxOKBZnxsr3FnP7r/X5Q4sSTjXfn/lv/gvuAuvNdBP2FHZlsJRG0Ds1+S2hqw/vqRJgnMEZpAHe45Of7eHChablMCGwOSV6fNZ4uLpLplFd1/oRz2aOPANlwcrlyDLpiunpviRyYQ4W2LyTqx0sJhrhuFFMY5ubqW+qxUfD9PlMl9k6qJAh59T+5Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 MW4PR03MB6459.namprd03.prod.outlook.com (2603:10b6:303:122::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 08:28:49 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 08:28:49 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v5 4/5] i3c: dw: use FIELD_PREP for device address table macros
Date: Tue,  2 Dec 2025 16:26:12 +0800
Message-ID: <4c4791c018d61beb9ff85ca68c5bf48940d2398e.1764663888.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1764663888.git.adrianhoyin.ng@altera.com>
References: <cover.1764663888.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KL1PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:820:f::17) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|MW4PR03MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f95dc2-3231-4309-e954-08de317cd185
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1vyj6iN/7/KcU7K9obkdyYuXs6B+3Lp7cLAlEhqtD9dr7iBluVJdUN4/xFHU?=
 =?us-ascii?Q?6ChtjnHR+1tXzxPNh+lXOzS3ZeTNkhxF3I8BghbgX7xnqQ0LQ9ntidfvYi6a?=
 =?us-ascii?Q?bsnSBeJGJseyrKnIlavbdTy4BHyg0ehlCzEOpqLMSqQyWIvRGK9+7+DPQCLy?=
 =?us-ascii?Q?YGNIaUl83chNVmlsl+/aTBE62Dw7yRIBNDHpDqXOYITXnesLct6/FDOwqOiB?=
 =?us-ascii?Q?4T1p1f6EyQwGtUohV5qTlCMJ/VyUGo27FINIkbRN/+/+6+8fkzqO3j7g8sS5?=
 =?us-ascii?Q?TamyHGg53VdBaF0TNaz1XizBO5hfTzWRcd0IavQ4HvqR1CZy9Gxcprp3bw8S?=
 =?us-ascii?Q?e0M3pQdaPMnUQAyAjmGFs9VSv2stSBDk1MwOth9X3POeBLFbOecJ0Gd6fgqs?=
 =?us-ascii?Q?EfFNcfVvYS9e9Z3p9DuB8nfvPpXYNuMpwxIbDBSiAfRo2UV49RlYAbniopVQ?=
 =?us-ascii?Q?MP0BGkxEikdk/kDZiCuvURVNB6vBKMzUNU0Qsl+qUYhgm/HSxz9ReaNfWvaz?=
 =?us-ascii?Q?x9m6Q1EqNYyd84PdfntI7UiKCYb2M9Ot5zFYaFw52SRTPWNgAHtTjqSYqYhu?=
 =?us-ascii?Q?Wd82aKj1saB3KFInE4RBi9byqPf9Weji5AB8VJHbembYvHp8TSnvsijmgt/i?=
 =?us-ascii?Q?uu04lDfDQCFexqwJRiQTlSwRiBcmiCtp1g023+33lH26kxCCXSV6Xb9qUFd9?=
 =?us-ascii?Q?cwv+WLqETfYPX9iKB1TFFABmFyp16hvdIU63HmP1gGU2xffM+5KMFTTmImxF?=
 =?us-ascii?Q?k8AcZowzDoxZ0sm0XvIziXIoM02ekqQNv+WHT83qTAzvyQ6wNrq4DoARgyxI?=
 =?us-ascii?Q?WgpnjzeX/890H8xIE0TcLsq7sdrOPsOWssIYYSOKdMP6l+ddWIQR3Z0gVXPy?=
 =?us-ascii?Q?2BEREujPzBHbygGpkwSVVOCtPXNTs/EUOLF8S0MMnEuezJwteF7mWKvgNnRK?=
 =?us-ascii?Q?AnuYxkT6CcaA9AGZoEs0mzaep2fAabsyA4pp8c0+QhKU8hZiKZ5iuy6Jp1pW?=
 =?us-ascii?Q?IHo9P282WbwEbbCMEUxKvUSjP3v1gZrTJrviS96S7Xd0qd4UrXxLXXpVF2De?=
 =?us-ascii?Q?ZrPxAvZNEJOvLatGCXdQdAepDwGUntym11vWF484LkohWCrsmcVjZldRiTpv?=
 =?us-ascii?Q?jMmoKNBqYEcifEDOOGRX4by8FAdVJSrmZOUqQ0If2ohrlVLFc2zH/f+y348r?=
 =?us-ascii?Q?x5zEs5lGVxMuxEFN6v6rUg2OaSeLhsumxGk2v5fsWVY/NMklCml4+Qde0ozx?=
 =?us-ascii?Q?zniNb3ZNKKNEmZjGVTsJma4oUg/zyUX3oDHai3TNtJHZA0KqY6pe3dZTPpQx?=
 =?us-ascii?Q?p3zMrt2Cv0a49so13NvwBUMMfunMFOA/MGM+QqfUfHhLoW1Zy8+lfoi+SwZ/?=
 =?us-ascii?Q?K2aZ1vkJoODMHgXofsbXY0c8F4z3rwxmtyqF6x/KLrnJ4M/nS2XC8Ea94wXt?=
 =?us-ascii?Q?Bn+5dKEdHm7agzCNOiVQdlWYNHvKUPnz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0qgHThbKaR1EF5DJy7H3atLKUoWA0rTzvZ5rqPSGbHRnCQ4ZNORaPObo3z/e?=
 =?us-ascii?Q?4HcxmjqWLTv5rLdYhq3/tfRo1Ym+O9qhaRcwjTQYGxXcp0pDP2J25lit8tjg?=
 =?us-ascii?Q?g9bUL6VHt9CnKGIooqaGnHsswPgEgVg7iPcQgZv0Jq9e3fFwjQ32UGZzxmpw?=
 =?us-ascii?Q?z+Pg9Ivsr/2Mi8/FPUe4eRR0tmM4xOqKMGvEMlzXj53TEDLRynJrWUnXANGn?=
 =?us-ascii?Q?erTk3u79BTFFm4ZRLQgyTZ8XyY5OY0GE2WyPCiSGklG3PAaxEWczjuHRBtX8?=
 =?us-ascii?Q?o6nSNbm30xm/6UuUylp8LIS6hNU0r0Aoi5eOQdZ7IxLGQhqm95+/PSFBsEwh?=
 =?us-ascii?Q?dkPgCB6bUTBikagrhZVq2/SkcIIBeKbc9XiulqUnvQ6MhUEJO33RsmYZ0wq1?=
 =?us-ascii?Q?SehsUYP9LSva+/AfIyERlUoCLyZ5/Guc8AxjGZPoMTPecARrXsXPx+eZ8/OS?=
 =?us-ascii?Q?O3YWs5zBSt5zBdYj4zpuwxyai6jy7xh0Sw9F6sTLnUBxQaW9Rzv7Re6Hrm+T?=
 =?us-ascii?Q?Wq9eLkrBMGMcGboUIkHK7Q3kp9M5CsWPyAawztY+oYCoUtlcfc9PlmHCAoA9?=
 =?us-ascii?Q?v93xPlTW3vhKfstx7C47B4dhK98Yzc8ZvQ+TokmldeD9dD3CAvS2RzKGcVhi?=
 =?us-ascii?Q?r2HPXnNl7tNpoL7jnIt/SO21bV0THc+IrI+0lJxDvtDiFtJZbRr24uzAdyh0?=
 =?us-ascii?Q?GAtwN0OSxs11FR6Oc6K5Fll3Yqx3sn9WVA9LUZe2wMAZOAF5zx7tttLP+Xb0?=
 =?us-ascii?Q?5JRK3t6f4CllANvrKXrtiv78mHurtUjyQyM4cNnaK4zCl9ftOe3/R3e0URjD?=
 =?us-ascii?Q?jiP0yFYBqJoSMHhDEFpdpKhrgnIkTdS0qgbMZmWpAQrsStN4kkvRLZSXYCDa?=
 =?us-ascii?Q?xa0k3UUX1UyxTaDToupXuLhpJX491VlX/RJE6UtdeHHOUrlhJ7K861WT14zW?=
 =?us-ascii?Q?Wd35Gjc4Jw3XDkAfKt0kvNVlAX3m8dDTmhlalNlvtzveogAAnFy6RcdNjUbf?=
 =?us-ascii?Q?ktKceqHrb9DLE4dpqxsdNI8e5nOwlR6Le8LdiJ57LPcZQDkAu3626YKlymT9?=
 =?us-ascii?Q?I0VjtXBydQt1HYiqaTFCrw67QCcTb5yUpsSAjlGPcM1XwGn5u94upxCx3emU?=
 =?us-ascii?Q?ZSOawwKx3R+MM4ThIAPdTauKWDpww8eoQ/yQivHinykAgZ7ACNREQ3dtKQIW?=
 =?us-ascii?Q?BFdrFBJr+xzMyQzx+7i882DhxUOdWqk8MJOviv4KgOXPXjW8jONb/hX4ha7N?=
 =?us-ascii?Q?xKyRcGjKIdYLZuMJ6ixLeCbJ3SntRQLVrPQUl6hXvBwUvtYbcQhw4CcKQVYi?=
 =?us-ascii?Q?hPol69rmouUolUdGo5/FUxJJm/RkmTu5GoRwpWz0UZzrolH2muIeUxvcuOWq?=
 =?us-ascii?Q?5KAxsAOTqiV0O2tHeOozkT5QE0fGf58tQunUzfZirV0bFlIu/G3ulSAOR+nP?=
 =?us-ascii?Q?vrUKeQkOp5TaQd+R4GUTrsy+vriKtzDFfmus9KvcJlsQYohugGbPo1TKhgkW?=
 =?us-ascii?Q?GWistwYXFqjVFgBbbDRuFm1/rAZNHsZx3PpZMGK+VslAxi0idXuRX11jdToF?=
 =?us-ascii?Q?oBT5WVW27PaIVFeLE2wGUiRegG8LcypEHitByLzq47YdMpL3++AgdxRq0MJQ?=
 =?us-ascii?Q?5w=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f95dc2-3231-4309-e954-08de317cd185
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 08:28:49.6081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6aOqkBxIBhMw2NeTs48sbTbqkw10HLSDkibu3vU/rK+NVgtWz88hkM7RiqVHC936A4UP28BafmoQOLd7hqx268+SkT1FtorClA9i7mHb4Gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_002900_130388_D3226890 
X-CRM114-Status: UNSURE (   7.10  )
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
---
 drivers/i3c/master/dw-i3c-master.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 8288888be591..1c1418d0a62a 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -205,12 +205,14 @@
 #define SLAVE_CONFIG			0xec
 
 #define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
+#define DEV_ADDR_TABLE_DYNAMIC_MASK		GENMASK(23, 16)
+#define DEV_ADDR_TABLE_STATIC_MASK		GENMASK(6, 0)
 #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
 #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
 #define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x)	(((x) << 29) & GENMASK(30, 29))
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
