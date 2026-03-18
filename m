Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514ED103E18F
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2026 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lgeAQENSAgQOStjBEL0b6CaN1azs1o4+ECxwck5++4g=; b=JIpZL4FnbEnKJO
	KvNjnjJfzJWjqfLz6/Dew0jgMPYx6sE24dfuuJ4d/WJ9czDS2qHj9fXMPYlyZe4V1LjMr3En/Jhre
	9gGs1wN3Z2p5t8sy0WDwO3cqtO+D/6dR167NZ+Us1lE/7172icuTNSxu32ExZQnV1QJ8oh1Hchy4c
	N4z+DYljgVXaKCHmU7Hxmd0wZOpA3FKob1TKP0PCtkswAJzrgQq2a3yCclePg7hkaaT/SNEvsaj6l
	Ww9XHWdD+eizDbxwGyNYCMluVBYA0//Tf32u5DDQ0J9KgJekBb0kkXX9XHEQbGpuTdC3aLu64o80C
	Fp6UdOzhyKZmEHtc31oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rrs-00000008atg-0Eww;
	Wed, 18 Mar 2026 14:27:28 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rro-00000008asp-3Wl5
	for linux-i3c@lists.infradead.org;
	Wed, 18 Mar 2026 14:27:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WG7cAc/MclyJoVCNnFr92g6V5c/Wb8LcOf+LbqRIGnxGVZMDcPhE7kqle/6N3csCkp0of3G6qNhpglnYGBCbsU1Fx1Vt/thUpB7uyutPS90T5s/hEUOfU5lv3GQtTqswP9rBIqFR26iiOqETm8UgS57VtrNk7/DrxhwzIAjdXxWAcQLg1jD9+UsJLFDlzuvp3Vthkw/PXX+d/66C1jZOcNZw85hfb8/Oj5NO0qXdLM2DLltJTfuzNFAMScPMPYjHJdCRAVMUWhdDkS7eSE9CrcGD/oQksnB2TpBxy0LIGK6PkTip4mLUmDddNQ++fyUvNMwfrgtdFFcyTxEB4SPX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDPsh+trSnmXy3GhIaG1SGCRWPfd0il/6l5w1Qkd0x0=;
 b=aVtGVLz+1L4RBenhDFiQ5x6hXx04Zvdlsws3UJ/s536GETmWrEMGcg0tMdYEoafS4ogEpqsE3UWA/Cn+O79hd9mXk7+wfPPeV5toaQsWoK778ZufF2nm9kbM0XXxgJzdckySMgyHbcYXQAL16ODO/oR1A0sK1OVs/9RkUlxrrC5YyZw0/R6RadU7CIEg0k1QeRqEUcFSCiEZ3qhPRPQ+/HhJZxVUmchzQ/yMzYG24GdZK1/0vNVEfZICk/Bi4MRFmjtagx7jAdP13sEAIaUxv4G1Qu2qjH8mBMHQFhHL6yXdnmv1fTxz9g3tLDo8ueawKJk5ecZPB8wnLXQUQ0va3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDPsh+trSnmXy3GhIaG1SGCRWPfd0il/6l5w1Qkd0x0=;
 b=Ugm0HquDzORVmfapPHmtoKk1EYDJIFrj9jVjNcSSh8g+UTqsSlFmVjNksk0+6jTANOxcVp3I1Sid6u2YqkPF+Qm0qtuCeIQLfpljmIUhn0X0h4ZkMdyou8GprYPrVwsAaXUnqE8UmLkTYS4MkORdwrwwQkPkCrmpr0Vq908r5TmsWfwfpzjSwSc1mrrSJuG8bGaCjLr5jngFoqvjbJjWdCsxEYoQqOTDRyVBltOKAatfZBeqZDQyxgRtgOVOUawTr22Xk5x29LG3kqNI75/xAGMVQCBUlBXVBJpxpG7ukwAfdqA5a+PPW8RPN1J0XSqIG2SGGZ0/VGk3w2wnYF46aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV4PR04MB11823.eurprd04.prod.outlook.com (2603:10a6:150:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 14:27:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.021; Wed, 18 Mar 2026
 14:27:18 +0000
Date: Wed, 18 Mar 2026 10:27:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 4/5] i3c: master: Fix error codes at send_ccc_cmd
Message-ID: <abq2PZY3cz1-mmgV@lizhi-Precision-Tower-5810>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
 <20260312-ad4062-positive-error-fix-v2-4-1c933b5c7ed8@analog.com>
