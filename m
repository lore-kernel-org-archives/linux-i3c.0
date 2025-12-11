Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B5BD41D68
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 16:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vaBtlej67ajv7RK6E15uPVa31E80Uvvb6GdGewevaoA=; b=Zjvmphxuh9vjIS
	oItJUowPAF+nOBC2HFFLBIT0QfJMdDPC3WdY0TUl2xt7ETeK3/44Y6G00oUlaRM45i/SyI9hC7piv
	h2c2ezAopZ4zbL6Av13MtLJ4pCktIX3IZEAUJKPHToe9qsdi6d0shxVSvOkgxR0uYAOm2f//PKg5s
	v249bjW2xuXKphnO+u1DIDi/rUF7riQyqotRlINKNIluAOr31jcLWdqAN2zP80QzSQyKW5bpPOfGl
	Uj49XAutYYUNUafSmhQiyVqWDXnkJYwmz6SSBenqMkz/ZgMG1FgcYT7t0T+klQSBjyaN3GfFvvcD/
	csXsxybg3zfcN/zHrE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjuQ-0000000GzTp-38e0;
	Thu, 11 Dec 2025 16:52:54 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjuN-0000000GzTP-1urw
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 16:52:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipba8rCP5S9YaL8KcOG2Rc63jnW/ieoxdxdMZUTXKqFtnMNhyqdU9elnaH8Fs6BoENINMyVajOxVQJclr+ipuYALarrIGnq7y/RxzcZlA+gko39c0mO6NYlAatAHa2GvpcIKIcdAD8FOJg/VH7mBJ0t/iTRdUiSnl9A57oqTKKvIwKr9waKAcRWJ6LV0wORbqx9g7rJ32Ttjj0YeQg6NDyXREnps9DdtLpUS6FJQCZO3qNmzmzLXgLLrMUeYhZwbQQs5gz+gYySOEbxxir0a2s5bpVVEpOUmmmPp9m6Cj1bMGpbtm9dhHMBPTe9OIxhtUbtI3v5nLWXU0T1NbkUkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1cVNDFsWNZsktASVqE9RzxGRd12gM7+5rwJ/6VkMCU=;
 b=r9WSsea3LHaguBtXrzD2nBMwxGv2IaiTcnQCLW8upYUHmtrOHp9+YLs5xe2A8Pqq1yA23hSH1gEaybcIz1qlIoO9mJtiBovsoT74B2/8DVNJjVPr7CRELpy1HIZxo+bMltn9Xr2iiXEankmsOnb9kCmVh//xoRnZ/5JBO+sebVT+C5PjADLiuPOtl5MyV2pt++u7/VDYfRZxiPQ4dqBvepgI/mvjhFsLjFRX3wOt+WIa2DPL44p3fgL6ctQzJwgQsIt5aa9VIyNrfck2bK84hcqiyHNAuJJWek1VC3+R0OoAz7asLSroEWfSX+4gxmvt9LERgxLyosdKOC6HcU526Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1cVNDFsWNZsktASVqE9RzxGRd12gM7+5rwJ/6VkMCU=;
 b=ZD5fV5mIaSGoC5xEpP9Lcj/BX8I8ewXp2rgVw6BdXWrd41LYr+m1/B7zwGBtr6UOnY+n4qnR8J+kXu0JWv48ChPHWtzLKPBfgvEd0Qe/fU0O+iWOCMVm3ZtjlDYScGKI00gt+z4dS1ELyWSvNPxtdykI82mMXTtNEv6N+Z45RQAU6vHxdLPZOtBe7muK+1CoNR8UIC346hhGyAkI6CZabFbZztZgylj5xvYKLkeFxQOB74rKnRnrUgPbBeshMtrPNjDIa/Nb8ze5yoPNvTTIFEeTXK6zRs73lb8qFDjY1oM48PPnoxsd4LshkaihHMY0g0scxb9quX9LLaRKw1Zvtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM9PR04MB7633.eurprd04.prod.outlook.com (2603:10a6:20b:2d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 16:52:42 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 16:52:42 +0000
Date: Thu, 11 Dec 2025 11:52:36 -0500
From: Frank Li <Frank.li@nxp.com>
To: Louis Sautier <louis.sautier@ovhcloud.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: Error while loading dw-i3c-master: UBSAN: shift-out-of-bounds in
 drivers/i3c/master/dw-i3c-master.c:885:12
Message-ID: <aTr21PvJUH3+Cwqp@lizhi-Precision-Tower-5810>
References: <66f5e4db-ac20-4bec-a437-af86aad1f56e@ovhcloud.com>
 <202512082058408ee92ee8@mail.local>
 <b9b568e8-8e21-49ac-b3dd-ab750fc329aa@ovhcloud.com>
 <202512091248543fcf4c83@mail.local>
 <c7e29aeb-c258-45e6-af78-9a81ee8de327@ovhcloud.com>
 <aThbaFalAXblN56U@lizhi-Precision-Tower-5810>
 <55935d9e-a647-4cd0-86a0-915c4aebc302@ovhcloud.com>
 <aTmPs3yviUjr2lXR@lizhi-Precision-Tower-5810>
 <d087f1c8-12be-4456-ac7c-978a82771ab8@ovhcloud.com>
Content-Disposition: inline
In-Reply-To: <d087f1c8-12be-4456-ac7c-978a82771ab8@ovhcloud.com>
X-ClientProxiedBy: BYAPR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::40) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM9PR04MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: 63f64bba-68e0-43b3-bd7e-08de38d5b32c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|376014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Tul4Cj+M1ev9FdYvOXc0aJ7YhoerLQUjgbMTttskksXUSloMWlkZGkvvMn?=
 =?iso-8859-1?Q?7OJa9q+QX9G49tRF+V2UEREJyKBMNfEsVCw3UA0aaeNUeTFnTsfUSiWlkj?=
 =?iso-8859-1?Q?/4LpRl2G4c6N9Ro9McVZBfA7mO9jfDl2NqdaHia361xGWCVd4EsBtRr4Qq?=
 =?iso-8859-1?Q?cN1YlQEPDe5Z1V8DfrFRORnG+hixbVpcot2U44oYRriX7IYB3pyg1674kf?=
 =?iso-8859-1?Q?b249MfTewrPEfpLa1YWNNAU6RaUjoBx83MFs1pdORO8pGovBKKAfpH6bcf?=
 =?iso-8859-1?Q?ai5imqkwu3Yx7kYJ9wBEzf0Yu6c/P9dCJrVSFCsfwnUTXUFQERMgmArNgk?=
 =?iso-8859-1?Q?yh6zMRkbFGtmmyEGUhTJNtXGj8iOr0n10vvegvURQNwQicSfI2RCWlSB8a?=
 =?iso-8859-1?Q?wog7orDkdFOuY9r6YHWM4VzIf2d8vMvgny4YJB+EuXCeCC1OazBBu06yp2?=
 =?iso-8859-1?Q?NEbDBvBNXAOKzxOz0XEWCsD6ZR8A51buYa8IZj7mnMCi8O+vv60UlWM3U/?=
 =?iso-8859-1?Q?X4rTVmF6ZsUjBFu7tinJKuw0rOi+iV05LxC271GZgUHr+7l2eoxLix1UPX?=
 =?iso-8859-1?Q?DPKI0ydQrUTXbA1pQ9pDmiNcYhHAK044D8iDJxgTsEqzSAYvqq+Vb75c7x?=
 =?iso-8859-1?Q?gXHYiFi/4aY5F/N/0t/FPyOM3mwOrb+6eatKTe6lzhSuvfLSG3a/KpcTmM?=
 =?iso-8859-1?Q?zMFwtO1T5kGhmQLtJ5y215n13uDUJisLIYF2KQNNijyWNB878Y8s3voqpz?=
 =?iso-8859-1?Q?Qu4+fFKOJV2n+XeH6f3tGM8DBoqUOZwYEQXEvDHX7ylxIMud5LzjNKXu1w?=
 =?iso-8859-1?Q?eOGAoxfvsKEE2hVlYTAIf2XKJB8k7KDHlJbpz9v9RHhLxa13DUkczdMImx?=
 =?iso-8859-1?Q?R+VHhLsAU82QlmvfHO2SwiltrIDCOBZuQLkqgEb7yuov6KChm9Ud9L+NFg?=
 =?iso-8859-1?Q?XhDkb39JF3Q9PS3NOiLeL9SMQPu5YG8MybfcYmgNnEII/S4grgk2UUDs9i?=
 =?iso-8859-1?Q?v3MSNZ2fdxlSMAKOBTGPkrjEwEbB4Vu8YJ6NChLoTH1DxRaXGMuS+t9fw7?=
 =?iso-8859-1?Q?EkXDSIi7eGeQ3DHOw4uZ9ypm0+v5UiOL+1lVOPX3YZsKmLO2MD7aDrNNr0?=
 =?iso-8859-1?Q?iIh31kHuhJyxW7jhRqBnlZ0Qqq/kxCLzRVzZiWOevPMrE77Nkg9o7Oxhfu?=
 =?iso-8859-1?Q?IaAkfhPMfF+FE2QoZ3cvIbtwZckzcECWw/1n6clvGs0VLHpxPLrLE4nrKM?=
 =?iso-8859-1?Q?PtKXwzG+A7DBnAJltgp/Z7k6egI+v6ELYidklSzU+XIw9VDPxp24Zagxpd?=
 =?iso-8859-1?Q?02B5/ufSAC623uTEz0pQS3h7m8QEvrBqNPJkeIPcmfl/ErRvbSv12bZm9p?=
 =?iso-8859-1?Q?6sDhuvknZvLgQV82TX4fGFcU0pgtXrYToeakAKQINzw09eJxgOYqicNQyz?=
 =?iso-8859-1?Q?lwe1aaZFUsNdpQEtg2PuMhrvcrcE49UPrXeIvzOjRsm5Yr+JiARO7B57fW?=
 =?iso-8859-1?Q?Qkq0YTv6IAYv0T15bECaQcIh73cDFVo4N4ku4fwJUZHg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lzZU0F7RQfF0UJkC4s41vyyONudWfhxHssv8c4gNOZ/ccNnJSAtdteP9Ej?=
 =?iso-8859-1?Q?EwOecRNj2s2ly52FCiZg9tFEHb4OdnDELv4XzpAoTS1HcILr4gQbuBLoSY?=
 =?iso-8859-1?Q?gaG+zl0nthSJeUXGDYOvCDPtiAnip110QrxCnOvCN0RLhavcM6E4msQc3w?=
 =?iso-8859-1?Q?8TAfUDtTBYpV7iZZiN86o93t85nexHEENg5YMUU9Sutl2JFAWx2+A8Fkcj?=
 =?iso-8859-1?Q?adQzGUF6IQDd0O1w5NI7ACRAHiWH3Btj4ww9+iGQWUODSKAUbHflIw5k+3?=
 =?iso-8859-1?Q?7RNU2eimm33BxBsJd+fJ+wh5uZlIu/9s+cPruMPWj+StGA60Spxr/HsSGy?=
 =?iso-8859-1?Q?TYHK1MEVHgRaq5iV11wI791voCXVs0a/hI6nQxwQiBXhmYdjN5YDINmia0?=
 =?iso-8859-1?Q?KrEf66sM8jGqeiajGdJO4dk2VZL0gVxreOnRf/SWbl7fv/D6PJy92+4ky2?=
 =?iso-8859-1?Q?ezDLgWNBqovBqbzVrARAVhnzrYySNlClssKuP31Ag8bv46QYK7oxCFZzMT?=
 =?iso-8859-1?Q?IsDZtfVqDIg1wZWP/5M1AjJh4BtLzX9KYZVviEIRrRbEDX/qaKh40RY93f?=
 =?iso-8859-1?Q?l4IG0B5Tg2PMfEVMVNCtNvqvhWD71B8q/vCRcD84OK9872sKYdhl8uFVxV?=
 =?iso-8859-1?Q?gDDay2fwS1OnRof+Vql52MwyFbJDeN8CQ2G0V4+JpGjlYq4dA8cAjNAnuL?=
 =?iso-8859-1?Q?XM8StiqSwJg9ZYXmGKOaEoymUMoqYP1CTj3K82/nEw8XBCBF8N5flC+5qD?=
 =?iso-8859-1?Q?vBSIJVCLTsWmCMgOGqP16df1zNouAWJuYkkWJB1Cle6f716r+GowHRAO1U?=
 =?iso-8859-1?Q?w7J+tGnfsD0Z6Pjthf9whWWyxoIFd+Xzlx4Kk+jNu2rgiNcFtZIp2/ziM3?=
 =?iso-8859-1?Q?3qUvcfL1nXWKzUtBVHrxihukKmaREP1keHfu9DRFKYh+bd7fdeTVfNtVK6?=
 =?iso-8859-1?Q?9FdKMwjmDldltn7Q+NUNmDcYbGEO20c5zz+1E4o4qgkB5Mlhek30HHwAMt?=
 =?iso-8859-1?Q?0/743KUxSyVvwOfw3ZMbaEf2aBz9g0qsNhDGedywzB96+ZiTRP7L/wT/mc?=
 =?iso-8859-1?Q?rS0/uvqjuD7j+dYOXGdAjgHSn1bsLz2071Q3Gn3gp4INCvdNO9wz/f0IXu?=
 =?iso-8859-1?Q?AYR98jQ0KEQDFUrGWpUUFGwmIFuP77enge/PNeE5ljLp4L541EiGWW8mwV?=
 =?iso-8859-1?Q?4vf1isoTjssgNkP19BGY5SmRPHpOLjgXyv2R7V63ChS7Tl+5yHtQhZ/Gr8?=
 =?iso-8859-1?Q?pdodaYB/+39LZwHhSsUAAVpOvz4g0R1Io2i9pS3Kznl41S0BJGgMRa+8yU?=
 =?iso-8859-1?Q?wwdkTgfKsjY0Ms1w2BWq6m8K3Tk4YpvxLi7hg9Tq6yL7zMLAPvAS/l1tnZ?=
 =?iso-8859-1?Q?eJWxBADQblNTEnWhuoPss84g1oDCsiSEnSMvWp8wYjH0iw1/hDGLPMmBCN?=
 =?iso-8859-1?Q?5FI7o8TCfSbDHhje1Qn9JcKbPhfDIFeNRo/EvfresCCNGa7iJ9xTroK8Xk?=
 =?iso-8859-1?Q?PeqNGhplFRyWk+nQxgchLBh3hKlWbomIJLGP/fTWOnqPiqQOhpX+m1yKb1?=
 =?iso-8859-1?Q?QecG5HwFbhXuqYWP241U2oCwxm7DK1iVDnGCg69sruedoNTOe/b5BCYf8u?=
 =?iso-8859-1?Q?V5e4nDBON6aniCswWtFN6PNxyy86X0m8Hs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f64bba-68e0-43b3-bd7e-08de38d5b32c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 16:52:41.9544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZif8G4ovEZn6CamHoOkqjRcz07e4Uuig8ema2XMxWWyzDZ8+xu0DFiP4Lwc2Hjjq7jI3tOCshqF9mcyteY4uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_085251_642903_108680F1 
