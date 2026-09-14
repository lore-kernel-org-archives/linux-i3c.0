Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EB3C88E72
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 16:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRcD4GmkTZhLu6/2MnXTVdkghi+sMrGkeUB+2OG07Mc=; b=vdqTnz25kPi7Zk
	vrW9jWu/P1VzB+U0ywHwPiO3heAYti51nlabMZ4c3krbmVKtauNi29hsJ7jWuA2eb6tdBRz7p4Dz2
	1lgAlTIrCp4+YGEtm76v/g9d+jQJyDD79WdMQLU9kGM7pk68EyByf5FnEXugCHnXdd24vgG4jAlkA
	eZvwqiPQJ8Pqw/TGR0XRAt4lFrfVl6Lx36yuMDERmISUogbMJeol6LbtlgsjAJXTvUsN1PTMpZ266
	XcvuaeCSEErIgl0dErPEXUiWN/7LwQqzTxIpz8xstm66YfKolBU9L0NCamV7nRmSjW/8Y1nBIBaHr
	uUlEIfMIErcSSdN908Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69MD-00000004GkA-28p9;
	Mon, 14 Sep 2026 16:16:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69MB-00000004Gjg-3wFw
	for linux-i3c@bombadil.infradead.org;
	Mon, 14 Sep 2026 16:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=d+PpN7taF0Rmv8XnPCQ/3qhLVyEUWBq5e/SKkNzfKI4=; b=MbXrfInrV2rzq62OTfuTAe/PT1
	eBduqws8FAK8jedgO52K8Jk2nK6PNUyAOOfk9MBbOuVTu6X4ECEmUu5kZfVYWiSYhMer8+rnJZVHZ
	lxWaRFebUPqJLPJQDmEJCNoJM4VkGl9HRnVVxVslCMXzj302zzTiPizQ1QTmswTEoxXZV++HY9S0i
	+R1NAaKGiofkmrvVl8RZzwo4Nl5s0cZLTTAWCQTNM8NY90WaPd2lQtyDGM/gd4ESdNuKYkgjSorPS
	Q4UlbT82epyCBqFCOIrM4YoQRJRK0KlWKFvKSUjAeAuzf7a94qWsrv98N+Das9B2cbe9A0QPIDWtb
	Q7MbrHLw==;
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x69M8-00000005pSE-49DW
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 16:16:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gy4aQiFAe2596obOaIlyIbVu4PlPndqAe3cYMmUvOjoJfVzlvI3kxTkGy29UbWTLhFGdd8q+Tzdseu0PjE9S8+NnsbYARrHUoCS7natudlrH2gi7+MIIeaVoJuPp1a4BKylI+Bj8ZNqXBu0EKaiLK7CBzzmHzFr0pzjtL33O/a+N42LciAYivFvooex/OWMgxWMvPcrQcfFZG6m9cLeqTVmWU1KO1kMJFV/fi0ejeeQQnOaa+2ht2aRoc1zZlzJbI32W76L7iiE5ZpICUq6dX5/c/3PRAEK2dcb8q45LklsDQHjxgFEMyOJde2O7+JvqdC9lA2BymfqyyXLnu4bP7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+PpN7taF0Rmv8XnPCQ/3qhLVyEUWBq5e/SKkNzfKI4=;
 b=Bsv8n8a/zjSfQEO2cjdBDGTdRBMzyTvhs6nppn4rAKcFtcWBF2FIlNyN8O5ToojjjiEjF8cgsNHv44V+AgaEeU5CXiGdEixZ3PKpSYMEvVRj68HcQ9kP3PVr+URlWUXDP9kFY5KJjNiK22VAgTGnczpPZ0JW76QgW2vRLgHO/tVxhbwMRX6GETr3CifyBncbqbKlvqZsFKb3loIQz3PpuJu/AgSSBIwlvpynhNbJSccueCQDW6MHYfo0QxsQHmsLrnd/sblEltRX1I36swWO8hoMUfyCVNIDF5l7L5G0ypjDw22MxV6A1eWw9xWXQnlQeoICzzLb6FYpX+d/tZFrjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+PpN7taF0Rmv8XnPCQ/3qhLVyEUWBq5e/SKkNzfKI4=;
 b=WUqsR/Q/9l8V0QvlNTZJXmtktJliOWA1Bc9KsqjSsrzJalBmNd5i3H9UsHzvqOM3+uhIdnvX3D1+jQiEuDnZONefkx/UNq3gIDSL9ZT5lU/MMUirTZJgNh3BId/orl92ZZC/1Wct6HnEduyJ2P+Lh9Ld6kSCizQWAjMnbg5jvtImhhx3p9LHaUKsbPt0lGF6pT4C+rbxKRcxy61zw8+MCO91K0k+YvssX1BH+IGkfnYLXm7F53lxw+wjU1OVRRwNGcn68xFP1sVA0TIu541Bbp6aivspDziJz0onvPa0QoXNaZnwJ0S1L4l2VUjqY7kNWHvS9jqsqpbRZlsHOumcfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10570.eurprd04.prod.outlook.com (2603:10a6:800:27f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:16:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:16:27 +0000
Date: Mon, 14 Sep 2026 12:16:20 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/17] i3c: mipi-i3c-hci: Bounce short reads irrespective
 of the IOMMU
