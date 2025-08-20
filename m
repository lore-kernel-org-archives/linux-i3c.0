Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF44CA0EFF
	for <linux-i3c@archiver.kernel.org>; Wed, 20 Aug 2025 20:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Y+O6MqgyonfRpImc259pdTaDAvxZXn+wWi7aSd/G3Q=; b=Q3S4hZLCt/PyNY
	7d38N0EQNyiZMejNaEwM+gMhefN8qMIFLQrB+ZqrQ8sCcg0u0QBhuk6bIYptu7xNtzpUx7841uTfS
	ASxAMT0mbJtZV1KYj4mDKX49dbosgZdAmhdqLuh70TKrupyORQvnq3YTCxPpk1ugy4yYKOrbYQcuc
	Pmw2d1GluL8HTwdlVXWSE+AIfnWm745DRtGpeh2XDfQ4V6tAVnO6e15IGtYnCCCVA7HUOF7Vj4rXo
	CyzaIV3T9EGaMC4D/flAZkHA1gXlu8RLmUBwcillVaMQvY+S/fddDXBx8n7kGT8VTnKpoZtMVmUIA
	z6JPmERuzOE0IqCN29ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopl1-0000000Esps-29WB;
	Wed, 20 Aug 2025 20:50:07 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolHZ-0000000EKuZ-05bh
	for linux-i3c@lists.infradead.org;
	Wed, 20 Aug 2025 16:03:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/bjpTdOGD3PtkOXqeDG1j4ACn/zsdqt60rAXIVnyDCvAhB4W90VmHopytuCzhl2kCB0aqfI3sfJCBXYtG/yOyNZhwHfo9UWpyPbMTTOr5BYdO9lPmVeg7dRMVIBr8FjUyrXdoKq+X4mGl6RRTqJYFDQ6nBzvpmm70on6hAbpEtgRIkIhhrIOMI32RdUf+G87IymTW+ui63/Oe++6Tv+Ky6hjcKQx+VEC7zQjYQWAX+YkSQ/cBBFLX8VtPqPyHCTI5YsErlTUcOjD39CaKMGEUzU3djg5aB+9PDAFzGviPjcpMq0JxqpOERMbMhQ5NRYLe9SctiTB3JXlKGP59E3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRV66/ngeOK5WsDoXQRMiA9aGaWDezBV3z/6FuQcjPU=;
 b=J8n6s/VQ+XbTJ4foQVtuIZti4jGEinMjSbPrFk3HB4/UT1swcMp34yEzy1tzKolXznoSVNhqqu3QOLfph+/8mfxVIZgDVpYYd5FeNOCbrXgoQThbC0Y87+R3wgiOWzk4p3tvRcrnbh0pG2fxzVWV62tjAsKXHh+USJBMOlwxaxop0OB6yLe4EYbEYh8i7xDvIC6fvBUu/o9hKmRmcY+DjiG3J51OBdyGqAtX6zm44V8NH18e+MomEg/tHoWbZNwGsJmA/OuRMh2WF/LVt1m3cc5P99/huAtNlttL2Zr9MemOfYrHODduQw8BTp2nJ/YstRISWALwI6nYqLvCz1R+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRV66/ngeOK5WsDoXQRMiA9aGaWDezBV3z/6FuQcjPU=;
 b=E1t92OAkgnfXt2Sacb00KrCLjz/K0d1BfqLZkLw0+pE1469RSighvqPSv4wH1Mi1cgiT0U1fOh2YjIXxPPRM1in7xtsXiZzd7GXYLoENAhJqi8SP023JocWlPvrKNXLGB3Yv9eGLEov0/gPXDeq+y/ERPza+6Ep4FPGEQntD5o9/8yVM0HNu0xvfekiL6BTEkEqOf0ck8MdC7cBqGa1rEKFV8dL/XKsEbdrfilq3xAR2eMgHPTIDxdZHLSGKe9MlrEga+BpEEGwlcikayik2kJsssGIQ632Ep4zbs+k5My2TAkbEnGV34ZruzZUdvjZsc/B3iyeKalpQm4QjBZM+Zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by OSKPR04MB11365.eurprd04.prod.outlook.com (2603:10a6:e10:95::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 16:03:18 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 16:03:18 +0000
Date: Wed, 20 Aug 2025 12:03:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 1/4] i3c: master: Add helpers for DMA mapping and
 bounce buffer handling