X-CRM114-Status: GOOD (  37.31  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, Dec 10, 2025 at 08:50:24PM +0100, Louis Sautier wrote:
> On 12/10/25 16:20, Frank Li wrote:
> > On Tue, Dec 09, 2025 at 08:52:46PM +0100, Louis Sautier wrote:
> > > On 12/9/25 18:24, Frank Li wrote:
> > > > On Tue, Dec 09, 2025 at 04:36:30PM +0100, Louis Sautier wrote:
> > > > > On 12/9/25 13:48, Alexandre Belloni wrote:
> > > > > > On 09/12/2025 12:37:12+0100, Louis Sautier wrote:
> > > > > > > On 12/8/25 21:58, Alexandre Belloni wrote:
> > > > > > > > Hello Louis,
> > > > > > > >
> > > > > > > > On 02/12/2025 21:17:31+0100, Louis Sautier wrote:
> > > > > > > > > Hello,
> > > > > > > > >
> > > > > > > > > I'm running into a bug when loading the dw-i3c-master mod=
ule on kernel 6.18
> > > > > > > > > on one specific server. I suspect it has to do with the l=
arge number of
> > > > > > > > > CPUs=A0on the machine=A0(768 threads, from 2 AMD EPYC 996=
5 processors) but I am
> > > > > > > > > not sure.
> > > > > > > > >
> > > > > > > > > The system is on Ubuntu 25.10 and a 6.18 kernel with http=
s://gist.githubusercontent.com/sbraz/a6f37fafbcf9354bbe4eace9e9eb48cb/raw/1=
15da594dc9d7ea99b06754847571e6fd76d9da5/config
> > > > > > > > > (basically Ubuntu's).
> > > > > > > > Just to be sure, does this also happen with v6.17?
> > > > > > > >
> > > > > > > > The only change is the shutdown handling so I would guess y=
es.
> > > > > > > >
> > > > > > > Hello,
> > > > > > >
> > > > > > > It does happen with 6.17. I initially discovered this while r=
unning Ubuntu
> > > > > > > 25.10's stock kernel (6.17.0).
> > > > > > >
> > > > > > > > What is the behavior when you build the dw-i3c-master as a =
static driver?
> > > > > > > I'll try CONFIG_DW_I3C_MASTER=3Dy and report back.
> > > > > > >
> > > > > > > Someone also suggested (they didn't reply to the list though)=
 that I add a
> > > > > > > printk to see what the value of maxdevs is. I'll provide the =
log as soon as
> > > > > > > I have rebuilt with:
> > > > > > >
> > > > > > > --- linux-6.18.orig/drivers/i3c/master/dw-i3c-master.c	2025-1=
1-30 22:42:10.000000000 +0000
> > > > > > > +++ linux-6.18/drivers/i3c/master/dw-i3c-master.c	2025-12-08 =
18:17:33.151567225 +0000
> > > > > > > @@ -1588,6 +1588,7 @@
> > > > > > >     	ret =3D readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
> > > > > > >     	master->datstartaddr =3D ret;
> > > > > > >     	master->maxdevs =3D ret >> 16;
> > > > > > > +	printk("maxdevs: %d\n",  master->maxdevs);
> > > > > > >     	master->free_pos =3D GENMASK(master->maxdevs - 1, 0);
> > > > > > >     	master->quirks =3D (unsigned long)device_get_match_data(=
&pdev->dev);
> > > > > > >
> > > > > > Yes, that was going to be my suggestion.
> > > > > >
> > > > > I haven't tried with the driver built-in yet. This is what the pr=
intk shows:
> > > > > dw-i3c-master AMDI0015:00: probe with driver dw-i3c-master failed=
 with error
> > > > > -110
> > > > > maxdevs: 65535
> > > > Maybe ret is bigger 0x8000_0000, and ret is sign int. so >>16 becau=
se -1.
> > > >
> > > > unsigned int val =3D readl(master->regs + DEVICE_ADDR_TABLE_POINTER=
);
> > > >
> > > > master->maxdevs =3D val >> 16;
> > > >
> > > > Frank
> > > I tried this and CONFIG_DW_I3C_MASTER=3Dy:
> > >
> > > --- linux-6.18.orig/drivers/i3c/master/dw-i3c-master.c 2025-11-30
> > > 22:42:10.000000000 +0000
> > > +++ linux-6.18/drivers/i3c/master/dw-i3c-master.c=A0 =A0 =A0 =A02025-=
12-09
> > > 19:21:52.735366616 +0000
> > > @@ -1585,9 +1585,10 @@
> > >  =A0 =A0 =A0 =A0 ret =3D readl(master->regs + DATA_BUFFER_STATUS_LEVE=
L);
> > >  =A0 =A0 =A0 =A0 master->caps.datafifodepth =3D DATA_BUFFER_STATUS_LE=
VEL_TX(ret);
> > >
> > > -=A0 =A0 =A0 =A0ret =3D readl(master->regs + DEVICE_ADDR_TABLE_POINTE=
R);
> > > -=A0 =A0 =A0 =A0master->datstartaddr =3D ret;
> > > -=A0 =A0 =A0 =A0master->maxdevs =3D ret >> 16;
> > > +=A0 =A0 =A0 =A0unsigned int val =3D readl(master->regs + DEVICE_ADDR=
_TABLE_POINTER);
> > > +=A0 =A0 =A0 =A0master->datstartaddr =3D val;
> > > +=A0 =A0 =A0 =A0master->maxdevs =3D val >> 16;
> > > +=A0 =A0 =A0 =A0printk("maxdevs (unsigned): %d\n",=A0 master->maxdevs=
);
> > >  =A0 =A0 =A0 =A0 master->free_pos =3D GENMASK(master->maxdevs - 1, 0);
> > >
> > >  =A0 =A0 =A0 =A0 master->quirks =3D (unsigned long)device_get_match_d=
ata(&pdev->dev);
> > >
> > > And I get this log, so no change, really. I assume there's only one
> > > "maxdevs" log because there is only one attempt to load the built-in =
driver?
> > It may have dependence missed at drivers. such as clock. when built-in,
> > this driver probe first before clock ready.
> >
> > If build as module, other driver help enable this clock. So it can get
> > correct value.
> >
> > Frank
>
> My bad, I checked yesterday's entire log again and actually, there are st=
ill
> 4 maxdevs printk logs:
>
> Built-in driver:
>
> # journalctl -b -2 --grep "maxdevs|UBSAN" -o short-monotonic
> [=A0 =A023.162996] ns31482903 kernel: maxdevs (unsigned): 65535

Look this instance miss config some resource, like clks. So clock have
not enable, all register return 0xFFFFFFFF.

Frank

> [=A0 =A023.163008] ns31482903 kernel: UBSAN: shift-out-of-bounds in
> drivers/i3c/master/dw-i3c-master.c:1592:21
> [=A0 =A023.166508] ns31482903 kernel: maxdevs (unsigned): 65535
> [=A0 =A023.166568] ns31482903 kernel: maxdevs (unsigned): 11
> [=A0 =A023.166576] ns31482903 kernel: UBSAN: shift-out-of-bounds in
> drivers/i3c/master/dw-i3c-master.c:885:12
> [=A0 =A023.166748] ns31482903 kernel: maxdevs (unsigned): 11
>
>
> I rebuilt with CONFIG_DW_I3C_MASTER=3Dm and I get the same logs although =
the
> timing differs a little:
>
> # journalctl -b -1 --grep "maxdevs|UBSAN" -o short-monotonic
> [=A0 =A014.507929] ns31482903 kernel: maxdevs (unsigned): 65535
> [=A0 =A014.507957] ns31482903 kernel: UBSAN: shift-out-of-bounds in
> drivers/i3c/master/dw-i3c-master.c:1592:21
> [=A0 =A016.683035] ns31482903 kernel: maxdevs (unsigned): 65535
> [=A0 =A018.872323] ns31482903 kernel: maxdevs (unsigned): 11
> [=A0 =A018.872362] ns31482903 kernel: UBSAN: shift-out-of-bounds in
> drivers/i3c/master/dw-i3c-master.c:885:12
> [=A0 =A018.882020] ns31482903 kernel: maxdevs (unsigned): 11
>
> Did I miss something with the unsigned patch?
> >
> > > maxdevs (unsigned): 65535
> > > ------------[ cut here ]------------
> > > UBSAN: shift-out-of-bounds in drivers/i3c/master/dw-i3c-master.c:1592=
:21
> > > usb 1-1: new high-speed USB device number 2 using xhci_hcd
> > > shift exponent 18446744073709486145 is too large for 64-bit type 'long
> > > unsigned int'
> > > CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0 #4
> > > PREEMPT(voluntary)
> > > Hardware name: Giga Computing MZ73-LM2-000/MZ73-LM2-000, BIOS R23_F43
> > > 11/28/2025
> > > Call Trace:
> > >  =A0<TASK>
> > >  =A0dump_stack_lvl+0x5f/0x90
> > >  =A0dump_stack+0x10/0x18
> > >  =A0ubsan_epilogue+0x9/0x39
> > >  =A0__ubsan_handle_shift_out_of_bounds.cold+0xdd/0x1c9
> > >  =A0dw_i3c_common_probe.cold+0x16/0x1b
> > >  =A0dw_i3c_probe+0x30/0x50
> > >  =A0platform_probe+0x42/0xc0
> > >  =A0? driver_sysfs_add+0x63/0xd0
> > >  =A0really_probe+0xf9/0x370
> > >  =A0? pm_runtime_barrier+0x56/0xa0
> > >  =A0__driver_probe_device+0x8b/0x160
> > >  =A0driver_probe_device+0x24/0xd0
> > >  =A0? __pfx___driver_attach+0x10/0x10
> > >  =A0__driver_attach+0xef/0x220
> > >  =A0? __pfx_dw_i3c_driver_init+0x10/0x10
> > >  =A0bus_for_each_dev+0x8a/0xe0
> > >  =A0driver_attach+0x1e/0x30
> > >  =A0bus_add_driver+0x13e/0x230
> > >  =A0? __pfx_dw_i3c_driver_init+0x10/0x10
> > >  =A0driver_register+0x75/0xf0
> > >  =A0__platform_driver_register+0x1e/0x30
> > >  =A0dw_i3c_driver_init+0x17/0x30
> > >  =A0do_one_initcall+0x59/0x330
> > >  =A0kernel_init_freeable+0x2bd/0x340
> > >  =A0? __pfx_kernel_init+0x10/0x10
> > >  =A0kernel_init+0x1b/0x160
> > >  =A0? __pfx_kernel_init+0x10/0x10
> > >  =A0ret_from_fork+0x202/0x230
> > >  =A0? __pfx_kernel_init+0x10/0x10
> > >  =A0ret_from_fork_asm+0x1a/0x30
> > >  =A0</TASK>
> > > ---[ end trace ]---
> > >
> > >
> > > --
> > > linux-i3c mailing list
> > > linux-i3c@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-i3c
>
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
