Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58F4FCA17B
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Mar 2026 19:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKE6zB3+UDEq6fuSy2QwMu52swTznrpSgtSzSh6+1gw=; b=DQeYmnYPJExBsb
	GlwpuV/cQ9FG44FwnFTAWUkbHBM8dQEEJn7Mm4HDcOAfURtGCpVd9BaFoh8FN9P8xkoqELbxPl1WO
	Z4S/DfHXYE7jXMX8rBYeSN3sncky/FwpTX8gZ/9VzgOc//CfpiIiOC2p7ldd76z17uDwjzNBocBPx
	owf/jxObabVFcPezc94eSk+ZpBYkmW3Jlp9xkKclgGYRYhfojO+L3l9e/BrQgiV4iZv3pyv3uwoFS
	h7leqLxKyX98YkgEpUMeOGLtIa/PtMGFnzPnDVUM9am1dtKIQnQb+EwPeBx+uLnINTl/AOIcnmUQB
	ETVGpUBN3cDFASUoiVpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgVS-000000084fM-1lx0;
	Mon, 09 Mar 2026 19:43:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgVQ-000000084fE-2ob5
	for linux-i3c@bombadil.infradead.org;
	Mon, 09 Mar 2026 19:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jlr5Q3csvSToDaHN/r1WDt8vvdSlv1Oh3zUDl2pZKUo=; b=JPOcbarV9bZa2RKII66O/jdKDe
	x+ZtVsHzQVbFIq5ZjY5ATiP4h/M5FClapqG9EBFyOPSIFk3KcZolUcNONS35TWC0T1rGT5wSDYccm
	pZnEWCn40/+h773lQABHJbjHm08cdvXWv5dHHTPEu56e01kjJGnUbMiPoldK5UtpTG+ZkZYO/cMWv
	LeVYTIqEq7eyPReMlBzVz6CKm5Oi87JTdtwPaVOdAY4cVHPpm7hbn/ZOCtw6uoJkAESa95it1zRCk
	9Jpxr8HCzehcwcbwXek/xdujOxPs3FcIJuz6bOeyJSFzax+fN4WJzy/6qhjQtRrf0tgBwCXestYPp
	+TwgEKlA==;
