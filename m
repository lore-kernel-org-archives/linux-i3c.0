Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D24F5A8DA
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 03:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13e5jsDg9HgQ4WmhjVS9TXpyJWlncfejD7Snf1plIqo=; b=x2NlIOSzIitaV6
	/2jFhA8Jpeaidq0ZkasI8dsKIDnCHrzjATmaj4KR7fpW/dfnhicbnNyZr7e32OfvG7WsmDn8NPTsf
	yczD570ntGypunDm+dhoHkY7om1TTgLoQjUJiQeWJEPf1VXL3zo46LB2PhKpK+M/kb3TraUA4LKc2
	QOhUCQ6VFeR7zNO96OBQy17h0a9FCPYQfQh2TV8O30snryxuBwqLssObq6QpmBoxK8a9uX9/Dc7Yy
	LtJwfu+m9tbvTmglKDti2I0rSYaI6cN0lqSPtKzNNqXLmED1yofFYd33z06Aulvt4VZLrFihdjJK3
	1kiQmSq6PDGgTlQbdxcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1Zr-00000007zJI-0nLu;
	Tue, 21 Apr 2026 03:15:07 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1Zo-00000007zIh-3MP5
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 03:15:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmsSy2MP8xmDZCJSG+AVVAgl8aVsyPt21fosFDrfa3AJXRC7Jxe9RXkSbpOMl70UVcwPATMPbayDnCE0GaZehEPXh+hyg9YKRrzWsz1XtTcTVG1kDQoIwSL/XNuOpGo9Gog5Hh1u82GIUplRuidxUx88htrPYcWgKv05tpyR+ePOpsxJPUb5HLGRYAa3HwfcedYBU+x0aNiQjknfjpsB5RBhX0O08yxmKrizX4Duv8nNnxf01E5GiuEKKpTazWfuQeGpRIJ90+sIthSFeUH/oCMDDsMPEAL2U3rlMveLL7Ehac3cDKoNZrTEcps9QRa6C6KSIw8TodBiHEx2EYupig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIMx4H52JuRcLoLp/aZlJLyexl3WJ4AuAbf8aFc5vtA=;
 b=MLo0duHpbYVO89CokPBghpUifoPzoktMJhMZ6LXGM5KVZrQhkfDi/BDmU6Vd/rh+LB6ZRa3KQLI4Ln1DAAZ2IutM+gvCDs10NpONHJVcdilr+NRtc9Qxu69Uz/HzNKfmiCdEYOOwCeBeNxbmRLJp9EXL4dUoWhXUq3f7dGk8xqvvm1Uyz46iJiwES8OMjXfxOfe04hiREINkvZy0y7DS/BK3W1dzeZcM0OroZut4Fbrz91oK6pxgZqpR08T1Yyp11IcORtdhNX1EETvD6H8Q1RVXMySzXfuH8kO2kBqmw6pN1uRF4MqwEZOr/ai5ZKIJsf8NgQ0AmT6kbJHw91CiUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIMx4H52JuRcLoLp/aZlJLyexl3WJ4AuAbf8aFc5vtA=;
 b=PYHQ5ZpTvT8pnz1z1OFbAi76bckxf+yN271ogK3EGnkXTINpAuEV3e6IZGhuturqP7H3ZypZhl10Z0Gkqg+ZfTmtETXJWPCmtgS67qhN00Do2OARbZRLczQU/3WR5F1JIYzlUS7GVgICqh5NOEygc0dF7yMc/DbfiWR3mLoo3HqlzeFLKDN2R2pn+hcrpXYM7Ad0rbjX7NONURLpnV0gyAidxdaI+mG/x5SuPUZbTK8aSVivGJPO7Hd3OVW5SuG3WGEzpLZY+nBCfD7jufxFOroxnHKCb/EX2aUkogfpwfC3CTdcE2sTeUM8QUTkF7s+ysftJ1bxEzPgDYj0sZXUCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10521.eurprd04.prod.outlook.com (2603:10a6:150:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Tue, 21 Apr
 2026 03:14:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 03:14:59 +0000
Date: Mon, 20 Apr 2026 23:14:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v9 4/7] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <aebrq_W-tLqZ3K6F@lizhi-Precision-Tower-5810>
References: <20260420105222.1562243-1-lakshay.piplani@nxp.com>
 <20260420105222.1562243-5-lakshay.piplani@nxp.com>
