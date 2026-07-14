Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D24C4450A
	for <linux-i3c@archiver.kernel.org>; Tue, 14 Jul 2026 19:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5ERauFtkQmLbRp8PuEDtgJjUMX3Q3hGTRXh/EwShLI=; b=WYhgZgr6UB/SnC
	J6EHpvRSol/bSvdntQ9eL0HLUD7DcQ9E6Gl2vrtUlzlpMXgtqde/Kw6EuItczugR2y3Rmhwmo46M+
	816uVIb0BV37w3h1TLry0WkJAhRdzt/9ZnC8osRyHQGvKJUcbgK6o9G9lpujk2+8n7VXOsPJfzJd/
	5NIE4HLgEYtxmPTnh/GetLSC4eh+QCib4yu8XKAlq9WZuX2cRuATIv9TAT6OQBwdv5ighSVP+nrlm
	sFoa7ypA67Pio7W4aJq5LF3vENkR+0QLo7hsJxnIk3Vrxua9Jnkb61c4IMY0hGWMe8EonvvjP9Z+g
	H8v6KlmOr0WRp8cZMr3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiWM-0000000CzJp-3IgH;
	Tue, 14 Jul 2026 19:10:22 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiWJ-0000000CzJQ-1IBf
	for linux-i3c@lists.infradead.org;
	Tue, 14 Jul 2026 19:10:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v30yOlDytVw7uKtLeZPsmk6FE/t6dl3U5ht0AsItcevyKRn+69My0In0UmTCqEJBgnoyVk5j57u6D11VH6P5HReBG59h2dy4vLEtJHHr3ZrMP7BfMFpieal4v/o4j6b+cXmd8ScAA6xevahzczIH8XVAiz2Me1rwXi3Y5nPedkgSXkEyqpiWHxYanWAdr7rjHvPeA+WC/Em+ZQSXe5dsWGHOVlt39ST4cSgbiWXYWOiMHUALq4MQdvd3mQ0JvyKMQyucFve6+CAbKlxU8xV1bjo96PNVHf/fJ38Hlq85E+CuPyhqVYhq1pB0b7ywTSd8KDKqfXtIksYvp3UMpBauJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjQ+KtovMztVNiIbwrIbROnNTLlR1wEeQOEKGu+tnn8=;
 b=m26v8StkIjWfu+hDpuqaX9Scu5n/57+usY4e43jwDbl03xeryzguf2IwWbFqXifkNhLLauGWvAiWth0Yq1qEPugohCNgdNbmnmUtfE7igunS56FEKJj5wbzgYKOZJGBLHZv3ghsNmn/j9FYYa2DvC4k7PzcCGmVzYk9H8RSi2izghH4jdLxBSHbFGI7AZxjREV7POqu3XJFcnV7nu0Vj4Y+e9ata2hievAT+0vMRIvg/XqgL62nSZcsO8dvURGKfZRMzjw3fDds4SJ32ky0xgrtL5wyY3uyuTsjmQBO+tX23/5YGeXZVSK2hA9JOMYLWyog3RVMHlmzuxaGXHmTbPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjQ+KtovMztVNiIbwrIbROnNTLlR1wEeQOEKGu+tnn8=;
 b=O7uC3kXnYcZ+MI8l5NHT/bbvkEPV200ac9QNgEZBYKMHDvOR2Brd/Y9y2f3y4kIMnWJLeCsC/Lte8R6iUM1Z2EaJCUnl8xCkHL9ezzvSLUw77ht/CzRXjw8N1Tj14kc0SZUnK+ekBpjKm8YZ+ERQWaKSj5TQNZuK0r8dWlSyaV92gM7//WrsEW+lyvIAbqc0USVNJ/eluU6EEARwacq3+jpOhm28H9OxG6gdccf7H6qWKOTtFceyAF8WqOqgBZVjnfyG5vKeMG/UT5rd1pJUFaJ4OEdNTYGctl3sG6sq8TOV1+ZlrJaQyMaoGNFtgmONyfuE0O93JmY6joPStk6//A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9639.eurprd04.prod.outlook.com (2603:10a6:102:260::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Tue, 14 Jul
 2026 19:10:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 19:10:13 +0000
