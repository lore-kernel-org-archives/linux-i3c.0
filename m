Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EAED4414A
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Dec 2025 09:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFrRYg2ErFzBYCAO9vM4KV048q1i2cdF7Zm1o0kPCnw=; b=SnWlma8yylz01V
	mLuYU3yP2zjyazAwX6Du3MOkL9QkDzSnkbQybts8sqruawchGDhyxUlcKgxVDuRur+FKPbvMFLvYN
	MElws+wVfEmxljlobnmQWLU8XOxZELUKr/6NtfKYKetuw/3+ufMVdSUt2vcA+dN2bCLX/3OM9YPYU
	HsdpPEBPwrrlkhlQg3aOgzRBuuh6MnYV9KgjwCdlB9i2GcAIjEqjp9KvAOnvLDP6JrlBQ7/QrkA35
	jzEWB1SwIE5NqriJMKfmXOsnQ/LARlrRrr5vqceGBnR4c4G2AZpxE4ayRyJAJlMki5z1IhjVwYzqV
	+KadrOTdH+BqZbevcvnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz5u-00000000J1G-2xjY;
	Fri, 12 Dec 2025 09:05:46 +0000
Received: from mail-westus3azon11010058.outbound.protection.outlook.com ([52.101.201.58] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz5s-00000000Iw2-0iBU
	for linux-i3c@lists.infradead.org;
	Fri, 12 Dec 2025 09:05:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSHsk+TtNZl7EGW4LTcyJhkXSAtE/jRGOdL6rYY3rBr9nBvhIQEQS3UA7jdCk7F328vxKNPmfkZEU22HaSwcticH2IQX3PtBJYkGSnWZIjhdon52N/Ip3/30KkcNBAeKc5gRfMZ1Le/HoWpO5TSyD46kc9JW1BGBbcRhIyJ2niTNYK3Hro3Hj/Jmk9aR591Z6Fj4U+S6+QCzqqKJBKWVJ8P2QkN3zTlMOAXR7OLpBTOMy7j6Ab6WfI5ogCwn4wxmyUOwmSUp6yroifNIo7597Y0/frodIO0duiPJxlZuiDlsG4wv/Xf+48cn1CZ9ScHsCHwMRoZWNe4P4Ec3/IJwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBQcYoXnCA5aexBrW1l/Zv9dgGm77dX1yyKyPswL0O0=;
 b=HXLfJcNTAQ4GwaoKzgCUeO1xxKKB/F9w6Rv/DSFCvXEhrWHAWlCjqx2VyQHKdObxOsTkU56J0HXHa4kW4+1Fl8rWLk/cjGL85fOkfcKjVyOy9Xve5PHqO6QFp1yDNP/bxpio/IESln/JtCcipB/cU7iKo/3baR+4inhu+0DwnGCljrmw6kiYDhDGP4JjjX7tOOelddpnvXGXYleU6ouz0iwVCwCzQ5EUQUupfj1tkTEaSOinHULpA8B26zai32edIdTvWtpCctgWEcn2VY6TaQnm4DhqR34Wq0eoa2Lr7DaUjdZzCwHFuKi0n8Tccz5G3vftTEr54O5tvB8OUBAc3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBQcYoXnCA5aexBrW1l/Zv9dgGm77dX1yyKyPswL0O0=;
 b=kwzk24y6JLFsMVgdeGpo0A5jbNmms8y4QtnA2tF8aUiD7B6Y4Bj6stAX08nlsg3NhvvptGdPEqTEGwFohsdv8cJ4s+eOpYoGRA+FqkOkHly65lZz5tN40OOYMUkYy8b52wriB33H4yKrVdxBNBEoI7fkRMJOJMB9JPZfPnIf3gQ+CaLrND+wL9dv315XCJpV6MobzsZHPaRfrz8m/ImV+vZ56TfArJBo+bZdb7ETVNmBz2TCbCgpigltx+RMlkLbzUrGtyieG5jdgwJq/SwcRxPzwTpVhbtwUzi7bTQVkRqV7xbq//djM0u2pxRXEh4I/RKJkCXM1/E0gBS7LIDACQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN8PR03MB4916.namprd03.prod.outlook.com (2603:10b6:408:7a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.11; Fri, 12 Dec 2025 09:05:37 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Fri, 12 Dec 2025
 09:05:37 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v8 3/4] i3c: dw: use FIELD_PREP for device address table macros
