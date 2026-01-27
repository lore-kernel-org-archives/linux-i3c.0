Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331E1D13C3C
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Jan 2026 02:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7a4wnTBAdSihzL84AE65iUktgiXpn2upAvMORoyQACw=; b=cAbAVODquo0/hd
	TNqN1G7MxdglOC8FuXKDmy13fKU7ioxzM0EP1BWpSzIizwiOZWMfyC5TvjbIik3HdkB+hOSwn2x8O
	+Vc6XWqvA/WsBpswqv9AC2rnWLvMHdWGnAiMn9C7NJAxYComkCkQfbuwqdspdfsi2GHCxW+QvnLOc
	VVvUiwhmTfCei3fMt+KSO1IF12zwNEvx0MFcC6738ZUMTd1wsdN5Eya4w2y0Bvf1QxIAx2YdjAzHl
	FRwcdw6AG/fCEhNI+m1RlLWg8hJ/eC9diftWG9p2+oxjeR999d0ollU/NPpczse5G0/a2S03e7Xgk
	QgQW4KrNFpLeR7WqU+jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYV7-0000000DTCf-3T8j;
	Tue, 27 Jan 2026 02:08:17 +0000
Received: from mail-eastus2azon11010037.outbound.protection.outlook.com ([52.101.56.37] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYV6-0000000DTBG-0stO
	for linux-i3c@lists.infradead.org;
	Tue, 27 Jan 2026 02:08:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCIAzv3suBaUGP7AMhlRjEyD2iW9Uo/Bjx5hU2r4Q6gF7M/3w5COnw44gOXFNuEoFCBi7pF7CJ9sw9gDZEMhfNs5JuaHcTcS9XAHh3jF/rVwozkY9hQEeBqUJ6+WmOoYoMjTqq5SwwVSwTKijFoFxg3UviTuq2hO9Wgg7cJRMTvZhS1NDsI3C0CPADY+Axz0jStn2xq4e1B3XYeIYlrLIrg3cs25g2OTW6FHu2/cCpyvyrlXpbw9Akq1GS8GS3WWFxiJf2v9WFd+9ZSUpEAmzFwFDKBHMpLyG6YoJluBQxF20T5rBUG0xV4kWNy9eqsMuUIcJj7shJXOBio+mccViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDBKP+oEjxoA4dIKZ/waGDGsvG0UXTHw0X1Vmfae2Nk=;
 b=Vc5rCwUZnBYMlQlPJmcstfV5CBX9fkcj8+nyOvgoy3vlZ39b/qgvvHR8v95CYfhOWyX1KbEBm2LxUBuzRrlI4LTyZR+C5VJQk88Tny35dHN41dToWWXQIpxK+mB4kqLa5d1sQZR0cqkwUME1XG33zMEyJxu2xM3XRABFvDaZpIG8RzbOEhRzjESBMvsrH1xHk89X9lTg8ZKxnKoDdl5o5GrdE2ChLPXy6FwttyoIik3ccExI+6Yckp0eCqa/jF9SYnRZ7pjBitzNQmtwRILTRCIsH26fnFPjF5NXgn4ivM868P78My1jyxW02Fi4gU+xKQaYeoFSOh56rgu3cAPhDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDBKP+oEjxoA4dIKZ/waGDGsvG0UXTHw0X1Vmfae2Nk=;
 b=CoXIj5W+dsH7wSuReOVuywkxNI6RedKq8O4rhEmC8TnFFiVmdRIHfNSqYIsP8rxRq+DaR92li1h73SMx6LDO1heZV+3LoRjV/TmS17NElGqb513L6PSl+75Go/sNOzQdMoVPF5mPIhWT2SOTTc26NUulb/2z2XCgrbz6XClhB8lcdvGBzHL/RRyokC7ACyQtxs7gln9k5QgzehPbCO1sE9wj/COle31T5G/o5MvOb5pTjGmwEcUvLIeoEesfUHDfvHev7edbraP92hOBp5gTrob3rlEBCi8GSLxhUEZCMHFMEhiVdbmEIuu7pNhaZl6ziGNYYPItH5QpzfkuLwQftw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BY5PR03MB5218.namprd03.prod.outlook.com (2603:10b6:a03:223::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 27 Jan
 2026 02:08:12 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 02:08:12 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v4 2/2] i3c: dw-i3c-master: fix SIR reject bit mapping for dynamic addresses
Date: Tue, 27 Jan 2026 10:05:07 +0800
Message-ID: <d4ad8161e604156c60327060ad3d339ebf18fe4f.1769479330.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1769479330.git.adrianhoyin.ng@altera.com>
References: <cover.1769479330.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: BYAPR11CA0097.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::38) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BY5PR03MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa7ead4-dcc5-4d8f-1eb3-08de5d48ec49
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4WhWpVctzXU+X59jNqPtgLORUcrGm0Z5hBT0JoiDBF7pLM5kF8p9BhYalLR9?=
 =?us-ascii?Q?wsXnVj57iT5CeQSiQF/wudftwOjo5fpd+Up5vzV6bZ4HTvibpHy5mKgiP2n9?=
 =?us-ascii?Q?JDasP+mjSfzgiG58JG10wIbFSjmQRszz89klDKcy4dEQbaisaLn6a7oBPa9h?=
 =?us-ascii?Q?XKWcjIDeFxWNBZ/csIZ5KEcOeHylqPksJajDIYL1+YDg47bbn+HfHtQG7xN1?=
 =?us-ascii?Q?7xbFddn6QIXrNrrJV9PzjOWn8KS2wPFRBkSRqR5ZxEu7Pyhj2vx5mQG+uryx?=
 =?us-ascii?Q?w6pZTRDWyUKJE8J+E8dZKxrEOr9IslxA4vRNUtdFbsMKaQcHUjSSQnYrv9mt?=
 =?us-ascii?Q?nAdy0tftNyr8nUSAY2dgaU6pge5ZNBd8xfF3wg+mAQZZIB0uai99SgHhHUJ5?=
 =?us-ascii?Q?5N3i91FIio0H6hPyQvw4qnnLQ34Y3vnJ0Y90PlFxpqsZMXFe9syBFckSL3xt?=
 =?us-ascii?Q?VEqk+moF/7XwB9gez68Ug8OyqU4uE3wVm9XRZiVFsBqNCgt5w+wOtLF77J8E?=
 =?us-ascii?Q?Gs6ioOhGHq2QXRbVWJjPdo2GSCqig8G5yuCWE1cMCC8NLdhg81+pbyFr1emK?=
 =?us-ascii?Q?f1UzQgkfXpnXjYTrwPACCmGsyYHpNOrGXOvZCZPYpGi0Vm77FdwUBkG4WLWC?=
 =?us-ascii?Q?mCScaVf6zEoAyG+lKur1aTYknEB1QN4Uc5PY1SifFlyQJ46UqL29CRL1Cmq9?=
 =?us-ascii?Q?EvhN5gHfu2vtcWOLwjF/MInCQpt94RDD2YS039Yos1F0DL9wimHVFu4TraoO?=
 =?us-ascii?Q?EL/ucmm5SRDip176BS2BiEh/dxXfxOKiP7k/hGIeYIHDuaUQOMGzPdIi3Qwy?=
 =?us-ascii?Q?JEnfYrHQMShBkMMAznk5MtgLSLC0xTW9tLfZiTc7CaPhg8TdQV+tHQQAhGC+?=
 =?us-ascii?Q?4z5/hMtZAWlnhf1WiZvPXRTVGBy00/GD81M1Y+m4Re8Vxm75+3HscgU3QfWS?=
 =?us-ascii?Q?ctX2gLvdK4rUUJj6nDS5pP3SpOODwuZwkfjAXYEjYKfUCkDdd1FXVYqFL5gk?=
 =?us-ascii?Q?5LnXnqh2QiBwMnOsTBRn3VtRn15QhPwe3UHMsEJJD+WdIZBRDetjs1zrnhEq?=
 =?us-ascii?Q?BshdCAqKWGmEww02jmCvK79m15h6SbguLOK0T2A+11Q4MyoZNeXJpHFybbh+?=
 =?us-ascii?Q?OA6fq2htsGFGiWgDM1rDnR0sKMavnuR0ywEpWVxq0p9vDCZL+crOTlrQj7wS?=
 =?us-ascii?Q?MzmdJamr/cuD5cKvqBG2Y6s//dFjEm+CkvTWJNYjDzopXFwQQo+e/Tm4TTZg?=
 =?us-ascii?Q?W8bOZQhoRUbFdhWnQlO3D51Av1/T7Sv6BYl4EGL+uElR1S6/rwOOEnE39S3n?=
 =?us-ascii?Q?epKZIqN+7DdSKTQ8uZLNvHgrS1QSY0M2PoiMBs2Mz8wTiqc6sQXN2IWO2Jph?=
 =?us-ascii?Q?g5++IAWq6U+9QbQhN+wuzPoMrE1iaTeMftaWS9MnaWgqLBUvBq6u9gcH6V/K?=
 =?us-ascii?Q?XRLto3y6NBY6pHCV09Go6gv5hOLZTsqV10k0mFwFmhrAOGKvyI3TE2iuKbI6?=
 =?us-ascii?Q?IepO8vVF6+4z3js+nluWTvh+y/L6qTUT741iiTD5ckIPyBbZC6sFZDb/eewg?=
 =?us-ascii?Q?5Uy6CMYSx5K2398fvzg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xr+81sMuspTYZiKswyzrjdHe5qKCBvqN7jEVhBEOU9Rs5H1li33VKV8eOJqt?=
 =?us-ascii?Q?lh6rrgMEabyG35hmatnB9kIXiJuFflQuQBIuNZ+neEaKtg8f8mZ1iXZNNYzS?=
 =?us-ascii?Q?frylqRxezY55sLMyIo6BWXtMtitANf2S7LUqdUpVrH9q41z4yWqIU6nTPueq?=
 =?us-ascii?Q?EfUR/qX2zHX0cJ6wmHETuR6CgId1VSHjBEVa2QrHr02F3x+R4Yp5iiMsZ345?=
 =?us-ascii?Q?NNKoznSUnuZEtqeRCqq/6KWj1UuhV1fK8TkF1qi2xFXP3wVdjzG5hXkdgVuv?=
 =?us-ascii?Q?drjHrF3KKLLBbQmX+dLE+cfV4/d6ufJSFG8JCaLCYfCHloejmCwwJ6o3si9H?=
 =?us-ascii?Q?JN/2y2ip5gTsFm8DN/3+C8tXy952xrKfgJBGgLNRnkdvzIEpTXK7UI+Njurp?=
 =?us-ascii?Q?CmoQhNt2XuxVBvLFac+Sbf2gMVBH7UNUvv7xMOWrP4rJtq+RgCH1d07Zrf5L?=
 =?us-ascii?Q?JNW83ujfp5TNgX9fDjw2cc0bI0S3njsqZIOyKSNSHtiThdWXSOa2E4Iyvgdl?=
 =?us-ascii?Q?zQquwQkTP4OA6kDYSgFRwsJEpedoEKYWJC6fdoz9AU2AwSpjQdCCbjp/4gH0?=
 =?us-ascii?Q?FMix7ZaQgv1mi19tyf9kK/d7FkIKVEK6/SJd1KHtD0dbbVAmBgqUyY0k2CwL?=
 =?us-ascii?Q?ISq+BXOTzZjV/jbUtHwqiU1TVxlsM4W55u9FANlHrraV2q0gc+AseworELIF?=
 =?us-ascii?Q?7XYUQbATOFhoTAEKKTBXOmBZj/pNkOoo6NEG6eVriUiuCr34VvoG3QxpC7CW?=
 =?us-ascii?Q?41kKivC6ILgRTGdn4sXavCVL46Ivv9dTOpslsoyAAjRa2EzH1waGJqkYxpad?=
 =?us-ascii?Q?9W4tn5eDha4wQ+4oMeio/+bJ4mYCzUyAwuYKKPkhlwlka4VqXolhVpYTKSPY?=
 =?us-ascii?Q?G9qqKP54035HEJKp7Kx3cwX1XgNAckalFNXhLfMiLnfD0MtdW/SCu9v36lKs?=
 =?us-ascii?Q?y59O1sQyKNp20JT6cHPJjfSdXmIK+oYmudCgYg6YCTJG6ooiLVCANxB1vy08?=
 =?us-ascii?Q?AIxZczSVryXL9qB3lcEdf9LS1YWT82nPA0TxhEO2pC6Si4jnncc0LnL1GeZ9?=
 =?us-ascii?Q?Yn9LA8LRUJ3Cgs+5HW2ulDq2//UYGPXKJhB4mPYMHrXMgzewiQKavSHGun9F?=
 =?us-ascii?Q?MZ6tQoR6OCrM09lHxVxJ35qLg1HgVzof2bEDlXk8LVHmrpTqGdhTKSVrWBIT?=
 =?us-ascii?Q?E2xguHO4AgRZUTgOgxn+K5tPd8LmZng8k05WSesuaXfaUess8/khSfqsv50o?=
 =?us-ascii?Q?Fpl5QMkrF0H/IgU/o8lTp4dYvkRU706oV+C6Tv6PJktpUZnbbCryBO8f/nqF?=
 =?us-ascii?Q?bLEtAH9+j8nEaKny8BKkWt0hmhACYc4RarLmNzfJTmjNOMXYxLs97p8PZsFu?=
 =?us-ascii?Q?5evno1FmcUiI3CYRt54vX8PuF/wfHXu5/dQnmEfGGTLhLXqqTIwdBxXntD6J?=
 =?us-ascii?Q?qOSBw4jMPQjeYHXWpL5uj0aGGUUu9+7XQ9hUWhj1ljQ0hqgzheg/3L9tdRUn?=
 =?us-ascii?Q?XDxVvXlxf92ama26XF2Gw5a64dIFxofasq9jqeM/353d8T2eLWv5eZMZo5vN?=
 =?us-ascii?Q?eQ5JwqwNWbGEunRA9Hx+oheDuJFXgB17p8tTQ0/ghT0tl82Il0Xm/Mww5t16?=
 =?us-ascii?Q?XHhhNAolWV14zUk5grGYp0vFme4GquG/g5E0xdhQG+/vvY2LtTG87M0eOEMq?=
 =?us-ascii?Q?sncAXD3PrYN5Htk1EJ0pNIrRLm2dsceKVEyRpkadFFXLbRfiLtiLy+qITA3Y?=
 =?us-ascii?Q?PiKqecL8e4RUL7EiKErXdq+xxkRFCEA=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa7ead4-dcc5-4d8f-1eb3-08de5d48ec49
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 02:08:11.9453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZS19oJ2Z/g5VBTaQYhgAaZaV2SHGn8aBHezZz6kcEU8320OtvtwavErhcTrHu/mgZt7HhG4X4g9gXky4/acP/i3IVyGmr4dyq+qwt/IZZZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_180816_253919_D7E0EB9B 
X-CRM114-Status: GOOD (  13.40  )
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

