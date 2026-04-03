Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4244ED7308A
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Apr 2026 02:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVc4zO9DCyE/c6DZXakYhfrC6tyFAVohH1uLc1XgED4=; b=Zd6iCF9V3aGU03
	Rl/lqK2PUomhDNL8YSpwaBNsfkVo3EXOu8YoAI37VO+zQsNxJ5ChqwoonvbeFYvE5w6ZBOaZzdKIK
	0o6QStVLiwVcKctijLm7hZUgHolMdVDt128RP3nHG4tmWRdkhE3h+Z8VfRm/ERcwZmaHW4Ma4cJY7
	APL13mBiGY0S88L8aRtWCF2wnTe7oOiwcr8URUc6b4X+grdP8UlmVRhyYQnIz001uX5V3GVOxTKxc
	Q+5nt1IYUNtfRyZxGscPUGxRw5OO9U4p4/RQeZpcAhFImWaPtP4lnQIGwKoUnqBuJUKZXPYGKbZGy
	3J25xjT+gRvagXLz8WBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8UeY-000000017MB-3lhz;
	Fri, 03 Apr 2026 02:52:58 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8UeW-000000017Lm-1xdV
	for linux-i3c@lists.infradead.org;
	Fri, 03 Apr 2026 02:52:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBuiN1icL76cC6KMcpei5iqL1gVzYJ6M5dU4tUcppou/NcU98Mf2BCRFXr3DRIP7tmdMyp1aLqjKhWcm7YleoqJ9me32OViz8VTRfr/GBdVhbc9xPHpIoVz5tDB1huqe1wcAmWOnaDft16kfRIWBPi2AyW4w9onQ6L7UQiRUVBf6jEuHX9ORgT4f3r6xIWdb8YYVHWlSLsC1Au/0hONmIwDbAJ0FE6I2NIvk3UjZNK1o+iDaI9+5BXl7i0wvGQC8uDFyH7QYUSDFyIQfwzs/vjmiInbVu2EblF7JcFCPWPO2EwjqVgallnYOZRXfU/Qk+uAOBEbqBPa0aa2rGjU6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6BxLCsw6K5PHMnalwt7bizrApb8ejgP+oyoeq7WEoc=;
 b=gdlIaYD/hILu6SBtvjWy9SckRd1fDP+nEdAwy5AQqxTodZdao3BSmVlkicMmM+iu3YAs+hYL5LfFdLi5ZwJaxaRpWDxAtESRWprrt/eFoKoAB2PJ0mmG9M4iZ5LvI3HEGsxEPAyzHOD9F0MooF4DB2OckTfWPhGx/kAZRZDhPT7/WchumkcJX+vsgMA0g8lUfBGpVf1gCPQCuPNdh94hbegruBdJBBuOJ7IBqUT4OrKxQm6nn53BujXzZMQOlR5NEZsaeNIAk/DWJYVO8biPMydWaxD5oN9rooGBJ+gJb44MULWRJBGblbuHVGRjhogw+S1V/Pxt1Wve5cJFy+L4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6BxLCsw6K5PHMnalwt7bizrApb8ejgP+oyoeq7WEoc=;
 b=mw9pbjx+eFhq4MXSpu/gJlfqJqQgsDtqxwzWrpymvL41ShzIeBV9wZ8E07Tie+U6SppC3ujalotjW0FBpm4593sFVSRcF3/j3he6wli6eN6R/8rqA7r7uayFYcFCT/XsIDoACZnqrergdITMFGULFrMuU9L+EbRFdX+Y8N/DHtKlucNglCoXqq0lHw+TuCD2PpWUzphTVjujdz1t6JVw2EPMfrlQs7EJsXuR4b5uDQjHdMgpcWG4cPEnxIjMPlW3e3V462utv5uU8rG5XolW6vdP5DOoHKfLyAhej36gXPdlvYdsd7f5EMqMrqJC31MTcRcQGsmZGIQB6OMpQI7/2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB12142.eurprd04.prod.outlook.com (2603:10a6:20b:744::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 02:52:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 02:52:50 +0000
Date: Thu, 2 Apr 2026 22:52:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: dw: Fix memory leak in dw_i3c_master_i3c_xfers()
Message-ID: <ac8rehhCgR-7QvzO@lizhi-Precision-Tower-5810>
References: <20260402-dw-i3c-2-v2-1-aa6c81d392da@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260402-dw-i3c-2-v2-1-aa6c81d392da@gmail.com>
X-ClientProxiedBy: BYAPR01CA0038.prod.exchangelabs.com (2603:10b6:a03:94::15)
 To PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB12142:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ca49fc-7f5c-4147-5c19-08de912c1800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|52116014|376014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 48UELmy8S//T3G0azfvG+19hJ9A6wjOABHCQn4S9AammD/L6TqNIBIDHbwBS3nJ84j/IzvgOwN3+bDsWXexbseyhIUDkW3YiqzwH0qlYgPes8KjTcQKt3RkuQjiTkP39eqssDsV6mySqqQE18lKoeVVPORa1Et7/xLCL1FQygJkqnhrmHHcBsOGTEJVxHF7b4i7HvuU1qKpaKTz9BvzIAeKecTkwbig/UgacX2Cjb+xwhIX0SVhrk/vib/edZtUM2AMJsSgFzbXi5cM+BfWmfBP9ZeuvfRV4jX3J+uJnZ0IiwXXWry6kNkMR+8/3SzlwpvaQsiAqPhW9Yo2hYrVuSyY8tQnErVwMM0gtL3SxAQuaJZZE4buTAbsu9Ndi6Ybo68Una1Czg6+d//wjBFBIry+6mxx85s8iIWWR3Nne2u0x09rPB7l637qO+gDflm7mappRKcR2DU1eNjZ9Kgvnn7DxUANi30oB0PnLqOcZL+4mUJTzGYLq6A4/opggBYlBOu0LZSEwf78qIssrUSb/vY/aK+sFwsbyZZZeqtaqg+tRoVahUyuOw7J4Fj6RP69+RJd20Q5id+rOsy3MSMyY90hMte9pJxSEJS7Hr28iytoEGbrVJdlHuwI8lDqDEEq/X29pPHz0+Sz4KI8t4acH2WYHPadlEKjtGg4pNwnAYr4t2c1DrtO4T5olAltpfLdpZFiJ1Godyxf+3/38ZK5O3Jk++Vd0AexbxBuNfq2kbhCYP/7s5vGpuVi2UIHZwNJVp2xjQb5b1kCDehxS0x9iUyYkzqKFbVEeSsoOzhQHVpE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zh752L+UYZ7PY2bgC1l3T0X/AHOfDENO7Mh18Epo0Mz7GaGL/xjvx2vppCu2?=
 =?us-ascii?Q?YCaGhHnAqUVMzAt22rYiG6ZTYBM9MY9PQb88atbzVA5NMwUBuswi+6cQoK7y?=
 =?us-ascii?Q?dHa5FvrOhBE/9Z6g9/+KfrcZ5gnO+ML5UX72rxSO40EAdySeoc3G6M33uj8R?=
 =?us-ascii?Q?50g3BqjmUUanAfxUtWQqVy3GqlBnmsEp4nf0LQetFTM9bPJgU7FKWRduT8rX?=
 =?us-ascii?Q?W61YskEXsMqXWcwZD9QtRDqZM00eAidenk8dzhc5NZQlcuJst711f0Oaimus?=
 =?us-ascii?Q?5Z8jP5L4wNqicIp24Ze+JumWU9iLm6sl1cmxZ/695SiAm58F1Ty2QxeYigN3?=
 =?us-ascii?Q?cNfjWnU6oKH1W39ohRlnusc8rDuzT0cBz1ZN/7+nMcDYx7XI3JQX3SkihKL0?=
 =?us-ascii?Q?xcGVHLqik0m9O1Wa048WBysgXzBqzlrU7dPQ2+AaiTawnvwTsbuMg2sPbGR7?=
 =?us-ascii?Q?bPRT5IroWcZGrbxO/uF7n4ftzpswxIbG3xqHQ9upa1hqW/ye7KWuqKR4DpvH?=
 =?us-ascii?Q?eGT61lsTH6ix6GRePb7qcjQldEx9bn3J9pUnGcv4QGBtfmCarbIh7/NZxBSK?=
 =?us-ascii?Q?yVFMjZSeLsfXz0V24FowQbGbFqJCOMGnhJJVE9+nLQW7Id5dmBD/iSaTZQCO?=
 =?us-ascii?Q?hdnU24VzCZwF8DlPUnfRn/bhcAaYCM+I7Q0Q3rDOxtHlpm5l29XFFMq+M5hW?=
 =?us-ascii?Q?US2YITBhiK9UDmqObafHCHXVLQU5zZ0ykDc+PGftvyfxEIAVT4Bj21QPaDy1?=
 =?us-ascii?Q?enmfgqylJ+5/6iGqcEax2apIAFENdnypmaZI5U/F+/Y6L6D4IYGO6UeYIA7l?=
 =?us-ascii?Q?VHFfyPhuUu6L1JwHVJMeBEnpG+VuotG4Er2g4IKukJuCRZWTVZNR8jUR+OAd?=
 =?us-ascii?Q?k/eKyrXNTOt0NIzogK0sasR1VmZ61BXnvD8FaSZc+TfDlEvbkzUuoOH958t4?=
 =?us-ascii?Q?vcleZJ/UKoOlam4TEFBxuij+CYjwygQB5iDL+9treyp7a/vWB4Vq5DUJo6W1?=
 =?us-ascii?Q?FoEKZk4ezVip51R5YQbtnBPoHpFkxT1vF5eL3DWPrKW+J3yoxqyiIaL4J1T6?=
 =?us-ascii?Q?7TDB5W7yB3XVSNUod/xV+bJJxke6gWYNB/+bNdGDW5AaeFw4mLdG2ZiJowsZ?=
 =?us-ascii?Q?4K6/M8K/rIkvcV03ijvS9SnTWjKJL7UUJVXMaOQUswNDO5VQza1rrnDSCt6K?=
 =?us-ascii?Q?C6+I8/9Q5pN441aUUoU5dGvq6LUTrsUYn0K6v4NpA4W0UEtMih6rmbkPAeq/?=
 =?us-ascii?Q?tltTrflDFhJ7QkT4mhFB1VCmsYctLwvKlctTdPe7MQEMBH1Wpag870sSz1l+?=
 =?us-ascii?Q?YlUPgN5jWejAYq/PbxD8hzY0XX5On/clp0JXQ1tHwMoaQDql9yI8/x3HZ7p9?=
 =?us-ascii?Q?PHhx+BsJrIUNxktwaPDcoWx8GAb5tFYOWwfsL6Z9S4smgX7eErVLdGyo9n7f?=
 =?us-ascii?Q?OezF3XlETvJM5I8HeXr5AccwvRfAVUCq1sRMtuIsDR7U8O92stGx1Lw/GJJR?=
 =?us-ascii?Q?+3mMJr12A+pURh/xQkWejZkEw0mlMhw6Cpu6hwfnS/QBq0wvQgfTFnczDC9+?=
 =?us-ascii?Q?7KK3uysNcL3C9/lT2Q80ou6GMN13oevRZxg4ZqPXQxdSFMaCnKFXJWH8JyZC?=
 =?us-ascii?Q?CHtxnD+V7vht8gt0Lum+38KWFOYhCbsUEI8NUCaE8banYs7pmaP2yOrV6POp?=
 =?us-ascii?Q?ivjxGtpnPOF16GwNplwA33s3LmUKbFe3YZE6Mec/RV6LzyMp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ca49fc-7f5c-4147-5c19-08de912c1800
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 02:52:50.2120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6eDTVHsSWEHlUUR6PJVP107YiJK3WUeTRINOfQK1X0zBeCWeSbBrKoref5xWAUIIkXKMS3phjReAR5pMD0BsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_195256_527333_B18F8F58 
X-CRM114-Status: GOOD (  21.83  )
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

On Thu, Apr 02, 2026 at 11:14:38PM +0800, Felix Gu wrote:
> The dw_i3c_master_i3c_xfers() function allocates memory for the xfer
> structure using dw_i3c_master_alloc_xfer(). If pm_runtime_resume_and_get()
> fails, the function returns without freeing the allocated xfer, resulting
> in a memory leak.
>
> Use the __free(kfree) cleanup attribute to automatically free the memory
> when the variable goes out of scope.
>
> Fixes: 62fe9d06f570 ("i3c: dw: Add power management support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
> Changes in v2:
> - Switch to use __free(kfree) to automatically free the memory.
> - Link to v1: https://lore.kernel.org/r/20260402-dw-i3c-2-v1-1-b530970654ec@gmail.com
> ---
>  drivers/i3c/master/dw-i3c-master.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d6bdb32397fb..2e31228b3809 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -7,6 +7,7 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/completion.h>
>  #include <linux/err.h>
> @@ -924,7 +925,6 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct dw_i3c_master *master = to_dw_i3c_master(m);
>  	unsigned int nrxwords = 0, ntxwords = 0;
> -	struct dw_i3c_xfer *xfer;
>  	int i, ret = 0;
>
>  	if (!i3c_nxfers)
> @@ -944,7 +944,7 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  	    nrxwords > master->caps.datafifodepth)
>  		return -EOPNOTSUPP;
>
> -	xfer = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
> +	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
>  	if (!xfer)
>  		return -ENOMEM;
>
> @@ -995,7 +995,6 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  	}
>
>  	ret = xfer->ret;
> -	dw_i3c_master_free_xfer(xfer);

You should mention dw_i3c_master_free_xfer() is simple wrap kfree() only
in commit message.

You'd better create following patch to remove unnessary helper function
dw_i3c_master_free_xfer() and change to other place by use cleanup.

Frank

>
>  	pm_runtime_put_autosuspend(master->dev);
>  	return ret;
>
> ---
> base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
> change-id: 20260402-dw-i3c-2-8f123def99b2
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
