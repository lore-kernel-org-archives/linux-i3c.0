Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E714BF8E4AB
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Apr 2026 06:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nluYcdj47/q/8Ka66gGNjZWBnWMnCPtRazb/ausZyEU=; b=AIBYTpYXEDjBw8
	mViVqb1CSkvILY4OyKr2AAMpvR+3MldOir5ulF4Bxv6lunVbO9hyhjtd0n7VUxjHg5fbH12wVgpxC
	rJ+UqEqQ+C7MWuIPT+/GzMvPmWcUZuhUnmaXLzqBOiBdxqg77erjTgJiGcBJXrl2z1paVJP7zm2SU
	p3XCsXa3Bgx2jdOjplnooc8+0KgkwT8izMktrpmK7jKqto5dCmqXKdoiGUPtOPWh+kKpRrICCXzGd
	53fy96itBGUljVNWuIhiV6OUHVOya15Wy7PzdwbaJG5EUnsjPFtaFiE5d16k5XwDOPzIZKg9kzZEM
	rqHyvygC6hPgKR2zYj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcpf-00000003Xrh-1pRI;
	Fri, 17 Apr 2026 06:37:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcpe-00000003XrT-1xJF
	for linux-i3c@bombadil.infradead.org;
	Fri, 17 Apr 2026 06:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pELu7H/2Ibx+sUwLab5QBfvUbg52Dse7FJrGbNPmcB8=; b=hqO8b8NjxPhqDOozOU20wwv8g4
	ckAUVZc585gCi2TXoCFMlaSqUrkCvT//GunVCFO2kPMfcvfM65DJl8JBND8pLJIWdNn0PBtE/S2hC
	BdkvDtFunRWwo5lW+z8YRyRHq9XqkA9UD/YIqS4izD+x//nxJx0Y+BJzvPaQyokmLXkjPiwYg4kPE
	26bniYs2Za/Pkv631qTYK8ANaGkvo1wGxF5LqbILzN3KkhL7DxD4H0UPSGpceeiyTEOCO3r3q1Fuc
	puUTouLuuMcwYV1YSA3HwE0KM+ty8NwaqGD39rNGIOjevBQCtqI9oPmXPZ4UEEgbsMQZOaRP0CKSh
	KatW1o5g==;
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcpa-00000004pp1-2uJD
	for linux-i3c@lists.infradead.org;
	Fri, 17 Apr 2026 06:37:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmFT6cOMZi15NFfVo5MQHOqBHugiHFQHItF3JA3hOwM0nEZyTzCu8hUExcpEDD5zwYR/LrnMKwW9ODP/XFdB6RMAApASgKrubN4aQf6DjVN/imsNkW4jJDg9rKqIg018N+c77naqD1PMOuPY9YdIn05SMkDU9Q/W02ypJfpeQRbc0TkRyVDC22hSHJ+vciqaCloevYhj04In9BCR4W6RVWDwcG3d9Z+Zw2Ewp3YLEa6QPnJqyZdQSjPsYnDZKceC3CxvYXlagCeCAfIfKCsBeAZ+tB+juEIAe7v0gy5ncq8YegV4o/7kjJbAz5tm6VNpzv2yJ32KNz+hky9u30uETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pELu7H/2Ibx+sUwLab5QBfvUbg52Dse7FJrGbNPmcB8=;
 b=joxYjDpm0othzBkjilhOQGJA1cLPzmiTu7+yH/MvOwrJR3/1xYEXeyNxZNHE159ucyaNJEqEa3KbjqUuQgvFCTTJux7b+pTWwgb1c/RD1kJmLDcFV+9ZyknzXyM/mujAbqVLU/9GYKVG/8c0qWMi/zNbAdKc73OdLI1CNMsO/GdI1hwQBlzPgqa8NPVoeKX9uO+4SCiAipFhGC9rreRO3PcnErxL8gtTSUZvjQOVsfCuYcnzOV+/EYMtaR3rN47PuBY+aEkCLLPjkZ5HrRusPpEKujg3Xrs0BKTwMsAk8TrbTtMDuU9Xz3R2qohfhxF/OYr3DiKfwEkJNmXobpssvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pELu7H/2Ibx+sUwLab5QBfvUbg52Dse7FJrGbNPmcB8=;
 b=m7HR/jWHgYM4yfTQzrs3aDWaNpFX6szjCsEUcXUkqh14TQa6iTb3UfTckn1fep03sgVWWH6c8N3f9IPQSioF77zIXkEtRboYz210qXWKgEOhv5pQFyF4zQOc565o4TvXOzBaDKKnhGxJqN+YAyOqMWi8dT/BWiE0V2oLFXFVXT67vMnt5vtH3x8bYEK9w1K6nYmIoFnCu/ExTZ/lmY1eGdSMDH+CgB5y+47556mHQGDFx8LnDDbpGuSL2Of2K6AXgBKp7Sj+VCRw6FnJbSzrD7XdQrfAzJE+Y7MEpHEYzyjuWq7D1r/lMlGV0JUrOl8sJhA2ZCdv6kEEWSwBcYfnUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7795.eurprd04.prod.outlook.com (2603:10a6:20b:24f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 06:37:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 06:37:30 +0000
Date: Fri, 17 Apr 2026 02:37:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/16] i3c: mipi-i3c-hci: Fix suspend behavior when bus
 disable falls back to software reset