The IBI_SIR_REQ_REJECT register is a 32-bit bitmap indexed by the
dynamic address of each I3C slave. The DesignWare controller derives
the bit index by folding the 7-bit dynamic address into a 5-bit value,
using the sum of the lower 5 bits and the upper 2 bits, modulo 32.

The current implementation incorrectly uses the device table index
when updating the SIR reject mask, which can result in rejecting or
accepting IBIs for the wrong device.

Compute the SIR reject bit index directly from the dynamic address,
as defined by the controller specification, and use it consistently
when updating the reject mask.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index ef8a38620e0e..9ce3519cc686 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -205,6 +205,10 @@
 #define EXTENDED_CAPABILITY		0xe8
 #define SLAVE_CONFIG			0xec
 
+#define DYN_ADDR_LO_MASK GENMASK(4, 0)
+#define DYN_ADDR_HI_MASK GENMASK(6, 5)
+#define IBI_SIR_BIT_MOD 32       /* 32-bit vector */
+
 #define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
 #define DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK   GENMASK(30, 29)
 #define DEV_ADDR_TABLE_DYNAMIC_MASK		GENMASK(23, 16)
@@ -217,6 +221,7 @@
 #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
 #define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
 #define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
+#define DEV_ADDR_TABLE_GET_DYNAMIC_ADDR(x) FIELD_GET(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
 
 #define I3C_BUS_SDR1_SCL_RATE		8000000
 #define I3C_BUS_SDR2_SCL_RATE		6000000
