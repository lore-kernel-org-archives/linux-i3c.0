Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533B2C55ABF
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Aug 2026 20:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DCYp0LFK0UiFpR3AJTnpMDhlMYJsA+IheR2vj7zZlo=; b=alYeUSQfsrirfZ
	85IcXm4lo+Z1nS9lEa4omjJFpcCe27TbINJQnxDrG9fXjDtRHpSWVdNtQPMoJE3exQEK8xOLV38vf
	yT5WZ0tZwDzQd/nkLTaW80W/HCUrn4+Xhoya1YFNyKkqxuvJJ2JahTX4v3WL9vtiWThJSktBM8uDx
	JpYzkwFWiEd36tWaxzU/sIETsRpzYvkYFfDBcnlHvOmz42WCJmmI19hsAezwVlWrMm4ICefFuQbNn
	LJ6htN2HpLnh2BDqVOIXM3z6Shc010qawgCzLu3bSsxnCZWiaYdEEOf/tRl8RJF/sDekzeFy/g9oo
	FpIK1P9PSKoGVmghx3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wri64-00000004WLK-3dy6;
	Wed, 05 Aug 2026 20:20:16 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wri62-00000004WKz-2aQK
	for linux-i3c@lists.infradead.org;
	Wed, 05 Aug 2026 20:20:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4Kojrz/hu1VMYE+L5peifEPRbTZLRrZ5OY2HA2y1jup16kbhcGownH0h0eoNfu2lTkvi355Yi/HJLLdvnxGuBlpLn2GxOF9LAjZ0HRdA4x1pTs90pJxLVNutpbf1ptTRQvvMUuU5QkXKym+8Ke4BgW2EgObHIMp8DXijmIFt8EtEeP8GZ3egzHgTxJodXcaUuiusAlk3UVFtI+6q0CguYGuxQAP8fDO2k3kG/ItQBQhiNicSYx6frR0peqCgVNZZ/IGDTrcA2N2mF+I9tswMhHELtZJDp4c0p2Z/Q8wi7hFer8wIPOvIVwiCzCxl9ZFvcsL5W8wYjo3I0/NGoNqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2X+yo9cG2iaFoL7LTorb70MnTqustMKAM09/PYp098=;
 b=NkKQste0sqRpu3N9qh+8DANF6F6PEhe5s5YZ7DmbvL0Tu3fstjhzPbW114NPGC/o/oAPNsADcabS4JFd4/a5DQq1jZjFUxuyOaWIi0bUqyyz6neHVEPez8ZIYpkjWuqRWNZpiSc5y4IAq14TWYH8eOkwkg3Mj4jVuUdRVCBQ2wJSr8jyaPMPi3aOtz0mmJSUyIN8SqFC6RsaxVL3iOyZWYySX0mMcFAyOlQs/diuxYTzabP3h2Fnpt/gdk18lI4ffttyZBO8l+wnMleq58HTqgds2H89mxeeQUwkqL9QYXQgpAFfGP26wM2652O49QMaMoAR/TM04g2MbkzmvZFeHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2X+yo9cG2iaFoL7LTorb70MnTqustMKAM09/PYp098=;
 b=HUxH7aHYyqZXZEtTywMpLUjzhjdUF5HmsvVDLmUgl/M7HZzGqFB+UAq+LhxPzcKRRFu83HQGc0lrCNI5kth/SpVR5dvyCBc9xTEjWdpOIey/7/qn1ZAJ+i88UO0Bj2ATKE3KUbJzi5PVncmrsTkyby4zDfA1Pj6zP+lei89NQZW1eoLPJLtqqQP6bt/QHJGWhMYEsxwvsjFB1C1igSM7LBKIIiwFsfZjmwRwbc6j60A3ckYnJD/LdNlyOTaajahXV1UXafAgwP08ojnVG3kMOsvReUpDz9c8dbYYWkaLrgsrv1IKZ2K6CoP2a2/NYb/lrUUjLJfJzvNSqlR+14i7rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10665.eurprd04.prod.outlook.com (2603:10a6:800:27b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 20:20:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 20:20:08 +0000
Date: Wed, 5 Aug 2026 16:20:00 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: fix APB clock name
Message-ID: <anOa8LOkiP3nexXj@lizhi-Precision-Tower-5810>
References: <20260803140224.12648-1-jszhang@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260803140224.12648-1-jszhang@kernel.org>
X-ClientProxiedBy: PH0PR07CA0070.namprd07.prod.outlook.com
 (2603:10b6:510:f::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10665:EE_
X-MS-Office365-Filtering-Correlation-Id: 7943db10-5c29-4751-13d4-08def32ef164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: z7qWqiabAUyfVQ0VG8cEBfVflhoIrwb9D2iq9b6l3xxgp6uPZMYOIDPZFo4SdF41mINru1GqLEHQVkr4Xoo4Rga/Bg0vOuxa/c2Cc33mGZ+F7TD4qMVb1ctJC1S/7HzWD88pLABs5H+wrNPBSgoQ0JF19WirqAOfz6/RF9qq2weYQ6ktvwGbMu+2Io1n5SYip8X5b8h6iECDlmBfIUK/gLJUKbELsTNMFAhOawXaXM6ZHud0drQKa381DoM/3pMxAy9l6fU9Ccqc9syFzX2ZKRS8BqJaMvXV0FRkAEHJehKUvTwS71mptTLAIL1DL6ERsJGGE+O44ZxbH/HsCz5ztV0FDyyPRR0ovlR+PehuFejdpPTpElFtymw+8coc4uyxloz2e4XIDubt8Hwo19qKMQkpGJ1Jnh9N17sJRIWCm3b9ZOjcddtDtTqx50ITipZMU3qgz1AmGDrUDMNxA9JvvzlciFBi/0ut5KBae+NHKbaQCliv4AQmAPuz+r3D8qQbM751e++Lla4gXKB7TmuZfpyK0T2lxMbqT2HCC5lcKCxnSAaVV6ZBi5bhBKafcv1eCG5Z3U4N5FJvp4aq5yusxe9hj9sG+BYw++Lqtno+KmL/uYg3LM6z3zfO5XCkpk3mZ3UXlqHfmAkalQE2UGAIrX8K6akBpBbGlYiNdKLNB/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bJp7u8zJJB37kZ6mk9sPyQ5r1/pHMVpGI+ePDWR0Zg21seTJ9p0Jb9+ZohSM?=
 =?us-ascii?Q?nHfyA+QTPwsWRYBlCUx+klgTrHzY75I9o5dvdzzrV9R2BIjt3VMB3JJwYAkx?=
 =?us-ascii?Q?jpwVTJ822nG8AQyXz7mbq9OZ9CgmjwYCPfDsyNrWcn9UNSk8TTWD7mMEt/Z3?=
 =?us-ascii?Q?CO2t8UWpbQMROxDuVOBCi0dX/o1K8GqEWp2QZ8apqwPoKuYA9A+avnhlolhL?=
 =?us-ascii?Q?nM0B7UE7dz446IJ9ZM90X4DX7Bosb/gv//+3GRZ/UErX4iOTYSLHp9havM0u?=
 =?us-ascii?Q?T1fPdijxPRHucH15YaHF/G8b+vyf5QMhXBKIORJ8XPfF2HcH4yGNMJUHI+MS?=
 =?us-ascii?Q?kvc7i9eorrS2vvZHRgrh9KWYakgQWv/lA+KfBG00IsQaLMBbgm/ZUhC0FjQ1?=
 =?us-ascii?Q?tCH+dL2Dux+eys1s5qzvyuzg91097Yr5HPGaoJfZsSJPUvQhwsmlS5MXd+Lo?=
 =?us-ascii?Q?F451JA5XSS3N53Vk6Z1tGwGMUvAP7+HFNioFF9bhiP/HSvRdvlG+TS46fY5m?=
 =?us-ascii?Q?H+i8KxvxmuB9BMdb5JrPz32fp69zzyUfImSxJ9gCmOE8Pwz7jBCVF8hLGCnn?=
 =?us-ascii?Q?aps2nEPqrBMZw0oJBL5s8NNoosjYInzXX2+oLoyxvQD7cff/c3KbAC1lY9Zn?=
 =?us-ascii?Q?RoeOsWdUW8SR2c2U7Go8zDbxBUyn27gvkvUA+00ndcnlG/5seAgxNApqJiwz?=
 =?us-ascii?Q?0wf4lGAnhQrxwbUEjcy006Q6eSMhF1zTF3b+AGVmzX2LHZXmnWJZbhxg1TZv?=
 =?us-ascii?Q?tNiq8arzpUDYVUREq7B6ICa9C5zFW8VKXEbX281BW5oEYg+2cDmMmJvdVH4O?=
 =?us-ascii?Q?uywFYCBm80mIQ+Eslj071ZgffQQb9qFs3JckXBjqQ5vKEYNb2KPJrZXNol+N?=
 =?us-ascii?Q?MaT4x0jNsyRcmIsmcOJvMT6YInh/UD5Eqlou4Z3j1Ar84TOQyO0NPyoRkZmS?=
 =?us-ascii?Q?tltHrIVGkMSZgerZetbwtPE7E6OvEBapjh0y2pEY22jenkfP5m9AQEAucRDc?=
 =?us-ascii?Q?hYyG9hKdiqEh4hhLojVU0O1hLQPjLdFqMCSx6m7w/oE+xOjqJel5cJVxpzCS?=
 =?us-ascii?Q?yq9A/tzFfxzMmv+JyYWeP3fc39EuuVYn4/UVBhEQn/dfcYt4cHURy0L8GcC8?=
 =?us-ascii?Q?Rn5qyAhDGsWqGIuCbZTL0VjxZz+3PYZcJ3348HIZvA9CpGoyrQzaSLGTJJ+x?=
 =?us-ascii?Q?e+OhJIcdUU4vtj8Va0b9XX+I3xmq4uK8KhoOdkPqn3NLFUPE/EgHRbABxRDo?=
 =?us-ascii?Q?BKMcz3MGJ6q/jGMHuQ7t1yDbwI03ProYNh+xnecXEEjo24xlY6HjskAG1Upy?=
 =?us-ascii?Q?4wy86aIj/ycpNsbFqSlnl7QUPauMCiCrx0SeWJgHqDIZasQr2NilcW+Rk0+s?=
 =?us-ascii?Q?V7r3CBufXj1wmf3H6XoiCiaUlnLmwjahrgS4qPJdg9K39qI63Upf+wXoeVIQ?=
 =?us-ascii?Q?kfOEJ55NnUeWrIlCgqENZOHXmjqfEYJzWJIQil+BIvIZFmxsqoN0qnumxxBk?=
 =?us-ascii?Q?in1GELjEx3cgHNOiwxsiPppntpQwVNeZMSotfv+JOsYYUMFi3rVPtu0+8Bej?=
 =?us-ascii?Q?lYHlfJOq2bqB5k/+4xx/C5/Ger6ZU4qjXCcyVJNFOnpmICjegijkCjGae3+9?=
 =?us-ascii?Q?OJ3RUnY3do/ehQVs4tYbizlwAsAheHGHzwz90WcIrhvPfVTQWVxGQiqZnU5f?=
 =?us-ascii?Q?i6iYQa4IO82X02GHaVCSFFhoCLVNOWF+YxJqIDrjzVxnB9HzjKN6zBTuuMVq?=
 =?us-ascii?Q?LM1+kmfGV7f83SODM0LTejlgTe+TvRbdlPkQW+jGPaXbbB8ZDict?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7943db10-5c29-4751-13d4-08def32ef164
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 20:20:07.8992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2L4aZcYsGunw8cq2F2XmXwtpPzA3mmnv2k4igC7c0hZrMY6/vHMy2STVjazje3iF0lBFWH6BpGN5mIo0mjE1CVPT2fnjllkISF4tRg4gsYdH3ajppMIQburVfrPOW/5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_132014_660289_87C2B3CE 
X-CRM114-Status: GOOD (  15.96  )
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

On Mon, Aug 03, 2026 at 10:02:24PM +0800, Jisheng Zhang wrote:
> The dt-binding doc says the APB clock name is "apb", but the code uses
> "pclk". Since the dt-binding is an ABI, we can only fix this mismatch
> by fixing the code.

i3c: dw: rename "pclk" to "apb" to match dt-binding

Change clock name "pclk" to "apb" to match dt-binding doc. No upstream
device tree sources currently use the "pclk" clock name, so no any backward
compatibility issues.

Not sure what happen when apply patch a0d48ebf39ce. Anyways, thanks for fix
it.

Frank
>
> Fixes: a0d48ebf39ce ("i3c: dw: Add optional apb clock")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 2f8c0c4683e0..0625587f1527 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1579,7 +1579,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	if (IS_ERR(master->core_clk))
>  		return PTR_ERR(master->core_clk);
>
> -	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> +	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "apb");
>  	if (IS_ERR(master->pclk))
>  		return PTR_ERR(master->pclk);
>
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