Content-Disposition: inline
In-Reply-To: <20260420105222.1562243-5-lakshay.piplani@nxp.com>
X-ClientProxiedBy: PH8P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10521:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d12bf27-4d76-4f4b-53eb-08de9f542b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|19092799006|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2l4han+WKs8oNiF4q9w5k25LqBk3mVaxtd3Gv6BGtPfpTw+Kg618SCNeZ/BufcV5TmDmH4cHCZ/mUznhv9+TAYNAnP9LZD/AoQwZNRzciBY8jhdEme1QuSNFy0LJs1EfPvCQkgX+VFP0Ur+e4YSD2kVVLqYkcRM5LWxq5/q2nuaYXTmOHpjE5jw7idUhkPUZHX/4yLevRa/Gq8Cgm6Uygo6eomvmmtXjIj05sbFKWJA+YgpEvNTVb1hNfbTz96tMeMNNcmNVSE2Mp5Z4L7im40SfluY8UuB1Sn+wz9ktYP4UE7UeSaN4X8Q/Gn6db1CLs+lv/rZ4i2ByxMySnbm8denXQt3sVFtN59o6sdLgm4YmdVAeOCV9ph3KxUZ0dKa3UHxzJTD1/mZbeIYHJU5hg775YS5JHsdHI4MEPjpr+X3nG44GNLt8JD9+3b5cVMIhbdWD2e8j53Bw+e6DAYOxr1Trpb4T/vtqtVPNG6/CfhP1r48fFzlK04LA3972Ke7aSWLrolFdzJBMIRU9ZLIlhMwrf0bJGfpEmoIzGoMcgY2ukJ30ieYjD81tDJ/bFr+KWjP3wvEBsqi0LPY9qa2ppYL+gE9PeMsO85VBkYjGMSvUmLYAUsr2z7Ya1yBwW8pypPDWOGGNmJMVNjo3eC7ffhmKJO4Gqm5j8K5t89r5a+QWs63T4TiMbicvfX7wLJeYQmrVEjw0rSmEa+XJ9+0R7Xyy2Il6Je5NYoPhsHXAuY/ceuDvhMnz7W0ce9wicsSSv5qhDibqqJT7V3oFPCqk3jGUTrFGFw1Embbs7yWnic8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(19092799006)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o5fKmWn3EgZpRO1M/4NyWv2LZh/XMIWbL6P3NiE6s32PrexNN2TxwT0EF4xF?=
 =?us-ascii?Q?fxatb4sde4OceYOtBfeaCO0//nScCmq+prgziJy1ZDKdrU0AtMqVYdv/Z4X0?=
 =?us-ascii?Q?oz8NfO5R5riwfVJ/FfsJmk125/cmmWUTuLaaqL5y+cuBMjd95RY5ufW2Lx7H?=
 =?us-ascii?Q?fIYXrHMmwFt26uZx/5VoVBaZJrO4M6Gt1dBH3g2tMMw7cdbHwkiH5WIiR9B4?=
 =?us-ascii?Q?pge+8WwExFuAebTZKxm4I2RXxwtEKPbezShZ/4hLtZWhZC/IdHjqPrwBYvsf?=
 =?us-ascii?Q?rh2tUIF2KdmtxK+wso95B5W1DQtIU9W6hPH0fwq4mRE++KKDvd5Ohwhx/Y7l?=
 =?us-ascii?Q?BU69FpYN5bYsaIjatuquZqUOf17ov6WwkBqqADRrjH+dVygazjtnOAPpSTyv?=
 =?us-ascii?Q?B1oehPO4fy4T/pa2s+/nACXTnuFXjRITMk68JkbUyQRymh/PwbNUimocrTZ9?=
 =?us-ascii?Q?8fGoW5ZaF+2jRf796tT3I0gsGZp68RMDMQ55jkykBD6UM9D9SXuOVi5hT1IK?=
 =?us-ascii?Q?PpdG88t0xY7AzPBDCKMXOAycdwIa3ULHOrcLuL3HAWrl3FNWY/8MppSkhVe1?=
 =?us-ascii?Q?O+I2woD2XPZRr6GEnXQ5zDcHJCn0+KPgIMhIuXIbxtuKGbdrNXmP4trejndz?=
 =?us-ascii?Q?Ir1xlEjMRQ3DYSdB3I/rhUhzk+gojWspXBUVrmmgReRM4iqNgFsH6Kaghvfj?=
 =?us-ascii?Q?BN2J0qw64Yss+tLqtVipFJedjYbOiuek0QwvvsU6l4VGOkvdXIoiy+X1cOFw?=
 =?us-ascii?Q?hgAcjhabX8Ve9rhrkd2je/sTjMHY9TKYuyzSxWFiHNdWFOXIQBPNbRt82M4h?=
 =?us-ascii?Q?Ab/5ROtRaBfF9DPyVphjEqx1Dxt/KaRP9dn1NQoKXFaEOYBc/R6jaXO9pbZB?=
 =?us-ascii?Q?FXlhoDoIWxT/QSSNS5T7HwtgcrP22ZgSJL600XrcqE96hheAS/ET4t4ShdWr?=
 =?us-ascii?Q?I0pOixLrEEAZjMiVizP7+cARFhEEpf6UG52OH8ROeH0Wr+57EqVhjXDe788B?=
 =?us-ascii?Q?KsSzJmuYgVV94dPkblZcsVCrluentHzaQbLxkGvixJLMlVxuebxJ0GGcthiJ?=
 =?us-ascii?Q?QvOYHGNWvNOMWiyTsHLCDPJ9etx7qvA8zCIASColFwTXFqW9NUhS0Dtn0nke?=
 =?us-ascii?Q?LfDs3tszZ1Q/ssqGkznSiWg0/5UPDpr4SUNFoofwqTJouykk4WRPP7f9ZuP5?=
 =?us-ascii?Q?tiNyHUr7K2+L82LDQWLml/uzK1LfNqhrA6qId1qWgL3XCv27cIw3qV10evUK?=
 =?us-ascii?Q?X/xoW6+Yfm+MAnffhuhbzhAv/v1WbJkoXzq2D62i/j5mkCU25RHerBF4os4/?=
 =?us-ascii?Q?g40/zKTm2V+I2nugMDwsKswWlNU6vqu0/qUBDQDHH+i6sGCV2jcT5uYlM5HX?=
 =?us-ascii?Q?P950wHBEOE0UWol8J5/J91vf6pYDxC+NdQPktZGjtp6+F0F7FuPExp5tQ03s?=
 =?us-ascii?Q?P5tXpXJ177uoJDQglNB6KqSv6rYVXDQbjmArucVXnMMpH6/8flA3amU0V3GE?=
 =?us-ascii?Q?zEHAzmm29rmMdJ0GA/iZnU6TT7A87H/uPQZ5XsW5w40w5Kc77F3CX3fTOpEZ?=
 =?us-ascii?Q?LjObtD3ttPrrvMGROqGVwuqXwni9MC8wX6DRgN1MzjoMWqJGzJ9xUYoWG14B?=
 =?us-ascii?Q?nVfzjDUqkbK4gnlsEWJ/9CmP+qqjYXadniqWB6lZVUiDztMcK+L7twr6+NDt?=
 =?us-ascii?Q?RlH16NbBjPkwcCjC2+PHc0AmgJEJ7xJyaRaB9MlhTxlDVdos?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d12bf27-4d76-4f4b-53eb-08de9f542b65
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 03:14:58.9139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sFoL9gtgAkMLPhTWAMWaFpo4ShfCxTFfwOIrcEwvR0lU5Zu8oqbyFDJs0XI4/HUc2zpHooKSJOuhJLPcKhgkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10521
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_201504_849988_FB903AD3 
X-CRM114-Status: GOOD (  11.37  )
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

On Mon, Apr 20, 2026 at 04:22:19PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> Add core MFD support for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> family of multiport I3C hub devices. These devices connect to a host via
> I3C/I2C/SMBus and expose multiple downstream target ports.
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
>
> ---
...
> +static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
> +{
> +	struct p3h2x4x_dev *p3h2x4x;
> +	int ret;
> +
> +	p3h2x4x = devm_kzalloc(&i3cdev->dev, sizeof(*p3h2x4x), GFP_KERNEL);
> +	if (!p3h2x4x)
> +		return -ENOMEM;
> +
> +	i3cdev_set_drvdata(i3cdev, p3h2x4x);
> +
> +	p3h2x4x->regmap = devm_regmap_init_i3c(i3cdev, &p3h2x4x_regmap_config);
> +	if (IS_ERR(p3h2x4x->regmap))
> +		return dev_err_probe(&i3cdev->dev, PTR_ERR(p3h2x4x->regmap),
> +				     "Failed to register HUB regmap\n");
> +
> +	p3h2x4x->is_p3h2x4x_in_i3c = true;

Needn't this one, you can check p3h2x4x->i3cdev to know if it is i3c dev.

Frank

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
