Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6DCC5B572
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Aug 2026 19:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUiowRrY/vEmWX6Ebl4Mv32MduBzpdBGe6jEzTisZWg=; b=fFt7jgMxUsG/Mp
	hUWOO8dOyzDRSMNMKdNsGsj4H3cIKHPCjIVpK+LhgtvH3ZYKDui3ynmI+TRacxTOLkkOGEo5SYRi2
	lBaCewY4Y+ShE4HTtJAb4Zeno2iHVMrjVOGFIIN9GQbdjvkDcsE8VeGNTGdiGw2PcF2RsWdP+kTMq
	ba55t9OxQ0H0hqnnb5nlYi6CQI8sedTUj3fAa1OYhq2LqKNuUkLUYg1CqpI8lpoGSU3qrYTbbD98d
	BJS3YfRT58pqRu2LjCB0vjF+VxBIH2A/Zl6r3NeivAA8M9D/qwDd1XiEcblFflYgj7BupQclGhdSl
	9iWuDFSQS5HmjoT9k+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3K5-00000006kMS-3vDJ;
	Mon, 17 Aug 2026 19:48:41 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3K3-00000006kLS-2V5U
	for linux-i3c@lists.infradead.org;
	Mon, 17 Aug 2026 19:48:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjxT/0ktuApNUCCq+XlxZKJF1c11YM+uChTWH9VjmEBbDWXyupJeXujUPPnoroXRlL1jfjYQ8zAA/AYXimB1CLtcQIIur9atxGDEs+nUr/7V7vdhQ26jfMv1SF12wQ9URCUZPbb5qi/KULmobrE/tLp9y94gDZiafcL4WYEGzcU6kJwoY/PHN4yj3dWxu5RkiDN/vDyoQfLgO2ulzbTsZogb6eSAtFdgGGIOVXUGkDQh4RGDfchmt2cmgqKwJL5B/Q3YETo+mqkiNxiaZzOYSkSaytlYMIOyhvtYWqQqq4TO8OufCsQgg/B6BazgmGsD6ci3TmONc6MkkhTxRxksHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tLY8S2S8Eb9tWzN440rslx071+btkbQqJWptVTWWVo=;
 b=mVcVmL7J5KGQ0aD75xrKbVyMDR/6UJGwqPcZNiiv52Nmal0qtcFEI0pKLGE4KVQMZvooYX3ewwT8uK6SCohCgqPhlQJBqFE1zn96+t4XH4BRjJWy6W1WFdkPb8R5ZXAGFIEPHSv+TAL54x2cPCFxQ/aqG8pcoj34NwHqaTpdgu+9KZT1UHYjotMhXNrBwaOgBqnBLnUfXyjJQeLBXF9DswT6St9RgwPDi+Tnvg1uHrH2wYRBvCdmpzRvmvorAcXjIO6v6TlcWCo8s9Yu+96KVwFBUbdjSPs3Dc7xTS47H0Cly2/2BAVMeDeUpNgiBs40/P9ZV3omNdw5xax0W5ZPSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tLY8S2S8Eb9tWzN440rslx071+btkbQqJWptVTWWVo=;
 b=oV+49UGZ0GBM43z+BMb9Qqbyn63aFbh6O0x0rfiQDNMpWr3sFeeekxz18h3umOUMoIpkJlI700wi5xkNM333JrGq9e20Re/6ClKbLtyNUbopnWUvhbv17mRBC+/IKQey67mVLHhPOd53buSngrmbmBD9/WnE/ziHiR9qJfBP5JxDgpRv+GfFbf2UPEnqSny9BvNQjlZ/UDbU4Rq2DK0BaT62gbUxu6phyKdWYfCVdCZRpEYdi1ctzM5o91YAr45EB8CglVX3vMtO62JjGZXEa6KUbLUXfvaH1jJbmnEm7ddjwtSWtP1eGM2ZN6eMP8OVWxZOwnei/dYMWKBk+a2img==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 19:48:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 19:48:34 +0000
Date: Mon, 17 Aug 2026 15:48:26 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jian-Ming Liao <tim678910@gmail.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	adrian.hunter@intel.com, jarkko.nikula@linux.intel.com,
	boris.brezillon@collabora.com, linux-i3c@lists.infradead.org,
	Jm_Liao@asmedia.com.tw, Patrick_Yen@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw, Yd_Tseng@asmedia.com.tw
Subject: Re: [PATCH v3 1/3] i3c: mipi-i3c-hci: Fix missing
 STAT_IBI_STATUS_THLD in PIO mode
Message-ID: <aoNliknLshqVQiMo@lizhi-Precision-Tower-5810>
References: <20260817082647.612471-1-Jm_Liao@asmedia.com.tw>
 <20260817082647.612471-2-Jm_Liao@asmedia.com.tw>