Date: Fri, 12 Dec 2025 17:02:57 +0800
Message-ID: <d72896e510db1870d26a794f131f600c7e42cf00.1765529948.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1765529948.git.adrianhoyin.ng@altera.com>
References: <cover.1765529948.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU0P306CA0061.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BN8PR03MB4916:EE_
X-MS-Office365-Filtering-Correlation-Id: 627acd1b-8181-41fc-2f37-08de395d9df6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pZmDZpezh/ybFTgKfRW/Zn3mSB+ZUhfYuQc37n5TQgQlRpoaiHMOeacTIE+s?=
 =?us-ascii?Q?CAbLTV13nFDZZdo2zp4rOufhEXEt+bb5M/dXoiyopqhV0cFu1GRZ/pzVdXAT?=
 =?us-ascii?Q?LRbPL97Au2a4JVyLGEsugSRdRHJA3cqolu3ltq745t8xkCYnKannryeIiLv7?=
 =?us-ascii?Q?IvHKY7UEBcHQt1pM9z+uhEkyQO7Cz1IS6wmFTjt7n3NnUJIAMPuNJyfmo7xC?=
 =?us-ascii?Q?52tLRurG5qVKw6z1t2HomF1iSNroKjoB2bo72DaLMn/cGECLtO3++bURw2fh?=
 =?us-ascii?Q?ehqfo5NxGahvPDItvQflMyfZvVcZl5pIYOotWceNsfEYP/8h7Ymp7UeLZFPc?=
 =?us-ascii?Q?cx6MrB4c1PdvDB6IWEHrPMa9xabuvyb1ZPz2yRjSuXTYBmD6nRQQITqRWY97?=
 =?us-ascii?Q?UPO9UGGMMXfVYzDRfAwNINM2umHM7SnGj+aMXaS/y+XGw9tHcrS3/FOif9Ej?=
 =?us-ascii?Q?wySGP/x3ZJWS2b9gX2kQsd20QBd+2y5fqT2YE519+4409ilySTl6JNrTPxZs?=
 =?us-ascii?Q?KJrKH7ChYaQcOy1xQRy93X5iFIHvCEk4jwA8K42KDH3//YHCoPrCd0nhjsx3?=
 =?us-ascii?Q?8ULqTjFZu+PbCxotp7MrNKxKcGCWis/+CXKiVv1A8pqvN4qAxkuwuviZpORn?=
 =?us-ascii?Q?0x9F6OsvtQT3WD1q6xxE+ASG1uKYIr2EV7HARy82D+xSFNnNUlOWd+j3almO?=
 =?us-ascii?Q?QaVzqhKEl8a1DRHIZ224Rzq50nUBgxNekQ3h44waIVCQdcHrqYFfmSGOsgh+?=
 =?us-ascii?Q?X6TFZj30Wr2XrsLUXvbg+gJdzzdTGLYoIi7v1BZvG2p+tVz2FuEHk4bvwNhn?=
 =?us-ascii?Q?wH0GtyDAIYoTlOty92P3R0X8WkGudtnB3aIGcDwWwoF0PS8GWRskbBQSLje+?=
 =?us-ascii?Q?9iLGhuWg1ad0/ZD1yvTP+mCdgjo8j/3AcEAvp8gC9hLHqTQyhhI36y7O+Jto?=
 =?us-ascii?Q?co4KHj01r3bIDfOSDBPl2FU4+geHr6kHHa9BRc/8w3Tzt86pE66WUSa7mE6y?=
 =?us-ascii?Q?EKdgqFxrJvqt7aU8z+M5eeU9BE2YMJ/cToRBo77oV70/R0N41NjIj74T3b+R?=
 =?us-ascii?Q?xwOwGbE6TzaxFzPTyGDUvZRPCgphswCq72oYPTPsL9pdPO40VCM3WaayOD/F?=
 =?us-ascii?Q?XnraRg9KvAsO7YkBc3pIfLEu4XLh5Gyp4FcHSj5lKcRKcqX+PLEv+cCrpu78?=
 =?us-ascii?Q?MIxm7EQ+4i+2+lLak9t+zF6YHs3g4YGvEgxS/6XX2kUGp+5wQ8gCN+dqN6Q3?=
 =?us-ascii?Q?oXhqfkfv6/FCEFn0+3BU3DUKh0+E+76tg4DMqNmGfHdesK7ANd4gdGun/NPZ?=
 =?us-ascii?Q?4jNogCTwN1Qu4MU0MU92YhEsk9S9JbPzZw0bHMC1u9HzYjpdgFnnqpuMwtQU?=
 =?us-ascii?Q?Xv5DdwzHYtgVt4vk/mHq0BG0l0P46Tddw6552R9hDZyncAba6x2iDkIXUE/F?=
 =?us-ascii?Q?NcwRIvtklxDyCsuJTGv1P8gRQQy1vCaR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fvzcGI/kBDi/C6AUrqIZipFppOM0m1T3KJrMobFy78EcFFEYxWUuuBSJz6Bi?=
 =?us-ascii?Q?e4kl5xN2JUR5sqzHZHInciv7u7hhVQiZJH4OkHZJDdF6aHKdu1+G/4xreYGI?=
 =?us-ascii?Q?1uzEx5lKon1/NMvy2ssMEkVUztX50wKcwdxJ+wB5NKDCYiEMDrIdL8Yvtuzi?=
 =?us-ascii?Q?uAcnKAbhr0dN3e7E5b2rtLx1ScgPYxthHY1ipn8kKyhblBkxtxOjeXKDpVs7?=
 =?us-ascii?Q?0Kc8vybW8Nt1GR1OY+6swnf1PkAbICJGSWGs39oh/DM5gL+TSkrJLqOUbcJk?=
 =?us-ascii?Q?O1BCeQsl4sv5piuSbo6meOvb4QnUDlVfegqpRpwU8S1cd2JlnKTMaDXiSB35?=
 =?us-ascii?Q?HkTMclj99P2lID+28mVHZuOCNaXTY6E79i2lfktlkYXZYh60mCcIGtVcbkMU?=
 =?us-ascii?Q?SY2TN3+DcNRxnLeDla12ItT8jirQ4hwT3a69abuTJtixF8tFLJ95OmGCxWVn?=
 =?us-ascii?Q?epzag8vILzzeZY3pILLB5tH28kSVyZqPH/j9j6MI3TUlmY/5EiecMTtJb8W2?=
 =?us-ascii?Q?lRHouMMaC6wXGBRIAwxNlyqa1Wly2UWnxFgxo4jEm1TiKRdq9OI3BH4hf5xM?=
 =?us-ascii?Q?UkWLABE8E3Jfk4H/+O7vvriU29cQfTpKc8sw6gkkkQd5SL2JkEY8IiNX+RAA?=
 =?us-ascii?Q?iH/Br7vF7+LFywWcSeEyzLlxBIr1qd/uHw1w8l9k8mEE2hFFGzq4dydNTpTo?=
 =?us-ascii?Q?kiLS/fcx42Af0vf65dTyXZLKD58j5dtN5PK2Bo68+AuztHA5EjxJZzW1hjy4?=
 =?us-ascii?Q?h5TvAxNXqNuSQog8M9DusSKnkq27uXJNxQHi+YnT/B7SQ4r9nj1/xO0VaTlx?=
 =?us-ascii?Q?TY6VskBM9jrAJgBGgjRArmZwiAVUsuW6cQnLgUy8lkGku6wcj/mWJHpBDLDI?=
 =?us-ascii?Q?zaOetcbdahxtWHm/R+LcRQebvurNxH/fwvDjjUfOzkT/iwfr8XiGw5ws3j3y?=
 =?us-ascii?Q?wYD8rcnTo2YFPk059jY6TCVD8wyyT3JLizPCKkL7RrpLZHDsztNLp+RqAjAz?=
 =?us-ascii?Q?Eodv1GoErZA7oh6XXolG4fFIMfDXeu+pCoZ0b/cwj+Hxr2XleNAITPXO6zga?=
 =?us-ascii?Q?Ra6HhXr6tnfT+TiAdAzTFEt2uHZeblbKgF1m4Lnx4Pkso+IyW5d2ayiQZTYu?=
 =?us-ascii?Q?L8rsuVW/N3XPLyV/R6licMLCnyRpTeiNCApEN041BWh//BMsGmijQ0H/hHDZ?=
 =?us-ascii?Q?LSK2vrRAQBP2aNhmOrWUCMb5+xizjZMjv/GAJxLFpFVDseOWQy6ZKajZ/Xsm?=
 =?us-ascii?Q?EParNcYUFXJcR6BtLJ8M+dDW9M/Uk/6ZeiI7ZF+kcXAZy/sb/1k2i52aoIlF?=
 =?us-ascii?Q?oi0bk2V12IsCY17wpPpfnpH5yqDT9xIxWm29MEtbdB3YEWse0U8Ht6z9U6YD?=
 =?us-ascii?Q?LZAkUGL8+A+kL4AqY6QUoukfl2Nzhtaf6j2wfxYtG6A965GsoETkVM3kCxKA?=
 =?us-ascii?Q?qfH1uAYBWOESRlyVrRAzvAWU4FLghaGJV4U5PNcebL9AKtqhdPERTW5rJTOT?=
 =?us-ascii?Q?lBqe08t3CPUuv3uyjIgn1DI94FEXrULyiUFJu95/PFUvkknnvDNasVjCw4RE?=
 =?us-ascii?Q?G/ozqZvPPvxRosOTF+JQjfMYhEqmm0RL8uXsIFy2RUjhh5R+rZnRysUN3Y17?=
 =?us-ascii?Q?vg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 627acd1b-8181-41fc-2f37-08de395d9df6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:05:37.9299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPNnsY3781YsCHqIsLsy04LrDM9Vxw7zLjSMhLSrzQPsK8bVxo91ziYTpC4mXdML1ztHH9NCCnXUgZV5/++4CUnB5kSbC38Se8sSvUd42to=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_010544_211958_76809DBA 
X-CRM114-Status: UNSURE (   6.98  )
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
index ce33600d4c5e..f96b30c4cbfc 100644
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
