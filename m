Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814B2CA0EFC
	for <linux-i3c@archiver.kernel.org>; Wed, 20 Aug 2025 20:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sH5uhK98SfAOm5VYtyPDX4ZozqvxBkoO0IwXkA07lmg=; b=JNBTS6xBwPIyIR
	rBJtTGYhfxcdJ5BdSQPHVmUoAYVCvtZrYafwE48n7UUi4S1XkmN6JYxioo3Kl1FDoTUHSJ51WgKtq
	+ydDD7mRDz75oIDwGviSMu5bKgZPYeSwRPyylc48yZUznCni7FfDOSw7aPwvpHkjFQrlH4t7JqNH+
	XY+u5GViBAssP/BMkolmCSk7Kekvw6MDf4b75MmQg7ushC+wA+lDmHjiQGQQPSbkzGGzU+rJ+z79b
	YTNuGT/DHoAe1zEzdPGjSCnre9SxTr7/l3ZidouwGcF0SV2pjX8svYDYq9Ip0Ji7Eql+EoThXzypB
	nBCOTb+OG3YrnShE+nMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoplC-0000000Et8C-0pxl;
	Wed, 20 Aug 2025 20:50:18 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolPX-0000000EMEm-0mWF
	for linux-i3c@lists.infradead.org;
	Wed, 20 Aug 2025 16:11:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrR/rm7yaDMHbfAhvtbGxTiJ5ld0/gHqWAUpYKz4ZzB8W1LLF7keirnMInOI5YhMpy08n+WZ0KBVgUpJ1gC/r0B2rs2D70obC/nAYF8xiR8zPyMUQQt39YqxuiETmTLNlEJlcdkrzvSPaNMFKUHL2XQrO4b7NZ3M4P7aGMsJgC1L2QvCreO9kwKPxAR0Lrzt6655PNiaePD/fVKHiQUrXEh+bPTDWktfnjB9QdCEOWa/FhAhwY/mN4gUtSjdFiZTUhokHx2LjE33aPlyr+iXQ4BYKSWNuARmopBY7IedlcCREZjaVU6LZD0S6OXrfH5dU1owDMbxy8QVZpIBOLITCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5ti12Isf4J4ICqUZMm+s1MxQ3zLcbRNryMOManT26I=;
 b=FNwaCmP8Enr9J773aHGFTeA905WYEsxBSiZ/QRjZwTt/KDaLH1uMEzak/CVgIVvWMt4HmW//jsMATdYNW/+q+4jAYPeLDN7L1lS8H9wjwt/A7YHlX1DkyxWVUCN4gQnewAdivZeMF+ww337G6rBp4wR8eunQf7wN7XckeYd5j5DAIAi4lJ5Eg/tAIac+9Tk/hWeAlwMbFRv9FWEk3A0OGMyCqcxzD2pLF0drkhC7y3ucO9vBZB6tFhQgh4vd23DdrwWncVAJN9RTDcB5P079fXPRnTVaj+TFvgNSh+Whj6Rt9nyoosIEGvZLHQify4C9/iH7R0tKA5LXwlqOCSNJxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5ti12Isf4J4ICqUZMm+s1MxQ3zLcbRNryMOManT26I=;
 b=HQ6uWwQ6La1StTesmtCZMjoZZcc3UkWLXtzahwbephmY8SXhNtSxSyxlAwHXrY3e1B63kkNc69I/ipDeD1aNyzu9IORIxSW2/KjgkFhHJQ8O5ew1Sg2geKs4ipaZ+94jsNEST1uQWV4fEj6kd9AyNnRJI/Ul0aW+6BuUkIhWx/1ggAfZPay39NYKic3ZP7USClNRcd0wIJH50bS1Hj4SCytJoC6dh/b1iKOxnjjiZ5RuhI3rlfG0KR3JNF6+w/yU9/z10SMYZ1Bt7OeT/37aM4PcG38cRO0cePFUQI/pucwCvpkFil6FSV/+DRmddtFPmjjyuvS/k8zMWAd8moJLsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by OSKPR04MB11365.eurprd04.prod.outlook.com (2603:10a6:e10:95::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 16:11:29 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 16:11:29 +0000
Date: Wed, 20 Aug 2025 12:11:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 2/4] i3c: mipi-i3c-hci: Use core helpers for DMA
 mapping and bounce buffering
