Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC94ACD8C9D
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uACZICXSMg0WA+ZRNhTzYPcrRjQ3sPEeGOWL7fX4rgw=; b=Yd7cD3EjlUyaug
	TKx6SSL4pCI4CtHAMR/RQdb1HXRzEoQCVfvK9nujDcBKaqZLAgD7WPpt0W7OcTvDhW8nFDUJ2Qb8J
	Q9JrxahNnSLT1Z6ky+hiE6BiuUo32XuR41a+tdb/lwP39p1szyHfxnf3R1kXXWaP6xpt8vvprsU3m
	LTzkftDmdIEQDT6AQzEVaseoPP502mykiouOOom/WCuNXN6pmkrfGUswt59eLwWAb6oWxwF7SviWG
	p3NXihTa/xH52rrlFMmlTt2zNtRG/zUqLse0Mb9/m46xcEWtmkg247+DrWaoUKK4tokIHLY+Cyk8E
	fB4Iz/+RxCzD8SvmMTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWe2p-00000004DON-0u3z;
	Mon, 08 Jun 2026 17:45:51 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWe2m-00000004DNw-3joU
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 17:45:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0kJFDQbkpawJ+Qf1eDO8auFgj4wlswf5qNmo/icYk4SdlqJ1rjX1ifijQuBsL8N+fqke7jD33/+3nmRO+vYnbrKNDmOIC+tCGErrSXoCRAEsBsJg2S36WN/xxjNL6oeYKi8vZKmEyNs5EDAcknSZBI8DRLDnXAXLp2Z9Bl79G+sbasU3Y1NXG35HPViyiKRloMtxxuyf0GyidfdQdda6c+k2voFSG3EoD0iHbG4CpHpNU33oMWWbcVx7szr197t0OibNg9XUEpFF7tU6IlLaBmJKb67rn/kI+NnVQGds8fYtC1BXlXTy5W7KZhb7DecOI8671tsgiInTAtKSIJYKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRgVD98twk715mBLemO3mxdZar//1Gy0KvCe3eKcvag=;
 b=zE/6ndpuzPnVCD0Bt/31grKVNb2pAeaCmhNt8vC2mVQLuoDXRB0MEmcBqNS0ok2xwvaU1I0ZwaSzk8k6UKYJi/OH4RpJq071N3XY5KG0ZJP70u8DeVLBW463RahPawW4Fnhufq88Y25KZli8ss12VJCZxF9XamWbfSfAhuZANGdaPjWAzjhnJExjQpA+TahTTMgGqDugV9WGY/NoKJsNP0JC8Ybq3b77NrWKfl2gZFYWY3zlfuvL359v/Z9g7K6XR4OTAIOvAUcAxMRmBFrodKo4G+s3wyTqZE+Mum4/mIBfM3KWVETLIsbf1V0Rc1SpE4rC321Xojj+JIAqY2w+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRgVD98twk715mBLemO3mxdZar//1Gy0KvCe3eKcvag=;
 b=e0Pr8tjONKeQewAvxK+iyxEmycIXzwMzI+onF9RWP6VpzSDv2EjCin2smQBp0cCv7jiXfVlNuLRRSTVrdd6536t24+kuidLfy6mTxwZWauAIIQ2jld8xZtivOIofR0MvzaewkUE34rR3W1o1LjZSnZH3A4HJMsGzKK7WwH08nxUKRHAvmwjwQvJ0+bMec9/kkrccmeOlLJ1ahxgicneszfcxG7SMv/sWU+QR+3qvGJGmgzZnCDD41lAJ1LpX9h1pGHbnyrDgewarVArkUv/sgNP7KI0Jof6yDDaRxb/dW0Bh/g30h0Lzm7DCqHzlhaKOdyz0B264+fJTqj4ZEAimZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7262.eurprd04.prod.outlook.com (2603:10a6:800:1ab::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 17:45:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 17:45:40 +0000
Date: Mon, 8 Jun 2026 13:45:34 -0400
From: Frank Li <Frank.Li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 3/7] i3c: master: Prevent reuse of dynamic address on
 device add failure
