Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED51CD4F24
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5/uMdTCCTHQMuvCjFiUAzumbcKfQc957nxCwcXYi7mM=; b=N/Q/GI5CvAnQ6h
	sYPtptAq0EKZmU2emGYY4O9BfpGHekShK7rw0lAGZDXJTQjAAYJoa9UIapr8VV8wZX5qAqLOkV1Si
	N29NWE78bVBzZYbGoO9fRX4mEdjdD/QYRVEOlfMYt3dfaOC4EtrUw8qnIgSrit7QVZsrvJoyVSAH1
	MSFaN30K19OjKJVcy93GLfQcl+BOUT2dXslr12uwVAqbjBDdtBDIkEnMbKxDWq+fUt0GM9KBcKVnm
	Oua5aq/98VqB1SB64zHlHo7dvy8wcm0TeGVoht5+un5vTaWQUEKIopUPURqgd+FvuDBZcb9c78Y/M
	bAdNuqIj1rXskA//hnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMq4K-0000000HNdw-06Pw;
	Tue, 12 May 2026 16:34:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMq4H-0000000HNcf-3LSw
	for linux-i3c@bombadil.infradead.org;
	Tue, 12 May 2026 16:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b6Zf6iV+BlanRMoou3BtZyTJjAYe6jvTnVmpQMoLUQQ=; b=cEEaCrIUc7HMy0feYFJ5QdMFEw
	0p+agkNDEtTgPQvpUgkDn6vwBbYz89lXNmZUA8cmr9VB8HJ2BBN9J5AMDkS4Y9c4y7ug1SKQ58vb3
	9BMwFgN9FlqNlGHj5fI1LE+ONhdI8QzAPArPU9h+YMxYM6HRUfeNvI6PzKa1BhuG8ntqgJGKcMOIM
	y8pdhdZs9WB2j3m3puLyf3tgxN8L5N8GhHO/ghS4ogFj8l73v/4Tw3JYhq42eZXTb2wzVf8rporG9
	nCmsyQBMedH1UnVBkv7W3EaqchqH6zT7PtjEsmbndYN3+z490t6e/2/+9pnCBGpWgLdSktrn7Xqjv
	j929NGXw==;
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMq4D-0000000FLmQ-3P0k
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 16:34:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YeZqauszyybq7SOlqIBhE6PyXzYXU9NjkdNTpLX5DFglkJuSOdZzAf5ihmT6zUA+IeAOSuJYXieNRd41eeK2sAUtztt7IXf+v9fgA+uKBrTNVQd73d3C86ZhyOPs0YFVf1ZhrTkAve+UpYH4wSpyM2rvEFzNUqTiE/j/o+R8jD7ulVYWhnr580NYZ7uSmLem/XHp8oGgJTKKxvmqp+MyYe+OG/JIP0IUYC5npAZ2bANmf90poPax5H9KQ+rCPiHwOUjwmBHdVQ1xg7oMIJY/BXpc26cVWcjfmUziKg51RpE4DH9LM3EsEVgriCDd3jFhVHRDlo4YuhyYan3cwIB5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6Zf6iV+BlanRMoou3BtZyTJjAYe6jvTnVmpQMoLUQQ=;
 b=MwQ62+8nnd+RWQn0xN3DIeQeETKHNkHDnqIXTG5QZfpUmQnGBx0NRZC7TG/KJoT8Ee1cMCBo0U+Wi66wuPUIdZ+FQzABvCMlsWc8+BM7ThxyPLd/VoNdN29HUPp0J/q8nUsxGG0BXSVkC0RVRUhWJDHYxpNYmH+DzctjqDjSKXeFrIjxPliww5RD3vRwEYHKIyNaj59SkdEv6djoZ6BDxkJldiIfgFAbVHld9l8QNzsV1vzBi8/mH48tAgoHcyGmu4E0jaAZiRducsn+2aXOx09xhancg4+Okh9b7GoWMr2fE16BCNF4eodukb2nOUZfPUNkn2iBYT7thMizhQIdiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6Zf6iV+BlanRMoou3BtZyTJjAYe6jvTnVmpQMoLUQQ=;
 b=g0/nsXltjK0NGyHU+SYj4kuZcjxIEGvkIo/1YWH58TPWjd4ijEneKA1bM9aTeh+OSwx3NYKVANid37/KaXhpEEKW+23QPQto+khzvDbxpY+JAr84tb9gmVxRkt45m1DTd+cvmz469H2eQev+l6WJp46Rd9PkZc0KTpMF8+AWK0x6odjV/nFYvsDzCAdbcdDi7+mOwbvOt0Q4IH8cdgPJejbtiG6H9QpazpYvH5r4Wh9aavxLl3uFZGOpZCSWkGqQ5DzcIIoSV75TLapTeUJTt7Vog9Dl34rlrJiUwuMx12M9bh9eQZQfwOIGJtNbGqgaIEu/Efi46NlFSbi+JHhkGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10228.eurprd04.prod.outlook.com (2603:10a6:102:454::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 16:34:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:34:41 +0000
Date: Tue, 12 May 2026 12:34:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] i3c: mipi-i3c-hci: Add Hot-Join support
Message-ID: <agNWmjBlVcOj7wJm@lizhi-Precision-Tower-5810>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-9-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260512121732.406009-9-adrian.hunter@intel.com>
X-ClientProxiedBy: PH2PEPF00003849.namprd17.prod.outlook.com
 (2603:10b6:518:1::66) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10228:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e4262b9-6081-4f0d-3694-08deb0445d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|56012099003|22082099003|10063799003|18002099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: ro0nyHWkWvMU9Fh3erRFxtckgOZbZehDbL+xF3p+dHUN2vcOq5vPTfehC4S+aeUf5Be8QShLCe6z/+ni6/jsUSoxEiTjLxYvTjbrMTryxxU/aicQbvKrODhQy/bZNkih1m8rWz1u6rVjz9DrEv0QFebfFke/QsZWQXN6IdQHsaAZVxH7ECSpxQVVV79JEGpBJWZVeaLkazu8PGxsGzHUOExndHsbXxU4b/0agduJdOQeIvKE7eDB3vk0Dezc+gPGARUELPQINVuxD3oF9TtrbrfuokunwvWdwqJuJyJImyOURZ3SX15Z54Xxjaprucko/dj2wfcLtoQrLm+sTzHmmDWaDia1jmv6vENMbQDHu0UmXGwOiQYbt5X2F+Ica3+reMgR2iW7h8N41A95AeYEhHCdHUHANhZDNLTeT5xXRDHbowWE91kUzCDQOLBCiqQhb4WdMZRoT3VRJbRnfDeOeZGP/QItxRiixOCx5n03ESoVN7UjInlBbHCNpW6lAY90wEv9aLyYEGd/Z+4GrP++5LrXfRrOU95ePkzPQ1IZRsKcHerQYX7Pu4LOs8JAFn+6mF29LIf0GiKLPhhyecHoHLJOzVZ0crnoavtYb1rXd+9zxhV63rPElwY11WWNnBTx9OSMXa3A+EYhmUIhNJ+SFpyR8WtgheZ7uU5ieJbgDK5525UHBBeJ6ZyqvDiS+HKR72LAp3fdv2Zip33WFhVgP5KYTPUYuehE/hd7/OnMD0YtlPWatxiapBBp9ZjxYEZl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(56012099003)(22082099003)(10063799003)(18002099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fcBaX2/ZJS48Qc3sVMjOnaKClRA8rY8lUUeOz/Rt7U2awU+06d/Xa0y+hhYV?=
 =?us-ascii?Q?yQlw+9yUrx2SyupaQZEfl4wIitFgbnPaIdGZXVF2lEtlo30Ay9DJMoaMZFvM?=
 =?us-ascii?Q?rRIvQpccT19fbaXAiFB7kTH9GtY5JNN7fHlDgAb5bA8g6rr781iy/nIx8AeC?=
 =?us-ascii?Q?PJwgTa4JO2DlpudygvQjvz4J7ui32YO1Wj74FltV/KxTjixi3nLdIHi9ZXTi?=
 =?us-ascii?Q?x321bLh2Mi7XYliR4ur0ncnqKGisUOHhhblZtUTKmA6ocYYdE3OAWbQmFd3b?=
 =?us-ascii?Q?UZp9BkxurNFdkZVvGUPRQLSSyeARDOF7VbaPCCQotxhfIn0BBD+mWrygkGYW?=
 =?us-ascii?Q?GI8E7rDDRy2Sk3Er+VskrKMmajWNDxwcx1c7nlUo3UyXaugYu9cBoC0Mj38O?=
 =?us-ascii?Q?I2o2+O5nHsSG5eC2CNazM1VxgB6EbJOeLWO9j1cOyHhQeggrGXsBSgqhnTsH?=
 =?us-ascii?Q?njF/0Ff7/zizvtEwcMC/E+ybYw3IEfzAIruhoQ3Xk9kKG6LGvxYFAQ0/vfGl?=
 =?us-ascii?Q?LNPYlCwRVpsc4yi6UJoCDT5490BDa5j/PkkibrjaE6uGUUTjUE4hMi8iPqRu?=
 =?us-ascii?Q?8n/jIwnFCrgRlqsr1Qr6taTiscu0hVuWlkCiCfWLE6N5ltoc941EKF2GfUaQ?=
 =?us-ascii?Q?JhbNWQrnz9xJC8Pt9/5gzrWqV1BOiyDDD6kD4hq0aNNcqYjGpwgxOrUwLXvs?=
 =?us-ascii?Q?LitBPw7MDzgINsaPcREiYYlYqRVeHYPzVyQTohrdZr6ewSQQ1OrCpokBcrGz?=
 =?us-ascii?Q?71UuHGTw/DGMjbduDJA8M1wS9f6NVlfyrJ46a8WN4kqxKPfwWmBbdTXYabr9?=
 =?us-ascii?Q?fDvaFqFiLn6EpDbi7uy8xI6fBycIyn8kFBk+vQwY/FlkfJjvZN21JggRI1QV?=
 =?us-ascii?Q?kC48ULCeVEtdMn/1PPu4zSpErRFHeYNEUzZuoCvRjk1HVdEBGbtvoMhdqPR4?=
 =?us-ascii?Q?mDEsa9iGGOZeMfyE7J46DjDZ8iMh9Ntti757yRvo38JKE0iAgSCE8Bdo+dIv?=
 =?us-ascii?Q?PSAhYS3l47SpRiCTZBDIiiwWsqJXBmMamml+kB4wt+ExNhgqPtX1L+pkBQ2P?=
 =?us-ascii?Q?RSPQFl45pWL24gY1DNnCWhW6Pk5/MzYvd9/DbXAWLTOANRZbQjNKGsdgb73y?=
 =?us-ascii?Q?usdF+TqvBTJmcCNzDPwJPvs8FFMBt5kSEgCfEs465zbhANrjMgHQKI85Jeua?=
 =?us-ascii?Q?BMfjyUIGo1QDgcIPjH7HomMiufPI9hmMlPAHKViy/1tZ93xQOFmHaUGT+zWH?=
 =?us-ascii?Q?Thv+frUgT/z6O8x1g/ckt7+GQTL+EJ+sD5z5OSCV4d7HtusSDV+icXDrHdys?=
 =?us-ascii?Q?RZ94Yug4LrjwQjDuJLgWTbHDQhln8sMs5tpHYwLX366nPlFxi+SHkq2YVPjA?=
 =?us-ascii?Q?mTTF4FQRiGGn98FmL1LNZOLB6V4WEHzugS/LswlrrRV5mT+nibGU9LAv/ldy?=
 =?us-ascii?Q?Rp0WLwfEu/Rd8MTftxRs1GKMvsXklag+aqIJ5ExBz/AO7S3dupNNY7Ek0OoW?=
 =?us-ascii?Q?KvC8SVlqUW0ZEO88ri+JjzHMfD/WJS9QhGgt05a9ZZ3HiAzZYz0xQ+aKXIIk?=
 =?us-ascii?Q?1lQvFZp7ZprhjnY9CWbqAJHnUd5bYG78JhfLE716nvfZhYx31jyFGTpgFuAC?=
 =?us-ascii?Q?73em2OqWYtK4yA7Qat89hXarY9zVWLKQMnX4v45PqZ1bCspJvIDz5ObltQ/1?=
 =?us-ascii?Q?EfyqLAOMzeSInQKFzcjrhbnyslH9Q+JXkBKBrqcm2LD7x57V?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4262b9-6081-4f0d-3694-08deb0445d87
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:34:40.8690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKUYjAdLAjEkgBuOVY6e0lCkTuGIpDbxlY5n5iwj65v0a3RYqvHx/EIpmZNlmA7b0QL2TMneSrGSvZ/G2dE6xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10228
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_173446_442631_A615B144 
X-CRM114-Status: GOOD (  30.99  )
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

On Tue, May 12, 2026 at 03:17:32PM +0300, Adrian Hunter wrote:
> Wire the MIPI I3C HCI driver into the I3C core Hot-Join framework to
> allow targets to dynamically join the bus after initial DAA.
>
> HCI hardware ACKs or NACKs Hot-Join requests based on
> HC_CONTROL.HOT_JOIN_CTRL.  This was previously left in the
> NACK-and-DISEC state, effectively preventing Hot-Join.  Implement
> the ->enable_hotjoin() and ->disable_hotjoin() master operations
> so the core and user space can control this policy at runtime.
>
> Also issue broadcast ENEC HJ when enabling Hot-Join.  This is required
> because the controller may have previously DISEC'ed the Hot-Join
> event, causing targets that were NACKed once to never retry.
>
> Acknowledged Hot-Join requests are delivered as IBIs on the reserved
> address 0x02.  Update both the DMA and PIO IBI paths to recognise this
> address and forward the event to i3c_master_queue_hotjoin().
>
> To make Hot-Join usable by default, enable it once after the initial
> DAA.  This is gated by rpm_ibi_allowed, since otherwise keeping Hot-Join
> enabled prevents runtime suspend.  A new hj_init_done flag ensures this
> one-time enablement is not repeated on subsequent DAAs.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/core.c | 50 ++++++++++++++++++++++++--
>  drivers/i3c/master/mipi-i3c-hci/dma.c  |  5 +++
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
>  drivers/i3c/master/mipi-i3c-hci/pio.c  |  5 +++
>  4 files changed, 58 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 2866d599612a..f8b399d16598 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -392,11 +392,52 @@ static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
>  	return ret;
>  }
>
> +static int i3c_hci_enable_hotjoin(struct i3c_master_controller *m)
> +{
> +	struct i3c_hci *hci = to_i3c_hci(m);
> +	int ret;
> +
> +	reg_clear(HC_CONTROL, HC_CONTROL_HOT_JOIN_CTRL);
> +
> +	/*
> +	 * Broadcast Hot_join enable, so that an I3C device that has previously
> +	 * had its Hot-Join request NACK'ed knows to try again.
> +	 */
> +	ret = i3c_master_enec_disec_locked(m, I3C_BROADCAST_ADDR, true, I3C_CCC_EVENT_HJ, true);
> +	if (ret) {
> +		reg_set(HC_CONTROL, HC_CONTROL_HOT_JOIN_CTRL);
> +		dev_err(&hci->master.dev, "Hot-Join ENEC CCC failed\n");
> +	}
> +
> +	return ret;
> +}
> +
> +static int i3c_hci_disable_hotjoin(struct i3c_master_controller *m)
> +{
> +	struct i3c_hci *hci = to_i3c_hci(m);
> +
> +	reg_set(HC_CONTROL, HC_CONTROL_HOT_JOIN_CTRL);
> +	return 0;
> +}
> +
>  static int i3c_hci_daa(struct i3c_master_controller *m)
>  {
>  	struct i3c_hci *hci = to_i3c_hci(m);
> +	int ret;
>
> -	return hci->cmd->perform_daa(hci);
> +	ret = hci->cmd->perform_daa(hci);
> +
> +	if (!hci->hj_init_done) {
> +		hci->hj_init_done = true;
> +		/*
> +		 * Enable Hot-Join by default after initial DAA if it does not
> +		 * prevent runtime suspend.
> +		 */
> +		if (m->rpm_ibi_allowed && !ret)
> +			m->hotjoin = !i3c_hci_enable_hotjoin(m);
> +	}
> +
> +	return ret;
>  }
>
>  static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
> @@ -652,6 +693,8 @@ static const struct i3c_master_controller_ops i3c_hci_ops = {
>  	.enable_ibi		= i3c_hci_enable_ibi,
>  	.disable_ibi		= i3c_hci_disable_ibi,
>  	.recycle_ibi_slot	= i3c_hci_recycle_ibi_slot,
> +	.enable_hotjoin		= i3c_hci_enable_hotjoin,
> +	.disable_hotjoin	= i3c_hci_disable_hotjoin,
>  };
>
>  static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
> @@ -833,8 +876,9 @@ static int i3c_hci_do_reset_and_restore(struct i3c_hci *hci)
>  	scoped_guard(spinlock_irqsave, &hci->lock)
>  		hci->irq_inactive = false;
>
> -	/* Enable bus with Hot-Join disabled */
> -	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
> +	/* Enable bus, restoring hot-join state */
> +	reg_set(HC_CONTROL,
> +		HC_CONTROL_BUS_ENABLE | (hci->master.hotjoin ? 0 : HC_CONTROL_HOT_JOIN_CTRL));
>
>  	return 0;
>  }
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index e5deeba0aa4e..34129ac039dc 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -971,6 +971,11 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>  	}
>
>  	/* determine who this is for */
> +	if (ibi_addr == I3C_HOT_JOIN_ADDR) {
> +		i3c_master_queue_hotjoin(&hci->master);
> +		goto done;
> +	}
> +
>  	dev = i3c_hci_addr_to_dev(hci, ibi_addr);
>  	if (!dev) {
>  		dev_err(&hci->master.dev,
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 243d7a67f6f6..591eea040b01 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -57,6 +57,7 @@ struct i3c_hci {
>  	bool irq_inactive;
>  	bool enqueue_blocked;
>  	bool recovery_needed;
> +	bool hj_init_done;
>  	wait_queue_head_t enqueue_wait_queue;
>  	u32 caps;
>  	unsigned int quirks;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index 6b8cc5f2b4d2..b5ae1cfaa9e0 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -862,6 +862,11 @@ static bool hci_pio_prep_new_ibi(struct i3c_hci *hci, struct hci_pio_data *pio)
>  	ibi->seg_len = FIELD_GET(IBI_DATA_LENGTH, ibi_status);
>  	ibi->seg_cnt = ibi->seg_len;
>
> +	if (ibi->addr == I3C_HOT_JOIN_ADDR) {
> +		i3c_master_queue_hotjoin(&hci->master);
> +		return true;
> +	}
> +
>  	dev = i3c_hci_addr_to_dev(hci, ibi->addr);
>  	if (!dev) {
>  		dev_err(&hci->master.dev,
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
