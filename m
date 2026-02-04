Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0481BE9D407
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Feb 2026 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXJI7Va2dvPY4CTelbFZy7GUM9mNcySUjrxg8mFPoYg=; b=1qhMVhdcLSwiEG
	DN1FsdPEq3N+2/hwe5SJ7iuroD2iNp5WmAw/yU2MheYKUjShpoLn44SUtlML0uJrerUP1zgRWHfgj
	bCW2GJhNaaE+mVa41/oM31ihgrH2sdzHHzWkmjwqzBmkooRXo1+cl16L5iKyxznygKbI35ozmn/04
	1qg7qoLkQ8RcvIkOTkazw4kk0mcm1RN421zM0Z2anDPA5wJESwdxUZD2yFV1GujhKMYilTSFlwPYZ
	uYytOvCp2rPtg33Pn0JseLowKHAL0vaXlKDyihPAWmhj2nmkNTaBiXgujQ/+3sP1dDEnu3y+YTg0u
	8N09ta57iJ77Ql05GlrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfQJ-00000008jKq-2rAV;
	Wed, 04 Feb 2026 16:08:11 +0000
Received: from mail-northeuropeazon11012059.outbound.protection.outlook.com ([52.101.66.59] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfQG-00000008jK1-3GEq
	for linux-i3c@lists.infradead.org;
	Wed, 04 Feb 2026 16:08:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOn95i5pxQV0jAH8TuAoTigKJ78VkKslTdCYRI7my5oMla+USRBp9R4KD+yTsurmf1q+foSEM4YqRbx/dSSm9/zNIBk+WKgJXmy/dC4wSlZwYM9IntE4uVCnj1oywuBEvsZaDhyj7dASQ+ydn7L85bSf+vOe5H2gBFE/HtaM0KJDUCfNoiCSZRb/xJE/KskCloVBejhjpkNsje0pTSkbrYLEQ61mdZ8fAQpDx8Kn665mBtqpOk8RZlhNucMFltcSxMbFb1T8a5GR1L0TX7hHKuuR+P1ap/6V0/AZfJqo2osbkA64y2wJB6lNoNciil7zaH0kJmnDm6zrHrGanNzO2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOqKL5SHEYMXQ66YZBOtiJKkYSRx5TB2+X+0d8/6cgo=;
 b=HUu/7Q2hbZhOx+zzhdN4vY0O2ciYPR+UITtshkaUFahLMIgBgArU7SAuOnJvRsWacSLvzkdEwzKUxykxA03w5P9DZqh9nbMBbAqoPPu7LJAjbKVzG4DE/7xObp1KRhm6kQZe2Ca0cKIFSv2HTregey+ZqMlXq+0vd5wVlIhKvadRDy9laar50RDfuYKIWF4B0CijhnsFxyNS53DGVCqgTm+J0P/TU62TRoyNS9YgyA92VgVJJynL4ARhcCAAqSXX7ASdZSiUBaSSo0CFe7MaUMsvZm/VeaE+yYZyaar9vDeWQigFfrQZpy6UnMpn9zONZgalwDU39gYayaFdnCGJkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOqKL5SHEYMXQ66YZBOtiJKkYSRx5TB2+X+0d8/6cgo=;
 b=BT6lCiO3CzW8czL4nYryR8QjL8JwWhGWeLXuPvqmhzL4Yq2ydmYg6iIPX1tCdTRNMhOssaJzCVOtvK9HZVuSvWMrrQUduJxx4gjaVHIZPZhUGaH7C0LXIjNSu0t2dPRP54unE9Hvg6V2wYr2UycSoaQZMK7B5M/hplWL/LHHVblQ1dqR5+gaoBQUcPK9jG37AInEacdXnY99Nyu6485cIuxvy4hVTA5HpHhfH35k19qR9SCfTS14lUcHVpVZL3zwt/GpWZpC59piG9Hmw/UvWTC7h+DMio8YQbIUEOWyFLfwoZ+sALag8Y/6K6kA3nGZDddUXMS1JRkKC+rxaR+Q9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VE1PR04MB7486.eurprd04.prod.outlook.com (2603:10a6:800:1b2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 16:08:04 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 16:08:02 +0000
Date: Wed, 4 Feb 2026 11:07:55 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, rafael@kernel.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH V2 6/6] i3c: mipi-i3c-hci-pci: Enable IBI while runtime
 suspended for Intel controllers
Message-ID: <aYNu22kkCTbPx66h@lizhi-Precision-Tower-5810>
References: <20260204111511.78626-1-adrian.hunter@intel.com>
 <20260204111511.78626-7-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260204111511.78626-7-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VE1PR04MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b484d5-92a3-4aba-7793-08de640792bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H+dvrOJeEK4oo8zax6tPA5A+Xrm2B9/sj0livHlG+hOOhMJ8mkOWMV7EA4AY?=
 =?us-ascii?Q?o6fnjV+HTwiXe6od4nzkVuHPHsH24niaLIJAq+PjkHCqyUAhtOi0vi5rlwGP?=
 =?us-ascii?Q?raThtQw5PDt5e1xNEbAd0eAMHwUhA8Sezu02LYbpbh8bQQmhuLhyZG2AtDfV?=
 =?us-ascii?Q?YzsalYtjCWtb5ybMX787KdeBuV8V+Ex3vmX1SCH4mlfzHmZo1vJcVAjT+4n1?=
 =?us-ascii?Q?lrCGPAc9lzxnP38Pswmcv6SP5536J4BhJy62BdAWgqMHN591bjkMKe4jo8Na?=
 =?us-ascii?Q?tH7eWS+vPV8NlJfHa6PlMsHTHw568Z1GMtKjre9ipmlV/LN3A6E4PUbW/ct5?=
 =?us-ascii?Q?cFW3mOL1cS/BlXtuIUcT6EYcviF8EUiCrK9buTMmgoWLT88nDEo14u21z/K9?=
 =?us-ascii?Q?cRd9lTaf6fMcYMxkjoLyu5RqxbXi+ZVlf/7RhQojUrKEJksxM0CSCppV4NTY?=
 =?us-ascii?Q?moOHQNQbIuUN/dxCTJnNjXZKipmIvdvKPh+T5GoMgGg04QnZ8plANJEQh8Ft?=
 =?us-ascii?Q?zADMyJFVfmEPijEsNyjH1ToOkACZD121kGhEgwoD4OWlyLZc+KMebjPI+SlQ?=
 =?us-ascii?Q?JDGQJV7cPSewQKxa5ZQxZB0DSmUoYsi3/zHDHXmuJtFxQLMvhZ0Xg1V8zW57?=
 =?us-ascii?Q?BZzw/qN4+zItzmqBLTTukmAwx/9pyHiYfC76jTBQi3GgOpPpywW7hVreHJVp?=
 =?us-ascii?Q?gnQ/tERap0NXyXx4bnRiZC3ri0sFZW0sNps0CeqvKXb1ku7oYSq31cdHyzR6?=
 =?us-ascii?Q?lecIqTzJqDg+UclOGLrQatPEsmchAUYdq80Noyv/H3eFnAR/KpZ0jqf0KK+U?=
 =?us-ascii?Q?Tb29EuFjiVmMPfoZDth91RCwh8IQA/7DZTW7e3kH+IWs1BEwFX9OyKNmuf2I?=
 =?us-ascii?Q?iwZbJF05MoSK4Rh3vVxqwrZB9Jx4t1CeCFIA4Ea1WRUQYAF7VIn14ecQpmwZ?=
 =?us-ascii?Q?Mu/iPW/FJ+JDX/chjf9fsQoO8EliBi+AVmJx+tmJP6abKS4bT5ze9qghNR8s?=
 =?us-ascii?Q?JYwKajx8SEToIFF3MLZpj/UJx4jiIwp8ABeWTktDfLnV11i2sOOx1pZp/ioU?=
 =?us-ascii?Q?1z0JVzhCja/9lzKx4JkJJ3uUuhXs2ZoY/6ToE3vbw70z5YRZSbjbWqHilp49?=
 =?us-ascii?Q?KR09RnakeqSjvE/iJ5gz3Mdag7JcqiAZb9UlowUzjbohEKdl4lYm0912FP8T?=
 =?us-ascii?Q?8JQ83Bk7U8zNOcfZSNj1XOvqGaW0wqnNdeQaEV06dsfpuOr0/teafju47ly4?=
 =?us-ascii?Q?ZGe5Px2uaFCjooETbsXvSU6JwcngT0NVTefTwVxDU2o605Ss78bAolYsnvmL?=
 =?us-ascii?Q?n/xQaliXILfmfkdS1M9Kal4WXccmjl0pb4UuZ0vXY/E1r0kvVi6vdA3vWEMn?=
 =?us-ascii?Q?DCG395+hkRdcBxXCFEP5QOshYYyStVlZMrUldJqENByc9vErs9eVmrPkvFIQ?=
 =?us-ascii?Q?f8mHjYy+U1ZpesqCEtd26r/shd2D5d43wQLlXe2oBvoVBxUJmw0vV2sPtsQJ?=
 =?us-ascii?Q?3hADtTRJW6AtTtkr1iPT8fxOITEc9JZG99OBD4Kf2M2M2iGiWGw/0tAFjBln?=
 =?us-ascii?Q?bUkAciKM022lO8948nAJ11Q4Q9Xtn7FlC2/TEPw8eQAHYgAi+yJMH4LYCjE0?=
 =?us-ascii?Q?jD6D+C0JHhppkba2LfSSidI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2bocL+Fwi6qBBIzt49djE2P8xjdSU3e8tlx4pCRTXKbRadhqjf8UgDa6Q6Nf?=
 =?us-ascii?Q?s6kq/KqBvBrC6Att1FxGi2bvNM1U2m6T0ospw44cjwq2JolLk57nsAzuiZ/N?=
 =?us-ascii?Q?R1K6sZRn0aPJES5LLm2nX50Vf97W7eAsLi6YkbPRxh+wyA2HB4N6qtBoonNt?=
 =?us-ascii?Q?FRkhuLRaZPjCpAfoUv20JSmj7yTUtd4nAP8x3lAyZ+PqGa47Bk3cUYkNAZpg?=
 =?us-ascii?Q?6SfGoibSmOYMQlPuCAOpwbpNh5p8eW4UnVqN8+nYOvADMhX6GIWwSI8QF+ZZ?=
 =?us-ascii?Q?Y4z5AUgBkbzaHKmaoffr8ppKB/tOg8fGBTEHgqE8ntA6UXRA60NFhzJ68/4U?=
 =?us-ascii?Q?OEhVJQt7ibYMIJXHBG4uPWenDIl7b5fYU9msZiVf0ls+G8zRUIcDT1w3QC6s?=
 =?us-ascii?Q?WuKTWWcWz1K5FNFXktxvBcJizFw24mj+pQbmKOAKBFc/IGyn5VV8NAyScyiq?=
 =?us-ascii?Q?/pmxueFBBSt653IcgW+SrpfSJ9Kq8vpe6OkoDS/PBVG4zWkJeYLrtCGgiAhQ?=
 =?us-ascii?Q?4gCkVtQGZ1kNgkXHtFN0nqABSxVj9ivq5OpNYUMyj8AsAekvZdn2+spUNS2V?=
 =?us-ascii?Q?HkSvZjEe6WGlVX7vtje0+QIAHylVDtl09kxohoBA6Ha9jk7yoK+D2iniDme/?=
 =?us-ascii?Q?+8IT9CMgBMRFUtcEr3o1V4FN5vpzfs5Hqe9eRcm2Y6EwF6CwZhYm5TTMsiED?=
 =?us-ascii?Q?IcYye78lB56mBiUIyNzY8tR7qeN2DEbQYFM8s3SIwhEDpS8doKxSqoPABlgq?=
 =?us-ascii?Q?YpSBh21Vi3Ehu7SMxRAtR0X3NfeO0hcQqaSBO8Gdz/6igYvTJUVmCX+CObaA?=
 =?us-ascii?Q?G4qAuX0GVTF32ZstmUL03LHExzPp1G9scFjJb1ph+jifF2GdwTyUtVpkeSMw?=
 =?us-ascii?Q?LzLqgDoSq9kkrKf12dcBCm7srAyLUTCOwR+dLRfkM9pZV1evtkE0dhRmGxxy?=
 =?us-ascii?Q?fSUiPkJ7nkamyMSi3/nbAQfT3h+Ja1IXSeK0MfpE1YQV3VzU3VMbCQli6Nh3?=
 =?us-ascii?Q?rMycYGCr/pTafKCXzD0GqQmdMpSGGxGR6/KklAf3q6ORLAT7Jg0oLZYxXnjN?=
 =?us-ascii?Q?DqZPkLjMfspvC+pTEe8NvVjkbFYg3z6ftQ58C7cJ+8uNQrlVXvwAL/RXbD98?=
 =?us-ascii?Q?rMhbdwQeEUCJL++jA3a/SjxqfeO+UEyv0/iZlzpjbVbXVn2KTQZXSGcHfLaV?=
 =?us-ascii?Q?t4mNpjyAegMyYdyTxwQn4YejVRTcCz5HEDN8bXa1/y9aTascY6oe1PKztPNc?=
 =?us-ascii?Q?k22ttrgPc8VJcXaZEZ0NvHU+spSOcDX8JpI7Hbckqmja9mhMbEMGnEPtY6Nh?=
 =?us-ascii?Q?XeQTM3t8ajl0oi1Tn6Eg8eEEkqxERyzzWX5GKPrYcGmvInTVkzD7cMcfs06y?=
 =?us-ascii?Q?KH90iS715mYaYNlwCWaFUOYDCfjW4knOZiMNDIT5JlPApyfrRf6jBxH7kU/F?=
 =?us-ascii?Q?ERtol7irsJNVGhVQx3E4OR814CNKsJGvErJ3atJ+Cbt+5JCS9AqyvQ75ST9N?=
 =?us-ascii?Q?mEsTlMvD6L6uFvmYC0ccIDF/vO/5ROktBGK+8qCNQQcHFzrgY3PdkmWg120j?=
 =?us-ascii?Q?fRG3xTs+TfrgXvlL8P5BUTvJ/cW7xHlrGkJx1yq3fPdL0aKzI16SmAOqgnQb?=
 =?us-ascii?Q?BHFNfNYFDp2aU46KR6HLC/3fHOzGeB3uEgO3OQPvMfm67z/n4GTgajW7BkH8?=
 =?us-ascii?Q?bURTXRughCp+v49ZXtqWcYQeXG9sEn9Mp8rqeoll73a5Hin0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b484d5-92a3-4aba-7793-08de640792bc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:08:02.4228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfi6+XMwpgKWF3JKuzOWsN3qApiu/6P8FH0FAK2zeHjqIwD6u3jcYz5R0e4UnQ/+EX4R9ZNI6petnRHXhPbpFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7486
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_080808_837872_0BC79C8D 
X-CRM114-Status: GOOD (  21.33  )
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

On Wed, Feb 04, 2026 at 01:15:11PM +0200, Adrian Hunter wrote:
> Intel LPSS I3C controllers can wake from runtime suspend to receive
> in-band interrupts (IBIs), and they also implement the MIPI I3C HCI
> Multi-Bus Instance capability.  When multiple I3C bus instances share the
> same PCI wakeup, the PCI parent must coordinate runtime PM so that all
> instances suspend together and their mipi-i3c-hci runtime suspend
> callbacks are invoked in a consistent manner.
>
> Enable IBI-based wakeup by setting HCI_QUIRK_RPM_IBI_ALLOWED for the
> intel-lpss-i3c platform device.  Also set HCI_QUIRK_RPM_PARENT_MANAGED so
> that the mipi-i3c-hci core driver expects runtime PM to be controlled by
> the PCI parent rather than by individual instances.  For all Intel HCI PCI
> configurations, enable the corresponding control_instance_pm flag in the
> PCI driver.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Changes in V2:
>
> 	Retain HCI_QUIRK_RPM_ALLOWED
> 	Amend commit message accordingly
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c             | 4 +++-
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 3 +++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 149b3fad34b5..d19be1d276b5 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -1005,7 +1005,9 @@ static const struct acpi_device_id i3c_hci_acpi_match[] = {
>  MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
>
>  static const struct platform_device_id i3c_hci_driver_ids[] = {
> -	{ .name = "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED },
> +	{ .name = "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED |
> +				    HCI_QUIRK_RPM_IBI_ALLOWED |
> +				    HCI_QUIRK_RPM_PARENT_MANAGED },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index c562e666f29a..58c4a025a29c 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -200,6 +200,7 @@ static const struct mipi_i3c_hci_pci_info intel_mi_1_info = {
>  	.id = {0, 1},
>  	.instance_offset = {0, 0x400},
>  	.instance_count = 2,
> +	.control_instance_pm = true,
>  };
>
>  static const struct mipi_i3c_hci_pci_info intel_mi_2_info = {
> @@ -209,6 +210,7 @@ static const struct mipi_i3c_hci_pci_info intel_mi_2_info = {
>  	.id = {2, 3},
>  	.instance_offset = {0, 0x400},
>  	.instance_count = 2,
> +	.control_instance_pm = true,
>  };
>
>  static const struct mipi_i3c_hci_pci_info intel_si_2_info = {
> @@ -218,6 +220,7 @@ static const struct mipi_i3c_hci_pci_info intel_si_2_info = {
>  	.id = {2},
>  	.instance_offset = {0},
>  	.instance_count = 1,
> +	.control_instance_pm = true,
>  };
>
>  static int mipi_i3c_hci_pci_find_instance(struct mipi_i3c_hci_pci *hci, struct device *dev)
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
