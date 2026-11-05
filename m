Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656F7606A326
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Nov 2026 22:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jgb9zBDN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wtPByOwc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OmMpjB4R5XfUouz1uFA1QhH0+Iv+wL4lcUsTEu7mpP0=; b=Jgb9zBDNt3rfWXq6efYzzOlE75
	n3JszVF2dS8nTHDUairKcEEVAGF1vltX4W9xIXoqxjMh3wTE/jxdImETBblYcedbIOgeX/D01dXFc
	3Ldy+pCG/np+HMM9hg73YN5ow9iXUhigVfQYho0HdDt0v2bVte8HojWQDWJUQ9jiD2rvx8gtNKTFn
	a5D6rIts/zODOqKdPJtjJFb/ZDVxjyAtf2oz1EhdoDOVV3qnbUbRJfFoXgqo5n+YThsuHLadDeKX+
	5c8hat3xc88d3rJ71+ZfK8x9VljH5byx+TYFtWXZLrPhCzvz9YR61DdVqNyykzZtTAvx1MC1iKJJJ
	3cvKx7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5eb-0000000AmZC-0PNE;
	Thu, 05 Nov 2026 22:09:53 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5eX-0000000AmYr-3q1B
	for linux-i3c@lists.infradead.org;
	Thu, 05 Nov 2026 22:09:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unSgFUwwYWfRRHr+rjTn3NwzDBJZXcl365ASxPY1Sijur7mNYl8k2E3ob3Cyy1Zev/nt8cG4Hz7CoYbppbmwd5JRIJGn1Nc/BbO1kb7pkH87Rqve8XokeWjnAAQ29yrpWffLNBxVVZzgTvCCGgnNink8ePV3BGrBBBifA4uvSk3uTYVc9yQIEWme6mcbKZTIzDVlpX/P3oXa+lc4Nmi9tkvUT7cLu3nPj7yENkjmIhMUuedKgQyZfMxPQtfnDflJZqzS8Ef2WdFqOsuE7rvepgkXi7IhNBm/JUeYRS4HQUtQUQjAiX6PJX2TwGoEmApHs9Mx6QY1fKFm+0/4VknAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpPn3dlP03U9qZLs3oavWGepVCo5I9P0h7xZhsfwANw=;
 b=CukuYfrBMtTsehhWaN5C2718FzNBVDaWPKHohj1uKmfs6SRDnLtgvIDMyE/RDWT7RdIgTrrzOMaD3HoyPyojGtIUSnDRg1HYihmmjxjF0MTYfmmH/jcu8foaNzIFmdJKjP6rjm/sv9WZar9onrhioYJs0nebrLjK9ukC3+UAJerAkUGpZP92EYUwVkUWKeUgM4fVqD8HY/p7SbWsgn/BTFnw9mqfTp9E+E4MLFOetLvtowtHtGzMQtKgIsaXujh13XE5VfYlQHYMvyR8S63W+z7VBJC5b3DxK+ji05wkT5CT25QkCLTqGzk3tpN4Ce8GA76eoU6Uhgy+32/0j4YYfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpPn3dlP03U9qZLs3oavWGepVCo5I9P0h7xZhsfwANw=;
 b=wtPByOwcXbJVQW4c4FKHmXv0UMIiP+gf9Xibr8XULtN9k5sFtN5s28KPeqN1jtfgxco+On2mngyygmO9D6qcwXQoCbyRATjBlXJkiMU6bn/t3zLH6nyxyp238l3KCs8NAPQetAIe3G1OFjMmR9NiImFHTfdpd8B4xKBCLP8TbBUqg2NYwwQOW1EK+CPu5Ij0gn9wreyBkQVF4F8qFBsOQFJ7FmwC+6AXyvadcI1BVKE2FKCdPft2idsJxgZWIunjhN0GIaLt8/cd3A8QAR4a4+yC4gPZzQst3OdUujEFMVRIL12IfryRxdj4afllrZKxRPLAaz5mEdD39c4zw0iOeg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8541.eurprd04.prod.outlook.com (2603:10a6:102:214::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 22:09:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 22:09:45 +0000
Date: Thu, 5 Nov 2026 17:09:37 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Shubham Patil <shubhamsanjay.patil@amd.com>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 2/3] i3c: dw: Track the transmit and receive buffer
 depths separately