Message-ID: <aKXzrHl/EfJ9JRm3@lizhi-Precision-Tower-5810>
References: <20250820113447.2502071-1-jarkko.nikula@linux.intel.com>
 <20250820113447.2502071-3-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250820113447.2502071-3-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: PH1PEPF00013308.namprd07.prod.outlook.com
 (2603:10b6:518:1::15) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|OSKPR04MB11365:EE_
X-MS-Office365-Filtering-Correlation-Id: 26bb7033-433b-4b87-3824-08dde00438d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M9Uv3PzH4uPv7QelnKNTyezNQHpXnqObamA9tBMOkgbJCfxCgosBNASrFWgl?=
 =?us-ascii?Q?Mjl1Hym+0vpzh+zGygwQ5KepJiYuX4jSlulvSqRNG8I/zqE2uNLhYQnkdJ+j?=
 =?us-ascii?Q?yFkpEMWYXlyroP43Xmy0PzoPbp8uBXtNkcM4rzrXZp2vrdc8QWuFpX7/+gEY?=
 =?us-ascii?Q?s9b5Sq9FaojUweqEC6mYpeknXjvrORbFeydP1uu3fkSyZdEpYWnIGqCHeIfx?=
 =?us-ascii?Q?QmnnayF0fzeygUIjKCOr0oWJah29ggggVDfegXoM/GjAzqBwPooXWyeRp3Zu?=
 =?us-ascii?Q?eAhOzutF7d+VGc7JfLQ3kLfeet5iy5tEimFqV1+usdXzi6l2MD4QEQownhg7?=
 =?us-ascii?Q?dL0NRVCbO3r4G721eeK2KfmyIhTwZdrUNzU8MHGClS0TX2GFeAqxBR/a9o4X?=
 =?us-ascii?Q?E5Wbtrqy4klEHuftKZTT2FPrWsjE3Zbqz15CGnZdXVfh5rkiWsSQT55Jq8WW?=
 =?us-ascii?Q?guikEygtuvEhwaQ4fMP9ikatUvn4Hqo3tLZoeyHG7x1h/3bPdCopRHxgiT8y?=
 =?us-ascii?Q?D5LKuNuP95jRR4X4cSg1NjjJLf2HFTKkjFQmyN9AfAFgRxgZKcW+R15nN5+d?=
 =?us-ascii?Q?jcw3OzijGIK2/hP5kj11xvcme6yMfm6B5MG81AjBTki15Io+Sb6jDUz8RYgm?=
 =?us-ascii?Q?gg1/04tnLG4+EmXVcq5GDVSQQsd2HUIDsepzZvW1m5GY0K0HXIuVlUl07peT?=
 =?us-ascii?Q?F5CmjduNB8sokC5sbkjyX2kYGuToOXLXkmNjrfQdeqlK7HedezVuLebHR43m?=
 =?us-ascii?Q?wRHHw34pTRY8OB0PXuOCZsCp62L70S7GsY5r6Wmtc/ZO/9GBvJRrsmkj6QLz?=
 =?us-ascii?Q?D3FoumEa1tdKKzZnjXEkhJ8IOU9xTM18vT9LmooASomEue74FGI7hluqB9yR?=
 =?us-ascii?Q?d48IdMbazmVJAwkLycYxKupaYIfuG38Vps9OevSCRWUx4nKC2/+8jZ2JyqDf?=
 =?us-ascii?Q?FLSs9eoJ725mfpD9cCSPcdVi2T5KbConE8DJHMmimmTZ82AIA7qfRa2yMkcr?=
 =?us-ascii?Q?GjeTuD1eH82lwE3P1i0iq3b0a2cQU321eQyXAydzSRhEv9CXH+MWNwc1Z6AZ?=
 =?us-ascii?Q?R7YfJFaHTLXF3ot8Bvioiw3eDpnKf6ZOHD6nD3Ck3BJrrs8LHXCZcF3HT2XC?=
 =?us-ascii?Q?IFY2IZdY87ZmztLrJBlCvuRtbXru4QllqQSv2zyW0IEYfFvSyVdsu01F31SU?=
 =?us-ascii?Q?SprKdLfIgBVMxhyl5MX6BSSze2VwmDpYDQ31HT9mLmQOl2Ld8cvgAIKXPlsT?=
 =?us-ascii?Q?d0Cc737CdplKtBWmPQ63pPAhjk+y5s3ntCzD69rpXhU84VSOpfhLgmBGcGc3?=
 =?us-ascii?Q?lrUVM1WTHxJB1WHj+LPwtvfPrnXW2q8WB2Ibl1xCXiKCi7CcOvma3JII+v+T?=
 =?us-ascii?Q?dq3OoUFgR3lGSCujEHDtXPP7QQ1Ysfz58DHun3LJWsvIXEPF7VIUs1RYX5aO?=
 =?us-ascii?Q?h5RmkJopdlNTH2dOsREb97Ndr0krwKLZUagPikvbaYo76oCjqZHgncUog0EY?=
 =?us-ascii?Q?Tj6zqe/X2zk+YO8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9AMi+Kqw2+e2b+t05xAbczsu2HmU5/7u2XcAPe6/kxIcLhk6hMSgUkBimP2g?=
 =?us-ascii?Q?x9TWrIvuy9oEejH7SWjvYGfUCez6RoXrynQ83Kiesljl5hklcvcrl3i1EHow?=
 =?us-ascii?Q?nCt9EzeRAl6xuwznQj1YUuO18jU/KOLpU1Atc8yK08yl6xIgKVggH94RQMdI?=
 =?us-ascii?Q?vcGu4nRF1AnCPiGQd/oFT6LJ5Zu4auUBvzA38EUznG5kJzsmXuZhvRBGDW3g?=
 =?us-ascii?Q?QpmRHbsvTy+V+DsECwa8LWkgcEi8RRIapxbsCtGg+ymGv9dUyFN85r+nyEFd?=
 =?us-ascii?Q?+UQ/syS5ci5IVg3gnlsvEXaUJBYsgvON/iXo6G7xy9muJGBDGL0338N7cNl4?=
 =?us-ascii?Q?H1gx4PGYa3nSTagUQS8Qm4HCzn6mfPpv47POcvw4mTb0eJM8+xt/gbV7CZHD?=
 =?us-ascii?Q?QFkkrwub8L7xfG8NnowmpZSpVvvidlnSwdNfcNznVdu3w7CGpaveOJep3Fnl?=
 =?us-ascii?Q?HuTONgT02PNBNexyZMOcZKnj5R2OQf+6i+HXJ717bwFdCaZQ/vpf/+/K7omq?=
 =?us-ascii?Q?9t0h0+UWmGYRjDYdvsf2Hud+kAagEu05nLDd1Qw4qEcsVOP/jVpfwjtgNHN9?=
 =?us-ascii?Q?A2Bbk65EO4yq9hJ8tRtVOwK0sMAxXsL5v/W/8tftFoW9K8auRW2QFeW1lynW?=
 =?us-ascii?Q?9S90VryP/CS1vb70oBMp/1mC1dyKk+bFAqKAupOhXPgDNyGnO8ZTMfePoCeO?=
 =?us-ascii?Q?RmVgsoD0IUHmDX+4ks5qDAecoke2qYEIt9NZo/OWeNLxHnE3HRH1BGb0pWQz?=
 =?us-ascii?Q?qxrQiaqAuBW1crtwK2AZwnwoE/9OuI3g6w5U+5xhEawC7NIoAEnN3S/YmgmR?=
 =?us-ascii?Q?+vZJuOt0m8/B8AlpWLGb0EqPOEPzTL8Uhzsz8CSqB//KKcX8ZDTS/fw3KFil?=
 =?us-ascii?Q?hjkFzvYEa/u2JVaNK/H8O13RcyXUvOl8pMbHOQWw0hp3JQDXEhBlGIfsOomQ?=
 =?us-ascii?Q?q0bX7Lq8tWcddf+AqvnA0RWZnef39nf4+nqSuzKbgQGNpCGYenMYztWmTpSm?=
 =?us-ascii?Q?nYriXp0Jgwhs/BEOykALhkBOqunvKmtDZ+Tzz9V+xJfxF45sJihgNcx9kIg6?=
 =?us-ascii?Q?swu0jdFyectSf3qillS/M4oQ7u3YUvgTGcsGOmPd2rnEzaeP3XAtqvB3TVvI?=
 =?us-ascii?Q?8GdJtEVvqivWvq+8csqhK4PgA1KJyLgcFIyFvXJjzZXqsLpYrSVMJMANyD4J?=
 =?us-ascii?Q?fNz90r7r/DZISpTDwhyAVFhXnsyda4gJVrP/v2PC2qVf8RIPFLxydYe1ZReN?=
 =?us-ascii?Q?tH1U5w4gYtvfhKu0pe+fYetNYygQIsgOzpmtjhYKA5URReaBP3NOM+n5Z0oe?=
 =?us-ascii?Q?oGgzfCpkVAmcXPNP2ukqKESIzgUODkxoyb/zVsiYmsNWjx+f/Iu7Q9fb8FK0?=
 =?us-ascii?Q?Hi9VyUMNdzELN1DH9fk/cSY5ZzzJxvAlcjZAYZDt5NhxWLfrVXAQ2fYxxlBL?=
 =?us-ascii?Q?3edY+C/DW3z2NkVW/v9zNEKkB6+Sy7T4PFiKYxtnGeSusaD1q3ox1RKPP8L/?=
 =?us-ascii?Q?Wu/sRCiKlW2t9luyPOq4ytw/7s0uliXIKLDkDFW8pha1e1hxZY/uMz+Uj6eN?=
 =?us-ascii?Q?PW0gQ7HcEZMU/oF0+baWw8Jm7Qtw6HobkWI0e0ex?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bb7033-433b-4b87-3824-08dde00438d7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 16:11:29.7405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zratIOvIyo9Q1uzCQqyEqjZ76nyWU160K9AdKQ7T2gjXSbuAvdTABA6OqYtXz6SVqFcf+UX87HxHk3m1pzTI9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11365
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_091139_227021_4BFB715F 
X-CRM114-Status: GOOD (  26.68  )
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

