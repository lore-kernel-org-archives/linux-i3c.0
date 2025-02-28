Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20378C282C1
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Feb 2025 16:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNBdA8CFLAc/Hqywi0D4A033TKU0FwEWxwEPmJW8n8s=; b=P+OnSguuojohJB
	pAre68khJo7LHG7pnPFpwR5gi3SbRLb3cvYnoCfY3D35KmziEF10J8Jv3wnk7w4LqEpGC68qm9LtJ
	rayVZwbytWX4OonB4O4uJgHMDQVfrZLnRc46WXTIFbhrmLg1ICC4YftDX+MPdsh/8CUeCmhsphpsZ
	QhEC51VzIQ4jZ8nS3bdvUviMqTLdRCMZJ/SzW5yZUqF9ShwWB9PemD/IHSOz2rK27soj1KR5CzCpb
	u2FRTWSZRmLdTHuYOZni5qtrTrCx7/R2OWwV45Ut/APCBERCAAM6SPx8dLiUYXhekMTDsdV+sDI/E
	vNIbCaREicLZvzxfrZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2xe-0000000Bbun-3jvT;
	Fri, 28 Feb 2025 16:11:38 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to2nR-0000000BaDi-1b5r
	for linux-i3c@lists.infradead.org;
	Fri, 28 Feb 2025 16:01:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDkE1E1MEvvRA5Hg8sF+ju7M9h49z4eCfu+IIR8y918SFXxaSSthkEL3VhpqaeQPn4CWclgb9xv6N4VZCpiDP0LfF2vK8jHOtH4gD/gk4M5V7HK2rsW2JlFUXxCWjUxptbvglydt+qzOcFGeYSHIuSWREOzXoRsgkzZGZS+KrMmnGheJeHQyV7mJ98KJZpntaKYlM7HmDYB3PL+Fefzv5pFw55o/nlLoIrexOYixEurnt/p8EuJ5IW/dM8YMnsu7pdH+xDnr6pGoiu2FnQvhT/gPFu4BsWqnS/9b2CBNXck1OXe7lEK45WSKuqLzRWiKvhGMgPWz93CI7F6t3w5Idw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEHiwOZN63pEiEhfPdzOaVOxbv5liSka5faemRxs8BU=;
 b=LjLNHeZzjTHLw79CF0WqrTNBZxCZLwopBOQHD7C3rkYRDg+eQnO0oGGEYdb3cwfC2vo55GUAm/J+5g3DJXO8JS5lecPUKWCz8HXLrN7acmcYSx0tiALyrqYOV2nifys+sD6Gm7udSpVdjPVrutmw+klKIMbvLE5cXMG0dL2W8Qx6Snk/gM4DdJekRR6MDvSGevPqeVv3Os5Jis8ELTMUwQYZkQZzR9yeA2mD61JKepxAGV5WMbxQjOQx7ObKl00VfZ26BxQIpg++Q78hfchvu/wTen695quZhmMOfJ1zO/Ak5PUAZE/Nc3I2YFI0A7FZB4q5ZxUixfrB1/O401cQJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEHiwOZN63pEiEhfPdzOaVOxbv5liSka5faemRxs8BU=;
 b=FZn1W3eezNlZ+zlQ3FSASeeK7plLCSrvsgU5D8uESzhJrl8ImuCJJR8ObcCA+PCuH88JAmYdFPfuWBOgShk3z+bc4T5YE0f8Z6jMc70OuiMLeTL6tVULWjg0mgskaZahawW6hjpY0S1J0LPcVuMZyao/0n7ctV8ID6jKhhHp8beO1f+BP9KSMVVFfg3IQYTS9/Y0S/J7Oep2mKcPhm6lSLoYkN4lbZm1Q9whs+sQAgVNIw4LMhO80qbkgHUEDD0XMCScDD9pIRXX7oHNOhWQiwzqm/111G5uRz//iC3R+P6eAzJvO+tDxoyoU545vSBGnvdyFOIMTQI8SNhbohXkWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8539.eurprd04.prod.outlook.com (2603:10a6:20b:436::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Fri, 28 Feb
 2025 16:01:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8489.019; Fri, 28 Feb 2025
 16:01:02 +0000
