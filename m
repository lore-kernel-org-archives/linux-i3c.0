Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF53CCFA13
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Nov 2025 17:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKYJomlUzOHu1H7beOmgFbkDiOhix2Pae3Wjkowp+Rk=; b=fNobPBugfQ7I94
	FYigi0PXTJFGNgStRJOJ1UTx5oPzxZRpLWQhMI2I/1l3vaSIoc6hs898Lb8zEJWbKuA/eY00/MH0D
	kLfRRvRyYbhVV1C5k6wwq8bCVUNSYiTgwBOmhQsVX5iTIJ7jdDdVsXXFVEqg3cMmbGR90gGbuYAzP
	3lwuak7ecaWls3i6uk5DQHWNRRPYSS1Z5GegOqAwLjE2LXn6wb0RERohEDyEd3blwb+OY2L+oC8QC
	Xc4pGpkCK9u+P+8cLpWb04HsrvDJ+15zwnDhwdW8A1nh0LTPyamXe2YcqRR57PG39dE7C9rFSBTpW
	bjqP+c9TIWGOAtOjSQKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3zB-0000000G2h5-0d7K;
	Thu, 06 Nov 2025 17:41:25 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3z8-0000000G2gi-1efJ
	for linux-i3c@lists.infradead.org;
	Thu, 06 Nov 2025 17:41:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVhC550HED8vX0GI/XQC2cVgXuC4SU9NE2FWFCXnYbyNcA6eLxIxi3wzwxmP7Zq4s1PbwYqCBgKTqNtjHYcyc9cQtexGhK9aSRwZvZU3SC3/HSR9YIYE+vbdVdWbrieeWBn1ypMnKBHw7h5jb4SZ+y0QkMRtr9lDQrLvBHKGNm6Jly1z6xJoneroySojLYXsuzLGwdae5UobI5vX4NkaGcVydRZJDTOrtVGX84WaWXgwLcVnro1bgm0Qp0KUHeTx72ExU47RnS8OSBFVxFjZCAhOMr1wEsLmIHu+kuc47RmzXjyBR0VzCMOd1SpiHOI4AcGsBIDOHiyPX/3GDBL6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkHFRD3CpSrGo3ZQJj0mzUIzH0MwjfzFQVYlx98S9Bw=;
 b=Gf78gTLQaomdMmXo/dFJDEqlf43FriWjBrYn+KyFPn2EfNs6yL0b3094llI6odg15/mKcEFRP+l81q/bSFPah78ZDM1a9MrUNBpkKay/zWUkUG1/uKzBqv/fwhE3JoeOO+k8cVwzPSIfPcTTZexBMREN4NNtCAn23p9zFScl1+pZA7dq2xtY3J0IXZ9YfLxHb0/RusVZVrMUJ+o0MEW4w6L/AETWqKzzcXjDo45mpaNGwn9uy6NYud1ug8a53L90I713B7clDlWd7Qu2Gvr3HhmRLrQ41YePTVJ9Zs2pxJ91hq8HHByhYJnT4SMLoXDVI++pfWwGPf0nTYiLghBntQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkHFRD3CpSrGo3ZQJj0mzUIzH0MwjfzFQVYlx98S9Bw=;
 b=mSO+CW71oonBwd3PHd6ZDFwZUrW+dAgxlBgVPmwMy1/N0rejFfukxa4xVWt+FM2YV754vX8ZLB8BmtPpuaTEM16+MKTgs+SitTIlTXZkFPkWmijXHxnV+lD3dkxQXv7DjO/O947wTLz1393F0ssHDwZQdIa1LNsXzC2u5RhnT1M6RWBAzzeMMRN5T/dcaiESsUMxu+9ql6ZrYeULSXdyfLP7poSZWRmQfszQThDoyp+5v03IbaXV4buQF0XQPPgxhTPlMCp3U/u94A1QDPOrOKB/yoyNivZjvP1tj6U8kXgqc/qmY5LqEiWIHYuMBBwpJ5fgWzEW0F+HoWNJ/M9vmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI1PR04MB7200.eurprd04.prod.outlook.com (2603:10a6:800:12d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Thu, 6 Nov
 2025 17:41:18 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 17:41:18 +0000
Date: Thu, 6 Nov 2025 12:41:12 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: mipi-i3c-hci-pci: Add support for Intel Nova Lake-S
 I3C
Message-ID: <aQzduJOW2PX21TCl@lizhi-Precision-Tower-5810>
References: <20251106171507.70147-1-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251106171507.70147-1-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P222CA0027.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::10) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI1PR04MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f1c1f0-6576-4161-77fe-08de1d5bb0f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BLHkC1QwCByNAUlzxjjDuug63NBJg7kmy29+JZAi1v69b4/WoDUAxe4Ko1x0?=
 =?us-ascii?Q?hAppII8/dZJirdaw8OpJfPE3aD6XXnUym4uTXn3k9ABgMkGkz78aq6iuxQQE?=
 =?us-ascii?Q?xG0XNyoIh5XxEMfJ6vvNDyg/+PUbl2mfbDfTB/rgnvekuvsAo39bzuUIBbkr?=
 =?us-ascii?Q?NdIlwxVgLgnQcZfXpiwXOp8nI6OdEy92s0aZsJgCvqtZkFb9XRD23eFdQZI2?=
 =?us-ascii?Q?aVd4KX/06G3YPi8UKQ2mE6bPbtDX1312Tka/NA9An5haulfIfpQn52TbC2Kf?=
 =?us-ascii?Q?qZJ2e6EGsc8ey72t03epL2zzzEKd1RqvW0Z9gMsZmn7dUbnuVwkGT3fvbe3A?=
 =?us-ascii?Q?/0LLJjcUOMDfOZOYTl6gTLZt9k6uI5GmnzM4NJ4wb6n+G+AngL4U9wJol6D+?=
 =?us-ascii?Q?Z7asvravzHD9Otp96TeF3dKkm7g8lY7iOzNf5LuRUdh78STJKYg7GKG62Rij?=
 =?us-ascii?Q?CGPQixV3qq85fAhU2d/3v8Ra4qBI8421dJtze7v2qlwj2HuAnngc+AXPoocy?=
 =?us-ascii?Q?OnkJ9hKtN8328JKFF29J8xGrsQf5BYqYrZzrnUhOgJWgEh0gk6FW24h7T/iP?=
 =?us-ascii?Q?04004+xtSQOK0oZTfMBhxCI8Xwr4jMnSiBIpiwlF6xSRZ9zIRSeKO6posYz8?=
 =?us-ascii?Q?wOYvqRXUB0+chKX0xry7f6DEh3ndScs6LxE4aaQ6H1L93+0+H3HTz7uLwq6D?=
 =?us-ascii?Q?XGEPBDCG/LM7os9rog//8EjMaF/wZa1N9q3LL+jxogcub4Bj/TdkQeM/no5Y?=
 =?us-ascii?Q?uMyoijwtewn4Y1WryDsv40gGz2VwaP6PlCBvRZzU7zPgJA4fHJ+q0Lty2U4K?=
 =?us-ascii?Q?8m/KIME/M2HPrssB47i3a2bAxyNIH9S/gYE4FTVVkq66bFi/9kepZt60B1uF?=
 =?us-ascii?Q?6e/VWGL2E9R9JWFQh01OfxGwOE4I1ENtpbcy9CutEy15xJhfbqfP5+Yin9wf?=
 =?us-ascii?Q?Xn1yoSmgl3o3jlTWUt7KCKRmK3wscZ67ZffoKLBSwRCNbivZF73AYtiXlwFj?=
 =?us-ascii?Q?fqEWocazYBvgb3W1Vcd9eGbdi9RLNKY8Za5YWuqNZNcJUOTdPBRoaSKNVK98?=
 =?us-ascii?Q?znvKOOz1QFq7a0p2TNCkof2xKceLg2PDvgnHJL6a1tZM4r9UDZfxxEhkvI5I?=
 =?us-ascii?Q?vWv9FkB63QDyPnw2+ik0AgrW101ZGmiC8wtp7smS6Tmt1gtjJOYJ7itd3ZR0?=
 =?us-ascii?Q?aAc+NYnpxAdafpe8YUoiS0h0n5vExpQc3tte999syyFI1d6+0pZOVPnwHtW7?=
 =?us-ascii?Q?6dE5qmNn2mJlrZLzxaELM5UFbx483sPMxBSS/KY0oXmeb1zvprMVZOCMKbxK?=
 =?us-ascii?Q?UXNLya+LJIkij+BF2VN8cvg506Qeu3Bmy8A0HuGNU3zdqTOoGYjW1HCxU1Xa?=
 =?us-ascii?Q?vosqP3yccGAA5uk0QfJO7hZcG6cOiFIuC9/im/14TqsTicNyWTMqq4nwLhG5?=
 =?us-ascii?Q?eG0ise+nsL0PSh0XiuKQlHDwYopZkOcewXx1JaWVduhdF1iMTOpWGs0Txca2?=
 =?us-ascii?Q?4RdRR12j3ALy2mQ5MSERKf3wKF7kILctwKJT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?16etotd9yohS4rxI8HG6FlJVw0kapysMc+8kRCL1ZUtiClpuZV4AueuCuQp1?=
 =?us-ascii?Q?N9gMp+iLYF5fNbAPRzgn1FEM86u+d4Tu25hIMloWvDRp3/bHXDu3gKgLXSgQ?=
 =?us-ascii?Q?Z56Ln9jGwbv9BtbN3+N5FJhWs6fk8g73tr0T57u6OWjcLntnX/oJI8i8ImaM?=
 =?us-ascii?Q?Ukx7a7XXqgNjR2l1zrBsKi2ixj7MYvpXmRgJgaTvYfe2m8W6lAXPlsUvJC9V?=
 =?us-ascii?Q?x39AKyJFnjBkbARmK8j3T83q5YLunOlBC5qGhd9uuk/jb+7ODc9SLMPMXHty?=
 =?us-ascii?Q?TXi0+BKdetrXUGZQAhliRe5eMfmYBwNWv5S2MlHTs5DUuvePGMcXyDPX9VKa?=
 =?us-ascii?Q?Z11nCFlzjth+IV6i8CLuxVQodBdBxAf5IQjJj0AzHCItvB/MAo9DcywSz2SD?=
 =?us-ascii?Q?GXIUrW3LF22V8aCFpXjdsa4ZpfZV3is9kcnCqgEyN5/z+1wTnnkeIydt02SQ?=
 =?us-ascii?Q?ikfrumqEJJg4FA5LNTfnxiiXzaQi7n99ziyIQKSOGhr/AevfmFT4YiHvVh8J?=
 =?us-ascii?Q?D7/dp6EbhUAZQFA1egR0aWdhqfX3Ea2g35ILfjfIPok8vQmtkwrtxYXmDFs6?=
 =?us-ascii?Q?JPiHsouE0fQnr7slAO2PGVpzuWq57ePxy+baPnl6t8KhCswih3dq6FY7yQad?=
 =?us-ascii?Q?xsc5T7hCOOvdULVnhKNdmqzbwEke4GqeKKeKT2M/+gvfPa8WL6S7lRo+wXbO?=
 =?us-ascii?Q?HmjcW7OnU64RH7z/w3Ewph+R8bX6v6HqbHNnqCuyNOPdnJY7liw8PM0jVgqi?=
 =?us-ascii?Q?A+IraHuWriKXsJgUmjHM0wrUO9cvROHXzpL0goEZyOr2o9Y38SjwhlyhxHVC?=
 =?us-ascii?Q?uJ2VQ3g7cf+YnxxqKI0iQ4EnfNP4LEtkhu+qmyIeUdVVC27pLMQk7ETEjNBx?=
 =?us-ascii?Q?ySpWTE242pjGP2C132zGAdeiT3u7SlnpSnvz5napa59mBw8+Tt4iIg1btfIK?=
 =?us-ascii?Q?w1UzYgnTmmd/bUuyUHErEKu/l9zIfaJNdqca9KY3LNVUE/3xXlEqHhmqszqb?=
 =?us-ascii?Q?1jBFauWtaT1PCKzL1zpaoxtsjPSiTSWF2nrFKzfkkyFFGPHWvisOIm+mLO3j?=
 =?us-ascii?Q?ErDVUyF42UdVG1uuVdAOs9EO5sbQxJjQZcCZvaPNaq84qc6Hpb+rlNMnGqEB?=
 =?us-ascii?Q?Cu5kWz2QB7f+DcCd4K5rsr2CsqWyDjAOStGyasGFemtvcLFcRX9PPN7MAqAP?=
 =?us-ascii?Q?Q5yrvXITUwdaLm/Zx8F91sDSCSM2GvfTTZClKKxpEUejnkHQPmSYCh1j6XGx?=
 =?us-ascii?Q?0myt5WKPdY9dBPoye914GoIcpunRoCWQ5aYwbJLZmj6eqkFz3m6KqwrNQRF2?=
 =?us-ascii?Q?WfT+ITout3r8CVWvr5MgY3tcPup5UtTaH7KEOXudck78xwG8ndryaMjmdE6O?=
 =?us-ascii?Q?fBD3jJDkmyvrSaF4vDPzf805wAN5KLZsJfhMmf7qvxPSbR/9Zsf6c48c5mSf?=
 =?us-ascii?Q?DqeVdrtyQc31Mj+Dgn5VqyY3pmwA8ef5beR7roDTxXuxjZs1VpzDopF/qQIX?=
 =?us-ascii?Q?BbxFj315l5sahO0Nb/6+fKrqxc1kpRx0/Te39e7VD3YsVqgJeNOrexkCm53O?=
 =?us-ascii?Q?LytB7+1bAOogb2ONZK7qZIp1VGP6TNXDL2cuEwL0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f1c1f0-6576-4161-77fe-08de1d5bb0f6
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 17:41:18.2606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yEm/kB90fgZai5CTynoOtB68AeBrOeMNMgWYkQ/Vao4+147+OgyH2g1dCGxjyTipeYihkyigmNkBpsTNmdIdDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_094122_438995_5D832C47 
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

On Thu, Nov 06, 2025 at 07:15:07PM +0200, Adrian Hunter wrote:
> From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>
> Add I3C controller PCI IDs on Intel Nova Lake-S.

nit:  s/on/for ?

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 08e6cbdf89ce..dd4484eff2f0 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -133,6 +133,9 @@ static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
>  	/* Panther Lake-P */
>  	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_info},
>  	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_info},
> +	/* Nova Lake-S */
> +	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_info},
> +	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_info},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
> --
> 2.48.1
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
