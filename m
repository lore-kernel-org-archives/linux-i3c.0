Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E893FD4F16
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 18:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b3PYFvS54C5bQtEUTvE1gE07AOr13I/lnMMRXM/lU94=; b=ygua2i9bjZf3EZ
	A1MpTJhaP2heSWEjfQgxbtCpZ7+dx2T8uGUqdetNsV7nsbCn6J5CqHWaac1nVEjC3JNGCZElxnfov
	BJ1UT5DBQg3iSnacL4xmQm0BdJpHMheaEoWHM2mEUBKM0iaV4XE8QPo89T13kfMo6PAMFBs69XauL
	ebRtdZ509U+MqeMx/ed/f2DSMR2pR5gBVsOmby63SeFlXScLvDNe814oBLYpQveCopjpMwMNMv5Ds
	v1uPgbQe19Txl/yCI9WWojNpaRA8zJhrj+ld8Sme5Aiwc7I1Xximbl2MweovngigrCqdMantsh1/m
	OZab6xVZ5LpnHz0HnYEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01pH-0000000A4lc-2zIR;
	Tue, 10 Mar 2026 18:29:03 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01pF-0000000A4l2-1M4F
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 18:29:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSWTkvFf4/ah5DFmwJnzmjyQ0w5Pfp4eGpvLplToBFBqbJVj16/NJH/0h1/6odJL/n/xPlp8ZttdTHQZEuM20axR5x7okU0OEvCw4dac0cQus4kBfmp79ZPxkCQgXtByhqHjrwe9TfWE96NWZmNY0OW8j5L30m1nbTGMnv94A89zpP3O+ZnCm5gF3rE3wes+Bme4GuGJZR1Wb1RMBf6Bsk2yHC+tmi8Txln7kxhozcdBzkA67LTjlsS8Owd/lcPcEWvbGoFdESO6ljA7hLk1HMHu0OXL2ZhGj3X9EWyks+FRXEoVJzhlBphr87jeeauUiP5ZMVvPMHHql9gTAQfcfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6HQ6LQQRSaG1Ss3bUToVAAPNvm9ffFwDTTUHOUxDrA=;
 b=TUMNIR3fQX9+9yCIFOHa6jkjC6bzYf7gzHIppnnoLM0WqMD3qap9M8aoPfxLciHtdU4zDA4RyxgLM8zM+i2CdeQhWeTCEnlXwMrxi9g0vA8BEMnbj35sXMi5tSk2WW6PmImJ7t8na6QV5rR0W7/66kqG9/2cn6inPpTrYMrxtkAO8Fy/gS9HGJAfXbuaL2bSZcw+AnBAZm7r6lsA4aRT8V/LSkFzKx6X40Y2NsYG9Sp8rkfRfbPzJvVytWaCSk8tEDceg/t79wYStg916Hg8tDvtzWHJmmR3I4VAY+OSMZ+/SaqCq3739eM0z2UrufZtI8e9EcgQiIDrF8TctzNY4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6HQ6LQQRSaG1Ss3bUToVAAPNvm9ffFwDTTUHOUxDrA=;
 b=Z1V2f+sNh1IWdMTGNdC11t2vU+PjZdsw+Z34m/upZt5z9ZuOV7SMBiCVNEBs4INhacxgw9F4ImN1cnPbFmRTeSuqomMfo9MGTEIoFo23Th7l77aXuvQThRwea0C/xvU1knynA6NbK8od2GfITVc4tbGnZMrSKZ6IZKDvRoAAD03EsRvFNgiFDwEzPR8bkPSJSiCixnLm+HUnK+92m0XlpNd3UyGfwtTZy0fw62VUCN9LiNJW35h3udTpz12FOFn6NJGWdOGMSdqoz/BUSiuk6PnoY+xwHMlSsI6H6mtC1Ghj0mwn4fz9Mli97nr+TQ4QiGJ1KPUSahDBF+87pMRt2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB6929.eurprd04.prod.outlook.com (2603:10a6:208:181::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 18:28:56 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 18:28:56 +0000
Date: Tue, 10 Mar 2026 14:28:46 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v6 7/7] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <abBi3inYHL9Bzpk3@lizhi-Precision-Tower-5810>
References: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
 <20260310065727.3759342-7-lakshay.piplani@nxp.com>