Message-ID: <aeHVJO0HfHcfI-TB@lizhi-Precision-Tower-5810>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
 <20260416175704.41217-2-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260416175704.41217-2-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P220CA0066.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7795:EE_
X-MS-Office365-Filtering-Correlation-Id: f725b9e8-5de9-4861-5ddb-08de9c4bcca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: b7Ojwswfy7goPfRTo8LO0TANTynT9cxg3UlhUOYGYUTscQcigdCi+t95xkQuGZ1oZ76SQZrHvexG842l6XsneACOpxMoEj+R2ddVhEB8YWKfz8W5HNhkFXDPo0g5x8mzCl2o6Lwrrr+ONAqWZndl3k8zuwjdEtYXBbswBdwfdUG8RTFWOJyn5xfF56ZhwpZebIBCHARh6kBTn8GowN9PKV8IS9gHemJC8o38I0pQax7kIzv3RWwKoTPkiIovq0ewoX3GCZA8bxTSYV4yqzlMwR2c+56hlS7ZJW4mDyrDpTnwLbVHj4xWtFNfrvFQ5xx3Cm0p8gyCYiMHLFyutpQRMuoQuk8cKikb4TLvSSV1CyuxCKh8a3Yeyh3ZBVWpR4yar/9RCUR1pO9SIAw8yKYfpvpLBrVE5/BwFuohx8afcNinjAdBM2/1M+uDgUP9su4/yVA6MTl9UBVeBiAtMvFkjBi0bfquLz7uUP/URyjreXte4S5ujbuiddRtY4IK8xJ+vyDcecjZxEp6bXKBCkURmHpHt2HYbPUCLz7Q4QiMZ8vlWVvMnaAuPI/fDDm6/z/oKD0IWd73viz81jYIQZWMSIKwTa+mXiqqUouYmxJMwMtwY2u62VkHwxy0rhCn/jzztRWRFMTUKUhDpuulTRrlPGtqnw2RAR1VzghYTAbZmiHldeXw35TNKZm1to7GlI96HDu7mDhxsDHdNpc/OG9CTKtnAAO2HNs0MwvZ4WZsbIDY/lpyG2zfdl7TmyDdfLOT00D8DA2my7VNAK3nnqlVEEvta3PgyrjO0O06aJjROl0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6lsrEG9DLpvygFn4KADW1SGf61EXDbH5VysA4Ypftl1qH8wMRNOql6A6GGXZ?=
 =?us-ascii?Q?Lj1B76kaZnyYp1j0BHTnewgf5DaeJDkHXPvsvXN/c1cCSu50Z859b+WU7E+K?=
 =?us-ascii?Q?/ZKeXtfrnxaTVRkMTOgZYRDf8vLb6VjOIGcsXHmTU58BQyWTUG2Hacni/Mqi?=
 =?us-ascii?Q?akT/KuN1rluE4jdX9QeIr4zatcsMqWJ7kU2T2EPO3FnTaxT7mZ3Z+3DVK2L7?=
 =?us-ascii?Q?pars4YvSocfl8t0U1JbRqrpy0QhmeHe/a0hGHRkzrwAAC/Fpy8Hx1KihLjQ6?=
 =?us-ascii?Q?2b+ULekmIwzX7tQwvMJ4YLXhBYqEf/lyeH9uTEr/TRPxJPlWPK930aD7tACA?=
 =?us-ascii?Q?GBJK+0gss0TGVU6P7hbJrU5biBo5vEYLOvaHAiPZHh5/7QLu1iiU1YIheP+p?=
 =?us-ascii?Q?IlN9+c6vDQ4ubzG4xA+tGFuU6lC+R3iwWxDtlwEv6AdRrfj/VeWH597c3vU4?=
 =?us-ascii?Q?mjZoQPbyvYmNQVYpiAY85j3EfyEnsVOlbcE8X8HklRWPH11kUSpz6tHwGWKA?=
 =?us-ascii?Q?xGElg0YsE/6nXjDNC0uawRmKvFmGstctsOM2MnkVB7477IB87vVsoWzczISm?=
 =?us-ascii?Q?8717OYQU1CzDoCY8Dg9C3i3hjMh++NElakl7c4dk345RFxin7Vyv3OVOBGl1?=
 =?us-ascii?Q?NEpKWR7mO1iPklDSKVGtAtVZ/2nd+jsVXl5DXWebAxg/P/AnkfifOCmvtgtT?=
 =?us-ascii?Q?tnSUiL4Prt23RgWtxjNKRVu00aMK0IgGaBLeOJxPHrH+RVsCMNqdFlE02FYT?=
 =?us-ascii?Q?m38bsi0r4g3ZMUJ7D29qxHDx+EScSB4Xs0Hr6KNJN+ekAxQ27jLJUPhuHTIb?=
 =?us-ascii?Q?rfZ9uIqLawB/mQXeRchKM/7iKxOxAizMifSVOelIlhNaRhoR5rAFqLnv1ELt?=
 =?us-ascii?Q?d1iWYGW6FO+9uLR0vycpioBLWDeJdvA1TOCGwIfRMxOMXO7o6Xn2ci+GP9n2?=
 =?us-ascii?Q?vMg3JSVClR8HKIlfsSBsT0fnmHj8tBN22oF+5ZycHNvgcyK+n/0i3Vl+ZiZw?=
 =?us-ascii?Q?huAPCyGPbP/tNzRWhRLdCfvuHIeQrxeHCoPwrAYh4ln7Q0W6tP7GHuuYPgKr?=
 =?us-ascii?Q?2+EX7hmkf8MMuqZp8CJglb79kynmMcQf1e17or7CH3MYT+aLYJl3vYmOR1za?=
 =?us-ascii?Q?Z+8ySNAZk8Tey+m0Gy+4zxVIiYpUSEIgsr2u+T8U+H60CWJPrexL8ENQnmkw?=
 =?us-ascii?Q?QTKrrXptXUBqloYSY1QRgHtW5qRC1SgCCU5YAy3kPgknHd3yHfRpOqlXdilp?=
 =?us-ascii?Q?eypWSWSp5ouCBn2vfTRk+HNN6PI0owAnk5tRikWLqR+MDb5k5qWIPIt5EdhB?=
 =?us-ascii?Q?7c3ZKxrhrFNZxBv7WqqOw3N0IyGELKhHzKyr+/P4clDiD4MK3wyOe4Qr9Q7q?=
 =?us-ascii?Q?mNCpjBZlsU6/mvFJgNtIJ1OhLVjTGqMyloStv80xrpB20wYVDtR9++6kxfVM?=
 =?us-ascii?Q?ybHl/prrvCJiVPT2Ielrxokvj8DA3aDCTDvzCADKcQCm2r6PdwduPkVJA5ZI?=
 =?us-ascii?Q?bFuzkzF48vM5eiTN17lOwa7g9hZB7/tgZaIQxdsiFHbsZxowLJsUlxB9vWPG?=
 =?us-ascii?Q?F0GNfSHKvZ7h6f8gAR2h1fPD6LjSG/hGyfy7I+94yHY/77oRMlM8nPnxfJUL?=
 =?us-ascii?Q?Rhq9wg9EV/FkgMJaizIHdk/J3iXgCoICm04lk2+rgpU4mWNdb0skQ7u/Vsmb?=
 =?us-ascii?Q?XCEvWu1q7sOl4hwR109kK50uRV/0hfy7/Z3HoEjKTmZ2xD7w?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f725b9e8-5de9-4861-5ddb-08de9c4bcca2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 06:37:30.5288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: innwa8QweQTgHfNZuOwLbWBH98lNkHHtYxZC3fQc+NMxVw9VfzL6xvMcDFLyn/QunWC4kJjjbxWLqwRxSX1n+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7795
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_073734_968675_EB18AEBA 
X-CRM114-Status: GOOD (  23.37  )
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

