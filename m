Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED59F94CC1
	for <linux-i3c@archiver.kernel.org>; Wed, 22 Apr 2026 04:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5bd7HWhT13GCMR2KZ8NJdQz92bLOGUqGX0MhXzIYukU=; b=JBbipGO/F23Vkh
	bCCnnv2tHZE871h4pMPUfxS+nTm9c+F9Af6UvdW32w5q/hOie0SevShnTOxkGbOhvnjEbxjRNovAa
	mkroujv2b9yEuuLgMZhK0y/UoiUj3qzNFhgPIc9R12a1Dl974tVTyqCPC7LTJ9srGZoJpnWggOSxD
	mvR/obAEkkEkURW2pg8moTY4Jo7Cq+XZMZvbBfgI9r9zd5U2kauY/dWPaHDeetcovNAfH3GIWF5Pv
	KFdIOu/E6HaA8bmCvzT9zt4I59cIt/oG+XM+jxZ2zKtoQmUVIun4SVgGn9Ede6TTdgIAvTFAXsbHR
	y0oSzehGQqEmiiwyrW3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFOoQ-00000009ZUT-49Hh;
	Wed, 22 Apr 2026 04:03:42 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFOoN-00000009ZU3-2Ak3
	for linux-i3c@lists.infradead.org;
	Wed, 22 Apr 2026 04:03:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRS3tbTmjNUvqylAtX6uznxbtsc/U2qUqHE5zTzQdLNxFkrYPvfnfM+V55Fqwd+5fNou8PkLO1z5sqgPf3OENS6rVweAN0zFBWrWM3dR3NLKVj9eR7XoRrPZ8mJg80EZz24l9JNiS8vvZQfSjHw2AhyXFdGYRH/Az54IdNpd2SjOdEjwmXAhFkE1LwXECH5RYpoXoeSK9XIvqEJlkovTThW7rNt3/u403x+S6u/sgFYdURvJ1A3eOhp1zjsibWT5y3neI+Eia9lNylQYaihXkRJvFAjmYOSQvw+AAO7LJznaLzb5RG2ltTxH4PzACZzg1h5HlACMRfQoZX9q6ktIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeEm7PpzWjb5/pBzNXHlMUsSCIsSKXL6VIQMnise8ns=;
 b=bjJpUhzVcn2NNfE8nDx1NLwrVXvDCgTeCuYat6FTT1BCdFxgDIp/j5o0BONSzNYQjuK98v3sY1oRoxA/k8M08FO28BV8vWn+3EOHnnzh/q5wLbB+FJGKY4Z6cLClZqCWX0JEDpjX1y1iIBGfK+lU5Wt28Wwr+JkpkGMGQv6N2tfXSfO9x88Lqa19Qb7e2X+MLIPA8Xf25chGOfWFY7TU8KhdtLdwKKUz5yCfBOoKOiZORTQNGL/5KFesGk7XoAsi9v5oKjYVd3m2fEp7dGgAhYNOGbiW+I0W5/ishzbvyw/MQNAbxeXF0WUYkebkbFv1KKCUjGzEXAEgDQN3ce12Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeEm7PpzWjb5/pBzNXHlMUsSCIsSKXL6VIQMnise8ns=;
 b=WbdGR8MQeITe5v7csrNE1B6BfekozgwQ1I/bsfH4jAZBnLj2oyMDkbjoAgtkEajrF62gvPgtqy+jiFIDccn7NF91KoqJU5NepQenAVzus/1IDWahhnn0sFLpvBoa8b+ALvulM5DJqIjHbz0oYlrFOhsXiJtGclq/CqP6VZHNG4vTYdZMLtLjPHOvqO7QsuD4CVCcJ5PBwDdGKN6rlmd+NiwaMmCmWMbmxGTzcYKtuwSVLyDzu4mHN0fPptHtkLd2JNnQQMQqSSnDLu7/IdhUt3Ucxm/69IQ/JZqVDkKY1YReyW+iRaqMW32LwL+rNzr5crJDQ03l9dZFaaKm4xR/Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB8378.eurprd04.prod.outlook.com (2603:10a6:10:25f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 04:03:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 04:03:35 +0000
Date: Wed, 22 Apr 2026 00:03:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 01/16] i3c: mipi-i3c-hci: Fix suspend behavior when
 bus disable falls back to software reset
Message-ID: <aehIkkRrmPWIGBTR@lizhi-Precision-Tower-5810>
References: <20260421175435.122094-1-adrian.hunter@intel.com>
 <20260421175435.122094-2-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260421175435.122094-2-adrian.hunter@intel.com>