Content-Disposition: inline
In-Reply-To: <20260310065727.3759342-7-lakshay.piplani@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0111.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 5106f188-b927-4081-debf-08de7ed2e36c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|52116014|366016|7416014|1800799024|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: DEvO6ICdRXlhnRORjTJHsImt4AywUg67JxXmd8cys95J/9NjO17gxzKfJyxk44snRAYvWS7QhPW5qWtoguLg8Y2e+LjYVK2bUVqYRGGjQ9QlLygqEAIp9Ayh6jkGFHgjubiRM5mylqfvLNPU3sAq6aKBcAbTt5u3ZSgKu1qhwJGpdz/kyunMzC6j09fig40b1FwM+Mzor5fIsL1BenkqsBxwlcsG89Jqq3ctT4TQPxCUk4H1sutF1aqSxL9yJ1cZwBljPmRzVhPxyBwrhlAobTQ3mq7xGzgtBmQ/K9hZ5gwnZ/yMqlL4fsCbi0dbSWGzG8hCnjDUTcYGlPP5kjR6TKAP7PfupvyrXWVR/8bv6S8yBFRpRWG2+zuQZzPJYco20kD8/Ygh4ypuIP6QDX9M+NT/MlWjxQmukM74gfUp9L8CqC9rURZbzdSVLdK0CAHsp8JIN5Ylu4PLFNb7lNpPVDJD/3hCvcetum+2CvDwF5CxPJ/IvLKLJb9EKbWgHQSOz8l4jFmvcvHv7vSgiNUFPgZzadPIhAL/KlEle1eK9D8D6Sj6U6/q0rX5Em0Z+olQs5T2kWoLO/r2mfGDulcPF2tGL7Xpdvv5C34UCau+motIrF+q02Q17QLTSWLUTNO5myFS2ys+D/8ergi89zVDwGx8gkajQmTI9q8iWjb7loLGtwo9vYWP4Wi8Ev9WYoQfkWLWsFxI1WTV7r+wLNkIMLiM/wrUBosuH8GJBYHbnLOMLXQBDM1HlEQaF73lodvRaf4B7ofHiabyC+8GlXsloqvK3+lax2MiyDb/5o9z3ME=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(366016)(7416014)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?87Y9eva7duqOUV8AfzIsEY6SIzJOTMJkVvJ+05ABf7ppSiLBNCjMW/kIJ7MK?=
 =?us-ascii?Q?HPecz/grEXECHyDO6mgGM4ASNKWNHvnj6uezpGw+/O0bsZICxQR6UwbO21jx?=
 =?us-ascii?Q?DncPc2hb4IAp9GxTbOa6c2x6efnX4heNJYCqnPDedSA5B4rSyJVgCJJ9dHVU?=
 =?us-ascii?Q?EFe3/HbCXORJXP7Ch7cZkWcg0C0Q05zgKPvTRW33TDLN4ALbstAmMePw6/is?=
 =?us-ascii?Q?ieWDM0EcA3O9f4VVnK1CPaRGPwcMb9Ok1AXGmTouieral3kII1QZu8mdkRxR?=
 =?us-ascii?Q?HsSPkNvjoFM0AJdwavalk9Y8vQiripqUMpWjwK2a1HqKWk7KyxQMvMfAD+S5?=
 =?us-ascii?Q?/hy/e6FBRp8SNQ3N56Puwt1irkI29Y5sCkaCRUTxgYJ5lE+E3uWTvhvOa1yK?=
 =?us-ascii?Q?+OPDT+6JJFIemOCQ6qYcqrOiww/b4FtdM/mIUPgc+MWMeag82GbDMGeNAt+D?=
 =?us-ascii?Q?SAzH7th7CTB5yjWqlvuE2lVsHzF/zDYXnbAbU2YRzOcj9yOT5Coohv9/yz+/?=
 =?us-ascii?Q?F/RgSp+CIVgHpD0Ykg6EMab+rk8bGPBTroLgGQALUK7cw4/t4PgUaET1x5E8?=
 =?us-ascii?Q?AQhYKVQ0aA5y55uPhKwynTg5C4vwaq1haxkt/wy7jc0COZR/zIUugPz/I048?=
 =?us-ascii?Q?EfhouHp8XdG9GQhHbFakoIUaX9Y7N5M/ZXyf8tCFI88Y/zWMG2eGmQl5tKu6?=
 =?us-ascii?Q?//cKbbbDIiSEgwSKvaqGKouv6Quj3y695ZEXJSnFoSQGmkgyRF3Z5v/MFORi?=
 =?us-ascii?Q?RyDuTMFTu6qfxJ/k+EMJr2vN1G109RJ4bn/xytmrbMTnWOr9chYUU0Dr8lpz?=
 =?us-ascii?Q?jKJ1n/8E0eS+NtXieXj4deDFWOPnAegcxGHw4KLTVfoP2iWkTHZQR8JRIngj?=
 =?us-ascii?Q?sCjCzEStTQPWmZUgKDIme2JK56oHyW3UtGnQj79KHiW/E0KE3whSViWUcifK?=
 =?us-ascii?Q?VwsLT41rpHPAHPdewl76Uu6qroPz0MwJ0wS1E+pNPAyq78wIMC0AhXklbCvH?=
 =?us-ascii?Q?gSKCL0Ts4OEcMhsDT+bltbrPZhhlJW9tEm+wHsAuQtKmfhqXcHun4fUKX8/i?=
 =?us-ascii?Q?/omGmZV/ZeIm13D031Q/ZVYYj59Sm+nyW9x533OwdzCbTpHTXcC0L4tqUGx/?=
 =?us-ascii?Q?lNYXHe/73usHgmZWkPYz9qEwaMvkgjxUFS+9E6KKxUK+inwEQIw4Y09CTx7/?=
 =?us-ascii?Q?ELru973Odsd2uTuG2j6dEhoJhOH4PCgS6ge/E5XOvQg4n39UcpMysDs2WFV8?=
 =?us-ascii?Q?GUYhyEh4f8ApTwQT11K6jhWxq5BTe+Dhn/VFks0aWSPu5jGz9Q1RTESIJqGI?=
 =?us-ascii?Q?wzlP2CoPblytzXY7sPwIbPkXOh4oZgzTvaCv1PTIols6uT1x/BFGTu8narPx?=
 =?us-ascii?Q?baeo7FUmJkz5waAi4XXqB0ZIiGDF6LssTBRYa+ZUzgJMs7nTyunjKk3XwXqH?=
 =?us-ascii?Q?30HzmIPyj6WFUSfqGqxxQ38PGJNVQwz1DUSrTvxyMVBeusv7Iwev6dBf9f/x?=
 =?us-ascii?Q?gMYCgQKXE5GksCni1ZVywSshCX+1a+uxjivbZSUMYD2/+qqcptcoqM/GpCIO?=
 =?us-ascii?Q?WkXe433QD+E0V0xDxLjdG1gNRJE3pgnJOckQsjF/xPgAS8eKEkdXmBjX5UA9?=
 =?us-ascii?Q?hAHQbnPfKVAQV8q5OUmuBlLstde8sMqTqvvJG4r2FnOSCWdx27UmCAIgBF6o?=
 =?us-ascii?Q?V3b0E2/KYxOlEnPu7SPy6nQW08LawEQ/g8UCfoe7XvsdXGtOSFVlxdBYKn/H?=
 =?us-ascii?Q?+HAvgvrdbg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5106f188-b927-4081-debf-08de7ed2e36c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 18:28:55.9188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0kXxE8VlpnrOE/5alDrweCwq0S+w5J1AMFf6F6y8wV60L0XkblslhnlfFWTAr6pQJ290pYIOFnixmlnSSWK5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6929
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_112901_566548_281D9A84 
X-CRM114-Status: GOOD (  29.18  )
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

