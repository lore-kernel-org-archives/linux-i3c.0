Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EE4C43458
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2026 18:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Lj7d9T7y4He+Gz7J8D+wgEhzAg4IAbCC/jwVVb60PE=; b=gqhozY+WOpCHRQ
	rzME6ssFG/BIv0h5p9eE0Jpc+DiOaCpwzgUQopu6QlWXugduejnSGYed066Owqod1Xjpbyh0AYGb+
	y+g0k+gMSkfD5ksu2EQ4tyhVT2lagOgzMUTqDHpxBtBn9wqSBTv9z1SJb7VBMRvUE2oG8DjOFUKOT
	hQmxcN/Ftys6DGhtO3+fyCGbdwaXHM5JdLFswbxoXORPHqXIvQmErFoFSaPKPkB0Z581kfYtV8NUy
	7Rwl91IcevYVrqwnuwy0U8hkpF+oqN0nCwjOd72WaKdftENsEQ+0tA9zxTx3WqAbsyoGi7c7OjPu4
	fhU1ROLU6nv0YHEDN2yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtyJ-00000003Kjp-1H2V;
	Thu, 09 Jul 2026 18:59:43 +0000
Received: from mail-swedencentralazon11013024.outbound.protection.outlook.com ([52.101.83.24] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtyG-00000003Kix-2Nje
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jul 2026 18:59:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzvhK4Z07edLqrgjQbUIA8CdLuVUIHm9/GU+L8b5e1+WeT37Hu6CSjHFQvLOYOvTumj/vQyeGIs2Zr5yqtbdUWRNae50+yHIJnLpVw1Igz8BAbNAsDjypefVcU2+3bg6bSWq3EBfx9bpZjIPD4tKm3DSvlM1Qwy4LnrjCG3JBvHemmp9bX9Tsu+L8x/4ESomQagyyRUsh8nrJV6da7kvE3KvvWorzCV9DoEdKopuLNx6Nxqgfs8aZnDYOWgmtpNFudXS/9a6kmvEIua+oa2ZKl87HP1wky+gTxCswpyWNdDrFZAtuOYzEiOM7L4oLhVnJpbIXCCq2fwGVkV4fsIiDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdX1CNcZVZR6DcWKgxcqvEkx9/dNphSKJIyGwF6GWR0=;
 b=OOy5sAeeK0pwqmsnDqDwu8Rq81XclNfyv2MyE9DQ0qM6MlKRCqteq+a1FAcurtp0fsyttcyB1fs9IPDJOwVTk/NSZy2/DOnEzSheVGYrTOBWQWU6WW2eE2Lw1JDOLxLTQmNNPWov2T0I1mXQ3gsh5fHdM6278wnouPy7ty0z3gD2YsjumoqJPXuqqZV54QSenKjedVDEzBO720J4cbOQPGhBvARkYl/9x/Wkacr6MBpEy2biwy9PAIzPgmscjlz/Da67WYIDXj0YVpddsUkj7w3KZIh3w1ZrLU/DqswPcD9VioOKamBjw0mcPXtaHOQjn1g0A6pertqCfWjQqyF37g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdX1CNcZVZR6DcWKgxcqvEkx9/dNphSKJIyGwF6GWR0=;
 b=NOsLOUTcPGidnvp+M7nKi7x3kEZBehTIXV3YIbKpUil6dCQ/6wPraUysgC6NllYFdBz2gHtJAfIKz7Izf3K3oM3imtVXI5hz1Gbe0vCX5NuKhsUZpZl0JLzFDgnLxbtt7+K0QYnkRCLTdiKsszFPxjs08pq2P/TVER5EqIkNthDNUwqdwBtDCKf+B3C6z2ESsoLL9O1Bv9j8Rrfxz6oS2FdtKceSH3f2fm4UvS65CXH8pPZGpA75m8OSiOr1387MZpslo0ZqgXxYnXzGhsyDsLUPyOuzG6lPWCge+abNUMjA3NMKKQHZMGSV/gT3BGoSu78IV1Lp4ER9MeYb8+79Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8806.eurprd04.prod.outlook.com (2603:10a6:10:2e1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Thu, 9 Jul
 2026 18:59:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 18:59:35 +0000
Date: Thu, 9 Jul 2026 14:59:28 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jian-Ming Liao <tim678910@gmail.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	adrian.hunter@intel.com, jarkko.nikula@linux.intel.com,
	linux-i3c@lists.infradead.org, Jm_Liao@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw, Yd_Tseng@asmedia.com.tw,
	Patrick_Yen@asmedia.com.tw
Subject: Re: [PATCH 3/3] i3c: mipi-i3c-hci: Add support for AMD_PT I3C
 controller
Message-ID: <ak_vkHHVbmW8Oj3S@lizhi-Precision-Tower-5810>
References: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
 <20260709071744.333403-4-Jm_Liao@asmedia.com.tw>
Content-Disposition: inline
In-Reply-To: <20260709071744.333403-4-Jm_Liao@asmedia.com.tw>
X-ClientProxiedBy: SN7PR04CA0120.namprd04.prod.outlook.com
 (2603:10b6:806:122::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: f6a0c10b-6af6-4e37-e4f4-08deddec37d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: oCFrzyaytHc6KUUWAQwkclRO7lHiIanYFaoEpTakPkpZAlwC4uqZF12KKIta+tDbawVrX3cgYZl9/0LIRy/8EAUlbrZUZmuhEBfM3GwwGu7taZKyWZYPXSY8TS/pbAoB/47EN2H3iQzbnQ6s0MHtzOJNiyaq8lMiCTkRuJ4xIDkfN65ry8NEbyyOxw7Abhxi+Rxj7xGvBOM0S+DyXObAPpn7OaU0rz1Y3Ka4D79GqtoD+b0xIP9NNBKRFvTR/LhZ5Sr/wOJBVli5mMxPFmHr8Hhfx2DMcR3f8rUmUyAuJhOLwByFpaGdaXnBT8jRQh0Xes4qvemyCz4lM1M5zbsvVVmDU7QZBzVbUknW74YmvVBaKLXljAF9qfqEvLaejAzKBqdYeznhTPS2ygB88ANNAXvBs1FUiddtEZ4JoR+8HEmbockzR6a7564hULF2mLn9NGbHortW4HCO2eH87xc/9y3j8drkpCbCNXz/8Q9YfJOFFW1fWBJamFdC1wNvmwnPfDdMwlypqfs+rIp97Df5ZpMi+JzSCHpVoW8hb/3d4yFFQgBw16fPEfxA/EuDu2sxeGDXGu4hXAkfrDxJYa+YGCGBNiWoszmh+NIGkEZLIEjotwhd+BOyZG47U7LdCv31p19rxbGuGr2Ez71iWQDPBtbDBU+ZTMuCPvjh/JHLz6c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9+p71vRKdWVgV6i02gsdL2mbHF/jM41fqL3YWWY7N9avOeNK/m5CcxI9VO4w?=
 =?us-ascii?Q?i6GEkcjjn3WgGHsypNvb8yvN1uD4zPuEa30iXg3+Aqwxj58LvGfF7usBnoNb?=
 =?us-ascii?Q?jdRfPJX/FMMk4UqYGYNQWYzPU1q2iR0wxYVb16s1csOu8+c2z2ACaN7T4rwa?=
 =?us-ascii?Q?gf3s4ZRGu7AKAnuaBUpuDy4zjaE/5JNiF8ErT5lu+4RxetpypNrsfXPNkYC3?=
 =?us-ascii?Q?5d6vNdSE1K8jVqT4hMBHr42VmuoqwKXFaFBnxnzW5VvfkVX8oY3gIL31+4Jo?=
 =?us-ascii?Q?rBKkvaTREv1CqSyGuRA48ykX34aLBScJyp4DHvvJv/kWWOBtj69s77YUGNbu?=
 =?us-ascii?Q?d4doQtDgEzU4Dpnn9KZbBl49wmB7rkcdr1SoJ+0HOAF4aKlow/hdVoQcz4Zv?=
 =?us-ascii?Q?fcbXI9R3mbyi7ZsFoPw6gWFeiau3r4JhMvOhv/obZs2imX3gZYZBvnhttnu+?=
 =?us-ascii?Q?kv/s9aMyYte+GkfnHLI26CPx68afXm/OpQeUo0PiMCA5e4p2HIbY0nk4k8WZ?=
 =?us-ascii?Q?OzzAIubxLXDKA4BAulv46hirdoVu/jZ9Ocbt2ICoEPmOhRitGGJWjjQboFKo?=
 =?us-ascii?Q?evV1RkwwPoB6GJpilnz3JMZ5Nrgda2fEdZkHAkGwnaP1fTklM3Zpm/TMk7hG?=
 =?us-ascii?Q?IlQyDCeM6ojt9q1Jebc2fs1rywtjcSIkBlAN/heyt2a8mR2fLqZl+7KngNUu?=
 =?us-ascii?Q?xu7Nc7FwX3akmEp6p/8urZeO9DrCPV0KWzIy2dsOrZknA+P+o1936/3PcoZc?=
 =?us-ascii?Q?rOMsb/2l6ZuLWJ2Am3GLUmN/p96MpNfYD5o+Ss5X8rwBzq9cdSmENlTusyQ3?=
 =?us-ascii?Q?X3XN6khPvQm+u6K+mMKUNziM4dr1ykstsFq+F1BHG93V39eK0Q4QRoHy/Kvd?=
 =?us-ascii?Q?/A3us8Nfkr3DKHryczYvBzbVTI3TQq/CeXtUmozbR5cbbfgABvwT1/ECDW5S?=
 =?us-ascii?Q?MS/0tup2pW51vgM8BcnPfuBC9JUqytuW5QtdSCBINGBdAptwrwpvafLirtz1?=
 =?us-ascii?Q?sYgViIjqyl0pMUI71lJOG3yGLJF7R9si4FB2q4AYCt7SIBfzvstjEATx9Sse?=
 =?us-ascii?Q?yYznFQQJSOBx4XT1GaYKVlyM/mHjTh6EtavyNGYKbwGcOC2MgbIfw7GCwIxA?=
 =?us-ascii?Q?GcvDTZC6jv/aQAB3hVJuyBLhyu6J2SdAjfTlloF12koyUpGo6uirv7PKHiK4?=
 =?us-ascii?Q?CJ7CZNBsPDzG6emtG5AfDgckdLa2f/lGSAnyEFjWWAnMSb678AJ9bbzTzGCL?=
 =?us-ascii?Q?tpD52ISrzZiB6K/EbZseBrrNpLI8t4Mt4GnPW95G9qxONdzs4/5WuDNSIR0a?=
 =?us-ascii?Q?GqBiFvBhcwVl9EF/FRpT2K+L/C900UepnTV54OCD3Onqy6c55lRFvRQuxegZ?=
 =?us-ascii?Q?t8u54tEIn0A/inW8iJmOmwWCBUzO5jzJbARq94S5k09vG4ZqZm+WcD3+rYGz?=
 =?us-ascii?Q?IvO3Sz/RmH5ZT3tuL6jqMOvjMHVqbW61DazxxbP5p4qDSV1Onh03K2Eq35rA?=
 =?us-ascii?Q?Hd8rB3oBax6Pq9GOv2tI7AnkhQ1AM6FzjHKCcusZe4+BWaArh6riybOZ17QA?=
 =?us-ascii?Q?ygM5mYWwpalrkbCjhvgHTkTB+TuVW54LW6X9dX3MC1Uj7NFGUlNohv0GQcuA?=
 =?us-ascii?Q?pGgU3cUv++D8i2GSEXyjS/XuuEw5onf+wEPSact4ORejHMttP5xK7/pKj7kZ?=
 =?us-ascii?Q?tYlTp82y6nkiCBUfciTX2YXFdo7RPLbqrcMB5f62slKrOhcNJkZWPB0AuvZH?=
 =?us-ascii?Q?1zLkAYHfvRGNWmlKtClLdZZE/5pyh4iiE22pKINns9cuTe+qEo7T?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a0c10b-6af6-4e37-e4f4-08deddec37d2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 18:59:35.4139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRr1BQo6SFbs144qYOGOP1uezeFuCfKGW7ffECM+LLhq2Jm324PAo//tCA2XdJ4yuSkseo1NLU/L+nyCJ6AGfm6lKKdXXQCRbGFOyVtMfLgY6a+oBclSuMpOTQc1s7Ie
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8806
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_115940_612584_A227DB07 
X-CRM114-Status: GOOD (  17.44  )
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

On Thu, Jul 09, 2026 at 03:17:44PM +0800, Jian-Ming Liao wrote:
> Add support for the AMD_PT I3C controller by introducing the following
> changes:
> - Add AMD_PT I3C controller platform device ID in core.c.
> - Register AMD_PT I3C controller PCI ID in mipi-i3c-hci-pci.c.
>
> Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/core.c             | 3 +++
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 9 +++++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index dccc974ef15a..15f9faed07c8 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -1198,6 +1198,9 @@ static const struct platform_device_id i3c_hci_driver_ids[] = {
>  			HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET |
>  			HCI_QUIRK_DMA_REQUIRES_HC_ABORT,
>  	},
> +	{	.name = "amd-pt-i3c-hci",
> +		.driver_data = HCI_QUIRK_RPM_ALLOWED,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 5a9e2a43eff8..d7549edd5839 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -193,6 +193,13 @@ static void intel_i3c_exit(struct mipi_i3c_hci_pci *hci)
>  	intel_ltr_hide(&hci->pci->dev);
>  }
>
> +static const struct mipi_i3c_hci_pci_info amd_pt_info = {
> +	.name = "amd-pt-i3c-hci",
> +	.id = {0},
> +	.instance_offset = {0},
> +	.instance_count = 1,
> +};
> +
>  static const struct mipi_i3c_hci_pci_info intel_mi_1_info = {
>  	.init = intel_i3c_init,
>  	.exit = intel_i3c_exit,
> @@ -475,6 +482,8 @@ static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
>  	/* Nova Lake-H */
>  	{ PCI_VDEVICE(INTEL, 0xd37c), .driver_data = (kernel_ulong_t)&intel_mi_1_info },
>  	{ PCI_VDEVICE(INTEL, 0xd36f), .driver_data = (kernel_ulong_t)&intel_mi_2_info },
> +	/* AMD_PT */
> +	{ PCI_VDEVICE(AMD, 0x444c), .driver_data = (kernel_ulong_t)&amd_pt_info},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
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