Message-ID: <aKXxvsLGBCBtxvvw@lizhi-Precision-Tower-5810>
References: <20250820113447.2502071-1-jarkko.nikula@linux.intel.com>
 <20250820113447.2502071-2-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250820113447.2502071-2-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:334::6) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|OSKPR04MB11365:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2fb336-4ea7-4f33-4a62-08dde00313b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w5cszKAeVPXNf0LtPm2rU1UubMjxjppJ2CIC5RLc8N9TPi2rAm38E9Q8YT6O?=
 =?us-ascii?Q?b6cNmkiDDNilb4DBUyRQUiOvnHoP2c+NZ77U/wxkx9BHZKlF1hAzXDrjiJjZ?=
 =?us-ascii?Q?VXc82P1R4yvloj5Me88hA0CsC/7/r26FUfud6PWtpZVnFX6n1fsCACtCTsLB?=
 =?us-ascii?Q?TFtnL2GSYpZgb/UPNyeW1oZkQ7DnsrqLTCzW6QvK/aqrbeNfx3GlAZ9GOKGT?=
 =?us-ascii?Q?rxbZi3XjfAfKXRab1n8gefHOtP8niCPz6NhTVJmppYcBSWZB9w5/sB0jYR3F?=
 =?us-ascii?Q?DSALlgUiI6mFahftnCCy7SfXKWZpX/YSUwfJyZIDGZ5vWqJ/5IyyUQFj9fTQ?=
 =?us-ascii?Q?E9poTfXlZ4luMxkj6bssK8OkjxWDN72v5IBDeQjYsmcEGF8ok2aIfDo5Hg/e?=
 =?us-ascii?Q?+ykOYHGWoN+DsSH1GcC+FQd/Kc/BLAjqi4jzLs75QoBAz7GM6SWeZMaPfrnU?=
 =?us-ascii?Q?NmYK/MA4mKlfpV7DYabLm2NWXRjtnhXXewSKtJdufZXItrDm8j/nsfuPTGCD?=
 =?us-ascii?Q?5BP3HS5fx+2i1kzFQgc1ThNtMJ2nrP7ZFiP77KdXZJe8xNqUwzD6zx6A1U9E?=
 =?us-ascii?Q?8VhGvKVoyV84qqZZk/3AvOjMtZA1g+kLO1JMhNFl5v5Jv4QtowQ/JPKVJmST?=
 =?us-ascii?Q?wIgUv8jnVQsN91RhghkDpqARF26WYUL7pjDnQcStnwO/FN1FSZuWW57d54dp?=
 =?us-ascii?Q?E77evP7sdK15gpSOPSL5ki7DXxb1I8x7QbZcZ1exsOgVYCB2JgZB6z2Ln+IL?=
 =?us-ascii?Q?s5hdatv2MAPgPz36XLUU/iXol0qUJrHjYPiRqSqATZFVMWo1/ZZVaqKxl8PX?=
 =?us-ascii?Q?60kzRSXnfPKMsw+wOguTQZ8KFbchkLOV7cpb8mND10r3B9UDOUwTI7wE1D+o?=
 =?us-ascii?Q?kVimmPG6SNNclgY1iS3XwmfkE5aFxmidsGA2Ei6P+bhcQggT7R+HUnAlUbBK?=
 =?us-ascii?Q?f0Md5zHUtYNDAl46RkJNWP1UzPqj3QmcR7jZAx4OJfVCdiX99+rJxRcwsQqT?=
 =?us-ascii?Q?fULy8AYcNHhRaJDNurgcMmy8/5lgS60KpV2uZ19xJr+hpUmsU0GWSfitZJDS?=
 =?us-ascii?Q?6suVdgoKmf1MAIjf2M5fXtLwWgnf5l7qfGhCYudRZL0SSrqj4QLLxkJ+aUEj?=
 =?us-ascii?Q?yI5T/N3eBlf+Y/rJI2qa9Vw4abu1o1VxaPb4SVIUNOPnATNSzL8PFVB8G4Rz?=
 =?us-ascii?Q?OHkTpPz+F97UNeMIE5PyG7eORAvGamJygGKVP9It06mzyDO6ZvGWuLC/HOq6?=
 =?us-ascii?Q?hn7kx9L/b3+y9heuaRZ9V2GZKBYJ9WAVp+KwgXVfS+bPdUNlGvLmtF8x5Qgf?=
 =?us-ascii?Q?VZxI0m2wX/nvRS3QoNjDJ1upbk6oFZY4f8xj7Iu5/euisKwuZn29JE1mVnFX?=
 =?us-ascii?Q?9HOgtSxXCCr2un7URhY4H+B6X/YovweBiL4rswy07ORzcSlJEgTxJ25T2CtU?=
 =?us-ascii?Q?S1YmjPEv3t2rxV+EZlMVJdTyXd12A5dJQTKIxDoTpym7yUBYSGWd2rtkLLVe?=
 =?us-ascii?Q?e9KlGQHg3PKp7MM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YA56NS55c25YdVFkXvQYOpK0xymnX3dCnoM+E6G3IUNU0pLrO4S0SpbJSypW?=
 =?us-ascii?Q?qCePIm0REC7A5Je9zUfb0nRetPvxqklUaVuw13rXNZfqGZCdqS0PlO+btyxU?=
 =?us-ascii?Q?7us4R7mNzfhHQUDuGxNqnMyxJZlp1RLOngA7D3KhtxD/2FRFs0Vhv9TRNdZl?=
 =?us-ascii?Q?QMYzVOEWvFked0GFuz/jyHUleVJvOS9/sDLOdCw0oVeJqzsQ4+ji96htRu+1?=
 =?us-ascii?Q?tUYGPndW5szikxGZmprRX2r92kEgi6iTvIpuAltKffB3frEdOkfd9Qlp5FPj?=
 =?us-ascii?Q?UoPAaN9oJsZDA6YzOgQD5+KFN1BFMj29xkXILLI6OtUdqxvDPqbCG7wUrJfA?=
 =?us-ascii?Q?nYRCtPkC4Tf9viPKsyDJmreH6OvKv6KMWztjy2BzCl2uGVeMuz96KyZtgG0g?=
 =?us-ascii?Q?o6+k28WllHWr0z7441lvNObGtjeBpheFW2sE6F84MZPBSdNaEAXc56E2cEFK?=
 =?us-ascii?Q?eK1XIxZxjVUWOEyCmJzzuI0sJJivXGBR6SavnCfWjVLPVrV4gLLJipxf9bOs?=
 =?us-ascii?Q?hUOoAJzvYeaV1NG66F6CgIcIj6XG6K+RrXRMJvbZKhosgepM/tRKOyzRizjs?=
 =?us-ascii?Q?MGUQcwrqLmljZBfUO6GqSb25q69wz4TI0nUplgVwjxKVwfiy2rXQEUBbQx4Y?=
 =?us-ascii?Q?HgFUsxqG3MFsMTWJNbTWbVxVo9xrLkhD69RY4cSQ38dpZVaapM0JNNcZRSZT?=
 =?us-ascii?Q?JuEqrXsn2jhU1Jay4KMdzbQbPgXi6L5WDCgjj24Rcd0XGYpwADznloSv/RRM?=
 =?us-ascii?Q?MQgpGNEkNm/locyKWoXQEz7u+Cy/iy03AbI/usptHknYgSgbgfDmjrBa2Cfw?=
 =?us-ascii?Q?1c2hPi6W0apFnA2Z8jP6tFGNmNcypMz/8dIYz4xK+kUKw56+bdxf0w0c+Pec?=
 =?us-ascii?Q?oCe+LXHsF3pTh7bv3jjARp3PbAvVv2zL8ZaVclhW0yVqWyUZPu9pCozjUCzp?=
 =?us-ascii?Q?pQFdXwU3IapQqDsxcvhw9jcN02Pn75Mo+wLU/jYxri9QcWTJuhA3cMsrwFg6?=
 =?us-ascii?Q?fRRmuE/Gvt/pFhPLx9pMuUEuL7jj8nxdBjjHLWzPTJNN//wpCy7LMGdcNNjg?=
 =?us-ascii?Q?CNTay3L5otL9U27Z9JNU8wl1nQsBor5TXSlsIUfeqJ9SyLEmn9VlTorSgbhz?=
 =?us-ascii?Q?PIt8bFl6J9uzUmofhXOxesCGyyI4qznnNZCDwi4k2N0UiVtAHXIpIFJGz4mP?=
 =?us-ascii?Q?VBRpQYRFEBsa3TE8HcBHL7tfBbSZNKjYLBi1wUwQ/oR+e/QIQYcoNb7R3REk?=
 =?us-ascii?Q?Yd5qXqwMCGOkEnPCfCvB1Q31m4rXDQb75Xj5+AomGsdyjiDAaJcQaWKooWNr?=
 =?us-ascii?Q?4RJzk6DOl1rn0QCkXex7WaSsSDH7xF0IbygHwv7enUtpGQlTuwbID8rg2xHw?=
 =?us-ascii?Q?TDTfre1uu/Ic7/r8E5eU6jCGwu9PrGD1GWzn6rb3KEbnk/i1aidmiPOgcmx2?=
 =?us-ascii?Q?px/7gFJqTjOTwkF9ZmycDyV4vDH2S7RLp6wcWL8nTezsF/AA8hUdOy5ztzT5?=
 =?us-ascii?Q?a7ktFwUIDFVt8XVFXCU5O2EGfzClBJecRKU0RbK+XQHIUfdy7KpAvLQhE7Ha?=
 =?us-ascii?Q?gGMZaI6XXinNDx486p4oqvUxL2nvW4OJArX6p5A3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2fb336-4ea7-4f33-4a62-08dde00313b9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 16:03:17.9963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eh8M4B8FXNGc87qv+1eL38MnzsqkSM3NuNnRxyzu7GwheRTJM2ccubiv+cDXI1un29TBY2QGX0VnlxOB7Uamww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11365
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_090325_059474_81B1CD77 
X-CRM114-Status: GOOD (  16.91  )
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

On Wed, Aug 20, 2025 at 02:34:44PM +0300, Jarkko Nikula wrote:
> Some I3C controllers such as MIPI I3C HCI may pad the last DWORD (32-bit)
> with stale data from the RX FIFO in DMA transfers if the receive length
> is not DWORD aligned and when the device DMA is IOMMU mapped.
>
> In such a case, a properly sized bounce buffer is required in order to
> avoid possible data corruption. In a review discussion, proposal was to
> have a common helpers in I3C core for DMA mapping and bounce buffer
> handling.
>
> Drivers may use the helper i3c_master_dma_map_single() to map a buffer
> for a DMA transfer. It internally allocates a bounce buffer if buffer is
> not DMA'able or when the driver requires it for a transfer.
>
> Helper i3c_master_dma_unmap_single() does the needed cleanups and
> data copying from the bounce buffer.
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c       | 73 ++++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/master.h | 26 ++++++++++++++
>  2 files changed, 99 insertions(+)
>
...
> +	    if (_T) i3c_master_dma_unmap_single(_T))
>
>  int i3c_master_set_info(struct i3c_master_controller *master,
>  			const struct i3c_device_info *info);
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
