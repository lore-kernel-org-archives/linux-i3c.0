Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD14C3DA4A
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Aug 2024 14:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZnFL0PKVaxqnZfD8yN50EEit5xQlkDAa66fyBiINzM=; b=Er/BS/9WSFaUyA
	C6vnkvN74ipk9XARUNER/YeGaT9duQjGAiamt0NBoEaGeIfKdB6SZA0Km5ulfDLCrQn/o8Zbd9iYM
	1bZTCE80n89jzSMT61XL7cjMsJAKRaYovIZ0BCK1EAbCni6c3BU0Y5QMzx6+iCLzbjTf3NYJMKZBN
	PnzCr1vpw/ednwmqXyrfq8+RTneGbiBeeOASG/RWj5d2Zr2wJHJsA9xhr++Ki6qLiyem+JFpkGGR4
	NT0EAyGJVeaYl0KsINwrlrtpR7PV4qviVGtQNqaYMOZsoDyE14QH6BMfzZ4ceTp11MfFKsAX5DXXx
	UcUvbvBhxA1mfulmNOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQDZ-00000005eL1-496U;
	Tue, 20 Aug 2024 14:52:17 +0000
Received: from mail-westeuropeazon11011037.outbound.protection.outlook.com ([52.101.70.37] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQAp-00000005dsk-1gMW
	for linux-i3c@lists.infradead.org;
	Tue, 20 Aug 2024 14:50:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yp+lQ33gfZqwnknHR7L9k/Hi82nGjlcxeBuGm5G6EM9QEC5yRjG6HW5Qjv4s7AmLHsVyZeiyl3Yau7L+xR4a2l5vd+ZSiIfVrDLLHhzHJAbxiOsb/R4n/+MeZx4yIXe+tof0Nx7pr6pimS+DkN1rZqwHoeDWJjUIzUElOIjxhMCbfKxxx43IDLP8HnEFm9zazgTwBY7tuRYjG7dDCc1/xFvWMaVTL5heEJJAVKquIzDJjit1oPRAMkR6eH9Iu1vgBLPPOpDiceZlgwDGeGfc8+iiOO+gBz0cbkJf0wnZSFKIitWZV/WgwhSA94RKt2OL6sRDXe6Mujq4daV34ymBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AppruFVeDfXSEQdWcKgDdD7WONQpROMHKSyJh5FcqeE=;
 b=phz6OlEbGD8MReuWVWLeprwS5gkvauRfQDXYQtuUxFfaPRN0h+0S1h8rwS49BMlpXNFHWwswIDNPlmf/Ex+8FP2dUX/xU7ayqRJxVszH+nhWwEBqcSGl2s/AQpiMi55THA22dpxHBb/oGrJPKEdSnuLxHujVSTGP97jryeW5F+D0khBFD1X8qLPbpd+zIlWrnZKbfcPjEM1PkZlqyS2cz1yyuLizB4pN01fg9/HFxsXfsMRBaqEvTQXSYcbDGwKxHH6kf5YJ1CtLsa6nS/7GnpmUCDu3B1p0YYJhLnu7DDkK42DB9fAVEv/7zqINfCrzXq0hAuNEFou1m58XxA3iAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AppruFVeDfXSEQdWcKgDdD7WONQpROMHKSyJh5FcqeE=;
 b=VCahOw/ifgLx00AgMmUP7XeOXGeIBs89D+bZ4zTWitD4H9mIgvmLbnQTErvA3vut6qj77B6znEvOrCok0bp/0uwLoK72pXqGnziYB+RgMm0+d0DntR+jy7BUExjLE4uxx/AGVV3LDxso3RGpoyl4fHGyuS3L2dRNmsVdGs9dOj2xnK3Jte/h5t3BIzVyGyoTiy4gIgbZgupAcJQTpzbR9jhb1G0qxm2jGJ121VlZwfUb+/jQKziRK+P3Vyjh6fReHwLKbQ5dEMZH4hIxK2zqBCsojlPZ1ONq7QxTkrrvKLAjh5WBsx1KkpKxRhLBm1Azfc+IP7YedBoQR1Z8ej3oXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9298.eurprd04.prod.outlook.com (2603:10a6:10:355::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 14:49:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 14:49:20 +0000
Date: Tue, 20 Aug 2024 10:49:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: nxf24178 <ravindra.yashvant.shinde@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"moderated list:I3C SUBSYSTEM" <linux-i3c@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH] i3c: master: Avoid sending DISEC command with old device
 address.
Message-ID: <ZsSs6W8ds67NZqRL@lizhi-Precision-Tower-5810>
References: <20240820043818.3352614-1-ravindra.yashvant.shinde@nxp.com>
Content-Disposition: inline
In-Reply-To: <20240820043818.3352614-1-ravindra.yashvant.shinde@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0047.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9298:EE_
X-MS-Office365-Filtering-Correlation-Id: f803db1c-6bfe-4052-37df-08dcc12745ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hi8UFKXQNJXKAdVLb9vvWp3sSwzd4vk9Vm1VWe8VWl8+flCeLKZuiVSc171/?=
 =?us-ascii?Q?zrpf9C6d3Bs5z4FLZDt19kvyhEEKsEqP5GA4Bjqb5I52sflHpcNx+x5rP1aD?=
 =?us-ascii?Q?e6LlmUQ5dEEDbVEuvPPfMZNSTR71r9YEXPK+w1OnN9+AAPoSEC2nu4d9pB8S?=
 =?us-ascii?Q?ygVO6A6yrRn9RuuyNbk7kvClRi5dSIm/7ITkMbhH4zRdvR+McB+Sq/fo3hWT?=
 =?us-ascii?Q?x+9LJNZX1/8VcC9ZDOTRCAzC3hq2fc1YaZTC6J1k89z5EIWr2PzUPDJy6mw0?=
 =?us-ascii?Q?iXUsW2NOrltosFvuGUeRFsbQriiRvAdENRU65Rfgyw7R0YTgDHEilPpnHTHd?=
 =?us-ascii?Q?nAyxhC8o/KFhGCBCGF0bl0d9eEXIpqQ90kg+w4mKU+lf7eUFQK2GrvKSwaXQ?=
 =?us-ascii?Q?aRN8LvFg8uRtlAi87wtZRI0lAzuQtZ3R07VmLtm6YshZAQxgOcGvIvrsdNYi?=
 =?us-ascii?Q?B2UNG62rb/2t3SQIFSwFIAKgso3iscEo2k1UzipwYG5GpDCO2fjQYtprTQlQ?=
 =?us-ascii?Q?3BGDNXB66A38fbo73xCiIUN+D1AgiAjIip1Px7ypXoLXtCaNJq/YmpWKX3uw?=
 =?us-ascii?Q?tBUniEpporq0nZPZOVBSgE/N+GeD+IEd6Ze51HP7RaSNnE2LBdr+X3a2D6qz?=
 =?us-ascii?Q?tX04gaZNNVLYON9ZjE/S0xe+2MMhiAuEWkrsHzRmA7UEl6s8IByhCJin3tS0?=
 =?us-ascii?Q?S0jm3NXx8smgvhoeVpukhySsIB3aWLwhC+UK5O47wQBcdhAwGigSvJdjGb17?=
 =?us-ascii?Q?M5HJF/pbJ0arnbV1L5Pfhjp4dMqJ0sp9JdC/C5QMatC86GBLuxu4AtH/fQUA?=
 =?us-ascii?Q?qOGHkvibeI78k6n9dUq73P5S//v0Ckkd4KQtvl5ZUJA2XvUUN4EG70ebp3Yl?=
 =?us-ascii?Q?Wy1MBQMgclgwZi3aRwNgn4Ua16Mbs4TklkGro15TCPrqxxv4Zm1p/ICcYqHO?=
 =?us-ascii?Q?DmiojKI6mqrR+XVBpDgk4lhoA1fNKQ3nyaEdj0J+NCIHT8HOLADlET/0imR2?=
 =?us-ascii?Q?25vwOGVkhyRyeBCQVAZZZ+za+6RRcyJgtrELbMNBKfMtH+z7HzBnAM3pXbhG?=
 =?us-ascii?Q?wCWRIb8q1NAYycaXUBeW61rrT8S2V60E4UtJzlE8QS6USS9p9nZG6k48xAJ6?=
 =?us-ascii?Q?a4ULOk978LtYISWZxSNt9UmI42xQTreCBgSiHqO8j2j0DKuq3Ccml44q1HGO?=
 =?us-ascii?Q?5mnOu/6vt5cfarok8CsROUHfdCmkUTEpOWtaV5+jFXAEgnZu47Tj226yHfWT?=
 =?us-ascii?Q?iGISI6CVLGm3xZ1Vf09z6JehmLXclIZSvoDfKRWrPRraXBtgLyET4TvDUYg9?=
 =?us-ascii?Q?pmaDqIv24YLvlGACpbQUQLOybDihKgPRScoEgSSE/AC/ZNAxm5deuWqYEPoC?=
 =?us-ascii?Q?7xNvVtEFUpSitV1rd5vncQQw+CnzQSNHrodNAcih/jmuD7qsIA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AEA6o1p+9ZXo3f3SwLLJRAno5SbSkU8JoNx/csE8mfzXnjMH0rNKfs1Hxu9e?=
 =?us-ascii?Q?+B0OYicVqF22l1ejpFwd3uPKfdAMqEMYVKYT+ObFOGsV6ZOrS1SjPSR7an+H?=
 =?us-ascii?Q?IBhm0d9u1vQsE1BmwriUabtMNpCn67R2up4QMZdgMIU2zU71QHFhv+ZstcUB?=
 =?us-ascii?Q?oZ7kTY1xkZ1gfZDTCSim2kY7zHlxuDnen831lVIxHPEdAqJ8NhmQ43aERYSc?=
 =?us-ascii?Q?Qpiot1WxM7KOyJWTs+02+PdFAGR/3VUumLfFtRuqet0SmLOwAi+hX4eJ486e?=
 =?us-ascii?Q?no9uRSe+kTNn1zKcV+BMF9wGBiLCAcA3FOuKwkpWLg2c8iUv7Nwa4KmrC9iK?=
 =?us-ascii?Q?CfSjUiaXLT2J7OrgcIGpcLhDc0qpjzJBdcf/m9g4YJAuNfXGMsOle6Kzz4ox?=
 =?us-ascii?Q?Ep+syU/5pG8Mv/98zUQkp/wOT+5mgPNtlqRPIII/4j1mM4H5wpWpgrz71jQ1?=
 =?us-ascii?Q?IOecyBgcYaGdrgZHCIWvaC/zb7OOlVPvCB4Ycu3ciJokKhr1/ukMFFu+3zGN?=
 =?us-ascii?Q?dBDScUAnulkIXL20R1QrfEiSc6vsaieUjA3UEnUnHw/dAl/cKQVHL7velB0a?=
 =?us-ascii?Q?cYPxnpfsPUIEhXXHnuyhbsoe1RdVF3jNDp7UAxhRHhgD8U5HRJdgItu+PHV0?=
 =?us-ascii?Q?FfeD9BshEWFh+PXRXymkwXc/iXBeSIGb5VKOJ4QwGxtgpjXPeNbK62lBkXNU?=
 =?us-ascii?Q?bqcxBBSiEuThEt1ivUnkvSSclAdihbxFakTiYF3rwQAGyMhUYq0n+2fbE9NA?=
 =?us-ascii?Q?wmk/OQd+nv1sD12+lFg+iRZKsqQW+9gig9TTk4iB2jVb95e3AdIbCewKqelG?=
 =?us-ascii?Q?+oPHWWwiOvWQhWzM1Qu69rF32Mjqd3wWmOPD4sQ+aOj4E+dW3GW9KTYCXUvu?=
 =?us-ascii?Q?Sci74qs8/VOTnJJy0NIuU+6HrvuOHP7JtgvHY/7cjyDu5f8IP3TswAuueUWx?=
 =?us-ascii?Q?jKlXfdw8HB6Ahv25A84J2VmRf8bhqgnCa6x9Z2C4/5OXs7SeXs4g1HlsqUnp?=
 =?us-ascii?Q?MO5tM3+0CkaGcY0SpbOy45ZqU+keFpXLEBiyHj1trZqbcPCj5XzVXUaaKJYU?=
 =?us-ascii?Q?r8BnPIC66ala7IZIfq5oe+rr8oUe89DjRwtzkhE6T+fNPeTDiQubwbIMDO1e?=
 =?us-ascii?Q?sU8rX0KfG6ZMPpDYCbdDvMOL5rE1ibSU5rtXk3wt03IWSKWZasLUkI6XDu+g?=
 =?us-ascii?Q?sYoLO38zLGIVLNr8xD8kn2LSyKJ5kEITn1ELYIJFbm4+6eL5OIvNs5DShHp4?=
 =?us-ascii?Q?/e51YUlr2DD8lbucCUcZ9QmKwYuMGJqtQSCfy39oNl8883dRwgjgEaygh6Y3?=
 =?us-ascii?Q?XYqdKdtHoNKGvudQ+eIRS++9gRcCmnpZjIRHPZ5aL9htxKI9GJp1HVra6wqo?=
 =?us-ascii?Q?YpAhUETmVZlaowAeZNd+WyjiNqW35ZH081KvnqBs/CfE/U3IZ/95CSkUPZKw?=
 =?us-ascii?Q?C6dlCvAk8guoaSwUo++cMJHE4kyZ5odyUPk/PBrujP4X8amaisHIBMhDL5bb?=
 =?us-ascii?Q?LSvJIfx6uz9p8WvqsTk1TOL8phvxFDQf+SAvZG6ywlM40QiU+1OG2Lp7+qR2?=
 =?us-ascii?Q?uF0sm4qWwt7RQmFTchsZOYIJwy2Xu3zES9YWDQC/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f803db1c-6bfe-4052-37df-08dcc12745ea
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 14:49:20.1550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwRqh33GbaXbbpvywcl0iRNHHtb2gfXUnRW9aB4sFr3o72PttBCkPV+cBb4Fs18PA/zRPrCav2NaIQUZ1UG5vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9298
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_074927_468401_3ECCECC3 
X-CRM114-Status: GOOD (  18.58  )
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

On Tue, Aug 20, 2024 at 10:08:17AM +0530, nxf24178 wrote:

Avoid use nxp nxf24178 as your name, please update it with your real name.

> When a new device hotjoins, a new dynamic address is assigned.
> i3c_master_add_i3c_dev_locked() identifies that the device was previously
> attached to the bus and locates the olddev.
>
> i3c_master_add_i3c_dev_locked()
> {
>     ...
>     olddev = i3c_master_search_i3c_dev_duplicate(newdev);
>     ...
>     if (olddev) {
>         enable_ibi = true;
>         ...
>     }
>     i3c_dev_free_ibi_locked(olddev);
>     ^^^^^^^^
>     This function internally calls i3c_dev_disable_ibi_locked(addr)
>     function causing to send DISEC command with old Address.
>
>     The olddev should not receive any commands on the i3c bus as it
>     does not exist and has been assigned a new address. This will
>     result in NACK or timeout. So, update the olddev->ibi->enabled
>     flag to false to avoid DISEC with OldAddr.
>     ...
> }
>
> Signed-off-by: Ravindra Yashvant Shinde <ravindra.yashvant.shinde@nxp.com>
> ---
>  drivers/i3c/master.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7028f03c2c42..07ccb2c00074 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2042,6 +2042,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  			if (olddev->ibi->enabled) {
>  				enable_ibi = true;
>  				i3c_dev_disable_ibi_locked(olddev);
> +				olddev->ibi->enabled = false;
>  			}

you can set olddev->ibi->enable = false unconditional. and add comments
about why set it to false here.

Frank

>
>  			i3c_dev_free_ibi_locked(olddev);
> --
> 2.46.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