Content-Disposition: inline
In-Reply-To: <20260312-ad4062-positive-error-fix-v2-4-1c933b5c7ed8@analog.com>
X-ClientProxiedBy: SJ0PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV4PR04MB11823:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cffd67e-fff3-47f9-47ea-08de84fa7563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info: gAg0GXlOUC8k/Dx9VjWb8uTfECSREcGBBlvf3SI6lyGBKUdSuU2hk5fjxYi0yYK4+cgK9obTNukBjilDbvq92mMrEys++MuMu9i4tu8AJrDxTt9atgzcg9CldhtKjfd8aaETVO0OL5dEkhuEF5+1bd5O9AZW2bkN5aKvGt1+hXDdgf7QohkazCofQatA73mq9+O8M76ktgMV/SrSJzupOZrPm9egs5ZPCNDycRwPehIRn8IgzOt2E2Dsq4FYEIhtqejej0LRiDtJE+JjbfDa/pYv3H/A3d5fAqnpmWliDst9ULw+h/dOvPKpCOx6L68RGMKVKZ1ep18V8S3GgaGe6ePkC1vD4BQytPQYNt0svU/QrMGpDCkIy4LMWfBTEtD3U3ppsW9Ma2WDKK8s16em777jF71Q5ywob0zE2JNRxc3Mp9G5o7Funpakujeh4sI+/nDoAQMeqEHogJSkeA/X2GPsXIpG8lu9DyPHkaAw5DZUmq+q9ieOc0StQiXw8e/h1yfDjl9OgX49G7Mre6JnjQh894v/PodV24tIo/mYttbGz673MMVczq2F8Pcp165BhRTFp9aO2UvE3Xqpvm7jEsoyrn56ocdw8CFdPq0+4KM+AtN/zeWivNd2YNyvutquh9luTd0er1lkC+3UtQum1izZUnDhWmyAJd8RrxDpKxvUMVM/+ls+RrAlLxTHx2UACmbb/NvBIVj2YtKxZe7Lz7md4TjD7ILnrpaVstlmes5b+HZ0d1AC96wCp5kzQEsR5eH2VZrLSp4fR0J7sjEYT05H7bzhd6OS+I45xROUDz0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xTBlMRzfnzXz2VclLcgsvu4KLj4aKPJTYYz55ianGFmaL1ivR3zUZv1SjuLZ?=
 =?us-ascii?Q?CWmp5rNLjRzeXXnp+sAqn/TifvQ9QwAB/QMKjKqmuAMzpuhz8JnNyG9niGsG?=
 =?us-ascii?Q?ZO4uAljiYgOa/y4xhJjeRIImgVnLLs86oQ3VSgsB2UYw60WprMo2bDG8fgFv?=
 =?us-ascii?Q?q/f3cd0dpTkBZVO8j9oUoDBEohLNrA2mHyu12ooWPItwVY+LOaDca08UH469?=
 =?us-ascii?Q?9Bnr2QFcj7/CxEBvGM2JSj4XyOFNoITv6MqI2vb9L+MrYirywsAWk20Iakzr?=
 =?us-ascii?Q?vDrUkeFnTq/+Ge97UI1W6yMoRSNK5PQLS1JqTFgHi2GOVt0VgHtGyJS7L6mR?=
 =?us-ascii?Q?D7/+e/XqqmX3udfkXp5zFftMC5KcUWkBi7FuuzrANsexkbM4WEESSrE8vWdw?=
 =?us-ascii?Q?GnvBYPmIjxOOMG94Vt4SMtZ4jyluSSj5gkfhwURksTv+tNDRWtZEL/ZdOdqt?=
 =?us-ascii?Q?rybDB7z6nCtQAd3awjlEXJKk2A7TBhVD8bfW+2n2E/LbYRdIw/PuCOWP2lnK?=
 =?us-ascii?Q?+6ysbxf+UV8sc2XsFxOg+ufkWpxEMJE0vcntT7cjiuyKCEHNsLCcxDq7cJ1T?=
 =?us-ascii?Q?dxvj+Us5lWoU2E1BvdSA0UirCqbsINxQBBNLNgU7Ho0eRnmHYkBY1GqiTbCo?=
 =?us-ascii?Q?KYp4nucf3pGR/immE+ZNNB9bpxpTQZKATljx5YyE80Ku+psNq6WDdk+w8lrO?=
 =?us-ascii?Q?c63jDJw1SG7IyvshQB1gnB+DPkOWR/Tq4rDC1RNBoBC08t3hgw5bNlJA4CAg?=
 =?us-ascii?Q?ocsoZ3PxKmwm9lM3fpMWwW5RMEHpXXrbt7W3coTTu16YNU3Kag15wDRuzqCE?=
 =?us-ascii?Q?GlXoMiBESh7WGT4gNXx60R/UWgNZtUv1iMItv0+gXUG2y1e1gREkdql/Nzlt?=
 =?us-ascii?Q?6p3VEy3JY5fAoxCgvImyGUxcOGH+/zWnbSEEPTQkGI4RNRHW7V5g+DrANv8c?=
 =?us-ascii?Q?/AR1ytUg8TEpsNYEV/olXRl1gm939TPVOBtx/SGNdPb/VV8XkqZDq/yC/Bee?=
 =?us-ascii?Q?nO52opC71gmKsZqnYJTapHYPhgg20FzHWcOPzngRzpUGS+ZcuSiHndnZOdnw?=
 =?us-ascii?Q?WYXs7mQ7TudCeBvKtTs2C4s58EkdG/4Txi9XNOmY0F68NXkJER2WpI41avmO?=
 =?us-ascii?Q?UTqB6N9GYVknFYkEhybfEaYisJHsuWP2Nonnp7sqcfE5tUhgDJnt7C2gjYah?=
 =?us-ascii?Q?T7NvFATaKCL38nyIGmNIW8tweie+y3hO/jmM640rfBSmHVGi3Nlorf5lny5V?=
 =?us-ascii?Q?ScO1dH+PzYi8X7pm/i3kfnp5DQQoJt04g+5NJj50WNwZ+wqA/Nc7DQr64UdQ?=
 =?us-ascii?Q?azMnwpxyhxirTw/OgsZucMBFEGuB9PIj8eBpZr7kiVW9krMEMZ9/Q6ffX9rh?=
 =?us-ascii?Q?Is+aKQypXZ6Ot7NmQ50IpWFgxsfeJdbDYJ27zh/8MXkAOZ3504v2icjo0p/A?=
 =?us-ascii?Q?ipyyMKTUL4JAiOia8f7cTSatore6hdTZ/kfeB/0GZrH90vCxYEVI+YWMPDqc?=
 =?us-ascii?Q?Kj5yT/5Ebi/HZhECngkEa5chZTxV0PAXWfVTiRknUOurCkOg9EKrTmaWvk5k?=
 =?us-ascii?Q?Z6I8B6Zb5ATq4CMK2agiMZLQeoZlQS4oqeysjOITxVOtTkasT0OdBqtpok+r?=
 =?us-ascii?Q?ic0ep23yrb6nhcjiwhaPMXvl4xgYGF5gfNywEqY2UrIiDkusru05Yj/d3LDY?=
 =?us-ascii?Q?IMu2OsB8BSkMLZkQSLTMoJBOcSMnoaaob9IDFHUMpYCg5kafWA20nqS8tTSM?=
 =?us-ascii?Q?L28Wh4MYag=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cffd67e-fff3-47f9-47ea-08de84fa7563
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 14:27:18.2736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMKNpgCxd9bE1LTA7vi/GhUunOkH+S4mMqA2IJR8OwmOTDz/8bvy67dfU8JG1gslvBSSP9LpQkgMltxUOo6ZbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_072724_906361_59D7CCF1 
X-CRM114-Status: GOOD (  22.92  )
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