X-ClientProxiedBy: SA9PR13CA0115.namprd13.prod.outlook.com
 (2603:10b6:806:24::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: a0cfe902-57fa-42ff-2c8e-08dea024202e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: w+5B9yYB1eZ4xoGj8Ses6WezCDDjbz4/U/6K+gIlD/7r8qSE0Jv/gxZc8a+pCvxzQ1NugSmx9b6nAvcPkJoxHI30fYPfJRPisSJLRIhldn40xSw1zzPwB50pwz9iFKSDUaOtsBxGtldoz6rrTpn/lZH2HzfN6FoAbBFmyPo3JhnY4bD1rRiDLHA6GG5zSY31DOa3SkT9JlIpEJjnXYD1c2qvjB4eueqWBTytiqObvrV4VjJgzHL/bLntoRCqAzYIfTaYgLdgM0k3Hf8XGWnyhZDUW2Nrggttsd4rIABjk/iwsRhOO0GeGP0yhm+1fqnbtBiwMj4YSzURJpRYMBQj1JohusHW7+nWHhrZ8Jz3ODn10iKlEz06xkir+rW6ONv+fMfdWwE+Nbw27fk+Dr+94XlFnCRKW65W5zpFKJWDYi7dB6vAiknLo6sqr0hLvCzjarU2Sk5m/ihoRjV5nItIXf/0QFuk0U6X+e1adW9Z5bBBT318nNVXSc8R9rp3ZstvkifklCa0+NF/sWvD2talqc+FtAuktw2Xe0S+iuciLLXeltr8iuSmSTBKmZwQFued3Wdf8lXXjPub9KiExR2eorfAZX2BetE6lplbT7RvQSSkCXJ7XWa55TyjZWfL/vJKkFUZBTGan5MwaMLCOZ1kGf0+d9Rmg81Sv9ME+0g5vQ9gepAku5zvVh1+kw1rNPSRhlCANyNXrKnB65Xog1Rvpzkp3Ab1exToFk79qvyZNj26u3ZpbBvlpBsC4Tz4ojM6A0MLJ/ij4BrJoPABK+V4kfMP4IU6pnCsejHVGNlW7BQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5sVJWpryGE7qF4QYKjP1THSk9G/hIZ+JYhYgBqycgx+hNB2A6saG4IYNyczW?=
 =?us-ascii?Q?YdQnFSSM5LVJIfdP/LTVAOztf1r1CAQNX/TfIa5lcpJdKZRCeSx759kSnwME?=
 =?us-ascii?Q?G2IUhmgzIl2HjKlV4puUt2/536O+PGz/48SBiSZyLw1twokkkkQEgVV9voHN?=
 =?us-ascii?Q?RxUOnp4stKuBwcf5xajs9PESSDlgg47jPEB3lY+2e65veRpzYBvRlQBtrFTN?=
 =?us-ascii?Q?c1tXb/B+g8zr2Ple5PYvScvdCHEzLuHiIH61/NK+b4lYMUDxvUSoNIzbn7Lx?=
 =?us-ascii?Q?ZB3rbei721yEzTOzw3zUoAiGXrnghEME1fIfE3UVcb1SCwkMtNoGz9zYwbL8?=
 =?us-ascii?Q?jmWI2/HddRghjLhkWNkE4F/2gYPx/a9ldHQHtMsVR80xIanG9IYN5xU3hqkg?=
 =?us-ascii?Q?oIjx3IwqSWRTM7odaG7jK0xA5ky1ZXRxWvNlnNKAV9aUrjLhr7ioAo5aRUqU?=
 =?us-ascii?Q?tabMHzi9lpP/gWtfL5+fJ91zXmcFtPbZEeRLg4T7zpd0ekMULztiNWeUv3eC?=
 =?us-ascii?Q?c4CWGYQin7WbZo+CgLmtAR9p50ZTT+fuZi+NNjuN06YvXogh+NpW4KwDCfaf?=
 =?us-ascii?Q?1ZruISUzD1IOYYFGRVb2pikzEWnSf9vNv/dRix4827e9onS7AD7INSiZCCJv?=
 =?us-ascii?Q?9Kc3ztfzorWE50IxOrKCm0AoUI0M/vN/0Tprc4er7DPLFCS5V5rFyow6ePQh?=
 =?us-ascii?Q?4OtNGDGwnY7QZxZqGqtE6Sx0SVsguZ9EFuhyB/Dp9/0NvgSZbZS2947zMTgM?=
 =?us-ascii?Q?4wz/W0Ro/HhWAHwZpWezYyJd2t0PQ9A7GXQB2ZYhPCqn9xCq5Sagkhb5MEO0?=
 =?us-ascii?Q?8ggqG8Zxu7kf17khT/M1OSn9Y5n5xZLetdRPyENDSbQA1be6I/VvgHlTuSI9?=
 =?us-ascii?Q?Drc+QMXEbUubogyx5IfuhHJs5gLm70iz26C+hhn3sjtYwcSr1EQGEEzMP+ZI?=
 =?us-ascii?Q?w1qXpBRUjLYf6cuhYZSlka5CBkLR7GvOvRuwnOo7LW/mQriVj9HI3fHmpKvF?=
 =?us-ascii?Q?xvLkhD7bCTIWILYYy9bucD30EuQk0JF9dPWMseqTpKtp9AFHEu2SqjVnp3n1?=
 =?us-ascii?Q?x4UK8aL9VwYQ3D7aKO212y1TPVaHBG+QDARGfTXGsfFdxaVT2bh2yXoDxRHp?=
 =?us-ascii?Q?wg4AYNlBnycY3/TCs820r61MNfoNQ2IIs0VzY0XNGv4IfUHucC5AfXXKMwIz?=
 =?us-ascii?Q?sp2QgZ7K2akYzTtKi6jiRQfz4s15oIaEJ8RF6iOahz15GZIzUTm3xPkDyB4+?=
 =?us-ascii?Q?e2BETlbvtQZQrdpD5HZBYFr2pHM3lyxlcNiOsg8tNdmzb+LJXFxBu0dKBNz0?=
 =?us-ascii?Q?awjMcafyKP8IhOqay/KxbIvAlfR2CGrqVD3IA42+rRrRGy5wbfx5XBhSv2pv?=
 =?us-ascii?Q?JDgpolbVr/V4/K/4qxQTR7bUS/byusZ+2Rt176oTgydu5QZOKVzCyD/aOUy+?=
 =?us-ascii?Q?KZNMoi/CxySjyRNQnaOOOsZ3z87zIxAWE5Sbi7m7ag2qiRD3I+qTw+9uOw2T?=
 =?us-ascii?Q?KixYo37a46kaRRA0V7ybCBAItSwPv8DBdxbwkFlYnbhSPwLsxctFD6inByO/?=
 =?us-ascii?Q?xNEwcdBOoMxmGkwGtVHhEiTJPfb59pAe7XnIy06/d7dsaR87nM9zvd6Ry4FQ?=
 =?us-ascii?Q?Rq02f9ElqOooWFlzHo0W9B5Sd+wIZm1nFZQsbZDLwrStonHG+cogAYaj4+n0?=
 =?us-ascii?Q?eyeLBnpW9EA92LJcIyrCYE5TNb0cBEqVSV/UxBGK+5asauY/hBeWpotKsj1J?=
 =?us-ascii?Q?C3lA6Rz15Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0cfe902-57fa-42ff-2c8e-08dea024202e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 04:03:35.3944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxjcL9TZveSBoJMek7vml9HV0v51m65WuLGRQKmagNKfXyV9DVZwBfhN4qyoQLK+i/dEQYEcmSaEVZOjj6SWzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8378
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_210339_584438_1C2E476E 
X-CRM114-Status: GOOD (  25.27  )
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

On Tue, Apr 21, 2026 at 08:54:20PM +0300, Adrian Hunter wrote:
> Software reset was introduced as a fallback if bus disable failed.  The
> change was made in 2 places: the cleanup path and the suspend path.
>
> For the cleanup path (i3c_hci_bus_cleanup()), after software reset the
> function continues to do cleanup for the current I/O mode.  For the
> suspend path (i3c_hci_rpm_suspend()), after software reset the function
> returns early.  However software reset does not reset any Ring Headers in
> the Host Controller, so returning early is not the right thing to do.
>
> Instead, continue to call suspend for the current I/O mode, which for DMA
> mode will reset any Ring Headers.
>
> Note, although Ring Headers should not be active at this stage, performing
> this reset follows the procedure defined by the specification and keeps
> the suspend path consistent with the cleanup path.
>
> Note also, i3c_hci_sync_irq_inactive() is still called via the PIO and DMA
> hci->io->suspend() callbacks.
>
> Always return 0 because the device is quiesced as much as possible and
> returning a negative error code would unnecessarily prevent system suspend.
>
> Fixes: 9a258d1336f7 ("i3c: mipi-i3c-hci: Fallback to software reset when bus disable fails")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Changes in V2:
>
> 	Always return 0 from suspend callback
> 	Amend commit message
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index b781dbed2165..afb0764b5e1f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -762,15 +762,10 @@ static int i3c_hci_reset_and_init(struct i3c_hci *hci)
>  int i3c_hci_rpm_suspend(struct device *dev)
>  {
>  	struct i3c_hci *hci = dev_get_drvdata(dev);
> -	int ret;
>
> -	ret = i3c_hci_bus_disable(hci);
> -	if (ret) {
> -		/* Fall back to software reset to disable the bus */
> -		ret = i3c_hci_software_reset(hci);
> -		i3c_hci_sync_irq_inactive(hci);
> -		return ret;
> -	}
> +	/* Fall back to software reset to disable the bus */
> +	if (i3c_hci_bus_disable(hci))
> +		i3c_hci_software_reset(hci);
>
>  	hci->io->suspend(hci);
>
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
