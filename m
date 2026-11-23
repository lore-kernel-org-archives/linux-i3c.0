Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5115B606A321
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Nov 2026 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O18HY86k;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SZTZzos/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=swcQ3FSqnmbpVeLyVySAvAJc5tsdFa46J03tZI/4z6o=; b=O18HY86kvJ15TGlFMtXctJZBZ7
	7mSt+fwSygw+azF7epY99YGRI1n0r+TTLykl+LV0Np89cebOn5WgfByVgnLBH+d74pLX0WuTGxwuQ
	Id6PUUgvuweWSWbaKnQENnEynIrVo2UozuevNwIHcEsjx8sxzwqtbn9s01r338iDGtHjRkOMAuqjL
	Y0OMkC/uBySnxysPqBjdNN5bEQFdLjUbNUlFD3/mc5j7wb7sbqdAbSly1Au4XREHt/+HICCRkTqWy
	zyui7XvpqKdAq3ibEjEgJwqqLBYyeFF6D0GAhL4amZ48HmH9fjiTg2kdIv+4zP9lm7qWr/ETx0voP
	BhcM0LQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaaM-00000004oiY-0Fa3;
	Mon, 23 Nov 2026 20:24:22 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaaJ-00000004oiE-3766
	for linux-i3c@lists.infradead.org;
	Mon, 23 Nov 2026 20:24:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opBgBuK6xmNUcrGH2f5WD9V6mTXwcu/RKiaS5SlGLb+o4G1/5ndZj/hvFMwzixZHcArXQU9xJgxsJ6foLFuR7M+/HyiDQf9uzT6yS6lgXIAvNkBMOswNCssOnTkpo0clvaA1G5BNE/sec/vEEIZh98hcS5dmxSPjRrDl2TeG8I3+1AoQHjiwX0L1dB5jSmXmSjz8Ynio+n2tD9Yb9rsmKJ0quAUx65vcf1wELZH7N0mJ3cDxHjkJpel33rDmFVTNIGBLhB2FZYCklcavLajJbjEkRAJG1DshO9Kj1wg5Q9VM6a/3fxaujhx1MSYFv09h3/CINVKLUTeg720n0nNydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhrSqJvKPH7vyEmzaeryEZV6/W0LjCCQM07s0dLC7gs=;
 b=Rr2kGa11BG3kLo9OU/6AviprZI4jAJVsOPwnjIkKosVsk6KO1JtDdhlzStn8+5z4mzYQw4+ZupJwgim2o5iMPXacxqJ3udArmijGcwE9PSps0H056cLmEcA+kNAsw75BVsiZrX9uwGx9hX+Zao6zSN+MkBPMnGasWocf64lN+8ZbmpSnHikqy95AC9BMCM4UUQ2JCF/7wP/bbjt0/zYyMLTOCafITcqlSyF+7BcetMBCu5T4O+eVTbc9fThsLvE07woHs8YY3S1D58Oi/bxD2T7fhIvoBBd1Fgw7AQ8uWBCcCWqehblkJje37CWEF5ned8IkaBpC5UN/jxZJNVxycQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhrSqJvKPH7vyEmzaeryEZV6/W0LjCCQM07s0dLC7gs=;
 b=SZTZzos/4wDrHYtHodnx6Az+AnhQ2Cf5MqRXwIcChE3JVKfaILDYllvtpkt5DUuRDJlF/KkL0Z5ZzAZ1ppzvqtYkRdyPI6YNH6Kr8WBvrFVPU31SEOXlajwWP2ltUDAo465YegBKE20B12X//0kPV09ZuehMgy8Ei8xfvSRf5lyagnEtxusNHLbH1cEc87lEmLjFggh6UypPfVdGyB5k4ltPF6MSw9I1JN3Cx+J6O7Xo+FeVYwuh+Ucv9Xj1OvcFXH0fuNo8zKFeZGRWm4kJ3Wtp27vn8i7dhfbZJbWE9MLZlF+zQIMxlwtwdnvosssMj/k0TCWKM11U8q83utFw7A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8701.eurprd04.prod.outlook.com (2603:10a6:102:21c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 20:24:12 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 20:24:12 +0000