Message-ID: <aib_vqOxucvU1J10@lizhi-Precision-Tower-5810>
References: <20260608075801.16111-1-adrian.hunter@intel.com>
 <20260608075801.16111-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260608075801.16111-4-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:510:23d::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: a37f4d8b-40c3-4afd-827d-08dec585c164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|22082099003|18002099003|6133799003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: iHi/Rhl4Q/LK3+sdsUliEInDQDAGeOoskHjnmGP2wtGG3+UQrexTEcGN26+/GyvVD2DS0LKdrYod/zw7MV6OTfhScARbpRvoA5MvBpADqGU+Mkgc22kgXnnlsfz7h5Vl8xMC8Y008Cv67QZGkwDJ11t0Ykk6KdTdVoBm5Z/HdlJ6hydR1SwIRc0vFZath6tt5LjwdlL9/9ypqXgYTE7mR9Aq0XZNkO9apgOWWP3M/jMnAEcTm7FhIXCdlDqzqPfXvHPDm85USSNl7YAlP3Oc3xOi6saoWwmh3FYVO/fNXL1LPM4WTqxMEffExPTTfvtHOlPhNfNbOWJHG8sI2DUty/EKLubRmvvNzfG6vByGvjKOc40s8Gxjk5kYrv7LQ5q6e9GcslytMGCvxpPAxzISdyCPPFBmbYYSeB6ARbwN7J+5PH2WG0WCTYsXoVycTqoFmZwOPcNsJ7rUWOE29YVAkIMQZha5TTQM5hqpn5x4MZdpFVfW3C7ULye5oISAU4yIS2fx58aoefejWLPM1hmDPGJPSStYAgaOSORMT0eEzbSd18KmBI0RI8v5WOnrRhBz4kNtDFDfwj8MhKuHzhejDphjodOM2j1LElv2cBH7ACbmd8XJEBpiJjsS25HZCCehxx59CW6N3Co7FfcFT5wEnAHDPVhy0g8izvTM0QR44qYqI0Ad5qQ8MUuXJ+IJjNFZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qTRr9nukvnkHPCv2Q2YjIHZS3RMzo2BzCy3r6St8SxzB0sorZI1CPeFNCC93?=
 =?us-ascii?Q?DS+zQb1wIwCTSE0hNShemRTmgSuvoUym3/DREjf1d6WZg77SGGkZY7Fgzmuf?=
 =?us-ascii?Q?ZcMdfTeh4TjPXrD+vhmcm1XxOBFPtrQbuho2QLTz9yZRwS1xc9NpyT63bOcp?=
 =?us-ascii?Q?+CFK9QJ/YRthmdKzTwDXflhFH4ZHbjMDQhRqiSEmC2cX5ZN82GQ20Y5txIg3?=
 =?us-ascii?Q?H07xYIOreu/NcwNlApeEZ5G4VD4KlSKpq6AKcNS+hhHh7YQlct/rEzuwAfs2?=
 =?us-ascii?Q?Ef452s5P5LJXYNl3xw8ctAzMvo6dqTH24BDJOBTS2L5kXECLNJ/L0+6o/P5i?=
 =?us-ascii?Q?oiNAolW5fGlMnmmLIPQ0qJKLOqR+MH6tlyHaLs1sjzF9iywPHiRw5sbFtfAX?=
 =?us-ascii?Q?F5pOTV9mLX0iuf3GrrPEvOD7Q5PGgKfCrhbwAtKfZfjcHAL3ocz3/UCdxJqm?=
 =?us-ascii?Q?Dp0SAwgdKqmq03dYNf/eZWRunPKrPeb/o3rCzbzyCema6oMaSE4hkI9DYd9p?=
 =?us-ascii?Q?ygU9DfHPu/ajP/SLUjUK3eevJtgG94u2mNE1jXabdqcwekG5B8XdU4pmGwxM?=
 =?us-ascii?Q?Trdi6dSOBfiirKb9LkpJSZeR1puba0AHq8Dw30oZTvE8MWIkpVZsHTth1t6R?=
 =?us-ascii?Q?8kLfal3etV4PwCht0w4/nL2l+CZoVqMuFebHVy7C15EOCda8gebnhmloPwgL?=
 =?us-ascii?Q?/v4ZvbfNB1TNNElbWc257jSJwf7WOxNL5RHOBvpTZYJstcPAwyaDhI4pXivB?=
 =?us-ascii?Q?rpgKx8fg7GBLdkKlbZP7i52xzrTfMEl4dN2B++7hh5plB6LybMCVi3/75Ndl?=
 =?us-ascii?Q?ZW/VCUBllEaWAO8CUKQySzoQQ0wNH32c5p2uhxsS5PxwATHqV5x4tWkVhS+E?=
 =?us-ascii?Q?Th81uo0caw3KhD76WYduuuvyIEe4mceWdXDf8i37SCMSIq+Ro+4a89mf1DA/?=
 =?us-ascii?Q?w/oE1zsZy487BHmz98luCowWQKa/Q4mMnU9JH9sRMKRcxtIJZcG8eLvy40f6?=
 =?us-ascii?Q?gScstlvuePrHyf2gTM92LYg+D6CA10NJVJD6NnojmqUY8gNULq2GEJfXGFIK?=
 =?us-ascii?Q?0hiiAE7wPOvyXEvHJqjllJuML9yA6otP3s2qe7+jszTe9KzLHKVPhNOJjjQt?=
 =?us-ascii?Q?erPbvvZe8LFowi4KSTB7LldIn6f8+/cUImpUEHIqOA5F7KEDp24gNBE9Fq43?=
 =?us-ascii?Q?VhaRfqsLtVklBFL6hC28vPQOb35gzVMyVZh1cEAcviUrwndH2ylbn7dNEAEC?=
 =?us-ascii?Q?rVJ3aDOWQwn7Q3QZiNn/kVvQOANSpgSA6Tp/W4OLKOqOGGWzXsVHsVhfds9t?=
 =?us-ascii?Q?UxJYMOJRmxVswt9K7d+F2+dg1CjU+4AZtF9iAhCXnW0gkQSglQVKiBi6vGLA?=
 =?us-ascii?Q?4HeiOuF0krKdqdkwVXyc6d3uk/7s7RHZf6B66qfCbtzeIl/b2qQGDfjFXUiU?=
 =?us-ascii?Q?Ck/0KlH/7gycTp8svoQM/ZYiqmXyF4qgMcrl7kE9JMHmmW+NWzYuolIffIRi?=
 =?us-ascii?Q?RLvDrP+Sh6cY0CdcVb9TuZW8FXTYoIPoHgDIg2BkCL8jKWosO/5f3LAbcWuz?=
 =?us-ascii?Q?CSgvcU7hOXxYvaqoachqr/RkUWZEyLUwcuF9u0XyXV9b74U6H/SVxAfYhaQB?=
 =?us-ascii?Q?L+0mSt2yKTNay71Ral4ZT5oRPIUnF06M/Z1HIU89ihxhsT1cC1MeKvAJoeij?=
 =?us-ascii?Q?JpwZbnGJDDfUuO6TrsIXQrLISi4vO5tfZDL5Id/NSkstvGvm7w6WMcilCaG3?=
 =?us-ascii?Q?dNd54Ta7dlSQYtz2WyUuQX/JZ3/SJZ0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a37f4d8b-40c3-4afd-827d-08dec585c164
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 17:45:40.1359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmGQldjPlJiFL7C0NE6MzLUprb0li/m5KlfRbDdLHR6y6USl+L3oh5bc9F72sIE7tq7sY79AId/H/IpHxAMG+31Jfe/qUlPb7G43WT4WWYI76aTNR+31QxawT+MCNv6j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7262
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_104549_204688_9BC0D59D 
X-CRM114-Status: GOOD (  25.66  )
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