Message-ID: <auz-oTwusjUDhgh3@lizhi-Precision-Tower-5810>
References: <20261105085425.3418230-1-shubhamsanjay.patil@amd.com>
 <20261105085425.3418230-3-shubhamsanjay.patil@amd.com>
 <sashiko-outbox-198746@kernel.org>
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-198746@kernel.org>
X-ClientProxiedBy: PH3PEPF0000409A.namprd05.prod.outlook.com
 (2603:10b6:518:1::46) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: f28d61fd-1463-4e0e-c64a-08df3b897fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|19092799006|261022105027099003|11063799006|56012099006|4143699003|261028144727099003|261009223027099003|261021121427099003|261026121527099003|261026140227099003|261102123227099003|10067099003|22082099003|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 7EyulDLTPSvvXTftVGYoFV6Uf/HkX2GqzJpb3mv4XsbAIcp1prLEUj0xfTDJJy4wv5M60YYdajbYvhBQ/w4iKaTCPTEuGkOzJFO5OPPtv77O05BVIkRk32DrCJRAeco+ITnXc88oh7AADMRyoyLBXzn+lOj70PUNdKi22eOAvtnifdcdUSSEjn7PAYVJafqhNDM3qKMbSgG5PWBw1ZQlBFPbB7h1KxuEg8iJGojCb+rZddtjQ07cpenxjMJBNjh5l6nC/9wTKNANsTx2Tg/WFTOFLnub07j4ndOly5UQMQFnv+qRjTW/H5pJNo9ACan4fVy/R4EhDQFv6zlSm48lp0GiBkUxrsGY4q+3um768vXU3ERPHSVyK3BeRU84ubZfHIgk4AzlxyT9S1lbakQKrno0EIoTpeeiNDFlcH29CDGlzoXGCXNbCJ+JkcesEfHoVn15rBf2ydWiDVbYBrN6WUESSiFcXe1SDFtpmZYNkIDnuUjGF5DpJi9Hi/cK5lEDXTGj8DEAQobqGL6GP8ctcN8H7PaLRnCoTviAoaOzfSwsuMRW+U5E5UW7WzFLWhUpKasSD/kVA0o8gCLZbsMR/Gvw4hnyynZInWMV4nmIQBE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(19092799006)(261022105027099003)(11063799006)(56012099006)(4143699003)(261028144727099003)(261009223027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261102123227099003)(10067099003)(22082099003)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ip4brVsZ9Yx7M4THJoLa5Dc2EisKwWzdwOV5OmiWjamvadwAI13TLkOX+8?=
 =?iso-8859-1?Q?nWZsnO74TNGMHimeKgGjAKYN01RarhPO7abcpXk0JGk/1m/cNBhKnHZdph?=
 =?iso-8859-1?Q?SinOvtqam2Gc3u7gz35QpNVCdAKUTB50ewKot1A64t2ynTHcqZIuYBF08i?=
 =?iso-8859-1?Q?s+NJKSpMA9zsfuvHDrdwh0pkOa1X1F+ebUz/nWBeXxoYJnl5rK+TPmOGwX?=
 =?iso-8859-1?Q?j4/KviSXD+wInIaMnAng2swjQ7mV9mMRRT4j611rU+OIY+cBvYvB54e1gc?=
 =?iso-8859-1?Q?5yEp3rcDBKI9Y64k/O/E9IPkoVFMaoLUWSMaw/BVyVPgFsNFLC/mb0H6m3?=
 =?iso-8859-1?Q?oacUQbB/c1VtPcIsptMamx0BHiOKz26SGH53Lfxb4z5H5a6LyiUlA9f6UB?=
 =?iso-8859-1?Q?CDP+/RC5JtuCg8sDRpG0DMNTK37hcAmuJr6Pi+IjmYtrYHNpTAg39veWMc?=
 =?iso-8859-1?Q?rcCIj+zbE59BDLV0WhQ96uxA3mtejgAjlZ5xYhazG2kP2ycP5v4EKUVZXn?=
 =?iso-8859-1?Q?CDjOvLjBhngYAnE6CnPV2jeuQHteiuLGw9qex8YNiewSrfnqCfU4b9CVD/?=
 =?iso-8859-1?Q?5cOLpgsQcHTrN9b3iqj13GxVqsz+BwT/XRoCOlbCcKuiC0QIs18vJqqr8y?=
 =?iso-8859-1?Q?07JS6kyOvHZ4BYw/RHMdq2J+nnwUBYFDRcaAM29gylh2wRhviz+tqHeIFX?=
 =?iso-8859-1?Q?AI9AT59rpbhrupIUjAOZ1NS/KUfGS1NiSipDo0xqLQxpbncUu4yplzyqYq?=
 =?iso-8859-1?Q?HeXaLeGRKfvOCiXkpnTUatw/y+CKt7y1eByhgx3vS0r+A/j7D6+KX1xMt0?=
 =?iso-8859-1?Q?fahZ7TZxfoyDJvIGgL6B/lc4fWA3HXNo36MKfk8nT3Bm74cLuq9ErVMc7c?=
 =?iso-8859-1?Q?awAbHY9rE4sgE87ZL5MWKmKP6ZpEkIjXpkeA4HXwZ7ySJwrDqPc8dDnhj7?=
 =?iso-8859-1?Q?RMOrJJOAy/ocob+pwtaqGFfEWdo8D3pb2YOwVeM/M2HILucsYvqm3zAFEQ?=
 =?iso-8859-1?Q?XmiqMP32EAWjJy6OahmgZ5sKqPX35x+xFuJC5BUXYy6eI2aP0Jk1Nmf0hi?=
 =?iso-8859-1?Q?OABHllJtpbNnoMw39tGK/gYOnlShqy0KwewfxvIJWR2Ecyk7H04xO76qZE?=
 =?iso-8859-1?Q?7ZgEinSfagvpfddvzVEM4BvIwgKCegCM52YtR5OFj5o5sFLfcgTMyRQVV4?=
 =?iso-8859-1?Q?0+AZRXMISPq+/kHsqyBSRyiweUAwLSz6srldijKPOcyqktgIgrK8u50z4o?=
 =?iso-8859-1?Q?xN2Uqqzg2L8lZJ4NxrraXS5XPEgExl3gI1Bzw5fNpuR0pMNt+30vC4VsPI?=
 =?iso-8859-1?Q?cEPFlj4WpoBZpoWjnZO4rZhEmMu+HKotabCHSOb5RX01uxTFQAj76gWp6N?=
 =?iso-8859-1?Q?tQgFNae4pnzBqc+iSdDu5Q20Ul5MhpRdbcTCruH438XP+hklATTXA7eELr?=
 =?iso-8859-1?Q?B4Bilo09MWU74OWoiMu78C3Xn2ssC+HcgC2amHFa8kfUjOe+Al9bVxw+tc?=
 =?iso-8859-1?Q?P0xIt2b2SNUugcr3BlJ3RrzQ2ZEZGYuxCVW+R3H6Q6fQMbi6BREejl60yI?=
 =?iso-8859-1?Q?QSzgqYzTUelux0lCUq2D8GtZyjR4jJ+u4DUbpdC/QE0iINPcKnpO+gbw34?=
 =?iso-8859-1?Q?WpThi/sCA+mL8GhtYFVtANDWaZtHqXVKXo0E20G6G+Wk2fkDUO/E+3DlA+?=
 =?iso-8859-1?Q?OUqFBqSmSqniE+P4aOgyKbuLsJS3Z8HB7UrT+5OXb6YJUYgIDi7S7ftQMU?=
 =?iso-8859-1?Q?+5t5W+GPYFcjNyTzO2LPCrsEk6KHAAALFB6X7Y7jKpuzuEql1EsPca+/it?=
 =?iso-8859-1?Q?8GwklIz6CRZUBInPMqtulz1Vb96euCKzLfEkWTjpTCrApaIWCGkq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f28d61fd-1463-4e0e-c64a-08df3b897fce
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 22:09:45.1376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fPbfDm4bwBLQKSvL6rRxhijdDyPBirWH8yDE1o6DVfnW8Q2K9IyXZlYzBNg7FH3lbR3tCFhm/lYoRbvB+odsG6UPxKQVv4nj6xbX/4jWzlM3st+bENFCR3BRoi8xo03
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8541
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_140949_982366_0EDF637A 
X-CRM114-Status: GOOD (  20.20  )
X-Spam-Score: 0.2 (/)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 09:01:14AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] i3c: dw: u8 truncation of rxfifodepth in dw_i3c_common_probe()
> --
>
> commit c93cc6843b57993d053db03cc3f7cee25dbd4371
> Author: Shubham Patil <shubhamsanjay.patil@amd.com>
>
> i3c: dw: Track the transmit and receive buffer depths separately
>
> This commit splits caps.datafifodepth into caps.txfifodepth and
> caps.rxfifodepth, populates caps.rxfifodepth from the QUEUE_SIZE_CAPABILI=
TY
> register, and exposes the FIFO capacities via base.tx_fifo_bytes and
> base.rx_fifo_bytes.
>
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw=
-i3c-master.c
> > index d1119f203d1b6..dd5462b129514 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> > @@ -203,7 +203,10 @@
> >  #define BUS_IDLE_TIMING			0xd8
> >  #define I3C_VER_ID			0xe0
> >  #define I3C_VER_TYPE			0xe4
> > -#define EXTENDED_CAPABILITY		0xe8
> > +#define QUEUE_SIZE_CAPABILITY		0xe8
> > +#define QUEUE_SIZE_CAPABILITY_RX_BUF(x)	(((x) & GENMASK(7, 4)) >> 4)
> > +/* Sizes are encoded, 0 meaning 2 DWORDs and every further step doubli=
ng it. */
> > +#define QUEUE_SIZE_TO_DWORDS(x)		(2U << (x))
> >  #define SLAVE_CONFIG			0xec
> >
> >  #define DYN_ADDR_LO_MASK GENMASK(4, 0)
> > @@ -978,8 +981,8 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_d=
esc *dev,
> >  			ntxwords +=3D DIV_ROUND_UP(i3c_xfers[i].len, 4);
> >  	}
> >
> > -	if (ntxwords > master->caps.datafifodepth ||
> > -	    nrxwords > master->caps.datafifodepth)
> > +	if (ntxwords > master->caps.txfifodepth ||
> > +	    nrxwords > master->caps.rxfifodepth)
> >  		return -EOPNOTSUPP;
> >
> >  	struct dw_i3c_xfer *xfer __free(kfree) =3D dw_i3c_master_alloc_xfer(m=
aster, i3c_nxfers);
> > @@ -1136,8 +1139,8 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev=
_desc *dev,
> >  			ntxwords +=3D DIV_ROUND_UP(i2c_xfers[i].len, 4);
> >  	}
> >
> > -	if (ntxwords > master->caps.datafifodepth ||
> > -	    nrxwords > master->caps.datafifodepth)
> > +	if (ntxwords > master->caps.txfifodepth ||
> > +	    nrxwords > master->caps.rxfifodepth)
> >  		return -EOPNOTSUPP;
> >
> >  	struct dw_i3c_xfer *xfer __free(kfree) =3D dw_i3c_master_alloc_xfer(m=
aster, i2c_nxfers);
> > @@ -1738,7 +1741,14 @@ int dw_i3c_common_probe(struct dw_i3c_master *ma=
ster,
> >  	master->caps.cmdfifodepth =3D QUEUE_STATUS_LEVEL_CMD(ret);
> >
> >  	ret =3D readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
> > -	master->caps.datafifodepth =3D DATA_BUFFER_STATUS_LEVEL_TX(ret);
> > +	master->caps.txfifodepth =3D DATA_BUFFER_STATUS_LEVEL_TX(ret);
> > +
> > +	ret =3D readl(master->regs + QUEUE_SIZE_CAPABILITY);
> > +	master->caps.rxfifodepth =3D
> > +		QUEUE_SIZE_TO_DWORDS(QUEUE_SIZE_CAPABILITY_RX_BUF(ret));
> > +
> > +	master->base.tx_fifo_bytes =3D master->caps.txfifodepth * 4;
> > +	master->base.rx_fifo_bytes =3D master->caps.rxfifodepth * 4;
> >
> >  	ret =3D readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
> >  	master->datstartaddr =3D ret;
> > diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw=
-i3c-master.h
> > index f5b4491b247a0..e23554bfc5e49 100644
> > --- a/drivers/i3c/master/dw-i3c-master.h
> > +++ b/drivers/i3c/master/dw-i3c-master.h
> > @@ -14,7 +14,8 @@
> >
> >  struct dw_i3c_master_caps {
> >  	u8 cmdfifodepth;
> > -	u8 datafifodepth;
> > +	u8 txfifodepth;
> > +	u8 rxfifodepth;
>
> [Severity: High]
> Can master->caps.rxfifodepth overflow u8 and truncate to 0 in
> dw_i3c_common_probe()?
>
> In the DesignWare I3C controller, QUEUE_SIZE_CAPABILITY_RX_BUF(ret) can
> return up to 0x7 (256 32-bit words, or 1024 bytes). When that happens,
> QUEUE_SIZE_TO_DWORDS(7) evaluates to 256 (0x100), which truncates to 0 wh=
en
> stored into the u8 rxfifodepth field in struct dw_i3c_master_caps.
>
> With master->caps.rxfifodepth set to 0, master->base.rx_fifo_bytes also
> becomes 0 in dw_i3c_common_probe(), and the nrxwords >
> master->caps.rxfifodepth check in both dw_i3c_master_i3c_xfers() and
> dw_i3c_master_i2c_xfers() will reject every non-empty read transfer with
> -EOPNOTSUPP.
>
> Should rxfifodepth (and txfifodepth) in struct dw_i3c_master_caps be u16
> instead of u8?

Make sense, please fix it.

Frank

>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20261105085425.34182=
30-1-shubhamsanjay.patil@amd.com?part=3D2

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