Date: Mon, 23 Nov 2026 15:24:05 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
Cc: Frank.Li@nxp.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i3c: master: dw-i3c-master: Add HDR-DDR support to
 Designware Controller.
Message-ID: <awSg5WQFw6NktkEi@lizhi-Precision-Tower-5810>
References: <20261111021151.58380-1-parame@synopsys.com>
 <20261119135703.22729-1-parame@synopsys.com>
Content-Disposition: inline
In-Reply-To: <20261119135703.22729-1-parame@synopsys.com>
X-ClientProxiedBy: PH7PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:510:339::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8701:EE_
X-MS-Office365-Filtering-Correlation-Id: 3576840e-e4d6-4299-c46a-08df499fbca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|19092799006|1800799024|261028144727099003|10067099003|11063799006|56012099006|4143699003|261021121427099003|261102123227099003|261022105027099003|261021123027099003|261026140227099003|261026121527099003|261009223327099003|261009223027099003|261009221227099003|261009220027099003|261009221727099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: VkH4f1CqG5zDzse603SFHtFrBnmhqLKuAd5xYiScwnxGUf7hRIQdSkxeMEVmBPCSqhJjctUr2oHUkMzz/DSAWZn25vrnxYs3tCtUfWvAzCJMHaNhxfhZlSIKD36QYcxokPe0VAxMux1ZQ9EoGYR37dDE5FEIShKdJvjg/fcfcpZeCXiVr5mfN1yVJ+FEiVoNcnGkv48/gxUa5obyR0mOtwuLtkBFsKtOAv97zVO6pro12LN/5pfF1d5rMDvFdyZmicsMDt5QrjyjG8JWbujpVS6XVmfT0kFjvUg1qFe8xDenT4UHFpzu5ZUX9wnCbb9rcoxbY6cYTKvBC8DaO9xO+V56/MBA7tIDNrQSfJ14gRZ/3jCBugcMf7c5LXWJAtnis2aDi6GwPSmN/ymMI3urIgEIcy1BDMS2tq//h9blPBSnwps+Akzff4YeVkFPiX2rk0cASr3BF3DnYyGTFpaz+/6NlagTU3z5m9gucKZo3vHYkQgi6h3kBkMbdCSx7R0TakuDLv+2pFbkyeHgVKh68Jdp9532XsEQeAQSaiC67YtHUtzbR9RxSbjtH1lOwgJdqWeQArjHd1ZhoWSphlYTi7Ww0l8Kf6NVkaGfzKo/fmK32PYDg0rmFFMP8bxIMBYUEklGEKPWtF8JZxkb83qu+WDn/Xs4i+SMNQRzsd/jAHA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(19092799006)(1800799024)(261028144727099003)(10067099003)(11063799006)(56012099006)(4143699003)(261021121427099003)(261102123227099003)(261022105027099003)(261021123027099003)(261026140227099003)(261026121527099003)(261009223327099003)(261009223027099003)(261009221227099003)(261009220027099003)(261009221727099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wBmbb2kdm466CepWqr6LP7GixCDzmOJCPbFXY4GSH7eQjm9psoIxObKBvr7g?=
 =?us-ascii?Q?RnrUU6fpTW5js+pLi4wAKJbGIL91SfsB0I/p5amMvVTAO97dv7XNhP1sYpx1?=
 =?us-ascii?Q?6sQU5nRNVNvnE5LAWJ9hGQCu2DEocev0qQ8zsD4rl1VQbDlexmfts9hpGpu4?=
 =?us-ascii?Q?y0cIFrY6av+Wy4FxYFoY9iuLsEvKMGOtp+/ATyw8TXVvYajmll6oVzjMd83s?=
 =?us-ascii?Q?2ET9eA3mQYjnbcbedPrrhReKRc5gLZnjeDl6JmLgGUL2J5Xw30qPy0XDu+d0?=
 =?us-ascii?Q?HOiwMGs9JEO6Sw20kGMU8UUVFakBRknbNGgVoCOWDqzQF1E1fcEePsuD/qpD?=
 =?us-ascii?Q?wMgzRQGfpllxZ359PUqGpn4VN/AHtJExiPdQ98GOb1Gd/Hr5/5N9exnP71Y+?=
 =?us-ascii?Q?CsOrttCDUYndTHH0roi5inYrpqtLHyx6aIPn+A/ckCX0bSnMfJ2s8DlYdqBz?=
 =?us-ascii?Q?fMjJQJuMK4k8wu47hGo2cq+UG3z9LBMJn5aYKrlI6t5s7JaMeBvEutgZ+QSv?=
 =?us-ascii?Q?gk9HcwMFMcHqxXIDM7tdPvvu3FtDGtcHbZD7DHK7X5hy4Q+BgE50siYM+ctL?=
 =?us-ascii?Q?mNGc0VhqFr1Qrz2DdisE8pFKiTzXjGxf5i5P3+9TClS9leBuiXJ6qrV3m1HI?=
 =?us-ascii?Q?TlwuY6u1eCkcCuAzxKNexo2fAAdr9xjk/WqykTdFGs7cJW4wUk7pn668Hv9N?=
 =?us-ascii?Q?eFLZvcv0Ng1bxQCyGoXIct7mssCcQgs3TJUaO7g/cU12ZfynvS9XJFOXj8IY?=
 =?us-ascii?Q?b1g2biFRED70T+/lANT9hUY8frwgAQ3vrX9LigUCu0oXszFWK4vQkVVQ4QeT?=
 =?us-ascii?Q?d1p7ho+LrPpWLDaQFSgB8CdUit/rY5CGM8CqD1yEtli9wMluj/QGHkn33wDI?=
 =?us-ascii?Q?hZ64XsAVGf6JB4s9jmm6T1ZoTs/PdBg5u80gG2qhKCIO6Ruj2x2nH22QmWJA?=
 =?us-ascii?Q?2HOTZ0Zs3jGEbkiLXQXSGWaGWJWwKIJjBUbWSqmpsBC2ib1NF2aOORwLPrgS?=
 =?us-ascii?Q?sW6swmdM7wmNNUePYX0d7V+J+0APgQSgXDgMSafwgdTkQijhC7PL2AXxSYUQ?=
 =?us-ascii?Q?tagUBonGjEYFx+vwRVttezJknBC8O4p3Xs2VmjGVxlTBMLo7XUvFMGutpled?=
 =?us-ascii?Q?mScaAhN1HSBTyng/20YDzMYEaWaus3xboZf4d5zmPH/ZwhIQ8mNmhVLzTr+d?=
 =?us-ascii?Q?DorLYS3mLPWwfI4OiVWdK8GKWEW5Ll3wnPGQRAiI1mlHNlHH453RaXy/ZO0S?=
 =?us-ascii?Q?e0HkIqy5jWmE3z5M5N1GdCTSwShdi+YQNYzd+LH/oam6Tqtkwveqlh545X6e?=
 =?us-ascii?Q?CdZ74zWla/sADU9jleh9jsHWaBfZbW67EZ/+5kX/PKV00qmUR7jarpWZAKEg?=
 =?us-ascii?Q?W5KAeP+pcmoknR6py2s+kGoeR9aZ2jZwD7poVQvrwnm47XiFiT9hjX+NENYE?=
 =?us-ascii?Q?xQFkVI4+oEe6s2Twp5cwSdVyS9FqxWSWaCLPcbJNeKJH9SHOW7XGh3JPGlye?=
 =?us-ascii?Q?ibbAi9Q9VXvS2W3ZYQsyAs7Y5I1x70WQQDGPss3W2umgP8bFTQ2g1x8+PK5q?=
 =?us-ascii?Q?diFtCYRuk+x7irR4QHufJkEedJcHLdrGhWzP1BoDp1YvBlLGIJ+h0IeZXn6+?=
 =?us-ascii?Q?v2oHEeerBAgIwQffkyBtPR2SbF/Ldw4iX+3BbtTM9GbBOon2Swr8GahugQcc?=
 =?us-ascii?Q?oUgTWiwVe1oci1KWu3dBeOT4WdF2Zgq7S/L6Co4qlvC51JG6nhk1m6D5fb/j?=
 =?us-ascii?Q?J7Fg/Vue6yfDwz6zqQvBsK2T215o1g5r/pwU0tSIM6KZZsHzL07I?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3576840e-e4d6-4299-c46a-08df499fbca6
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 20:24:12.4742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYL/2cvfYd3cwsp9jMtkQIMSO5tygKzN7uE9Qg6qLCpNxXy2xgP2vMP2Ttx0bnQVEA2dMaCrMPPlHRt6AIKGRkSMq6VToIj20To/yXEqlKro3/eTacYtoemNT0oEg2ip
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8701
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_122419_821495_C8049790 
X-CRM114-Status: GOOD (  26.71  )
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 07:27:03PM +0530, Dineshkumar Parameswaran wrote:
> Implement HDR-DDR transfer support for the DesignWare Controller.
> Only support for private transfers and does not support sending CCC
> commands in HDR mode.
>
> Key differences:
> - Sets the speed to HDR_DDR_SPEED(6) and COMMAND_PORT_CP to do
> data transfer in HDR-DDR mode. Hardware will generate the ENTHDR0
> based on this.
> - HDR exit pattern will generated from the hardware when it sees
> the TOC on HDR-DDR mode.
>
> Signed-off-by: Dineshkumar Parameswaran <parame@synopsys.com>
> ---