@@ -264,6 +269,14 @@ struct dw_i3c_drvdata {
 	u32 flags;
 };
 
+static inline u32 get_ibi_sir_bit_index(u8 addr)
+{
+	u32 lo = FIELD_GET(DYN_ADDR_LO_MASK, addr);
+	u32 hi = FIELD_GET(DYN_ADDR_HI_MASK, addr);
+
+	return (lo + hi) % IBI_SIR_BIT_MOD;
+}
+
 static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 					   const struct i3c_ccc_cmd *cmd)
 {
@@ -1236,11 +1249,19 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 {
 	u32 dat_entry, reg;
 	bool global;
+	u8 dynamic_addr;
 
 	dat_entry = DEV_ADDR_TABLE_LOC(master->datstartaddr, idx);
 
 	guard(spinlock_irqsave)(&master->devs_lock);
 	reg = readl(master->regs + dat_entry);
+	dynamic_addr = DEV_ADDR_TABLE_GET_DYNAMIC_ADDR(reg);
+
+	if (!dynamic_addr)
+		dev_warn(master->dev,
+			 "<%s> unassigned slave device, dynamic addr:%x\n",
+			 __func__, dynamic_addr);
+
 	if (enable) {
 		reg &= ~DEV_ADDR_TABLE_SIR_REJECT;
 		if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD)
@@ -1253,11 +1274,11 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 
 	if (enable) {
 		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL);
-		master->sir_rej_mask &= ~BIT(idx);
+		master->sir_rej_mask &= ~BIT(get_ibi_sir_bit_index(dynamic_addr));
 	} else {
 		bool hj_rejected = !!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_HOT_JOIN_NACK);
 
-		master->sir_rej_mask |= BIT(idx);
+		master->sir_rej_mask |= BIT(get_ibi_sir_bit_index(dynamic_addr));
 		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL) && hj_rejected;
 	}
 	writel(master->sir_rej_mask, master->regs + IBI_SIR_REQ_REJECT);
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