On Mon, Jun 08, 2026 at 10:57:56AM +0300, Adrian Hunter wrote:
> i3c_master_add_i3c_dev_locked() is called after a device has already
> been assigned a dynamic address.  If the function fails, the address
> remains marked as free and may be reallocated to another device,
> leading to address conflicts on the bus.

There are other error patch, which also free dynamic address. And if add
dev failure, should it send CCC command to clean device dymatic address?

Frank
>
> Ensure the address is not marked as free on failure, by updating the
> address slot state to prevent the address from being re-used.
>
> Emit an error message to inform of the failure.
>
> Opportunistically remove the !master check because it is impossible.
>
> Fixes: 3a379bbcea0af ("i3c: Add core I3C infrastructure")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V2:
>
> 	Fix 'if (IS_ERR(newdev)' error path.
> 	Be defensive and do not change the addr_slot_status if it is not
> 	free, and update commit message accordingly.
> 	Amend commit message to note removal of unnecesary 'if (!master)'
> 	check.
> 	Add Fixes tag.
>
>
>  drivers/i3c/master.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f87bf0099d3c..7b60b0c7f646 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2345,12 +2345,11 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  	bool enable_ibi = false;
>  	int ret;
>
> -	if (!master)
> -		return -EINVAL;
> -
>  	newdev = i3c_master_alloc_i3c_dev(master, &info);
> -	if (IS_ERR(newdev))
> -		return PTR_ERR(newdev);
> +	if (IS_ERR(newdev)) {
> +		ret = PTR_ERR(newdev);
> +		goto err_prevent_addr_reuse;
> +	}
>
>  	ret = i3c_master_attach_i3c_dev(master, newdev);
>  	if (ret)
> @@ -2472,6 +2471,16 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  err_free_dev:
>  	i3c_master_free_i3c_dev(newdev);
>
> +err_prevent_addr_reuse:
> +	/*
> +	 * Although the device has not been added, the address has been
> +	 * assigned. Prevent the address from being used again.
> +	 */
> +	if (i3c_bus_get_addr_slot_status(&master->bus, addr) == I3C_ADDR_SLOT_FREE)
> +		i3c_bus_set_addr_slot_status(&master->bus, addr, I3C_ADDR_SLOT_I3C_DEV);
> +
> +	dev_err(&master->dev, "Failed to add I3C device at address %u, error %d\n", addr, ret);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
