Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CEFC87FD2
	for <linux-i3c@archiver.kernel.org>; Fri,  8 Aug 2025 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DqB49G/xqUKNwVIxxyJNDMNdNx6cOpOceANlXnTs9w=; b=F8rDtUPQejbIwe
	yRV96Mxm03suaIH8zFn3WcX/RkOxBOu8377S8KHsrgGDf8njY1Y1EPndOG70rH/xwSWLg66/czPoH
	8kyRLIMZhHoJ+D7VxiYdZR6ij3g1El+2pZfq1wY03F+Vf9vsNyQlRRdwl0dQMB0I0NA+nTqtCXaRT
	KOyrWLi3toVo5V4EfQM/atsyckrtG3lyV+eogIbTewyLSqbxhQNI23gTym7IjkKs2lBQgR7uDvEsH
	hwx1vbsR9SFlkiIwy1X4Lb2iE1pqAE7Djr6S2jAYzkH7HK1Ktt87RH8MHyK8saX4FxXWZSht3YQ/L
	KDvreXbH1yuXqWxO8i1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOpx-000000038bz-2N4O;
	Fri, 08 Aug 2025 15:16:53 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOpu-000000038bY-1ymm
	for linux-i3c@lists.infradead.org;
	Fri, 08 Aug 2025 15:16:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3rO5MPrrZjt5A5xJAu17iszXS6w1VYCiJQ62DS6ijpcu1TF8ZR6CVtykazhJUjFbbAz4Huwy7ZoBgjpF+wTMT34Lhm1ii7es88RlHPZKB9eH0qvC55S702B3V8tKFBOqxhPlWjwV6IWtZK6tVI6ZzfW0BOGcXzuQtaiQ3eJrXokUqD4E8e5ixoaP5CUkFxobensb09kk5h4TNdEBl11D/kAk1k3W1tM7fkpPEbWHytgWl6Zehbmya2+dY/HMPGjZMD6Qf6vA2BE1V8LEYEpLeKRMvLM2ar/Tx5vl64zVjI5L1VbMZjb05hfR2cX185pVWux9yeDrSEiTT2zZOcziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yS3ixiT/qxhpTUKgumehdYd/o/Uz5G2PSuMNGXN1Wvk=;
 b=sdmOKaFPEQGwosJWyKboThs4R9MLSxtQ7w8UY5Tl/w5o+sHsX66nnzVotZiUQM2dGf303z4e+MxnKmTo2zESrXYXvHkjVfKnoODQjfgL+gV3jRQgQuDMRQYTpDrmPKFZLNoDEHFNaqS2DSsyKXhkXfenn40QynFvy0f/MajfJLVyjQ09r/QnjnsVKZHaX05vqDNSwIf30wvsAK1GRBxQbu1u1FHfNl2Ydv9FOHIboAR1Va4xkcpcAPtmrPRWKc3S15xFd7jyPb63F3Lr3aCk7uFnHdJCzYIi2HJCaBg2KOFTJ0T99buYkiBpREeLAgNz04wRekmFHtcwqurBzN2MUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yS3ixiT/qxhpTUKgumehdYd/o/Uz5G2PSuMNGXN1Wvk=;
 b=HRRNHUbap47X9QSE0ZgLxA9ksIqniiyBs5suPE2PxHHA03rx2BY3DT+ZBELb2EZ+wao4/WI0jrDyV7fSZ/4Kq4sREAQ+21CojgSonyszZ9pk9rDzVrCXaR0sncntfrhev5ojYcS4Z10EUsMvGHKy4vtlUVRDgnWi9jBt9fa0S6tuZwBeJCfZ4YexoJ/30Im0SS++SA956HzXGSa/gdWVRBROTzx0S0neNlmJnCsTYMH3AMJZ7h8Erjeyiv/uM5VqpwVnMSugmF1VXCdCy8DegXoRN8gfcwtpotNLKd4d76Rqk5EyFjD117QJTPsyRG0z0VWzg07P6syiqpFYlmZYfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10218.eurprd04.prod.outlook.com (2603:10a6:800:22b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 15:16:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 15:16:43 +0000
Date: Fri, 8 Aug 2025 11:16:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] i3c: mipi-i3c-hci-pci: Add support for Intel Wildcat
 Lake-U I3C