On Thu, Apr 16, 2026 at 08:56:49PM +0300, Adrian Hunter wrote:
> Software reset was introduced as a fallback if bus disable failed.  The
> change was made in 2 places: the cleanup path and the suspend path.
>
> For the cleanup path, after software reset the function continues to do
> cleanup for the current I/O mode.

Suppose this function,

static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
{
        struct i3c_hci *hci = to_i3c_hci(m);

        if (i3c_hci_bus_disable(hci))
                i3c_hci_software_reset(hci);
        hci->io->cleanup(hci);
}

"For the i3c_hci_bus_cleanup() ... "

> For the suspend path, after software
> reset the function returns early.

"But in i3c_hci_rpm_suspend() ..."

> However software reset does not reset
> any Ring Headers in the Host Controller, so returning early is not the
> right thing to do.
>
> Instead, continue to call suspend for the current I/O mode, which for DMA
> mode will reset any Ring Headers.
>
> Note, although Ring Headers should not be active at this stage, performing
> this reset follows the procedure defined by the specification and keeps
> the suspend path consistent with the cleanup path.

after your patch

i3c_hci_rpm_suspend()
{
	ret = i3c_hci_bus_disable(hci);
	if (ret)
		ret = i3c_hci_software_reset(hci);
}

look like only remove call "i3c_hci_sync_irq_inactive()", how to make
consistent with the cleanup path and why remove this call is safe.

Frank
>
> Fixes: 9a258d1336f7 ("i3c: mipi-i3c-hci: Fallback to software reset when bus disable fails")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index b781dbed2165..bb8f2d830b0d 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -765,16 +765,14 @@ int i3c_hci_rpm_suspend(struct device *dev)
>  	int ret;
>
>  	ret = i3c_hci_bus_disable(hci);
> -	if (ret) {
> -		/* Fall back to software reset to disable the bus */
> +
> +	/* Fall back to software reset to disable the bus */
> +	if (ret)
>  		ret = i3c_hci_software_reset(hci);
> -		i3c_hci_sync_irq_inactive(hci);
> -		return ret;
> -	}
>
>  	hci->io->suspend(hci);
>
> -	return 0;
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_hci_rpm_suspend);
>
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