Date: Fri, 28 Feb 2025 11:00:56 -0500
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/4] i3c: mipi-i3c-hci: Allow only relevant INTR_STATUS
 bit updates
Message-ID: <Z8HduKx0dzRAqRev@lizhi-Precision-Tower-5810>
References: <20250228141802.1344453-1-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250228141802.1344453-1-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: b1486d34-9a54-496e-9f16-08dd581119c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MDJCvNPom72cPTvxecTKkqTEo6s45/reOI69skF/TXKotp7Ihqxrp96tmBWG?=
 =?us-ascii?Q?YR45jsXqS5JvOg4/t4/N7za/szD02QJE6svbp5xkRNvZ5MuNanvK0lOynoGK?=
 =?us-ascii?Q?L+cpNjdi9OeaXLYNzbRsKFaTiBjdRugfeJP+yW5wzZEmiItN9HN/ufLSiOBn?=
 =?us-ascii?Q?/zmrbaKYzE482sHdfAfcS0rVtT2/XWrEXm3T3AxQ5FyAxAy3FEA2tXPLMseS?=
 =?us-ascii?Q?/0kZT1HYSZUmoGQE2qP7tM/5dFnfuyVDGEr9AkD6iJMyV7+EHstEsTBd1K40?=
 =?us-ascii?Q?u0DYFTm//+6LNIbg+Dxr6e6UTTc/Nc6pimhQwP9nmDdoX2Wjxv16ScNdtAw1?=
 =?us-ascii?Q?kxxUZplqWahp1O0wWs6Im4ECdrSVQQ9tB0Zvfi/9Ft2xfEFS5BXWaAz8hFdV?=
 =?us-ascii?Q?nZp09HodtvTdqss3Rnj3/XnXbnxAMxL/w5X9jbdvR5T3SiprMXgXc0zZQyie?=
 =?us-ascii?Q?+VVxS6lhO+pQvE3vlHGlr8FciROcdS1qxL4v7U/JJYrkvLlf8lXlYUhBlJ9+?=
 =?us-ascii?Q?qKI3YvNgxLuoZ1zcWvGc1VNEDYmNsf7n/aQCqgmjzrT/DNemPoevQvFqvcm3?=
 =?us-ascii?Q?bV2/lTN0d9qWRc9gJMeiviSImxaBgl2uU2cFg32W+EDxXzH9Wdo7AmAkJZBc?=
 =?us-ascii?Q?+T5GvGpkidg/05g9DnTudhQrPaLtx9uRdal61sHmhyT5S5KyYBITmOc3h/W0?=
 =?us-ascii?Q?tz8XsWR/ifZoCoje0L/XGkoljVFjjYrXuePOqkxYzMocifUf7A+4UYaHpsBP?=
 =?us-ascii?Q?4c0s2CdcTMdRKpvW6JQt+MAvwYc4I9ad2TS+3WCgVAUiUgoFYoBJAomIHnip?=
 =?us-ascii?Q?kChlE3qRSyk74MnW4pVQYZ+wAPAsQcTM7Ks2ojYQq8MEf3c4sBO5qa5QUDHv?=
 =?us-ascii?Q?Ewj/KzOYfu2lATYQaIyEIcybH574jFgkyqRFZ2JXHffdAsDT8hDXsmlBUSnP?=
 =?us-ascii?Q?nqnIrAnt0Ur+ZviJ1OJi7Wx9Dkl7VRms9oUWFRBq9KhO0yvUtBNjqWU8v5Gr?=
 =?us-ascii?Q?X2mZqaYSZgVQRsrSrNCGdwJziuXjs9ZkG2tbkSgCrg9SiejyGSiokOifoT5j?=
 =?us-ascii?Q?GWN48aRS5dLq/VvdetwMmpXgCfLvzbLZWii5mOQqDJXVdM4Vi6Ga15d8+bHa?=
 =?us-ascii?Q?IrvhWFTWZHfVnlPohAyKaq8i8xrbLCm9WmY5HYbVH9lsi1Lsfz4WJ29hrGvn?=
 =?us-ascii?Q?Lqpnp/yVhGUlYyWLu1RxqZ4Oihq0K+WAyjAPL7k6VeGvLZiS8wiHfI85aS5F?=
 =?us-ascii?Q?F7/VyxBj4NCj1ofTV9eS+IFnqSpmbSsGF1FhZrkoCxnITCj2/1bSvWII+HNp?=
 =?us-ascii?Q?2IWd/qbCaB4/04BsLCWQTov70/1widffuiSARrMxU2kZEVp36MNFyZ0W9zxP?=
 =?us-ascii?Q?moDGGEQYYGQIfkBgy+s2YXRkPHb7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?35i3xSPzuivEXaMHKRjpJ6e63HFUC14T90IQi8HwM4WVv9Kf1WvTAWXeXIos?=
 =?us-ascii?Q?OoKb6rjizjeKBbbI5a/xEazVmbIZUO8nzPFrU7CMU1zX5cqCI5JK20NSNDCi?=
 =?us-ascii?Q?hhmbPeEWBPL1c2AmLrSRfT2KqDn8pCh4Plv9Y81UBUM8DPG5QDhh6OuyR++5?=
 =?us-ascii?Q?ZZLtNUomTCMNESa1lHS2AtPKFjywolQ/EaHMVj4lBcnR+mLHUiitHr1VZhgl?=
 =?us-ascii?Q?jjP+z5YkNWBH6gZJsP10E4r574ueZEbSbbHgANrSd+qfiH18jUctxmPT1LQ0?=
 =?us-ascii?Q?OjUr6qGLlCPDn8Mi0ZhMOSwjQCtVi97xmf5l5OW7pCxnv7ivU8NYesHBtZcp?=
 =?us-ascii?Q?gWPQ9Xeit82W+0PKNT89Nlaxf3q/xBqaQAtrL3+30ThKSeMSxvsnbmdnKusz?=
 =?us-ascii?Q?OVd2xETYDY9vbdI92Jc6yEVSCfSjyOutRYkzvDHOZF3bwd425bzNDy0xs0ja?=
 =?us-ascii?Q?Y2i5xKRDKI8GOiS8lwMaRSqBSMRYK9qiHAgIATkpZV9nLjS6Eq6QFIrHrM20?=
 =?us-ascii?Q?DPwJojpr5q46w8RDXro3LNWZVi9DgQG2HtYKpppHjzWExwxdc9BfxT6kgexc?=
 =?us-ascii?Q?taseVhWMhF/H1Z2/ckEAoy3GoZFQGUwdthCrMbwXm9C0ug7FfO+YYBowSuKM?=
 =?us-ascii?Q?7OKUPzPXaPkUY3iVjniX8YFZYaBPZfufdHc5D9iOgFaXDwS/xQnPpRdhpMVc?=
 =?us-ascii?Q?GqOz/1Qeq/Q11ob9aI8DiuMAMUDrBbds1UYtOwzNsqrdZx6oRFhvfHdi61e/?=
 =?us-ascii?Q?q8zSauW9qc9tk0UxuEaW14HMusZeP/CerTXUuWodWJk2T4xiABzcEVTckPOj?=
 =?us-ascii?Q?QC5HGgEtY5IXt1n101UEvURclw/0MV1XJqBbbRY2zrs9JcAaVpK3l0wMsSna?=
 =?us-ascii?Q?HT7Vza+GyNZonkJ2FXeiwhZS5SEIFJom4EeVz3PZmn9zethATx2yDzUFr+lY?=
 =?us-ascii?Q?JwGgOu9xzlU2ztRx5mzBDuQY4Uym1ljmACRdQj6Z/x4MXLxOg+atuMvxa87a?=
 =?us-ascii?Q?2fG3qhtvpd3AFC5ldj7hJ8/wMG0uXntttVv1R8hc4m3Fu9sCWYr4baf1h6Io?=
 =?us-ascii?Q?I2S4j+blkhmEBwnrt0Ce9OVemx0JPpp4/98Iu/UnuVAL6lujAhZPY4cp1Cj7?=
 =?us-ascii?Q?PpqES/uPUwJpKO7n2LwRAd28JjZdPxjy/DY3gVIHP3yVHYfOVl2ZGY3nND/3?=
 =?us-ascii?Q?G+80exjXlXBrXwUgNyORVUjryX7n1Ww8MfDatZHeY4JUOba2xSyeV6mvv4Od?=
 =?us-ascii?Q?77PmOBcZJg+AGVfBwxrXdUOsNnXtB7qvOlaC1MAiDWAg5kWBqNlTfgiv+IJg?=
 =?us-ascii?Q?5EI4Xj9GPYMfba/dK23XGi8uoJTw9I47i1rf0oEnXEI7yrXirXs5kBOY/gjv?=
 =?us-ascii?Q?4r5bEhbp64L0WP+6fjZfOD7YcAbhDYVIvrA4uM7NjqyZkFQJKAMjbJzSCFcL?=
 =?us-ascii?Q?3Ga5slg8hnF1WRLTmErcQW9S+IoRTXLVxcdBQiVlamgvUUuGQWBoYfnK48Nz?=
 =?us-ascii?Q?jm4FKi5mY5LjEOdelK5I6WlyPKAbrEJxFxGGNEWoe8vhtcOeIILi8Y4kf8Zl?=
 =?us-ascii?Q?cVs+IsjqTuFgXS+awbqXaRF0YOgPY4mvmnqM4SwN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1486d34-9a54-496e-9f16-08dd581119c3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 16:01:02.7388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qO4O9xhSGkULmCkEVQJASv5K07zOIyIaTlQALvpoOz+UW7+HV70kVJrNAnIcrL1YVsnz28g8VJnezQjokVM6Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8539
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_080105_425749_DB3734BF 
X-CRM114-Status: GOOD (  22.31  )
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