Content-Disposition: inline
In-Reply-To: <20260817082647.612471-2-Jm_Liao@asmedia.com.tw>
X-ClientProxiedBy: SA9PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:806:27::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8829:EE_
X-MS-Office365-Filtering-Correlation-Id: 676156eb-d9ad-4e4d-4a52-08defc988559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|19092799006|7416014|376014|1800799024|56012099006|10067099003|6133799003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: DvNk98fsMYaqqbjHJvtVF26KzCWgRyDZmzGnyQ1qtJ88QDZfE3GHMS7h4/vhSK1Snq7Jy8TE/O38hOV2Z3VifqPoQ1/3wCgRKOQf4/QIfxvMiigMepA9m30Naxt9T/vDcEx8Ukz266dU6XwAHM+/UCHIwP494Xa8WH+kDC7EQUbOHDbA+bCoalurKD3VQCLo91pSYg0FLRsv0Sc9eCDzamxdXQfZvY9fTpty/mpcCYDYNcwxo96S178XlEXrRNWF12ANA0PEmS5XJ1Nsnx4jlTKUYpBLvGzTdZc3/WHQwxL2UGwmZWmEqq0lyF8lVRdrCO67ZNc+fmQTzdPqJ1Suaj1Qvbx2E8mWdykkTgbIicuI5IuGjsQq0II+8ODpryf5mzPu71ox9itwV/RcReU51bUikIpQ+sK0N4kWGtTxttAe1S63axNRbnQx0eRNLbf6gDYVw2TuuP5yvVUwaga3AUXScgMa3M4eUKk+si2V1OOFMp3ozzaCMRsT9c/wty/28aN8y+U9aARKnh5huxbjWRLWIEtBgPiCa0nD2VVO2VUqYeX01t+7Zj/tvtgF2MQMGmvd6ZW0Jvv7SZR99xGhlTexfp1GEf5UoPQpIM5C/kNSHVT3SKJEjP4miujmtJ7ZWcRFhirFc6h+Wnj1DNlvdW6Yn4tkW5aNTtCRE/322q4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(7416014)(376014)(1800799024)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y4/vQsKlNfQuCHY23LIwYZQn7L/F1/+42lqIToivFJuMJ4B1DS0hpQ+IgQ1D?=
 =?us-ascii?Q?hIs4bL4JMJnxnBKySTAgh5ku7/QTB3sReo12vAOOA+UW6KPFX3UA3/ShMKhR?=
 =?us-ascii?Q?gMC2XhfOarUiWIumKrVWkwoPyDhg8+6+xiHLBUwWX0Nq9CXrmbO0wBWVOaty?=
 =?us-ascii?Q?8wD933oxYV7Teu5fgBh22PvepMPueeulX/O7U3hiE/9+8AP6uAaU5cmB8v3i?=
 =?us-ascii?Q?4vg5w0HFoGF//vnH8vv5BDRIzjv/j6SA4HUWs/IEdbiJcxrX5vEMjr5iB+1/?=
 =?us-ascii?Q?ybMOtrcoRo0A+YthXxLRUXZIEMDZ9VFO2p2aQxaQTFjbG5Kd1S7sVCPAVxnj?=
 =?us-ascii?Q?zQ6RQ3zx0iB8aCG6j0UEJsQ8rMNZYl4gjNxhwtEEmPH7JkbPnm8rgaehUXIx?=
 =?us-ascii?Q?JWmV4hOXEvjRaSE2xTL7hdh9MFQEA2eekpmpXdMJfAurRGF2CJdHwHr2BpTb?=
 =?us-ascii?Q?KM4sgIpvBLsScUAvabBwNEsS8iBzX833hbLJcZajZLrZTwdweANH55vGwtxd?=
 =?us-ascii?Q?OzNlDdCLtfgk9jGyAbN4na3LtmnslpQ43TWxz1U2igOhVvzigia9vMLqtAX1?=
 =?us-ascii?Q?RPL8A3bAT0ebHvtvCpUqgMc1Q6iakB889pd6sM3cBvamIUvk8ulQnaZEJ62N?=
 =?us-ascii?Q?9BwBwbjyhirdwAQCv2QZqw9BUD+MzFLX5ifEOtTdZeDRAa+OvhI+bmij2/aK?=
 =?us-ascii?Q?IT22UWFjUUSZ0342y4H5kDx+l/nFijaIMJ3jP28D6823uAbFxpkZNIfx3nYX?=
 =?us-ascii?Q?p6oupxmmJDP9PAqb4f4OzLCykJry3FvZ3j24Hsmvw+btDPJfj7m5IT8MY5bV?=
 =?us-ascii?Q?c5bbu2LkLEjAHxpO6chLV+TDv32ndmZn8yB6M5fEd0ODg9+eaBd59ALLPaMC?=
 =?us-ascii?Q?HfKyUBL+ZxAqG63lID+//9C92i/M4TUA9X/NrPfiahQLRlov73pOP4EUPTBH?=
 =?us-ascii?Q?zMDLHN2EMQv9UhUg674o/LcETXor6mm2t2JvMoCw/jtqPU6xDZhZuK+K+Bjf?=
 =?us-ascii?Q?pkBfJ7MdjKt7fxuYwZZnM49hzASW3edRQOXDWSb5QUFR3w2hDbHDRvlACTai?=
 =?us-ascii?Q?qaGktQK34SrYFvcUSSv+tSz2MPppS3lRX65FZqyKQZd7S2rJsP5iefdHvVMy?=
 =?us-ascii?Q?LC/VHDs7Qynqb2bMfmm1IgspNdnE/gc1stx5ViTWivZ4cShrRIWTxrZ1EuLn?=
 =?us-ascii?Q?35P6vfECU3+UE0J8GaFYbG5K5r7BRS69bBIuFKNDHD7f8LfpLKBy3lwenxKS?=
 =?us-ascii?Q?XVArfR5Z1gUSDhXv7O8m6guoIUXMuDDmTGOGEoybqDV5CsA2SAPoQpO/RCjV?=
 =?us-ascii?Q?Htj8ztU2FYlYGZAMzo6b9tuFNnDV0rPz8LQSzFY3nlSRjl/FGt1lp5jmJvf5?=
 =?us-ascii?Q?QJw9fTxQLMJF0Yz0dvxdeX4YULGQhjlOsHCO077A9C+egRexhLb2RVXk4T3z?=
 =?us-ascii?Q?Kr/NRMOqYAxkTmysae5CkLJp62+cWyz4TsBajnKhQBWb+4t8n+Gv35VeYQdV?=
 =?us-ascii?Q?fvYKGmgXApuIU7xCLDtGBcA5g0Vtfo2vwFf+YUvL9EnMi9BAjcWmIj3rHN16?=
 =?us-ascii?Q?uE6JWulbQZe8ylsJ9sLMxeLKzlNtKwSDAscWenQI4ewLOgEkermzyKimwTSv?=
 =?us-ascii?Q?R80tRmq7dq6pZLL0ko0Byk8lHSrSBz0SwV3c39IN5FdHxEPDG+Tb/ttrlMiY?=
 =?us-ascii?Q?1ORMJXM3E9K3LJens4kusssFVUFPRJmz5e8YxAIMHqEOan6NXIk4KXRTOleo?=
 =?us-ascii?Q?PjKWANz3FtrCqw0SsuJ8eLJSPWeU6Bpt1FoYuA9ccv0aJT1EoJsd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 676156eb-d9ad-4e4d-4a52-08defc988559
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 19:48:33.9779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qu7pH09IDeN9TG7ZnAqKBrQmf6LfkS0mOY+I9H+S9jNzBSDah1ucELOeUTe9kyRtsi7I2inYAw+uMt8iRpSl/G5icSp12TUGqWBnbufxv/WL++RjSzoCPHVE4AByovqo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8829
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_124839_643355_432137BB 
X-CRM114-Status: GOOD (  18.54  )
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

