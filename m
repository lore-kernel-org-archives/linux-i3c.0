Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4591103E183
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2026 14:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtXW5OLCTyPHX7+JIs9ymDh9kkwdjHUJl/hNo+10zkE=; b=iEbUZCGNvGTfa2
	ePPRB9lZDaasiTzju+IVVaLVtjYvfIXj/43CXHaVVAjp7N/ogex3GBcp5b+CcM0Mr6bx5f2709OhQ
	OwxfOck2IZfbXnv7eP1Ozk5ncHItdFFhVkPkEwotDKrs+QeksZwl4D6DkLhMTGRClErmzhOpnilym
	1EsRN2yCMesAUvMg3r612nIobJAxEVSmXw+7y21FARsyt5THmRb8xCVuW+zaNm3cG5c7ycp+Zvp/0
	yfcoQZTgQ1k7sBsVCUCFfHfp+rIzGUEDAGiU30B4blIhs5aILdahlIl2MxcvpbnCraRbWEVxPxbMI
	+DyX6MLSZ2dala98EoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rjj-00000008a3u-12A5;
	Wed, 18 Mar 2026 14:19:03 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rjg-00000008a32-232T
	for linux-i3c@lists.infradead.org;
	Wed, 18 Mar 2026 14:19:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H81AlYckS8I/kUN3tFZoIGsN5q3dsAcCUcYfqDxrV5RVF+Ab/r6KfYzgAzQ/OwvHvOF35Zv6joDtj4umOBoUl2flxJB25c6X0V2DxJKaU3jau61PDF3lKepFSvnxDaM4/I1BjC4+jw6RPdPBUrZA/Kkv1nwwItBG3fCpQ4IwkhhOz9uonT3rdN48dH50gZR8IjHdE6aZuP+lvh//6G48crkk+J9Fu+ZU4XLBSloskkhRpjEYw/NF+s43lp3e7C9rAYVjA9AtJxy2nkfnlpBPEtFpSt7QXmRvIsqVsbDiflBnjnbyNr5XdAQoU44IQjJ8zy0SHMD/5ZuLJtX3v7v4gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrJHzY3Q2+a1i5m0OkfPu9bfzRCMrOgoy+R8My2LzYA=;
 b=ZhELLQUCPnETonI92JxkqZBapCffpo2tRrKNpLlG5jhHPk9i0VAJzs4elMA6rnwuBdnw+3OKHWD95+NL6bTYs1D14/lq3TCvc511VkIT6BYjUKOrMnl2rTuYDH09tZGEcSjn5zGoX5IDxAb3/U0qJ6uTA5xXIjcwY3FSFWw0PI154IiAuf3hI2GRoHwynsyeazrclX8zPW7JvcGJjm1LkKXUxGzsgbaoLqebofq6RUiLjn5lDM2cTLPlcNp8JtRUwfFrpPmDKidgs4U3U3kBrNbmNqc86ivSVhGSg73EMMlzUsWK3UxHwobL7fOb9QOLjIhf3c0sTWG7Ziu+X08CDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrJHzY3Q2+a1i5m0OkfPu9bfzRCMrOgoy+R8My2LzYA=;
 b=dwmIkbkshjXyHAlL65tWDa++Cf9fkc1+tozu0O1lGOVFz0keOgUMGWaRzYnpn6nM6k4V8cAeq1ckA37n0OJfXrl8yga05jZm2xgB3c56CvZCg+JcKyKH8XUUhafd8Z+p5Vujb9K/j9fBdSI4To++IgZuPbew8DtuuupJteS9C87R6mSmsEZ1rPHdnpRXql0Iur8KVx+sp/IEqjG+p46NTZNr8ueNSnJlK3V4AQ5L4/3/ueipRCiNQZA2e+loZNEpitg/3sBZIX2Yy6F9dp7sqL5Ww6fBWOvLjPeN8EYEc15cJSJPqE8I6EXAdA2qq22/no/F0xLXQSunX3nPZynTUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8512.eurprd04.prod.outlook.com (2603:10a6:102:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 14:18:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.021; Wed, 18 Mar 2026
 14:18:55 +0000
Date: Wed, 18 Mar 2026 10:18:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 3/5] i3c: master: Move bus_init error suppression
Message-ID: <abq0SC-70DCSEQWW@lizhi-Precision-Tower-5810>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
 <20260312-ad4062-positive-error-fix-v2-3-1c933b5c7ed8@analog.com>