On Fri, Feb 28, 2025 at 04:17:59PM +0200, Jarkko Nikula wrote:
> Since MIPI I3C HCI specification version v0.8 INTR_STATUS bits 9:0 are
> reserved. Version v0.5 has bits 9 and 5:0 in use but not handled by the
> current driver code and not needed in DMA transfers.
>
> PIO transfers with v0.5 would require changes to both
> core.c: i3c_hci_irq_handler() and pio.c: hci_pio_irq_handler() though.

If reasonable, why not change core.c and pio.c?

>
> For these reasons don't enable signal updates from INTR_STATUS bits 9:0.
>
> This change is a no-op for specification versions v0.8 and beyond but
> gets rid of "unexpected INTR_STATUS" errors if somebody (read me) wants
> to run code on old v0.5 IP version.

I think, simple said
"Get rid of "unexpected INTR_STATUS" errors at old v0.5 IP version and
no-op for version above v0.8."

>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index a71226d7ca59..e139d7e4d252 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -699,9 +699,10 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  	if (ret)
>  		return -ENXIO;
>
> -	/* Disable all interrupts and allow all signal updates */
> +	/* Disable all interrupts */
>  	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> -	reg_write(INTR_STATUS_ENABLE, 0xffffffff);
> +	/* Allow signal updates relevant to IP versions 0.8 and beyond */
> +	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));

Generally, just enable needed IRQ in driver. Define some BITS for
difference type IRQs.

Frank

>
>  	/* Make sure our data ordering fits the host's */
>  	regval = reg_read(HC_CONTROL);
> --
> 2.47.2
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