On Mon, Aug 17, 2026 at 04:26:45PM +0800, Jian-Ming Liao wrote:
> In PIO mode initialization, STAT_IBI_STATUS_THLD was missing from
> pio->enabled_irqs. As a result, the host controller interrupt signal for
> IBI threshold was never enabled when transfer starts, preventing IBI
> status descriptors from being properly processed in PIO mode.
>
> Include STAT_IBI_STATUS_THLD in pio->enabled_irqs so that the IBI
> threshold interrupt is activated alongside error interrupts upon the first
> transfer.
>
> Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
> Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> v3:
>  - Added Fixes tag (Adrian).
>  - Updated commit message and code comment to accurately reflect that
>    STAT_IBI_STATUS_THLD is activated on the first transfer (Adrian).
>  - Aligned From: and Signed-off-by: email addresses (Adrian).
> v2:
>  - Removed "Hot-Join" references from the commit message and comments,
>    as the change focuses strictly on enabling STAT_IBI_STATUS_THLD
>    for general IBI reception per HCI spec.
>
>  drivers/i3c/master/mipi-i3c-hci/pio.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index ff2657ee220b..a1341d66bc65 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -185,8 +185,11 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
>  	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
>  	pio_reg_write(INTR_STATUS_ENABLE, 0xffffffff);
>
> -	/* Always accept error interrupts (will be activated on first xfer) */
> -	pio->enabled_irqs = STAT_ALL_ERRORS;
> +	/*
> +	 * Always accept error interrupts and IBI threshold interrupt
> +	 * (will be activated on first xfer).
> +	 */
> +	pio->enabled_irqs = STAT_ALL_ERRORS | STAT_IBI_STATUS_THLD;
>  }
>
>  static void hci_pio_suspend(struct i3c_hci *hci)
> --
> 2.43.0
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