I already said, don't post new patch at old thread.

> changes in v4:
> - Fixed using HDR-DDR cmd direction instead of using rnw directly.
>
>  drivers/i3c/master/dw-i3c-master.c | 41 ++++++++++++++++++++++++------
>  1 file changed, 33 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 05584ddaf104..d94e7a6d28f9 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -65,6 +65,8 @@
>  #define COMMAND_PORT_DEV_COUNT(x)	(((x) << 21) & GENMASK(25, 21))
>  #define COMMAND_PORT_ADDR_ASSGN_CMD	0x03
>
> +#define HDR_DDR_CMD_READ		0x80
> +
>  #define RESPONSE_QUEUE_PORT		0x10
>  #define RESPONSE_PORT_ERR_STATUS(x)	(((x) & GENMASK(31, 28)) >> 28)
>  #define RESPONSE_NO_ERROR		0
> @@ -232,6 +234,8 @@
>  #define I3C_BUS_I2C_FMP_TLOW_MIN_NS	500
>  #define I3C_BUS_THIGH_MAX_NS		41
>
> +#define DW_I3C_HDR_DDR_SPEED	6
> +
>  #define XFER_TIMEOUT (msecs_to_jiffies(1000))
>  #define RPM_AUTOSUSPEND_TIMEOUT 1000 /* ms */
>
> @@ -381,6 +385,11 @@ static void dw_i3c_master_read_ibi_fifo(struct dw_i3c_master *master,
>  	i3c_readl_fifo(master->regs + IBI_QUEUE_STATUS, bytes, nbytes);
>  }
>
> +static bool dw_cmd_is_read(u32 rnw_cmd, enum i3c_xfer_mode mode)
> +{
> +	return (mode == I3C_HDR_DDR) ? (rnw_cmd & HDR_DDR_CMD_READ) : rnw_cmd;
> +}
> +
>  static struct dw_i3c_xfer *
>  dw_i3c_master_alloc_xfer(struct dw_i3c_master *master, unsigned int ncmds)
>  {
> @@ -726,6 +735,8 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
>  	memset(&info, 0, sizeof(info));
>  	info.dyn_addr = ret;
>
> +	info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
> +
>  	ret = i3c_master_set_info(&master->base, &info);
>  	if (ret)
>  		goto rpm_out;
> @@ -962,7 +973,8 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct dw_i3c_master *master = to_dw_i3c_master(m);
> -	unsigned int nrxwords = 0, ntxwords = 0;
> +	unsigned int nrxwords = 0, ntxwords = 0, rnw_cmd;
> +	bool rnw;
>  	int i, ret = 0;
>
>  	if (!i3c_nxfers)
> @@ -972,7 +984,10 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  		return -EOPNOTSUPP;
>
>  	for (i = 0; i < i3c_nxfers; i++) {
> -		if (i3c_xfers[i].rnw)
> +		rnw_cmd = (mode == I3C_SDR) ? i3c_xfers[i].rnw : i3c_xfers[i].cmd;
> +		rnw = dw_cmd_is_read(rnw_cmd, mode);
> +
> +		if (rnw)
>  			nrxwords += DIV_ROUND_UP(i3c_xfers[i].len, 4);
>  		else
>  			ntxwords += DIV_ROUND_UP(i3c_xfers[i].len, 4);
> @@ -995,28 +1010,36 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  	}
>
>  	for (i = 0; i < i3c_nxfers; i++) {
> +		rnw_cmd = (mode == I3C_SDR) ? i3c_xfers[i].rnw : i3c_xfers[i].cmd;
> +		rnw = dw_cmd_is_read(rnw_cmd, mode);

Can you pass down &(i3c_xfers[i]) instand rnw_cmd? so in dw_cmd_is_read()
there already have I3C_SDR check logic.

And actually rnw and cmd is union, which point to the same value.

Frank

>  		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
>
>  		cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(i3c_xfers[i].len) |
>  			COMMAND_PORT_TRANSFER_ARG;
>
> -		if (i3c_xfers[i].rnw) {
> +		if (rnw) {
>  			cmd->rx_buf = i3c_xfers[i].data.in;
>  			cmd->rx_len = i3c_xfers[i].len;
> -			cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER |
> -				      COMMAND_PORT_SPEED(dev->info.max_read_ds);
> +			cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER;
>
>  		} else {
>  			cmd->tx_buf = i3c_xfers[i].data.out;
>  			cmd->tx_len = i3c_xfers[i].len;
> -			cmd->cmd_lo =
> -				COMMAND_PORT_SPEED(dev->info.max_write_ds);
>  		}
>
>  		cmd->cmd_lo |= COMMAND_PORT_TID(i) |
>  			       COMMAND_PORT_DEV_INDEX(data->index) |
>  			       COMMAND_PORT_ROC;
>
> +		if (mode == I3C_HDR_DDR) {
> +			cmd->cmd_lo |= COMMAND_PORT_CMD(rnw_cmd) | COMMAND_PORT_CP |
> +				COMMAND_PORT_SPEED(DW_I3C_HDR_DDR_SPEED);
> +		} else {
> +			cmd->cmd_lo |= (i3c_xfers[i].rnw) ?
> +				COMMAND_PORT_SPEED(dev->info.max_read_ds) :
> +				COMMAND_PORT_SPEED(dev->info.max_write_ds);
> +		}
> +
>  		if (i == (i3c_nxfers - 1))
>  			cmd->cmd_lo |= COMMAND_PORT_TOC;
>  	}
> @@ -1027,8 +1050,10 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>
>  	for (i = 0; i < i3c_nxfers; i++) {
>  		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
> +		rnw_cmd = (mode == I3C_SDR) ? i3c_xfers[i].rnw : i3c_xfers[i].cmd;
> +		rnw = dw_cmd_is_read(rnw_cmd, mode);
>
> -		if (i3c_xfers[i].rnw)
> +		if (rnw)
>  			i3c_xfers[i].len = cmd->rx_len;
>  	}
>
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
