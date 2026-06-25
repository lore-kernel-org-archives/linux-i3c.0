Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B78CDB479
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Jun 2026 14:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MwlxxCrNO8mwUrPaw22a6mwp/E7S77RsUKrerQmlmzg=; b=31fR7C5CwBo/aV
	9eKKzVzTjbq4bXrDxQ7690u1vmvwtGySAO0d+Cwi0hbAPtMAjBQsvciHZKmgx/9Q+aZN1e7MtFbxN
	BHc/b7EXp9bb3T3ny2EZ+5tdLeNWWYUshVSqh9sc4xO4921CLVx73yn2+RnfK4u7ZcxSiRTuAF+9N
	/z8XlGcPeVJ2iuBktPz7V7Lsj96LREpTzeDIRB5xmuCpAQk8jbIbWp+HvK8fxurtVFC9Wv/VlQkXG
	3TVp4NC9GxF8AokKhtpaS87MUlGij0NTgjzSjofEmTl+g/vYM8Plf7pUWxC8sxCyRVWh51tT3QvTb
	JAnpBAsBrqEoiKpSizcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcl48-00000009KyJ-3zFN;
	Thu, 25 Jun 2026 14:28:28 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcl46-00000009Kxr-1Arv
	for linux-i3c@lists.infradead.org;
	Thu, 25 Jun 2026 14:28:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKimwNhQflp93TQfetXTC3a3XIFDcGeJGQgkDM84p5Bg9RUwlB1fg3Om80MqHW0XZbfh1+CFH2PY7xnmeunhZ16pDRp2t+W9KaJZiPMqf+uUVmtrjf1wRPHc7qXz+lTHBkXEHduzrAKQqLvrNCGcEKs9pbGhpd86IhK5TjoGJKozUpO731yGxHpjinYNPS+/h55uxkYvvmVuS7zymCm9ZwUYgOTuOuiIXn4i3yQOg5KwmB9xxHNItLCrqK3y8Ox+baj2AK8F8PeBkyJkGFTOd3fgbG24xVnGRkm+N7mGryvQ8lrtq4yuke5fpiXpUTwPJicXPQQ0bCKHwmbbbtnyTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKPK5QhawMXRq4cv5jGPhaE7ucZ6XetpH6P4Q1x2AXU=;
 b=ItygnvONNxMQG/98o9qOiXHZdksoWSzYIcTjWq9pi7/xfpjgmfkNEuTUlOioYBRrRENsP1KgooCRvfgcd99WM9nHv8Gtj4hUwXCYnIoSpZI4jxVbQvFtmW5ylF7sEfrHj7efckKtJd+hSW3skR4d0Z2hQ5tubECTa7AIwPWpOfcE8qW/q5dlUg+sh2mVZfNLvLw8OapuiMq3Af9+jh//zQek4EgTVtC+3HPTUTjjDnYlQ0xRnvbg0i/3bTao2seNWdECSRhLa1SazjE8IKx6LD/0yw0AvwcIgyC9Rntkga0g3QiV+JBs1xosmbKMmdKFGv0B5mKgR3fw7qenqtddSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKPK5QhawMXRq4cv5jGPhaE7ucZ6XetpH6P4Q1x2AXU=;
 b=jM0WqmNKEpd6Py57MWTn3aVlClH+yxenm+GGvZemcFbAk9/cDtNM4Gx7JXdNB6wQbnDys6snSvxfVvCQUiqyRC1A6xupuzURoXTXAo3oyR8sluqQz/NHdHPOpxlVhlhO96G14CxYo4n4d7aYMmxM085s3Y84keki9w3ICYOe5mdD9baxyblcUBIm9q7oE/P4sKLOcE6jj6dwrQAdDgbhORIVXchhhlXM8qg4d9AiWhLXBdpkEQpNdR0QBpVrmiqQy72iEeTQ1gbcIEDr4XJQ2EbDSq62to8lwLE514K+2u419VhZzLzrxseAOVLJ5SH/8mM8loOxLPvHwZ695iSbYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB6976.eurprd04.prod.outlook.com (2603:10a6:803:130::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 14:28:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 25 Jun 2026
 14:28:20 +0000
Date: Thu, 25 Jun 2026 10:28:13 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: renesas: reset xfer status before each wait
Message-ID: <aj06_UmHobM_U6tb@lizhi-Precision-Tower-5810>
References: <20260625030357.87402-1-pengpeng@iscas.ac.cn>
Content-Disposition: inline
In-Reply-To: <20260625030357.87402-1-pengpeng@iscas.ac.cn>
X-ClientProxiedBy: SN7PR04CA0091.namprd04.prod.outlook.com
 (2603:10b6:806:122::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5d3bb4-3363-47f2-4da9-08ded2c60166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: LXuMYBLj/bzVFmdKJtYcfxfkTATdwYe/I47K16gU7a0TkU3ZMuVg29zLh5pqG6Nc/vMtfoahyVN9P1ypk9yaG4aPvErvjCagkAe9m5IeZhSwOJGnWHuoDm/ibLfkPdiuNYFDXTJXfM2GPbxu/76nrLYXEqXwGT9csHk9Xw9LqaruZGd2tlS2QWmtL+GWqs4i/DrBsraO+ac/EczpNuyuowKh/KF407cr6wCvLAbwJPA9H3mRgXKFqcj3+qeygSMrW8q87ARdBm359jR1P0E8Oo5YLlyUDoeYG1+Cu3S641dlQk62TXWaxugGJOO6brYWxvOd+YELC6YCqrNmFEwlG2b/iJ0GOVrPXAcOyubt+D/PnAHH55VjwqL0BRfa6ONBpqfx1+YVpYeVt3GILTTs9Z9J/FLTGbI72JxbkIfU7KQ79RCW8O+CUAAHBE8uA0bqe7TVbJqoy/sRqNuo/Ctk1ZIGYiVJNjIJ+0d8rgmv0aD4Y+dDmZ/3vq6KBkesQ3EHqrVhEAhN+o8ArDqhmXrKG/sxofaWKqLHEj7lgpyditBLWDHgACh2P6R4Ie4U/3C40L9UNV8yOqTzDVYMGl1RR2WApr9ZRGxhNPm183da0HQq42wQIqRnQK4gu5VryeUznM60T02ZDGbE0gQuB9gP2AeNS5x5aLQfjAgr4VVav9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sz3B/WCsLWO7TVWWy0pejvW5W2ug5QvDEG8nw2138fmWfr5w02J5uGY6dBgx?=
 =?us-ascii?Q?8Glo5AqGG82k9or9Sin0wQiBGGVWEdwuqdQFSMG2r8MZ1HjRF+LewXyFCtOg?=
 =?us-ascii?Q?OHb92dTrvX1fSncECOQLORZg+JggBXFPKSmBFmyOTcuUGvA8GOIs5NUP3n5J?=
 =?us-ascii?Q?yuz4J5POgAXN5uc1lZ4kt9RajJbMwmE68auf10T4eP4gGcbfaJLgnfsDcoWp?=
 =?us-ascii?Q?fLCaoRgRGqwS5QsBg2qdYmWxLxBLaptCmVBQXVsbR9GiKRPJhVHlPWX0OrfX?=
 =?us-ascii?Q?CbafVZHxV7DYSnm57sZeBAsbzHh57POC+C/Q6o3LH0NccfbXjOD8L+r1vFru?=
 =?us-ascii?Q?/QAN+/C3ojC0+uUcoOgKsU4f5gvcKAxTm8QmiR+iDeL1Pc50tel4ojvfBaRl?=
 =?us-ascii?Q?pu/f3K/DLHEOCA4xFj5Br8SYdWBAAN0KmXlhdGUaMRoG+/i3Y9YKkAphddi8?=
 =?us-ascii?Q?kTaAPuZ1dVWMx7HigwrPwNLYWhEMtH4lXX/thiD7fzNfvQ+KiKnh8q2CR7gP?=
 =?us-ascii?Q?AbH0DVMS0wzB+WXliRTB7A3RhbrVEbGd1HeGgu6PA3a6HXmfFW3WmuHGrJvp?=
 =?us-ascii?Q?hlllA2mRy0XRJ3lwImjdi8PcNX4RVJhBLqvB6/LS7EckAtL9awd8XCOgwe2G?=
 =?us-ascii?Q?6qWFiFev/Ohbn4+bKaozJZu4D7y4NF4M0ufICxbMcNLdf2Xz1Ry21h4OtKds?=
 =?us-ascii?Q?rh1WNcCnvyqbVEk5AMb9cHwSuVRFEMzD3rN9dxwPBgMSuR8hWL4ARiPRSOgs?=
 =?us-ascii?Q?slBEQoRT++LQRk0nY8oe1Rq44g1UqKMiBJkH2TP5KBF5dnmNeXbe+IE68Gde?=
 =?us-ascii?Q?UzB5HmRGBmhASkgqn4EfhyKVGUxUYWQhmVFRKujwtsvgVxYtozHlwZ0PRWNG?=
 =?us-ascii?Q?BhOsjkzDifTW+CbW2rwVM3s8GhyyqARd0b013f+6ByqRjq7NhmSBtLkB8XM0?=
 =?us-ascii?Q?+m0/u2jGUcbMjmOlCaXVMA19rbL4XxtnJ+15Nzjew4irB72mpxXvJ3UXer10?=
 =?us-ascii?Q?74hpF58tTzoFC1UmlcbA70j2mnC/chi+6KJYTHJDTugiLAvJaoDXd/G1XnHy?=
 =?us-ascii?Q?UhS2AEVqp7EophnJkzWGht7hssfci0i/MoRlGBQE61KytDir4mt4fpTgo+cg?=
 =?us-ascii?Q?OXzO9FJYsKBROUfJ7jZpUrMT0K+e2U2m/e4TIHBolxZanDE6pVwLEWqBemYh?=
 =?us-ascii?Q?l3QN5K8/ZxH02F6FctcFV3RndpJQpubN9ongysSwnkBlFxbANfqf4i40RUuc?=
 =?us-ascii?Q?y8H8USSCD2DWjYnZ8WfXVPrhoJmDa4V3r+8Yl+o+sdZ0+AoUHSDMD3Y1cfwf?=
 =?us-ascii?Q?cPUkyoXDGMJLhuhdZ5TKbh65Q2PGju5hqYehsGYVXlttJrEqNWnFEsbIE5lG?=
 =?us-ascii?Q?UFhOydlvIFxdkQfXJTQgvKv0K0GMg/WcLQLDDN/74lkETa10KU4L05c+b0nG?=
 =?us-ascii?Q?MW5bgH6hOcEaW/AdU5abk7UY2a2kWmOXfnBXe6huoDFeML6RAy/KWSnu3Xeb?=
 =?us-ascii?Q?/Oj8GtDKqnNld9BAfBfx+lfg8mwqUSm2Y1/r8zFmZhnqHS/wSJ1r1iTZ9xQ2?=
 =?us-ascii?Q?O17gPxyzzpCzBAfWCg3Q52ojgywCU5yBCIasMHwYy28SkQ2tAGf4+iOv0eTJ?=
 =?us-ascii?Q?5wNRjdQIwixtcYGH8+ZEKkNYvy77wjMr0pYWw8Qu4AN8AL3awctXum2At4aB?=
 =?us-ascii?Q?+WIfbnjGOK4dX9oFmyH5MZzpth6ZrtSrc5PeU+J7mCBZ0G6bQ3lJ35pF1drl?=
 =?us-ascii?Q?ipKw2aYjo5Jn9X0BVcnFRTL8Z4egKfsgir0bYDPT2A0YLG9Q1RhW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5d3bb4-3363-47f2-4da9-08ded2c60166
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 14:28:20.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEWP0FfpQElsyd1BsEDHu+ThMIKK4Ew7uL6mNTN6IUnV1NaaKmR3vZG8l9xKbjdq2nNn0fOIKVzc4Qg4l9OEGImMTRTdBeFQJ0RPmwHECb7lzZ0hAdBFNgKfy8pAO5Ju
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_072826_364653_8956CC7D 
X-CRM114-Status: GOOD (  16.63  )
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

On Thu, Jun 25, 2026 at 11:03:57AM +0800, Pengpeng Hou wrote:

subject: reset xfer ret value before each wait

Frank

> renesas_i3c_wait_xfer() reinitializes the completion before queuing a
> transfer, but it leaves xfer->ret unchanged. After one transfer completes
> successfully, a later timeout can therefore reuse the old zero status.
>
> Reset xfer->ret to -ETIMEDOUT before each wait, return the transfer
> status from the wait helper, and propagate it from DAA, CCC and private
> I3C transfers.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/i3c/master/renesas-i3c.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index f39c449922ca..7f123cd72cdf 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -433,15 +433,18 @@ static void renesas_i3c_enqueue_xfer(struct renesas_i3c *i3c, struct renesas_i3c
>  	}
>  }
>
> -static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
> +static int renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
>  {
>  	unsigned long time_left;
>
> +	xfer->ret = -ETIMEDOUT;
>  	renesas_i3c_enqueue_xfer(i3c, xfer);
>
>  	time_left = wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000));
>  	if (!time_left)
>  		renesas_i3c_dequeue_xfer(i3c, xfer);
> +
> +	return xfer->ret;
>  }
>
>  static void renesas_i3c_set_prts(struct renesas_i3c *i3c, u32 val)
> @@ -687,7 +690,9 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
>  		    NCMDQP_CMD(I3C_CCC_ENTDAA) | NCMDQP_DEV_INDEX(ret) |
>  		    NCMDQP_DEV_COUNT(i3c->maxdevs - ret) | NCMDQP_TOC;
>
> -	renesas_i3c_wait_xfer(i3c, xfer);
> +	ret = renesas_i3c_wait_xfer(i3c, xfer);
> +	if (ret)
> +		return ret;
>
>  	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
>  	newdevs &= ~olddevs;
> @@ -800,9 +805,7 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
>  		}
>  	}
>
> -	renesas_i3c_wait_xfer(i3c, xfer);
> -
> -	ret = xfer->ret;
> +	ret = renesas_i3c_wait_xfer(i3c, xfer);
>  	if (ret)
>  		ccc->err = I3C_ERROR_M2;
>
> @@ -815,7 +818,7 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct renesas_i3c *i3c = to_renesas_i3c(m);
>  	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> -	int i;
> +	int i, ret;
>
>  	/* Enable I3C bus. */
>  	renesas_i3c_bus_enable(m, true);
> @@ -854,7 +857,9 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
>  				renesas_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
>  		}
>
> -		renesas_i3c_wait_xfer(i3c, xfer);
> +		ret = renesas_i3c_wait_xfer(i3c, xfer);
> +		if (ret)
> +			return ret;
>  	}
>
>  	return 0;
> --
> 2.50.1 (Apple Git-155)
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
