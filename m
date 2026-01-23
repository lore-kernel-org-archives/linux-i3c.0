Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607E6D74EF5
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Jan 2026 16:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FmQoab4MogaCcSmVgjD2kPGruUY4PuhPNaGkIq+e3t8=; b=nOtu7EUuZkMJ3F
	JYakms1Im89wrYptMSBK7ILfwktK5r1XgG8s2YdTocylY2u2HMW1mqoZWyjWgmIMDi/KZTl0NTcc+
	GIxGQ4ULUio0XITKSc1p0bcb+jZYZ/3wY126MNlcyPLmbWQoLNmM2VygRjUOsoqji5BnZgAbP88QB
	9KW4IL0Q8NKhsKtMiu+sw0A+XbOwnXkSNct5mOFWtKcgazZvMFHIHuyzqFU6G/9n1atrIss4XPAIr
	wItCpMkrOWn8rGpQWsi0bivArvjla1ubrTNLC0v6xGEHybHrtmRu0hVuUhdQnwkVPMowRu8o1NRCy
	EHNLg9fe3m2uvM/lCwVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJga-00000009900-0OkA;
	Fri, 23 Jan 2026 16:07:00 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJgX-000000098zS-3IvD
	for linux-i3c@lists.infradead.org;
	Fri, 23 Jan 2026 16:06:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYE3xscAX/ZBo15uy3DQLkqwgqAwP1IbeHnPXtha9OySv8gE/SE18pp+ICxhIoR/Zwg6HHtf+t63BJSxn2t0i7IZmlwKZcVg9UP5JG75vwcWJJCsa3pfoS2PH0fCHjTAMy91wM8CucbmpMv/vg+9tX2ClF3da5h8OQqdCcEsgsKXXu92XCLNYlv7cW6RlPIwybFfk/hdFzg2KM9egmsoG2lF7ry+4CpVohU2FbzCF14IpwbnTZkXdHBL4HoCvTnjPFOkPGWmTj54VgDQq3rkhf50ThNytc4JJ/6CjfIamd1ON6m5FmfqnknblZmNwCqu4X4ZA+l2p3DdwPCi9Dd2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTlGFL3DFeA66R1P54mRFmN4SppXZCtH3aGJDJt1d44=;
 b=yduGKSmpO4sbsM2j0RAamzQ1iCG0CCa8MULuTUbRgFsyTqr5FkPtSRWL5/EA4WkXzytsnhAPEIVj/KwZgzTpiVoNQ4byUWP8DFRshAaAn8wb7PqNCtHldk9bWE17T0oWs4IKzL47IMW1DZR7lYXFWyiOsbnWTFrEnO1yAjeMYwqIf4FnyKzj37R3FoIFaaNIU5giSFVVvxwOXo+XCCHallvVkcpabQ8h8ScRslUyAQe4c/pjTwQ5WRwgwG+pQUnBwH4pc59h2iPkjyBdOcBb2twsYAf1Af8swooR3BsDri5jdgTIqwHJCoPPB5dOBAm0XtJyZGdm98B02p8hDyyNNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTlGFL3DFeA66R1P54mRFmN4SppXZCtH3aGJDJt1d44=;
 b=gGuHI9dEoD/D4fFjEXi1VbSv6lPhtGZoEOX8wQgJS48DnauvKBgbGHWWOX58ph73PCGSMsNW43cBMFmaZ9TKe47Q/1AWF83ENkD5hfQrFBPZbzBslA4itt1or4jh8wpAIlJXZ4B/xqf5k/TC878XAZIf5YWUMSdudDbM0kHK8I5aWVXxfYlD3bKY6ME2XF1ODkqUmgvJ8FQE1RlUA+wzU5Gn50p3OkXalprq/jwdECLFKe7HyqAzTh/kbD/D+qfbP5ex0rHS51lnKcUHcv2TsGAtH9MH5ENQFn6J8QStlktuqzfsUt3J8ts+slTIlkdjn2gW8f+gpNg9ekPKuC1XEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by PA4PR04MB7792.eurprd04.prod.outlook.com (2603:10a6:102:c0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 16:06:52 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 16:06:52 +0000
Date: Fri, 23 Jan 2026 11:06:45 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i3c: dw-i3c-master: convert spinlock usage to
 scoped guards
Message-ID: <aXOclWlrqu/9ucnw@lizhi-Precision-Tower-5810>
References: <cover.1769151395.git.adrianhoyin.ng@altera.com>
 <80774b6019ac3daef5b1f01445e3232bd48ee391.1769151395.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <80774b6019ac3daef5b1f01445e3232bd48ee391.1769151395.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: BYAPR02CA0041.namprd02.prod.outlook.com
 (2603:10b6:a03:54::18) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|PA4PR04MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba34a81-9cbd-4ea7-3025-08de5a996bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A6eJQGzreKqxPln9w62IvysAjpjIUqIpNqCBctmGt/Wis0BxoTG3MIL19CKv?=
 =?us-ascii?Q?Uc7eo3i4diK/ZQ5cn0wKr18iKAkos+qeZWwYqEr7kOg1iXEqFm9zlWT0SbrH?=
 =?us-ascii?Q?vsy/mgo7+kMLRWizj8gvtyAxQ9zEFLFMQdVI4RkSGSJhi5O76Hh2jdB1884Q?=
 =?us-ascii?Q?qwlElLi0BkGCRYBB/3WrH4Z4c0qIAg/NWlC6fDgiL8mltszGss2+t4W1roAu?=
 =?us-ascii?Q?AoJok+aqVGUrfrlilovaU+BH4uVSDiXU3jCyp6JeS8us6kdEsuWtQHqpT9gv?=
 =?us-ascii?Q?zqwNjF9Ti7LqpcOxvKHR2IpeTHk6Hwxu2VV1scFbxjYXmkzKewnLC/j1IwcG?=
 =?us-ascii?Q?N2Ur9MlpV5aYJBValWgoApXUrq5sZ5tAZIDqD3LUH/ZnI/ceGgd1kGdNTfHX?=
 =?us-ascii?Q?fPuvK6zes4vAaSGUpdm2ScIKaYGJS86uvIS2V46QtTjYe5tB0ni/8vgyFP6D?=
 =?us-ascii?Q?nx4SzD4w8QHniKGEjNSCtYIqTXImIUd2XMX2Y0Y25DPETDDQekbOzphyWw0e?=
 =?us-ascii?Q?jOKBWmvGugbJFzX899O5YihI+9Y2/ytAhTTkaAk7lGwB5bqPlaZAhKSmzlgM?=
 =?us-ascii?Q?oHWqHRIK8HObBtY2LxyTVG3CvphvVwRYJ6nCG0p4+PvJKzMO+y41T5KtOy9y?=
 =?us-ascii?Q?S+DzBnt91YfOFhcNAS5X6ZiFsi7kR+9myi5822F4a8c5IUuK30ckoQTZ2YCo?=
 =?us-ascii?Q?IvYb0l+UIkeXigXkzJmSooVivS4L2JrqU7ywyiRGUVsu2PYFJQYdpRgnQ44u?=
 =?us-ascii?Q?IbKV9xfs2k/5GO9RuhQUKWQGwhv9czE37i2IXxkgkFMI34+52GoL+gfGfemW?=
 =?us-ascii?Q?A3ctTMaihZieboeVr18OgKrI6B3GHRtH1unwnY+2b6OiZsQ3jRE41vtRDs6b?=
 =?us-ascii?Q?z4mLsGK8CPVAxNLPSWi/UCaNfrkuCspnfh0dCUBr+RJIakBXnfd3wlsPdKht?=
 =?us-ascii?Q?re3GszMsu0gK+ClOf7A0IU2RU2WrZyWyyyumbBskToWF1qF9RGjzB+XAMFSf?=
 =?us-ascii?Q?oWSTmqbKyajzDek0u9OkJGoLBr4/SpaNQ/lBaNFxQ6i7W+CM2fQC256iiVAZ?=
 =?us-ascii?Q?HklPIvQ5PGQjb2xyHegcRlW+ihYcEioisCRIRDKY+6qvnSd0cYsjeU3agWB7?=
 =?us-ascii?Q?c40oVFGc7tYz1tmu5hwcxjTi7cn/RjZW70C8jH2w1zbXI+AC79ueu1VR4rs9?=
 =?us-ascii?Q?iJp9SKtBd7/L16KDKDTSpKP6WvyYYb6vWhRc72ImrWRB/xK58W8ErBfIIY2c?=
 =?us-ascii?Q?rFsNUyMpXZZSCGqMFDXPIKL2SSlvXTusl9cgNAIL/n6X1PIsrb4FeZMULxnH?=
 =?us-ascii?Q?Dl5Ttsid8KKDsIbKjx4x3g8dUA29S6Y0RWXe5SJ+XYl5pdg7Q9rgv+F/73Bv?=
 =?us-ascii?Q?keUpNw9dt7DBQRvWeqicRlr/98QO73kj0tPzZIuDa/QGMXx9fddOEMR2+MZD?=
 =?us-ascii?Q?kymLLg7WhR/GD1rJraOh4B7QDOQYQFYVrhVwIgOb/oDDV+dKw+Mf5KPbyQV2?=
 =?us-ascii?Q?+3M7AIHKr6M/eKk1dLCh/khHKuBtZg0IphRTpHkuZFHKylVCzGXVAyWahFeR?=
 =?us-ascii?Q?RCDFhhw6UqfxUtmvoDatItbrbQq4BFgx/oK9UuHB/Ng4qbZUVmT5xU2CwR4Q?=
 =?us-ascii?Q?Nl1Tq21V123rfTdLknr/sIQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kY60JKOdQbMXcsYL8PEojJKhscMNoJjjuaJehHWtVl/WD/fJwyfrKcVDx3v5?=
 =?us-ascii?Q?ZpT7DW6g1RbKx54ePTLAO6jTkeQMiJyRpjb8oXSsAk2QwLrj67acSSq2MoG+?=
 =?us-ascii?Q?ixE4SjbA6SQjYt9Su2ED7HqmwSYCb/KJHv6bTQUodXs/jTWg3M0+2l/b2X/1?=
 =?us-ascii?Q?EHWBWsU9G0AjuSQfPxkEWmVyY4HvkgUOer+Zz3OogAsJ5jpc+xOpH7lO5FfU?=
 =?us-ascii?Q?mDXUzqpPClBsoenZ31q90paEteix0uCfzl+DuYwQNkuHlk/HqnfgOLwoTW7H?=
 =?us-ascii?Q?snx/gz+GSMcYutfVwsJ9ObQfeD8VbT3qaMlZ+/+22U90qZZLf2fF6C3kymRt?=
 =?us-ascii?Q?O6Avu0CT4ReDkUe6w+5+HjLqkYV3WHSz05NLFBepbhE9Kt67PifQWOtTb7iK?=
 =?us-ascii?Q?if42pIIhmoMcLdT+Gcg0GbRgrdMfsaTN+lnXj2mpLHI1kvgwl/hELF0FSXut?=
 =?us-ascii?Q?fTBKldUsMwL9v6PaR3GHt3Q7/jTG87pXuQLBxXCriSu+gEtgQ76n1tTgZ9yf?=
 =?us-ascii?Q?aMDjdYJBfsm/F6uX9mFhJ5+zLd9xdgWYNjlZe0pC5Xaie4p+Sp7BFRhrMwe5?=
 =?us-ascii?Q?KRTFOD6LCcvpRvcG+uybXDwvxZm58bE53W/XjNcNRaHiMqLzvm7SxWBXUNt6?=
 =?us-ascii?Q?q2AVWcwSDwLmnYB0dNUE3fk0ILt0eQhKzpc5DkKzxgbsc9ilU7F0N/VKTHjv?=
 =?us-ascii?Q?zb0TNdqwWuRbJLP+r1xSyWl4W1ahc6ffUP+1tsw/PBmiXAMHFgvUs3SSKLF3?=
 =?us-ascii?Q?Jpwsm0XuBVGpw6GxRcu+m+h7MueO4oRVODuQqHNOor8RahMzKkALy99CD7T3?=
 =?us-ascii?Q?XbsmHFa8zIqvxko+nzu7L6N/QG4q6BvrXZVpgIxbdoO/MT+NEAwJBoGuKtgr?=
 =?us-ascii?Q?Zi9u1P61AUCGfrmjhCHrLauE3mo8OgWj5jDvf7lDwYP0HppKS1tuRo33ABm6?=
 =?us-ascii?Q?/VXattwtczzfCMR0nhO3zR+KhjuytCMrpoCM20Kca9cYPSp25Q6gbhpe52TT?=
 =?us-ascii?Q?EYUOT0chKJSAxRoGKSmTY3oPmZcgSOl3hA9yuk5COVKon6StKYiRSznnEzhE?=
 =?us-ascii?Q?Q+ZYn1+4tLlTp2RiRslFvZZD7toZyP6YDFO+LHRPXvgjf+wW8T7a9CXeHuwZ?=
 =?us-ascii?Q?3v5WDE3V8hDq7sf2dUliUVXbVZg8w7FY90NgTii/RiwJ2CL7rA2s+bUwkB32?=
 =?us-ascii?Q?qJHfWxTeMb2+Paw+HlsevltUUBpVJAwgccHstpDtAdjIjyO/BSniS5bjRgzG?=
 =?us-ascii?Q?er18uYPa9+QeAjacM1JgvSV6eevQcW/67fX6C7cEZaJFwPtfBRuk+dlJVcjJ?=
 =?us-ascii?Q?STqh8SzQCBMwegREhCyoh4DjVNh+PDJe/2RZF5Yi3LzLkwsOOKRxpou3IN6m?=
 =?us-ascii?Q?hGJvyIKSA9GruHX3jA4z+b2W9zcyGmIOh12cjVRwUGZYgKNL1672X9kzD8Kv?=
 =?us-ascii?Q?DnWHwwizzXLFivZVyX3aIFlYzCxnjL/EyxQy4mF71G2VhOoFTaEPokXXNDum?=
 =?us-ascii?Q?jDa24/M+hmGmCxeO65ROpAor3mwXgOl9UsvxkaD42SZ3lOb6mDfAT9+wBwba?=
 =?us-ascii?Q?/Szjw4QRtOX1p4SQXXmWBaLF7GH+WYZPCF0zZGIALqrEQrYs4dN8giSL+s6T?=
 =?us-ascii?Q?reVYa/it5gPFEu+BWgAwlf/an5ruhv0wt0GX4p0jQ/YokjnSi+9a7TKMc1tV?=
 =?us-ascii?Q?/Hq+X20MUuQtdkgr+ANbt6oWdadDapPo0+AKBVDenV0XuMs8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba34a81-9cbd-4ea7-3025-08de5a996bc8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 16:06:52.0578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xMDsds46mfFJOlpdMxALF68aOVxyx3jAmjqHACfdMzDxM1pe5hBFEwyXlfchgsERRVIEVAyHTl8BW7aCpxs6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_080657_835458_D0A3AAAB 
X-CRM114-Status: GOOD (  10.91  )
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

On Fri, Jan 23, 2026 at 03:35:11PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> Convert dw-i3c-master to use scoped spinlock guards in place of
> open-coded spin_lock_irqsave()/spin_unlock_irqrestore() pairs to ensure
> locks are always safely released on scope exit.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
...
> @@ -1212,11 +1204,9 @@ static void dw_i3c_master_free_ibi(struct i3c_dev_desc *dev)
>  	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct dw_i3c_master *master = to_dw_i3c_master(m);
> -	unsigned long flags;
>
> -	spin_lock_irqsave(&master->devs_lock, flags);
> +	guard(spinlock_irqsave)(&master->devs_lock);
>  	master->devs[data->index].ibi_dev = NULL;
> -	spin_unlock_irqrestore(&master->devs_lock, flags);

This one need use scope_guard(), otherwise below i3c_generic_ibi_free_pool()
will be in spin_lock protection.

Frank
>
>  	i3c_generic_ibi_free_pool(data->ibi_pool);
>  	data->ibi_pool = NULL;
> @@ -1243,13 +1233,12 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
>  					  struct i3c_dev_desc *dev,
>  					  u8 idx, bool enable)
...
>
>  /* "ibis": referring to In-Band Interrupts, and not
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