Message-ID: <aqgd1H8B54JedV8u@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-3-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-3-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P220CA0031.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10570:EE_
X-MS-Office365-Filtering-Correlation-Id: b15dacea-5528-4f9c-c006-08df127b878d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|19092799006|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8BnJSlp5FwEPtprjVz40ImAR0uYwLej7pqAoyXob2nCvhF2b36Kaiwyw+sv/aCFsTk/EnBtIYohUNpkx3c80HPFVMPD1jARnNaNv3beY8O3epTDbAx8Wi5CYVAPtJULsVzPTIGT4ZaZXdIg0aeKC6zRrY3KBtfJ7nAh/PXim9NYyb65ikEj/EgZ54EA31b0xftCat97ELFJEf5x2SY0S38LcAqN+/NwBKXni8IhbSTIleA7BN5jOIva0HVsg3doD9fqEzjpJPWEIrIHIdoxee+1Splz2IN+q20FMrBLiFUufXE78fos2IXC+zB2Jf6zKQCqnqLJiq3WPOgjMCFJmUQTo/2uIukDI0t/KyTuaTNvrm+nujqqxSIwKo4CA6SztnUe8y9gzoq1977RYEO7iaVBY5zkQvGYi4XFHs+tFp+qtc5pR0WLzslJfsvP8/kPFdMcJlThPEnHLqgHZM3ntkPq14/kVR5lFyZCtQ0GQM3FtCyh5RseZjUGiGC4Sdd40EUFzfwxz2VrMlgSwMxuNwjJCVXCAy5MjqOZsy0GxNF1rA/krSsS3cYmDvxB1MzHB20W8cEp+U2P1fkTr3lgGlzs9M0u6rLcqlXOevqo3LTWHr0GmnDmxVz0D2ZR038PafcW8VtXOchmeaPdJ7Sp3oOmdBmWGfPt79WirV1l/s0g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(19092799006)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ooxYDrHMgjVqEmLfUCFDLjZKVaUmQqptkVX1WaHDCPeBTKk3lKqAfbRuu1fi?=
 =?us-ascii?Q?KYiQyL3RkrWk9873wniA33U8C6EGNfattOhYEHmL0MQnd1EbmIkm6n/GGHrr?=
 =?us-ascii?Q?nAVr6RCgvgq7LG/PmJQe3ydLJu8P7QneXIy8pvEtljrHjZFUphvha2KeoAhf?=
 =?us-ascii?Q?WqOh6ggp9sSe8et3LqjmmRVqVNrJpnEhqu1xrendrZOOa6baQV8O1XTYQjoL?=
 =?us-ascii?Q?g9hMB5bPEMGumg8VUfe4RmUAO1yJAEuRrI+ZrgISNCtmBbc0khOE9oLp6vfv?=
 =?us-ascii?Q?gVJWELgxDOdmjjZsEYUZ0O19kKTYoUyy59asLU4eICMF9t6ak79hal3eVwjj?=
 =?us-ascii?Q?qIwWZm4iZbV4rkyFk+EPuxUnLyU9WDPD/gSCFW3sQbLZB7mdRvV1orpA+liH?=
 =?us-ascii?Q?XQqw6VE8embt+BPeNmpL9SEjU3Ky77R5PcMr0631YaOvzPQt2fgAdoU/IGWQ?=
 =?us-ascii?Q?LRHh/sOA8KOeze3QAQN+ufslcInYY8YwhNJzfHnHmG5SdgFLeSy1RK56kOLt?=
 =?us-ascii?Q?FaMjlZQcWTflsqk41a/rWRtO5JbQVtAcvR6yoi6bGp2b90AMJcORiwNAkiif?=
 =?us-ascii?Q?EQw9o2j0b5vGjMsaDiB4KTkjCascylwg3s/J0j4zj3T+njpRZxuyB2XkiUvX?=
 =?us-ascii?Q?xsbTFSgN7XKFOSc+axkT7OBCD03+zaiVmgdGMVc5yPhyYJ2hKSJaaaM+Qw8v?=
 =?us-ascii?Q?9JjuvT7b8+TI6hZ+w8p5uc15mW25Qn74PNRiYTYeClVPMsfnRHElrNVuNo3L?=
 =?us-ascii?Q?o2DovGB5ASwMMvKcSjXXo0blwft13QBSFz00gMXO1nQcWCahk050oqAVbVDE?=
 =?us-ascii?Q?00twe+y4LOwUrn331ZegXj2QIMhV3T0ipzchpP09rCQyovECZsO1rRntMkO3?=
 =?us-ascii?Q?AR3xtDwWyJcQb7LWSDIAt7Ir2Ws/VuqA/yedkbalCa3kunYPLlpLEspgWkmq?=
 =?us-ascii?Q?1xaTMHTVtGgDmkCTKaTlTQ8WpisDPo5JOND/dgxuJmMZ0JjeKMVoPEq0SFEb?=
 =?us-ascii?Q?SWH9kSzMmS5OjMQBu6JAu7JfTxNrmb0MOar6K4WbkQ5EU62lWGLRW8U4PF/Q?=
 =?us-ascii?Q?aqGdsjiFHTrQA1iAq6RACbW/oiyGsO5Tc9jQAUwZb/Dx4DmxKdhy/YQHBg4s?=
 =?us-ascii?Q?nBPxn5lZKs0ItK8C2x0T1CHmCFaHwHSLqJnGjwsgr14H9hlpjkG5krWlkVI7?=
 =?us-ascii?Q?PhRNXpmoX1WCvhFqaRzMeAModapkNKwMdFLc7ubxKobWDpAaoGlRip6rbgII?=
 =?us-ascii?Q?oV3IOoW/BF75jCELCyBVo/ji2rYMi7VpEUEqEThrEHrujFX9ORBzlv3ncTOK?=
 =?us-ascii?Q?/UmH20BHxpqAET+oYK+W9GZhhFNo6hcshM91/e0rmeTWE63bReZ0ca/Bn2C0?=
 =?us-ascii?Q?GhxQj5Ah9fgnWbRwOcdDqHau9QpB4nN4UBfxG2K/UZrBpUEISrGoH70OcPXk?=
 =?us-ascii?Q?kW3gdZsiWWI6fEZopGRTFuXQJ4EPI3fCWXCZP22qc1bdSDg16p6tKHoEnQgL?=
 =?us-ascii?Q?rnpehUXO/JrUh1QmXg5lQpLvrsLMw/FKoOg2SLug4ehJ6R0Kgnk1VIwg1ni6?=
 =?us-ascii?Q?ioszNoLqKP9i2Kbom71f72zYrtSKmYxN1Uh/I3ahTWzPvN/Z0yot5mg+9dJU?=
 =?us-ascii?Q?KmFmtPLM/RnSd/yqT/8hlq8aGUYN1UUD8iZswzdHqwyZMkCYxbv8Z4vpll/g?=
 =?us-ascii?Q?7S2c2e8GJ81lzf0qmdCIR3jGmUWcmEeFu1Z2oWvMoR5SF5lFQ1HWLZwAI5zu?=
 =?us-ascii?Q?3ZaIx0CVw+9F5ODGl3oGM/+sbIBZ+OzG1f9kSauZmfLWE2hHYvfx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15dacea-5528-4f9c-c006-08df127b878d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:16:27.6277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mldbwprsgUVnEfw8GG5DYiMRvpDEJT9liJp1wcElRWRBOtcRRRwOD+BExXOPldUY3WY0D+2Xq3SJlLnK1DxMp/uSLUcAi0d0v/3RCp5jC6k2lMCUdlfutpF48ykVd4Tn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10570
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_171633_197386_6AFDC995 
X-CRM114-Status: GOOD (  20.15  )
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