On Wed, Aug 20, 2025 at 02:34:45PM +0300, Jarkko Nikula wrote:
> So far only I3C private and I2C transfers have required a bounce buffer
> for DMA transfers when buffer is not DMA'able.
>
> It was observed that when the device DMA is IOMMU mapped and the receive
> length is not a multiple of DWORDs (32-bit), the last DWORD is padded
> with stale data from the RX FIFO, corrupting 1-3 bytes beyond the
> expected data.
>
> A similar issue, though less severe, occurs when an I3C target returns
> less data than requested. In this case, the padding does not exceed the
> requested number of bytes, assuming the device DMA is not IOMMU mapped.
>
> Therefore, all I3C private transfer, CCC command payload and I2C
> transfer receive buffers must be properly sized for the DMA being IOMMU
> mapped. Even if those buffers are already DMA safe, their size may not
> be DWORD aligned.
>
> To prepare for the device DMA being IOMMU mapped and to address the
> above issue, use helpers from I3C core for DMA mapping and bounce
> buffering for all DMA transfers.
>
> For now, require bounce buffer only when the buffer is in the
> vmalloc() area to avoid unnecessary copying with CCC commands and
> DMA-safe I2C transfers.

I see below you pass 'false' to i3c_master_dma_map_single(). where
check buffer in the vmaloc() area?