Content-Disposition: inline
In-Reply-To: <20260312-ad4062-positive-error-fix-v2-3-1c933b5c7ed8@analog.com>
X-ClientProxiedBy: SA9PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:806:21::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 79ca4e90-02dc-4eb2-6b7c-08de84f9499f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|19092799006|1800799024|18002099003|56012099003|22082099003|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: 17PXYWA2phe4d4FoevianiEL8rLixwRyubW0i5L6W1qtd8M1XpV+JXbipkxuf1OmZcoitm+OrddQm6mxmHk+N0TuyS0dl5kMEsJD/7gJNP3di4UkGjSohVa7Uppq767E1BJmgJHWUGgZo8XTj8+ElmO4VHEFDYPU+hDLF/+NwxoLmAzjsv5xjA6YaqHZbEO4gxYoF4GVN9uq02fdT06RRaGHA/gZf7Gy+cNP2NTU0nZcMI/xGog4PyCVzBBcJ800Cysb9Lib0R56F3kMUUUns7BUvcSt9JrcWrX+vNf116VT29GGsYJWOr3R7Me0IKbdBLUCh42mn8wBL9DrXtVXOdC0emkejac34vqS3zs67BMf20bGXmc6gLfLRJAkzASZCEW0RmhAcZ+c/bSm16KCKwNPceNsekTJNaFJp8/8RZhu/3yFlKZYsF6vGlnkC5tTQdnSzH2ZVayvlYOKFz1hUkUyd6sf4AjFuT3AKFnZexmeWdRX9b/MtjPWikh3etsU1dWdlYgBXB/9dRzJsZQL3ETP11FmdGh1HrNBDVBvPoQo9hAiwY/sRvw/ynXD4bPEIRze9lzCEqquRjEUAP2C3fGGOWPDNVWwS1vmiBvNgNvqhQlju0bu+JPIxjcLfHy5U9ZHWdgbt31+xcDC3fr2eLua5Z3OYo59VI7ZJcJzcEiLKo++priY0fTT5yOEJfuPp3Zuje8yQSV1R3+hs8Ca/Jmw5/E/pmFRiX0WIxH85jHsqHji9mfyieqEeoaOVPJbbOYC5ozT46B6u3DC9dkCuxGj9yEbdykEt5Ndv1Gm41E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(19092799006)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5eGdENO10ibEjsFzhogIxDinub3OpEhLwC5+6XiUv059PdkxsLTvQERfg67B?=
 =?us-ascii?Q?bnlNqbfJOT0e6r0SB4fmpBjc7mC3InU+N9clhuGQw4Yt0Gj4vzAT2LTd4ED8?=
 =?us-ascii?Q?wx39wtioY2mWjg8ktqmpGMk6C+xAB2aFF+0nxIgtd/akS3O7fr5MW8u7yxiH?=
 =?us-ascii?Q?FRP0e4CIElNpJ5Doy730s1LKkiIQA4Xte/Ndw9169QAkXJNlHdRv90zdPRB/?=
 =?us-ascii?Q?P9q34SdbbmyX0RwZymy3IU6aohJyH9QiOQLKewe0ZMHU7IDQN4on2dga2Ydu?=
 =?us-ascii?Q?lX7JxBpCx69Gf/In83fye7LGpTjuRqLgsZO5t//aPWvNwGsx/J4OQabBKqqM?=
 =?us-ascii?Q?vC8XH9vYFKm1Qs2oEzz7yrP0W3YBgWNZYoLCDE+MBYv42ZRrk8oAoQLbo3/0?=
 =?us-ascii?Q?bG/DShRugxMTEgBHo4XC9WhUeAvPZbZW0fAoNT17vz916bLRNO/Vasvn/zz/?=
 =?us-ascii?Q?KI0+rrhTfi7IKuS3D6sZvsX38lCOGjzfaUZYVZq36kizP2DNFjYNkfbTfXzx?=
 =?us-ascii?Q?FYduFW2J3LbVYQhgxI6isyHnXYo9MVEVJUWtjsHmqBQCrTqxKI93Xtcrxo/4?=
 =?us-ascii?Q?HvBDRTUqQ/4sbwF9J6TbdN4NMozguVQbqgnRkTjP50JDritIg0L9R8ghCQOE?=
 =?us-ascii?Q?YGpuk8iuH8U5x3GBUiLY4cFaDcBF0r52sVpls1fFjCODQIdMWzJ6vIPP7PtY?=
 =?us-ascii?Q?uLZq2YZWO394NXknkJwjdwpC1QyE2QXzrz/pI9MODB/lyUlicXd/rkxvWDxQ?=
 =?us-ascii?Q?sGZcR3HLRe4V932jEJN+bHCiw2bpNszVPI4xdEChG92Pa9ADmpyiSXoHbb8p?=
 =?us-ascii?Q?z0g9Pe3C//ma7hQW27wm+kI97iTdNjczGyArgppBmWIcHQAsENoPjtmDRGoT?=
 =?us-ascii?Q?x9+8DY3j2Yas3K/QgEUrgYiJoZjVRHCr3xnmkxdoTy5eY12WlPmz7vnHDRal?=
 =?us-ascii?Q?feMLVRChnAPVPU+LIByizv4kSnaWri9Lc6ZdFxyXEpQd6oybC/IRsHeFw39F?=
 =?us-ascii?Q?i+lb88KciMHa0WzRvpoKsh2047L8MYyBa+zcSWkuaNnBZ1CA4p7tsNmCjIdU?=
 =?us-ascii?Q?Epysdks4k6gH7Db4zpKdqfg9voP8PTQM/kQR346xp35DDgx3EF860CL0TxH9?=
 =?us-ascii?Q?d+pd2DAcUDGOW4WVAmEv3p5HPvNnxLqINwHO4RT0/ljb4LPeAzbxnw+AycU6?=
 =?us-ascii?Q?GPvR1g4v1oGwhAaqdwWD36+fse1Pi4XNeZX8IOKAqFCIaFknuDhwqZ9Dl/1x?=
 =?us-ascii?Q?6lqeZDcVMQaPzViK/i7pfjgGfv3YMDcEZA+YdnZq5wp0XDr/7AHROM6N8kd9?=
 =?us-ascii?Q?zuHOUEIw6IAMSXx7WYV6HPkliX9iJmQyOL6bNC4fhncDoFSHrvGI6D5DWniI?=
 =?us-ascii?Q?r8LnYII5OO2Mvu+XpaM7TarjsVcmt5WlIcRVh/tSCSjqq+zOx6oZWBElzv/K?=
 =?us-ascii?Q?fLGVnrjD8K8EbZD8lCBuy4OQyoB/7/FPsvKz5r6qixrgJ/GTC++0g1K92N7O?=
 =?us-ascii?Q?0VIWSw+ycFZmQUpoiJmsg99NMX/ZdGDMybTdGMsMFTt7tzVq0yIJp8g3PwaZ?=
 =?us-ascii?Q?NRVvLIcSX+Q90WN9Ynx2Dji7fTc3vFo7Oes+2qseEn8vHZAeKClVVs2qmIFF?=
 =?us-ascii?Q?AA0kxQPEJT3CeWGlbCIyVlDYjgKwGh/LtHukpA7Wh6mfFnQbZWe4YvvuplHR?=
 =?us-ascii?Q?QXAmpG+krU78RGKiXWIPCBA7ucrx2NFoDMYSmVHgEPrq06L1EcGpl7wMUs6G?=
 =?us-ascii?Q?p/Npf+yo4g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ca4e90-02dc-4eb2-6b7c-08de84f9499f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 14:18:55.2569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0bpHg9kepbHGPagrB07H6twh4ZYNfJKejSAthPCH5BdrhtNpqkx+Mw0TOlzr89bJFWbSPdCSeVoiOZwCBD7wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8512
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_071900_531618_6B824239 
X-CRM114-Status: GOOD (  24.48  )
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