On Tue, Mar 10, 2026 at 12:27:27PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> Add I3C hub functionality for the NXP P3H2x4x family of multiport hubs.
> These devices support downstream target ports that can be configured
> as I3C, I2C, or SMBus.
>
> This driver enables:
> - I3C/I2C communication between host and hub
> - Transparent communication with downstream devices
> - Target port configuration (I3C/I2C/SMBus)
> - MCTP device support
> - In-band interrupt handling
>
> P3H2440/P3H2441 support 4 target ports.
> P3H2840/P3H2841 support 8 target ports.
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
>
> ---
...
> +
> +static int find_close(int val, const int *tbl, int size)
> +{
> +	int best = 0, i;
> +
> +	for (i = 1; i < size; i++)
> +		if (abs(tbl[i] - val) < abs(tbl[best] - val))
> +			best = i;
> +
> +	return best;
> +}
> +

There find_closest() in
/ include / linux / util_macros.h

Can you reuse it?

> +static u8 p3h2x4x_pullup_dt_to_reg(int dt_value)
> +{
> +	return find_close(dt_value, p3h2x4x_pullup_tbl,
> +			  ARRAY_SIZE(p3h2x4x_pullup_tbl));
> +}
> +
> +static u8 p3h2x4x_io_strength_dt_to_reg(int dt_value)
> +{
> +	return find_close(dt_value, p3h2x4x_io_strength_tbl,
> +			  ARRAY_SIZE(p3h2x4x_io_strength_tbl));
> +}
> +
...
> +
> +	p3h2x4x_i3c_hub->rp3h2x4x.rcp0 = devm_regulator_get_optional(dev, "vcc1");
> +	if (IS_ERR(p3h2x4x_i3c_hub->rp3h2x4x.rcp0)) {
> +		p3h2x4x_i3c_hub->rp3h2x4x.rcp0 = NULL;
> +		dev_dbg(dev, "vdd1-supply not found\n");
> +	}
> +
> +	p3h2x4x_i3c_hub->rp3h2x4x.rcp1 = devm_regulator_get_optional(dev, "vcc2");
> +	if (IS_ERR(p3h2x4x_i3c_hub->rp3h2x4x.rcp1)) {
> +		p3h2x4x_i3c_hub->rp3h2x4x.rcp1 = NULL;
> +		dev_dbg(dev, "vdd2-supply not found\n");
> +	}
> +
> +	p3h2x4x_i3c_hub->rp3h2x4x.rtp0145 = devm_regulator_get_optional(dev, "vcc3");
> +	if (IS_ERR(p3h2x4x_i3c_hub->rp3h2x4x.rtp0145)) {
> +		p3h2x4x_i3c_hub->rp3h2x4x.rtp0145 = NULL;
> +		dev_dbg(dev, "vdd3-supply not found\n");
> +	}
> +
> +	p3h2x4x_i3c_hub->rp3h2x4x.rtp2367 = devm_regulator_get_optional(dev, "vcc4");
> +	if (IS_ERR(p3h2x4x_i3c_hub->rp3h2x4x.rtp2367)) {
> +		p3h2x4x_i3c_hub->rp3h2x4x.rtp2367 = NULL;
> +		dev_dbg(dev, "vdd4-supply not found\n");
> +	}
> +
> +	/* Enable regulators */
> +	if (p3h2x4x_i3c_hub->rp3h2x4x.rcp0) {
> +		ret = regulator_enable(p3h2x4x_i3c_hub->rp3h2x4x.rcp0);

can you use devm_regulator_get_enable_optional() to combine get and enable
by one call?

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> new file mode 100644
> index 000000000000..833bc0bebc4e
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> @@ -0,0 +1,119 @@
...
> +int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
> +{
> +	struct i3c_master_controller *parent = i3c_dev_get_master(p3h2x4x_hub->i3cdev->desc);
> +	u8 tp, ntwk_mask = 0;
> +	int ret;
> +
> +	p3h2x4x_hub->hub = i3c_hub_init(parent,
> +					&p3h2x4x_hub_ops,
> +					p3h2x4x_hub->i3cdev);
> +
> +	if (IS_ERR(p3h2x4x_hub->hub))
> +		return PTR_ERR(p3h2x4x_hub->hub);
> +
> +	for (tp = 0; tp < P3H2x4x_TP_MAX_COUNT; tp++) {
> +		if (!p3h2x4x_hub->tp_bus[tp].of_node ||
> +		    p3h2x4x_hub->hub_config.tp_config[tp].mode != P3H2x4x_TP_MODE_I3C)
> +			continue;
> +
> +		/* Assign DT node for this TP */
> +		p3h2x4x_hub->dev->of_node = p3h2x4x_hub->tp_bus[tp].of_node;
> +
> +		struct i3c_hub_controller *hub_controller =
> +				&p3h2x4x_hub->tp_bus[tp].hub_controller;
> +		struct i3c_master_controller *controller = &hub_controller->controller;
> +
> +		hub_controller->parent = parent;
> +		hub_controller->hub = p3h2x4x_hub->hub;
> +
> +		dev_set_drvdata(&controller->dev, hub_controller);
> +
> +		ret = i3c_master_register(controller,
> +					  p3h2x4x_hub->dev,
> +					  i3c_hub_master_ops(),
> +					  false);
> +
> +		if (ret)
> +			return ret;
> +
> +		/* Perform DAA */
> +		ret = i3c_master_do_daa(parent);
> +		if (ret)
> +			return ret;
> +
> +		ntwk_mask |= p3h2x4x_hub->tp_bus[tp].tp_mask;
> +		p3h2x4x_hub->tp_bus[tp].is_registered = true;
> +		p3h2x4x_hub->hub_config.tp_config[tp].always_enable = true;
> +	}
> +
> +	ret = i3c_device_request_ibi(p3h2x4x_hub->i3cdev, &p3h2x4x_ibireq);
> +	if (ret)
> +		return ret;

Need unregister_i3c at error path, or add API devm_i3c_master_register().

> +
> +	ret = i3c_device_enable_ibi(p3h2x4x_hub->i3cdev);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(p3h2x4x_hub->regmap, P3H2x4x_TP_NET_CON_CONF, ntwk_mask);
> +}
> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> new file mode 100644
> index 000000000000..75803a59fd6c
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> @@ -0,0 +1,423 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + * This P3H2x4x driver file contain functions for SMBus/I2C virtual Bus creation and read/write.
> + */
> +#include <linux/mfd/p3h2840.h>
> +#include <linux/regmap.h>
> +
> +#include "p3h2840_i3c_hub.h"
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)