On Thu, Mar 12, 2026 at 05:38:07PM +0100, Jorge Marques wrote:
> i3c_master_send_ccc_cmd_locked would propagate cmd->err (positive,

function name need (), i3c_dev_enable_ibi_locked(), check others.

> Mx codes) to the ret variable, cascading down multiple methods until
> reaching methods that explicitly stated they would return 0 on success
> or negative error code. For example, the call chain:
>
>   i3c_device_enable_ibi <- i3c_dev_enable_ibi_locked <-
>   master->ops.enable_ibi <- i3c_master_enec_locked <-
>   i3c_master_enec_disec_locked <- i3c_master_send_ccc_cmd_locked

why "<-" , look like should be "->" Or

	i3c_device_enable_ibi()
	i3c_dev_enable_ibi_locked()

function need (), i3c_dev_enable_ibi_locked(),

>
> Fix this by returning the ret value, callers can
> still read the cmd->err value if ret is negative.

Can you wrap at 75 char.
Fix this by returning the ret value, callers can still read the cmd->err
value if ret is negative.

Frank
>
> All corner cases where the Mx codes do need to be handled individually,
> are resolved in previous commits. Those corner cases are all scenarios
> when I3C_ERROR_M2 is expected and acceptable.
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-iio/aYXvT5FW0hXQwhm_@stanley.mountain/
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  drivers/i3c/master.c | 32 +++++++++++++-------------------
>  1 file changed, 13 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index bc1189afaed81..0752af5eb79b0 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -898,11 +898,17 @@ static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
>  	cmd->err = I3C_ERROR_UNKNOWN;
>  }
>
> +/**
> + * i3c_master_send_ccc_cmd_locked() - send a CCC (Common Command Codes)
> + * @master: master used to send frames on the bus
> + * @cmd: command to send
> + *
> + * Return: 0 in case of success, or a negative error code otherwise.
> + *         I3C Mx error codes are stored in cmd->err.
> + */
>  static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  					  struct i3c_ccc_cmd *cmd)
>  {
> -	int ret;
> -
>  	if (!cmd || !master)
>  		return -EINVAL;
>
> @@ -920,15 +926,7 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  	    !master->ops->supports_ccc_cmd(master, cmd))
>  		return -EOPNOTSUPP;
>
> -	ret = master->ops->send_ccc_cmd(master, cmd);
> -	if (ret) {
> -		if (cmd->err != I3C_ERROR_UNKNOWN)
> -			return cmd->err;
> -
> -		return ret;
> -	}
> -
> -	return 0;
> +	return master->ops->send_ccc_cmd(master, cmd);
>  }
>
>  static struct i2c_dev_desc *
> @@ -1036,8 +1034,7 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
>   *
>   * This function must be called with the bus lock held in write mode.
>   *
> - * Return: 0 in case of success, a positive I3C error code if the error is
> - * one of the official Mx error codes, and a negative error code otherwise.
> + * Return: 0 in case of success, or a negative error code otherwise.
>   */
>  int i3c_master_entdaa_locked(struct i3c_master_controller *master)
>  {
> @@ -1097,8 +1094,7 @@ static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
>   *
>   * This function must be called with the bus lock held in write mode.
>   *
> - * Return: 0 in case of success, a positive I3C error code if the error is
> - * one of the official Mx error codes, and a negative error code otherwise.
> + * Return: 0 in case of success, or a negative error code otherwise.
>   */
>  int i3c_master_disec_locked(struct i3c_master_controller *master, u8 addr,
>  			    u8 evts)
> @@ -1118,8 +1114,7 @@ EXPORT_SYMBOL_GPL(i3c_master_disec_locked);
>   *
>   * This function must be called with the bus lock held in write mode.
>   *
> - * Return: 0 in case of success, a positive I3C error code if the error is
> - * one of the official Mx error codes, and a negative error code otherwise.
> + * Return: 0 in case of success, or a negative error code otherwise.
>   */
>  int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
>  			   u8 evts)
> @@ -1144,8 +1139,7 @@ EXPORT_SYMBOL_GPL(i3c_master_enec_locked);
>   *
>   * This function must be called with the bus lock held in write mode.
>   *
> - * Return: 0 in case of success, a positive I3C error code if the error is
> - * one of the official Mx error codes, and a negative error code otherwise.
> + * Return: 0 in case of success, or a negative error code otherwise.
>   */
>  int i3c_master_defslvs_locked(struct i3c_master_controller *master)
>  {
>
> --
> 2.51.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