On Thu, Mar 12, 2026 at 05:38:06PM +0100, Jorge Marques wrote:
> Prepares to fix improper Mx positive error propagation in later commits
> by handling Mx error codes where the i3c_ccc_cmd command is allocated.
> The CCC DISEC to broadcast address is invoked with
> i3c_master_enec_disec_locked() and yields error I3C_ERROR_M2 if there
> are no devices active on the bus. This is expected at the bus
> initialization stage, where it is not known yet that there are no active
> devices on the bus. Add bool suppress_m2 argument to
> i3c_master_enec_disec_locked() and update the call site at
> i3c_master_bus_init() with the exact corner case to not require
> propagating positive Mx error codes. Other call site should not suppress
> the error code, for example, if a driver requests to peripheral to
> disable events and the transfer is not acknowledged, this is an error
> and should not proceed.
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index d4f9e7df4adc5..bc1189afaed81 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1059,7 +1059,8 @@ int i3c_master_entdaa_locked(struct i3c_master_controller *master)
>  EXPORT_SYMBOL_GPL(i3c_master_entdaa_locked);
>
>  static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
> -					u8 addr, bool enable, u8 evts)
> +					u8 addr, bool enable, u8 evts,
> +					bool suppress_m2)
>  {
>  	struct i3c_ccc_events *events;
>  	struct i3c_ccc_cmd_dest dest;
> @@ -1079,6 +1080,9 @@ static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
>  	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>  	i3c_ccc_cmd_dest_cleanup(&dest);
>
> +	if (suppress_m2 && ret && cmd.err == I3C_ERROR_M2)
> +		ret = 0;
> +
>  	return ret;
>  }
>
> @@ -1099,7 +1103,7 @@ static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
>  int i3c_master_disec_locked(struct i3c_master_controller *master, u8 addr,
>  			    u8 evts)
>  {
> -	return i3c_master_enec_disec_locked(master, addr, false, evts);
> +	return i3c_master_enec_disec_locked(master, addr, false, evts, false);
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_disec_locked);
>
> @@ -1120,7 +1124,7 @@ EXPORT_SYMBOL_GPL(i3c_master_disec_locked);
>  int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
>  			   u8 evts)
>  {
> -	return i3c_master_enec_disec_locked(master, addr, true, evts);
> +	return i3c_master_enec_disec_locked(master, addr, true, evts, false);
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_enec_locked);
>
> @@ -2108,11 +2112,14 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  			goto err_bus_cleanup;
>  	}
>
> -	/* Disable all slave events before starting DAA. */
> -	ret = i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
> -				      I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
> -				      I3C_CCC_EVENT_HJ);
> -	if (ret && ret != I3C_ERROR_M2)
> +	/*
> +	 * Disable all slave events before starting DAA. When no active device
> +	 * is on the bus, returns Mx error code M2, this error is ignored.
> +	 */
> +	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
> +					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
> +					   I3C_CCC_EVENT_HJ, true);
> +	if (ret)
>  		goto err_bus_cleanup;
>
>  	/*
>
> --
> 2.51.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