why I3C_SLAVE here?

"	This enables Linux to act as an I2C slave device. Note that your I2C
        bus master driver also needs to support this functionality. Please
        read Documentation/i2c/slave-interface.rst for further details.
"

I2C_SLAVE is for slave mode of i2c

> +/**
> + * p3h2x4x_ibi_handler - IBI handler.
> + * @i3cdev: i3c device.
> + * @payload: two byte IBI payload data.
> + *
> + */
> +void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
> +			 const struct i3c_ibi_payload *payload)
> +{
> +	u32 payload_byte_one = (*(int *)payload->data);
> +
> +	if (!(payload_byte_one & P3H2x4x_SMBUS_AGENT_EVENT_FLAG_STATUS))
> +		return;
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)

The same here

> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(&i3cdev->dev);
> +	u32 target_port_status, payload_byte_two;
> +	u32 ret, i;
> +
> +	if (!p3h2x4x_i3c_hub || !p3h2x4x_i3c_hub->regmap)
> +		return;
> +
...
> +/**
> + * p3h2x4x_tp_i2c_xfer_msg() - This starts a SMBus write transaction by writing a descriptor
> + * and a message to the p3h2x4x registers. Controller buffer page is determined by multiplying the
> + * target port index by four and adding the base page number to it.
> + */
> +static int p3h2x4x_tp_i2c_xfer_msg(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub,
> +				   struct i2c_msg *xfers,
> +				   u8 target_port,
> +				   u8 nxfers_i, u8 rw)
> +{
> +	u8 controller_buffer_page = P3H2x4x_CONTROLLER_BUFFER_PAGE + 4 * target_port;
> +	u8 target_port_status = P3H2x4x_TP0_SMBUS_AGNT_STS + target_port;
> +	u8 desc[P3H2x4x_SMBUS_DESCRIPTOR_SIZE] = { 0 };
> +	u8 transaction_type = P3H2x4x_SMBUS_400kHz;
> +	int write_length, read_length;
> +	u8 addr = xfers[nxfers_i].addr;
> +	u8 rw_address = 2 * addr;
> +	int ret;
> +
> +	if (rw == 2) { /* write and read */
> +		write_length = xfers[nxfers_i].len;
> +		read_length =  xfers[nxfers_i + 1].len;
> +	} else if (rw == 1) {
> +		rw_address |= P3H2x4x_SET_BIT(0);
> +		write_length = 0;
> +		read_length =  xfers[nxfers_i].len;
> +	} else {
> +		write_length = xfers[nxfers_i].len;
> +		read_length = 0;
> +	}
> +
> +	desc[0] = rw_address;
> +	if (rw == 2)
> +		desc[1] = transaction_type | P3H2x4x_SET_BIT(0);
> +	else
> +		desc[1] = transaction_type;
> +	desc[2] = write_length;
> +	desc[3] = read_length;

can you define index 0, 1, 2, 3 as enum

Frank
> +
> +	ret = regmap_write(p3h2x4x_i3c_hub->regmap, target_port_status,
> +			   P3H2x4x_TP_BUFFER_STATUS_MASK);
> +	if (ret)
> +		goto out;
> +

> +static struct i2c_algorithm p3h2x4x_tp_i2c_algorithm = {
> +	.master_xfer    = p3h2x4x_tp_i2c_xfer,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	.reg_slave = p3h2x4x_tp_i2c_reg_slave,
> +	.unreg_slave = p3h2x4x_tp_i2c_unreg_slave,
> +#endif
> +	.functionality  = p3h2x4x_tp_smbus_funcs,
> +};
> +
> +/**
> --
> 2.25.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