Message-ID: <aJYU07LWMcADIrzc@lizhi-Precision-Tower-5810>
References: <20250808131732.1213227-1-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250808131732.1213227-1-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0041.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10218:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a1b188-1bcd-424d-99f9-08ddd68e9517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fSgcu44eBFrztt7xBHrR1rhWe9L47ULPOAFfpgeN0w+UIAMuGDmGCoXL0tsp?=
 =?us-ascii?Q?hzq7QuUmgG46kg2EC9VmIil2jlb5d5zJGYCsMJQZwbcv6G9Cb118NJj3GNRF?=
 =?us-ascii?Q?MbuvWAjVCuQtkVV+n+0f4SHH5Pq0ls9bXbyPnw1ipy1QPt3sYfSxmBc2xDG2?=
 =?us-ascii?Q?xbNkiIxuShbB3qRp3jy5IJsyBzsN1lB2Ijw0ZNltbgkuhyalyAx17H5WnEty?=
 =?us-ascii?Q?HOXzpep2ZWRIeBnnCUEcwLuXvM54UKlY/VOi0OABloT+vQP6RwL00nj1VAvj?=
 =?us-ascii?Q?Va9VtSvQbkK0InSHK6H8CCHmDAa3RAaQ7IHEa7ADdH0De4uxbTtl+k7KEysZ?=
 =?us-ascii?Q?b66HN70JNsWvTwrmhb8gwasH8EV1q1uKBFd/hshK+hY/WBDSGeNaBiPskxQc?=
 =?us-ascii?Q?KIYcWo+t1//BRvDBoCk+8Z+0/yCQ/3N4TeynyW3G/cgNaLXN/Z4t49UNfgjz?=
 =?us-ascii?Q?Gy4cI8hBPiw1S8ApieLzTNXDxLfZoyMbszAYbxXMH4gHx4ARoFm2Sei/KBcY?=
 =?us-ascii?Q?gtSL90/44aXr5ve0B74SOEVK8Eh1+bKJiTRYVdszA8zdSMN7+MSP4vVywErG?=
 =?us-ascii?Q?9JYl7sRbur8kgOFSYJaupcRS4yqZVEMNMmOi6dWgorNOsqg36HQwSvGGe46E?=
 =?us-ascii?Q?mw/Zc6jFOl8UzogO5+7dnDH4X44X+UDh3kzQTNgR8zVB613xSAGKdbB3FuBe?=
 =?us-ascii?Q?WL6drUxKmJ81PLv8VDfMuxec/DkO+GDxsq/dHjbkHs2IcZAk3cifmmEeP6EW?=
 =?us-ascii?Q?5tBOQkNeurn4lyH00ow0hnJugXVV0wkPtfgpXDc8u493LKX1QCE4o/YDDepW?=
 =?us-ascii?Q?3G2TOMehShPaZdZQ4+3WpVainKXSEL1KULn88Y67ZYTcXo/AWK+D7LxgkwxF?=
 =?us-ascii?Q?UZoduIwb1R+7m0X0IuT7iUYbRvRHVD924t2MVbJPsR/svQqsZvmBRBR8aooE?=
 =?us-ascii?Q?8dqvii1liApnzIH8jSQ5qAyHcUqNBc6maYUbMeJltydW8k4caSRZ+A701NAS?=
 =?us-ascii?Q?VL8Gb/QhkLHVNtmRsTWN+tvReLCqXvhR12Wd7V8jFCPpdBH+PiD/qMdmLRy7?=
 =?us-ascii?Q?RCq5HvgcK1kzSKljPTJRB/6613IwOIi6tXmaLIC/GJAfNxVuXry6Nwhtkia6?=
 =?us-ascii?Q?dcJjSwE4G6n0G19eT7S0DgOpOlT+N4Xlgsd6mOZbNbjde/TrFNOn2RT9rcwq?=
 =?us-ascii?Q?o4/gNMY+cydoTOgZKH2P/7ANIlDtVyJjBI6+3Bu99qe/sa//tDH5wlsecvhK?=
 =?us-ascii?Q?Xwgmx5sc6Q7PYgHaYUGLjeTXr3gCuNxvkBNJu04K+gSHwQMD9QjEAbLtyC/I?=
 =?us-ascii?Q?3IdJ7VkdKtJaWrA3eoBZdq/u9k7TqJ2Z2XFxF5Q3icxX8t02Z5mTS9cVLVyd?=
 =?us-ascii?Q?soFtApaOTd+3zvM/DXkdavxPCo+MVldbvWV6yqWgs9BuoxKGqNegGj2pQTdg?=
 =?us-ascii?Q?iCY+B7yYUF2UsN7jjxuA8mQF7m4Qs4aFA/lvxuJKeDrek6qObbqo9FjJ4fL+?=
 =?us-ascii?Q?4b5IquXQu9NCOoo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2crBorP78nIx+X4eu+D++g3ikNo6UDhPcdZj7T/M5/67QsC6rD1bNBF6/fYL?=
 =?us-ascii?Q?9LhC2yul0iQlv4CZ1QNt/nYlP4aKNwMtA0ZPA3DCXrLkBNrkH+iB67vFkKvO?=
 =?us-ascii?Q?EMrRlDf/FE/3KH+WbeD+F/kyvXmsYSxk8M8FjV0oPq1L37MXUppVz+8v97jr?=
 =?us-ascii?Q?nZTBnNYKX4C6fAkLgXMxEs0xpvBvcXGZhsOD420R4rgFvKq9GEgQo+90PT0w?=
 =?us-ascii?Q?k/zMFKcYU5QWv3fmCJE/NMEtwK96UjWlnvKSF+G5la1KSELgNAlF4EWUs8G5?=
 =?us-ascii?Q?uZXUfbq8urnv5oIThyrYG2mv2KudBK9d/nMg70JAkH3brHTxB11HLeNQS0ow?=
 =?us-ascii?Q?/Hc0bamRWOXpJYYrAjr6Z1hLlIv9x+gPYavurF8RChgjmE+oa0B7Kkmoy0BT?=
 =?us-ascii?Q?eZhx9rFVjdC+GRy8lEDJCWVPXvimSWedYJqoTeXRiVpZqke/iQlFPx7aALpK?=
 =?us-ascii?Q?kPM3TYNje5kJVeW7rukrhxKtLKTfuUXQDyvqpsPGVnbd0ZeWZPe9BUOA4KYr?=
 =?us-ascii?Q?C+q2/XeKOq2Ayl6XuQBob86dnC422xKZjZCJRRg3oqci4S6Ui8ucO1nLKKJs?=
 =?us-ascii?Q?3s3TbpDDccT9jxhAFdEX2vR8WOnclhP/AGnN2k8d4V3qCebae9UovbRAKfL6?=
 =?us-ascii?Q?CfKX2m0MOrY9rJcaGjHsmruR7TgDVh+lokdwvqegixXmhU3HLovKpDSQ2fsv?=
 =?us-ascii?Q?ln/xXyqsujcM3/yRvt9/2jp37SBqjDLYG13K4nPoAS6fmMpKPTvtPqhQhzlJ?=
 =?us-ascii?Q?zFXdmCWbt8uQ2aHrrXFX6VHW8zI0qsiSmyCKjz3y+f9LTmUUViyJQCMQRe+b?=
 =?us-ascii?Q?CO01fCMIbzc4T/+LRIwfdjdrPZaIUm3LTTa3nj3GTbTPlkHjtqIBermLXlpQ?=
 =?us-ascii?Q?+JbDkg0SetwMRQWzDdTpqjHpHa3uss4dTtCvus47YJkfUjFYAPLnOMrV0n3L?=
 =?us-ascii?Q?qqRLL1DnVjYwkasySpfOLlTK7IBDWRmCGxGiJAl7Xf97su5S6jvkfxGGituA?=
 =?us-ascii?Q?5Zq0cfiFC846UFXceHzyQq9XibCCOjGf2EcTa6RnOll2sgefwTPYVbXitKHI?=
 =?us-ascii?Q?f7iXGTOj6AmwO7DcYcjAl6/aM+3Eu12GYwzeqPd8M2yek/UlKNBo2KVF7ctd?=
 =?us-ascii?Q?r0shZKtgTh0ozG1rdM3WATtkeCeXlu/9MNe7B/xtTkLKzD20ETDUs0eYMUlS?=
 =?us-ascii?Q?/zfTsllpBARKfts/TLU0i4Sb3sJZrXn64BaCRcr768PLBIVX1dSZB47NpgFK?=
 =?us-ascii?Q?1szk/pZlWXtrH331r13phqSZ9hcSHjKYC1jXZBa6l+1OY+vEru/oMtSPLkEf?=
 =?us-ascii?Q?FGxTxJm5a4occQeTouAshtlmcUHbaJIU6YgEo+tuVxkV9Tmes8Y0hLlxImPF?=
 =?us-ascii?Q?uRmuBgMKmV42jxVejm6BkUeLRE4SaWMJ567NHKSidnayxOuICHY9hh/IBC9+?=
 =?us-ascii?Q?vQoGojay3WhTgvciG2tTIVL+7TaPIfWFwmhJHNlyb85u3KctEyKeC/BW3fkZ?=
 =?us-ascii?Q?irE2lGoA6QAj9vuUbLQ4IGHDUuCebQPB0GTB07n6duX/OhkdhVwcRWwvLtpv?=
 =?us-ascii?Q?c8H3P6m6u4RePrqTGZU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a1b188-1bcd-424d-99f9-08ddd68e9517
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 15:16:43.3038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xoGEOrmdUC5+oGqIzDvp1FP+b4mnl/cuS2WHI5zb7XRiLOwixQaDQGSo1/uhhnVsM4JFuuFnQ5GWYt15ijb8/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_081650_533855_5868DCEE 
X-CRM114-Status: GOOD (  14.61  )
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

On Fri, Aug 08, 2025 at 04:17:32PM +0300, Jarkko Nikula wrote:
> Add I3C controller PCI IDs on Intel Wildcat Lake-U.
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index c6c3a3ec11ea..08e6cbdf89ce 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -124,6 +124,9 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>  }
>
>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
> +	/* Wildcat Lake-U */
> +	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_info},
> +	{ PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_info},
>  	/* Panther Lake-H */
>  	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_info},
>  	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_info},
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