>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 34 --------------------------
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 27 +++++++++-----------
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  3 +--
>  3 files changed, 12 insertions(+), 52 deletions(-)
>
[...]
> @@ -391,21 +390,17 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>
>  		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
>  		if (xfer->data) {
> -			buf = xfer->bounce_buf ? xfer->bounce_buf : xfer->data;
> -			xfer->data_dma =
> -				dma_map_single(&hci->master.dev,
> -					       buf,
> -					       xfer->data_len,
> -					       xfer->rnw ?
> -						  DMA_FROM_DEVICE :
> -						  DMA_TO_DEVICE);
> -			if (dma_mapping_error(&hci->master.dev,
> -					      xfer->data_dma)) {
> +			xfer->dma = i3c_master_dma_map_single(&hci->master.dev,
> +							      xfer->data,
> +							      xfer->data_len,
> +							      false,
> +

you pass false here.

Frank
					      dir);
> +			if (!xfer->dma) {
>  				hci_dma_unmap_xfer(hci, xfer_list, i);
>  				return -ENOMEM;
>  			}
> -			*ring_data++ = lower_32_bits(xfer->data_dma);
> -			*ring_data++ = upper_32_bits(xfer->data_dma);
> +			*ring_data++ = lower_32_bits(xfer->dma->addr);
> +			*ring_data++ = upper_32_bits(xfer->dma->addr);
>  		} else {
>  			*ring_data++ = 0;
>  			*ring_data++ = 0;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 69ea1d10414b..33bc4906df1f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -94,8 +94,7 @@ struct hci_xfer {
>  		};
>  		struct {
>  			/* DMA specific */
> -			dma_addr_t data_dma;
> -			void *bounce_buf;
> +			struct i3c_dma *dma;
>  			int ring_number;
>  			int ring_entry;
>  		};
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