Received: from mail-westeuropeazon11011024.outbound.protection.outlook.com ([52.101.70.24] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgVN-0000000D6Yj-16yl
	for linux-i3c@lists.infradead.org;
	Mon, 09 Mar 2026 19:43:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVcNOTvbePM3qjHynVMZbZhfwRR45cRs1Q9+Ia8qfkEjFQMNOUs5P05qBYWjJMra7qomhBfV7wALFexg3DhHwdAP80ZJs0nmMMBvfVcOpUmQHXQUaIemLSJZK9myMmt0k1Lx5xBF+zhtoHiBGtaS6BasnHeOXs46a0JFJVkPTolU1YI8Cs1cSJJ/wIdUX4cDlKDV6eIUgbW6sGLK6nxXx/N+Os6emP5PAbh+VuTMG8rSPmbkXS3HUY0wukZIfYl2rS/ErA4PdfY/Sl5imNEa8Uw0OiGuZFcaIIPmXga4h3c1TayUCppzhDtnK5LB8BoRbSveEC7hhXjCL241vA+NUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlr5Q3csvSToDaHN/r1WDt8vvdSlv1Oh3zUDl2pZKUo=;
 b=EHH7AxwTPE4Ni4BwToutYlTRSbRwqBRJAv77/foPzzs9maDTXrrSnn7hDpgNFhJtZv2Aa3PMbL4xNlkhbwAavBB85wGqzz8nonooL1bCih47WuuSWeJtaorl0NXA1UruHz0RVymbTWeqU8+bxqwY+Xos2HSGzyrEWMbRNeFy+JEA7mTtnn0W08ygyr/cp2ilZomJfT8IUy4pswMmLmi7UluYcPD+u5R7eP+9Mw/QRmsaO6RsSabtEvC5OcSFYVnjFs8TRqZjYUFz1sLy2o1Zj8IPeWuPY6C5j6dFKmu9QBqzSllxQAWyqzoaMSbaOJHvrSQfZN6wcgkFm7wtPM2Vag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlr5Q3csvSToDaHN/r1WDt8vvdSlv1Oh3zUDl2pZKUo=;
 b=c+/PM32oAhBGTLs8m2S2Q52RuRCrx4IcqzmyzF/XhFLaZSPQCPIyN89ck1h6K1gnmcUu4Y48h8iFbxd0arcGxOpcI9o7ADgaFPmGW5FqtyOmL0s6EZaoDECKY7RwhZSm0t4UHoCQX3HE0nVdKXNz/TlHYt81oEhvL67MMtJyclHi+6prcmySbJrZrcwYLQMfuka7zxvk8iv5GgV8duVrKatHcgJQ/aqXQgK8IlBmwsYvYk++317NEowZGnMNwr4ss3y18FjK6Zrg+QrzzOp1CtAg6G1ZAy6A98vAzPbvmdJEHcXgLFZO/LA1t/cYPip6Ke7SoyOqKj2KojnLU6/dbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV2PR04MB12138.eurprd04.prod.outlook.com (2603:10a6:150:327::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 19:42:59 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 19:42:55 +0000
Date: Mon, 9 Mar 2026 15:42:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: mipi-i3c-hci-pci: Add support for Intel Nova Lake-H
 I3C
Message-ID: <aa8ivTo5RRtMsySP@lizhi-Precision-Tower-5810>
References: <20260309075045.52344-1-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260309075045.52344-1-adrian.hunter@intel.com>
X-ClientProxiedBy: SN1PR12CA0103.namprd12.prod.outlook.com
 (2603:10b6:802:21::38) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV2PR04MB12138:EE_
X-MS-Office365-Filtering-Correlation-Id: e6e62c3e-0720-47f7-2320-08de7e140eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: TURtaxsOJIImDCSzzi1xBq9zsfYa/6a2scpKAQztbI1Gh8qrGhSRos3Y1DJf3K6K4wFrp3ftRVsc8jlJHN1Kvr9OlP8dk3uTEhDmqPn2tQWev5k8XV0IbsS2Vc++TZZczeU4ECmwbHteMcgZzJaOvyntQSJFhIpuwzK6OSuM5ZjYfjxvSQGY6fy2o7KfbWQiWBKsMSiVJqiX/rAraYxOv0OUQpZZCshuPO0Ky+xvX9fxR6c3SXW0nEgmF0TQnEbGFMxnteBlyoXP5UangTx16XSSOwJmo2qUY2BE0gwQ+o+NiG3dHsIjRJOnwXzMpDcZ39EsgacMV+kbmn6cgrwDlfng6I5W99DZT/Swr4MVXACp75w3ZsVS4dytudHz4WnGVlvOg15BUBTdQX+B665lfIBuyWD0BWDSHjBSoxgxUHYN64q1YtFbLK298N94/9X6heYExOTpFd3t2QkBiXZBB9QfzRyqVIUw9Nm4y/u2h1Fjh48kLmhBaGB+Bji5r5SwYoD3vhouc5MdOtj4egtQkyuKjL0MkPwSInnJDrQuETSW0R475ru5j2ePLUuGAX0jg5Xt6GRK+6XeInxtkz/7I4uEAVinZ0OiiD/u3drLcomjY2BFCPEm0BYzr3FUDC+8Uj3GqrmsXRvRdXUcgaolst9qYj3EgAFAGc234CVSiS4UJZqVafMkKcLWcFWp9du5VL9XMYZDJrX8FdO6CIJJ8/oDnjevJ0m4XUWK4a6/WsIGkMrdxBW3Pd+FxIT+9fA3pVN+LL9Og8I97Pkqqq7jx0kY5KOweKCdNxQAmgqLzqE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PmdSj2GX1lbuKjYPgGpqWwb9lm8Di/2YStlJUbfjfOAuvKuGq0Au9qsJPBh6?=
 =?us-ascii?Q?gsi5ke5EEzILOuz+j6Pr2zfrTOVBq1qr9ipH72wvOfgOe+wGc1rYoUCoWh65?=
 =?us-ascii?Q?TndZDVt2FDfUShWWtTuq8OWT+CQ+wvM2t3DWY6G/xP/Rn0mK05jVgc5CCodu?=
 =?us-ascii?Q?3bMLG2e56kGSaawYY6/t7qIrmvbhPRstPkFtjO49pELq41536Cv6dT1IVrzD?=
 =?us-ascii?Q?Qm1ajGzFUi7H7IEModQmZFyROKo5Vp4jf3ksqn64V6aoDimcXDbu2/ik974z?=
 =?us-ascii?Q?4blIRpeBBLx+FHILIhizHnV5sV0YUn+oSrBiYtIiuSjk8+F+FSCfaFGQSvk2?=
 =?us-ascii?Q?QUmBAMhEIvhb6bnA63pHAYYrcsZY9zMU/kLcXAaBvrVAcOD2YpwLqqeP1dKb?=
 =?us-ascii?Q?jkZhWBBQmEjyRmfn9haJOWgbuntL+uGbDeTFe/YAKSMEjR/igLRJFQkVOPAK?=
 =?us-ascii?Q?h3Tdl1H1p+fhgFch+SsuyjJZTeY0X5hpgSBdIeF7EkT0L8TKt4jhuqhF7X7c?=
 =?us-ascii?Q?vOVzl0EeCRPhvBsas/JkctBNuALMvxP4n4yYgrHBb6lJtjPmvUXWOJORh/B9?=
 =?us-ascii?Q?hPLuCZgNuu5k+IRpJ4Cqy77gzeeXlziB7Y9JKcv3Y3gjGXvsl+B0dkMWppzs?=
 =?us-ascii?Q?wFVJD4YHQKfdKV1gqdZgO2QOmKMAFayyO6YoazB0LEo+UtLVFK6pD1PahgJS?=
 =?us-ascii?Q?T8z4EMlEAVdK2HTul5gI90pTC2FtgmdPKgtIp9f1jpLqU8P6W5PVk0j4LJJg?=
 =?us-ascii?Q?i3539kARkzpOCxq/asr58kI5kZCI2nPbJpE6eoKM7pEavjqUuD7SRTPGwhyC?=
 =?us-ascii?Q?s+iMfx+mPvDB3ZRBf4Ntzlk39HJwTOcbTHugI/DnXxY6P++dWRCkE+f9Qkvi?=
 =?us-ascii?Q?amcrHGzrmhS6f4oET1gOFr0IHtcyU1q2XU0oQpjR04x1PW35CEWiu1kAFOxQ?=
 =?us-ascii?Q?COS4b+tz5SoJvJgv6ukjMMsq/G/c+apXs/oBYIY38r0uKcM3GRZ8ippkxfWC?=
 =?us-ascii?Q?yQP3nCNva+GxFbqBJk2msCnfFhnYGZ/K+KzAuFw1jk9kn95oVkneFdbw5moI?=
 =?us-ascii?Q?jFgaxBosPLNIOpciwkbAoCyRUXBbG5NsT1k1JLcAIAkFI24Qfaq7D+XJton7?=
 =?us-ascii?Q?rfyIgdgYar+9kgBUwhky8XZJd/eVA/9vn4BiZIafGhVf58ZirsdWa1asw5VI?=
 =?us-ascii?Q?83AZMeyARsPfTe8hDUNM0OPH7xdgF332tXGzKaKT9klHft+8azkGqxGiMvC2?=
 =?us-ascii?Q?qbkFve+eLdv917tWFFPvUYAOARjf0IDX/R71TnD0NqNQJvS5OdyZHSx0jKBo?=
 =?us-ascii?Q?UtiXGa+XVd9I92T2/c8vj4HW9/v78DmBAQ1ad2FbJUoJsPifNPyMlWZ2NpKO?=
 =?us-ascii?Q?Woaz0HUGPs/UY+/Y0Z5WCpnKODor8xnmJJ19k48fghompD+2YtgyDTqfGid0?=
 =?us-ascii?Q?TjqM4WrPUdiXxvMGCInJNeceAdKqjDpXO8Mo5/RpAPZwsoaLRFtFsWODPZ0t?=
 =?us-ascii?Q?Nd7PdzoJCsFJ/qMkRhrj296tLC77zW0itdpOU7/uMHx6+8Zz81SqJlHt48Ss?=
 =?us-ascii?Q?CCRq/oA6TjBAwkSm9PUMDzGFB1WkwcY2eJI7HKgTO2Bb1pcGEBIwZa2n9Vhl?=
 =?us-ascii?Q?Elz6+S+v++DwIBAtTRs9ZxLwqTWzwIFb6HTI02C+RhbARV9eRppczMyGR5dx?=
 =?us-ascii?Q?V7o42sT30s6YyOHKSTUKL+OkAtXVaBnVRCJHumaudwQLVEJLSfIiSSBX0+I/?=
 =?us-ascii?Q?X+WxkvkZOQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e62c3e-0720-47f7-2320-08de7e140eec
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 19:42:54.9787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+8mS2PugpY+WLjk7nbzGqv/+FWoZmiWbF0+Hv4gBYITyRNTix+orrOjw/BGjijIk42wacMFhS/s60V3bH6PtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_194305_426174_72292B26 
X-CRM114-Status: GOOD (  14.90  )
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

On Mon, Mar 09, 2026 at 09:50:45AM +0200, Adrian Hunter wrote:
> Add I3C controller PCI IDs for Intel Nova Lake-H.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index d6bbc3f8cd2a..9468786fb853 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -472,6 +472,9 @@ static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
>  	/* Nova Lake-S */
>  	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_mi_1_info},
>  	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_mi_2_info},
> +	/* Nova Lake-H */
> +	{ PCI_VDEVICE(INTEL, 0xd37c), (kernel_ulong_t)&intel_mi_1_info},
> +	{ PCI_VDEVICE(INTEL, 0xd36f), (kernel_ulong_t)&intel_mi_2_info},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
> --
> 2.51.0
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