Date: Tue, 14 Jul 2026 15:10:06 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, robh@kernel.org,
	Frank.Li@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v14 2/8] i3c: master: Fix IBI request and free cleanup
 paths
Message-ID: <alaJjgWkLKoQklNt@lizhi-Precision-Tower-5810>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
 <20260714092053.2461482-3-lakshay.piplani@nxp.com>
 <20260714102026.510E01F000E9@smtp.kernel.org>
Content-Disposition: inline
In-Reply-To: <20260714102026.510E01F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA9PR13CA0087.namprd13.prod.outlook.com
 (2603:10b6:806:23::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a492914-aae3-4209-9c77-08dee1db8816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|19092799006|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: TlEIKh2HTWRCV7kIA+ZRndLT25lwKmFqFrXcs7wgeCqOhu9+Po7uSwNexzPS8sZzVGvplws5U5o2J7SoEG7UAZiRsRtzo7NvvOy0A2p4kGO7+vSFXVGAWaNEo1UkOgYRmwosuwrbuN3WHfnV365pXh1zS+rENtUg6HYZAn5+eKSAANX5IEyojWNQ7nBX0ST4K63gSDaLBZxVLj5uMw3wqqSEyYSLJ5yck809NNq03mQiU8oC5Kpl17d3NlCNiWItw40OYVNs4yo4tNqjytWrDv/1Dkk0WXp3aOI96ywxSqcx1x+JVQdIKsa2mUcGgOAgw3dfzy1woeZJ88T+z5jc+YTl4NGTd7r/kDd+NtBVaWkhGzRKcJbWEYsg5TynzZt5NQ4UQ4/WSSTP/JoVbCs9TyMSFzr980wwrF634k1a9rfL60pJNIqEkMhqLU6x0h2qj8OKpt4+LJl/c5UKNVJLc1KsiNNKqcagW1iBD+gWjm+OW09OF4YeCRV8IOgtPAx8G+ElNrppPSnY2r9UIdks7lFnH8px5kvEdFjt0XQr6s4l/yD67eHUPSGBMZz18H2/+/HvovBo9oFW3H/wQB1f8Mxp8+/+FydrR7s1k2Wl7Lg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(19092799006)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lDYnkUEd33BtiQSG3+E/s0dbcwGSTXset4awABob80mK7mM2ai9J9o2B+1?=
 =?iso-8859-1?Q?iAFH5OztrtFida5Sc5qL1SpSVOEf0JCVm1mcIYlsji0MXDhLurEMx1M31v?=
 =?iso-8859-1?Q?vlaWrk8Jr04rpDYBwHdNh1X4s2nDSjGzCd0ZNqUtomBxOn4jPNHcjlRbDV?=
 =?iso-8859-1?Q?oFeC1yPadcNX22X0UNYIS2foi2XuUsRNU1URX9GKWVvSN9pVhoCIGPkOVA?=
 =?iso-8859-1?Q?tcnUReySSj0gb5Lcyczqai+nEVz/nt1UKjpBGQUel7EvU8t5rNtHT93C6A?=
 =?iso-8859-1?Q?02ETnR5cYatw+HMsig5/7vxlIq4ooqvlbNU9TIhxxH7j/9iEmsxbTaK2ET?=
 =?iso-8859-1?Q?jubSkT+5lJpTP0Ux2kZeH3vpiuJscbQB3rw/ULCRZ+wkOtn44n8KLQKDte?=
 =?iso-8859-1?Q?txsTsxrPeog6kkvdV+TjEbf/BpKCNMr8El5Kmau1rkpUJYuKY3PMKnYNqZ?=
 =?iso-8859-1?Q?ml4Nn/xWg2KYLU46ql/2as16GqBu52QUR7NV46XQB/Wwotp2Oi8onUKuUU?=
 =?iso-8859-1?Q?789CD1/WbKsSvQdC8m229KzYp8bwR5EH2vB6GznlTbjUqJSWEAnGnZBNkM?=
 =?iso-8859-1?Q?HiHbIZBSU34Q1c9EK/G0vN3UvhqBzBZzLGQ0ole7w8DXdSXeOnJkqCwyT8?=
 =?iso-8859-1?Q?NUIT5A+AMOKulvCFnwxOWKUtWxIwAvHL0jOuTKPYEAXPfTuBzWHHvB7io7?=
 =?iso-8859-1?Q?f8s7r3IXwaL+Du14q8NK6YiRGv6z0OFTfiZR8Hr03O9dVWpZdK746AkYL1?=
 =?iso-8859-1?Q?asb84R0Q5ra96af5xH39tz96giyRLgylh0peTEoh2lXDE2TYw2hf4kftG6?=
 =?iso-8859-1?Q?St9z3e19VwgAp7vdbY2jwY1h8oqsHXQlFKThIiB1vEOFfPIBv+gEEuCO+4?=
 =?iso-8859-1?Q?lIOrtcITiioPHLb+APOa9LD5M7sD6Jr6hsyjoUigSEZRylOejFlEQkBWR3?=
 =?iso-8859-1?Q?oCNvwHGLZaNDUoBumk6qHvkxw++7zcTZfowaGBiGnSeThAu4t+8ifELNgS?=
 =?iso-8859-1?Q?jpoWvaRD6jLArNmmhh7O280h5lEvl3/v4BQE43Wr/qdDlFmyr86vr/4WYA?=
 =?iso-8859-1?Q?18zen3Mfkdq1f/1kGR9CWqD1xqhOIy6rnJ6/AvG01rbGy1UGSiplK1sDcx?=
 =?iso-8859-1?Q?UCdmxN+4o4hjC8vxG8fZn+Rr9tJs4TZnUyQci1zKmZTqXJQ0+1MvOZB+r/?=
 =?iso-8859-1?Q?KEownEtST23tExkyMXDzoK2xx4DYcTGmnm1r7npi+4qjkGfI6qnM0L42F4?=
 =?iso-8859-1?Q?kS64dmNJux3zRmERvul+ztX56w/cOQloLOobZ3qg0Ob8mxs+iywNrKHQ+q?=
 =?iso-8859-1?Q?LVQAtsvDyDE+zk+C5UUo/98xj8k4YvExbZKFz3yWdCqz5diHIUu6H8dCYx?=
 =?iso-8859-1?Q?TKl4qIZRLD8A5jfV8dE1zzzBN3zimeOu6BrdnJu1pEUhls0018aUvU6Ic9?=
 =?iso-8859-1?Q?Y2kfmPtgqnSGsJ1L1Yn56G1+3NbeRPvTTJCxOruUdj1OKaVPuP7OEZyb+j?=
 =?iso-8859-1?Q?rlI37P7791d6WioeKdmKul280/ixFFR5uuUk7C0q35HiPokx9MgiY8J2z4?=
 =?iso-8859-1?Q?4RMbjl4RIPU2uy5lc7/UjeGKRTaw0LS6gfihLpfUT2r2M1pzw/K9BmcEy5?=
 =?iso-8859-1?Q?eEz5O7PbCAvck2tab29LKaf1nSDaqzmxbM7VjczB0cB4DHm54JCwOv+LiJ?=
 =?iso-8859-1?Q?1QJLqZp05tOG4ew71Qx7X9NHRlvxU0U6xt5gGX8/NUrNPpIM2ejIEMRpXH?=
 =?iso-8859-1?Q?/cK3O2ODfamGI6Rfc5Ib7FjUOPb+d1Sy+5KVr0mJ0UTCTzmuzXyeTrVrS9?=
 =?iso-8859-1?Q?4nKXI0LUOeCjuaFBn8OOIP80DdltpMCgTtd646NoadelXh5jlnlE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a492914-aae3-4209-9c77-08dee1db8816
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 19:10:13.2713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2v10q7w7EGR9ZM9cMxaHQK2go5VKXX+ebUU+hZodGfPH7iGBlNtPKMP/aPPjrmEaSD6kEoZNrid1gYsBd35UZRfr3SvaUjq2GxoLeI5zHzrgNJJ5wSmeWxHZlpx7AHjt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9639
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_121019_360682_787E2EF4 
X-CRM114-Status: GOOD (  27.34  )
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

On Tue, Jul 14, 2026 at 10:20:25AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Bypassing the core cleanup paths when `dev->ibi` is cleared by a=
 controller callback causes a permanent leak of the IBI workqueue (includin=
g its rescuer kthread) and potentially the `ibi` object itself.
>
> Pre-existing issues:
> - [High] Potential use-after-free of IBI pool during workqueue destructio=
n if IBI disable fails.
> --
>
> --- Patch [2]: [PATCH v14 2/8] i3c: master: Fix IBI request and free clea=
nup paths ---
> commit e0d1c57d2924f66898a40232f7e52ca0e1be0aea
> Author: Lakshay Piplani <lakshay.piplani@nxp.com>
>
> i3c: master: Fix IBI request and free cleanup paths
>
> This commit attempts to fix a workqueue leak in the IBI request failure p=
ath
> by destroying the workqueue before freeing the IBI object. It also adds c=
hecks
> to avoid touching dev->ibi after controller callbacks if they have already
> cleared it, aiming to prevent NULL pointer dereferences.
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 3b1c342be2bc5..ba37f71badac8 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -3702,8 +3702,18 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_de=
sc *dev,
> >
> >  	dev->ibi =3D ibi;
> >  	ret =3D master->ops->request_ibi(dev, req);
> > -	if (ret) {
> > -		kfree(ibi);
> > +
> > +	/*
> > +	 * The controller callback may have already released and cleared dev-=
>ibi
> > +	 * when the request is forwarded by a virtual controller. Only clean =
up the
> > +	 * IBI object if the callback left dev->ibi valid.
> > +	 */
> > +	if (ret && dev->ibi) {
> > +		/* Avoid leaking the workqueue allocated for this IBI request. */
> > +		if (dev->ibi->wq)
> > +			destroy_workqueue(dev->ibi->wq);
> > +
> > +		kfree(dev->ibi);
> >  		dev->ibi =3D NULL;
> >  	}
>
> [Severity: High]
> Does this logic introduce a permanent leak of the IBI workqueue and the l=
ocal
> ibi object?
>
> Since the core framework dynamically allocated ibi and ibi->wq earlier in
> i3c_dev_request_ibi_locked(), if master->ops->request_ibi() fails and the
> callback cleared dev->ibi, the check if (ret && dev->ibi) will be false.
>
> Because the callback does not own these resources and cannot safely destr=
oy
> the framework's workqueue, the workqueue (including its rescuer kthread) =
and
> the ibi object will be skipped during cleanup and leak permanently.

look like make sense
	if (ret) {
		if (ibi=3D>wq)
			destroy_workqueue(...);
		kfree(ibi)
		dev->ibi =3D NULL;
	}

>
> [ ... ]
>
> > @@ -3743,6 +3753,13 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc=
 *dev)
> >
> >  	master->ops->free_ibi(dev);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but can this lead to a
> use-after-free of the IBI pool memory if disabling the IBI fails?
>
> Earlier in i3c_dev_free_ibi_locked(), if the IBI is still enabled, it tri=
es
> to disable it via i3c_dev_disable_ibi_locked(). If that disable fails
> (e.g., due to a hardware timeout), it returns an error without waiting for
> pending IBIs to finish, and we proceed directly to master->ops->free_ibi(=
dev).
>
> This callback immediately frees the generic IBI pool. Subsequently,
> destroy_workqueue() is called below, which synchronously drains
> any executing IBI handler works. Since these pending work items reside in=
side
> the newly-freed pool, won't the rescuer thread dereference freed memory as
> the workqueue drains?
>
> > +	/*
> > +	 * The controller callback may have already released dev->ibi, for ex=
ample
> > +	 * when the request was forwarded by a virtual controller.
> > +	 */
> > +	if (!dev->ibi)
> > +		return;
>
> [Severity: High]
> Similar to the request path above, does this early return bypass the
> destruction of the workqueue and cause a resource leak?
>
> If the controller callback cleared dev->ibi on the free path, we return
> early and skip the destroy_workqueue(dev->ibi->wq) step, leaking the
> workqueue and its rescuer thread.

make sense

Frank
>
> > +
> >  	if (dev->ibi->wq) {
> >  		destroy_workqueue(dev->ibi->wq);
> >  		dev->ibi->wq =3D NULL;
>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260714092053.24614=
82-1-lakshay.piplani@nxp.com?part=3D2

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