On Mon, Sep 14, 2026 at 02:29:48PM +0300, Adrian Hunter wrote:
> The controller writes whole DWORDs, so a read whose length is not a
                                         an i3c read

> multiple of 4 overwrites up to 3 bytes past the end of the destination
> buffer. That is a property of the controller, not of the IOMMU, but the
> bounce buffer that works around it was used only when the device was
> IOMMU mapped. Everywhere else the buffer is left unprotected.
>
> Drop the device_iommu_mapped() condition.
>
> The overrun is easily seen with CONFIG_SLUB_DEBUG=y and kernel command
> line options intel_iommu=off slub_debug=FZPU, which reports it as a
> kmalloc redzone overwrite.

Can you put a line kernel msg here ?


Frank
>
> Fixes: 9e23897bca62 ("i3c: mipi-i3c-hci: Use physical device pointer with DMA API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 7c2b20474130..5b195978f376 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -428,7 +428,7 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
>  static struct i3c_dma *hci_dma_map_xfer(struct device *dev, struct hci_xfer *xfer)
>  {
>  	enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> -	bool need_bounce = device_iommu_mapped(dev) && xfer->rnw && (xfer->data_len & 3);
> +	bool need_bounce = xfer->rnw && (xfer->data_len & 3);
>
>  	return i3c_master_dma_map_single(dev, xfer->data, xfer->data_len, need_bounce, dir);
>  }
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
