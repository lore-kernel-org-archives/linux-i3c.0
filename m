Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEFCC52D71
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Aug 2024 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ailisjduwA50UXMCuDH1bvfRSyPxufU1ksCFXxvhdsQ=; b=UhnDBs1pAAugGr
	AfDbcW+jmy4SM3NiayrEItcsfroPobhDK54OshvNRQ+rH+aGdRJDIwBJXvcS+VO3p4Nk2RFPBOouc
	xUsUZFPbZS7Rvxa245Sp29Ca3UWGpDIUASVFQYf071bSe0ThpSQqazqgTf+Ty+v24MjFqOoTHf3SH
	8py/rAlh0HXmfsd6P7cvrxHC5Vqcy5ugVoY/rtTFiPdwdEZXTXPuzRuQsYCQ5pMgemRgZHZxaZSa1
	84tvVrbdHyrzRylc1bn0Fq1hpgBC1JkrAIQJvlUIfRqEZ1juw1/BPsmJ4ePcDyHIh2d7ATdD74fzl
	p9cFTNzE4dtdHtMwCd8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbMey-00000002HeV-1i8V;
	Tue, 06 Aug 2024 16:03:40 +0000
Received: from mail-westeuropeazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c201::] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbMa8-00000002GBe-0yC3
	for linux-i3c@lists.infradead.org;
	Tue, 06 Aug 2024 15:58:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6MsrE7baPXViOTWF1iWDLqSFdgvh533YBe7l88i28XoThpAksTbkUjYfVQPqNZBEDHfHdcl/+V8E2ro9PZCTNt6SygLvigCOHapJVgs63d9jgpccZO8pyQfeq4fxuAO8gWRH6Vo284NgWq0apTo8as/OaubM1K96xKgvcu/zTFcvh4nvNdjSb8qpbA74nCDPMV8cojsRwJuz+CvRDSJ5LQvDvJ0xIy8wlFsjM65r3ea3gjdohI/iNC4xk6N/pB8nGpBYO4MZ8VoQEUdy1RMtbRIc+XzoZFeYYwYChfWb9MHwJsVThbhQuKoGMpwRM5dC6eKh7FTsAuBcw4Ljid9ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJqwk+YjCSPNMro7AUtkdC2TEMxoxC6nsUSw9DlM7iY=;
 b=UV4l3ztEryHvpBMtlVVN2lPxNjZ7KBr+IzrgNQAkX5FD7RYhDsJAowCG5KJXeuox7Fm3qPIJvtnTHdzzAwxixlJzOHs8QKcSUHRNMw/nIO+vyqigKcD8Hr/RX/E/GMNkGyMPBJfq133VA96Ey9WdWtCJbmsl0vYUGPNR7jsu2UVC0cV/30Ink/tTAJLi6+2Ens+GiDBL9KHpZHy8pIsXAkophb7HHK4tSv4Rbw3et4Ls/HW0BKtrLjQw5kJ5T3KFJGfBv9S6fhHgGRf9slt+Flg+Qcd6hQ5CTzRiA88kLGpS1w9BZWgkn5qS6Dy/+dkr7mfUPNT855ku9tK3Y4mnUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJqwk+YjCSPNMro7AUtkdC2TEMxoxC6nsUSw9DlM7iY=;
 b=MisOvm1JLve0fE7jGY6p21ODu/4fMdLAo3QWhVU7UBwYElzemoF7j2FOeQ6M3RQvdIoRctloZHpWxrnPOn588vcPR4BXPv3AI4Y+FuKsYjaRCm7nQhrqLpklVUi3uNCiPkfKHSV95BEaFmTDXGPDBoMUzZpA6KkQIHFjDEt78JX669SoS+bjMA/b3a6IUHj4hkwHkAv1V4T6aF67YttSeqrEZzIe05UFW/r22xeJ9RniWm6/NZP/HpAa/O4lhSLa9mWS8hPcG/7cAln+czwJRNzq6yNzfSBuI19KmqHTFz0xJOkZlKwuwLEb88tW5VJTmuNY1u6QU3tFlGF59WSEBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10197.eurprd04.prod.outlook.com (2603:10a6:150:1a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 15:58:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 15:58:34 +0000
Date: Tue, 6 Aug 2024 11:58:27 -0400
From: Frank Li <Frank.li@nxp.com>
To: carlos.song@nxp.com
Cc: alexandre.belloni@bootlin.com, miquel.raynal@bootlin.com,
	conor.culhane@silvaco.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-imx@nxp.com
Subject: Re: [PATCH 1/2] i3c: master: support to adjust first broadcast
 address speed
Message-ID: <ZrJII9soS8sG2roT@lizhi-Precision-Tower-5810>
References: <20240806064851.2425797-1-carlos.song@nxp.com>
Content-Disposition: inline
In-Reply-To: <20240806064851.2425797-1-carlos.song@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0225.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10197:EE_
X-MS-Office365-Filtering-Correlation-Id: b60104a5-eb42-4f5e-4750-08dcb630a08e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qGrJSBeyRV50IdE358/47PaMAIK0V3BGAdNSydtO57plK0+2i/YFLb5gE/1W?=
 =?us-ascii?Q?9tElVgZlWJVjXBE6vtj0wGTaQLBEDZ+51KLOPqHcHaiKLQHspAiVeORUmg5W?=
 =?us-ascii?Q?q9acZIyT+U4TrCzeP7+5wc31U3grN7DCYwCE2MGf15puLttX0kfz53HqdDDP?=
 =?us-ascii?Q?wmphh/pL4KNNWTSp/ka/L1YibtHZEdANDSBLEvrZQfIccWoMietb0MvyAYk5?=
 =?us-ascii?Q?9Lpi7QJgcH+PSRddgxvA6S61LENdK8qEAkXtt5ZQ7ySWj3k2OELCzxw+GPD0?=
 =?us-ascii?Q?qmejDivWfAWqVUrF4sKjfVwbp5042KWTUqScmqCSo4e8YdSbUgerorY7iZtS?=
 =?us-ascii?Q?33xVx8otAmix4qqFSYARSiyXyeLaYuIHyEwj1E5e+zX3sublVL3NrBmRwZFp?=
 =?us-ascii?Q?05Ps9VY+jAgEE9sVO1FBIykw441K7e7LG3u6Rg8knsWYI2cOu97L3KMG9rh0?=
 =?us-ascii?Q?U9F4vvE922ReaCjKS95eAMLvnYz7lK9Zt8w104waxFJU0eSiWgJyKqUdwuJL?=
 =?us-ascii?Q?BlmcSsGvLFe6s/Tqgnis9rGQ6hyoTu34bqx4cLyXhpXAlqPhlYh17M7cxEL0?=
 =?us-ascii?Q?Jiw0bDDClg/RqFB9b5bnZNqygagVq1FZ+hp1Yl45tYFffDkJ3d5rci+ux8OX?=
 =?us-ascii?Q?BZ7hnnMVVuP+nvEPeLI6CGtMAefhH3Hw3LHMvs5fLPH0tGxOKyfjiqNcs/Av?=
 =?us-ascii?Q?OXcjgkf7ccVnp1FdsTjDhidoe3WxH6ca3LX+nzrtjTWAjFKEvxCvT7xP6/xV?=
 =?us-ascii?Q?Gz1DNNpSgmihYKZIiM/WU+un4QO7U2/RyauJh8wdJW1H9AB0TvT2kffjMXeT?=
 =?us-ascii?Q?PjhO4AS+KDsHf/pCYDOHCBWtQYT/TCNJqE/z1BZ9VBfcecTrARdI4Qkw8Ewq?=
 =?us-ascii?Q?AisPZgiMyM0GXDO9cGfOUq0YUE4ZZCV4czZ6Gtf4VtkMAUrtwtyHvAUUD4Iy?=
 =?us-ascii?Q?hmVTockQ1UMTq2++Rj3nyfdzY7vqBa1kU6WQRUX0yav94XFuUPIPCStay5YX?=
 =?us-ascii?Q?7lSuyOnyI2+cH/tM5pDcq3dBYkMC6DH/7zgU+BkfhHIHvL41DN/LTYZx1Kcq?=
 =?us-ascii?Q?dfAqN959uOu9/29hVsP8/ve8SOHvgY3c0h2fQTn9jYfoTRuvOUGNtjAsV5sS?=
 =?us-ascii?Q?NlArYLt9C+NPBg/SUshVVQGZYfCHJeycw333Fqtzj5Upi4npDZ8WdsQUGq3n?=
 =?us-ascii?Q?8mJTbgdy9hEHFV6lLGgEoyyAlQ/7omGV/kCiU0q2uogPK9QxqNd05iiyMhls?=
 =?us-ascii?Q?N+lrPyb7HXr6oOgqPnMgB33oStAU0iwTtX6GZGNPszDBQZfBMMLJOAmYZE4g?=
 =?us-ascii?Q?c68sik+0QHbcvcWjjcm8ijg82Q5wij734/g/SRaSyqUkdrT5JlVw6Lm0SxF5?=
 =?us-ascii?Q?Vnc/UzTiULKeXMOFgdYOrb2W/JREm5QqZn7d7F74AfeiRumjZA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zltsdiu5Mc7GeWPS9rPMfmlbCLyb7XOLdLNSOLaK19Bq+oGhoAe6moN823YB?=
 =?us-ascii?Q?it2xhd/gqRqMeFcrptlv8FcD4ZS9OjtI0GJXrbREnnEMzNRCyOaC5tclO5aU?=
 =?us-ascii?Q?3hINP/pFsqvJxkJOAErOhWCFJB7uWVkPg+I7fFROLLksieF1aF3Sx6DixgyV?=
 =?us-ascii?Q?i8ZgXjrpgP+4HU4yul8EODN6Ss5NHgwRLCnbep4n0D7sowp2MKBi8koKMS/G?=
 =?us-ascii?Q?QUtLMTAEQSRwno6vyGIHk4SE9OmZl5W1XN6aefBtLpb5F0mvcnSqDqPmLgpe?=
 =?us-ascii?Q?QlVF2o/UJuAYKcsZPXKLrw0320jfen3PR406RHeMVnE6GTyPWHqVzQEYwD6y?=
 =?us-ascii?Q?r99womMB8On00XgzwF7E7py4i7C/hT9jiDCSVliCkMVTifJiLzK4aLPYdtFX?=
 =?us-ascii?Q?yObCOx6z0liT7mSCM1oFhJj51rKUmJKc7Wedwoe16bMRF7kYQIIKfB84cKfY?=
 =?us-ascii?Q?UkmAo7SmFWpNafnumgvbEy/Wx2gIodo53AlEfmT1Gceo18Cfes80qWwIvf+F?=
 =?us-ascii?Q?5zXOBPPXnXNzY63JAuQ72F80e7Hta5MIEEcfAM1n1jmN/Dxt7B+0x2LRrLjQ?=
 =?us-ascii?Q?c4VqBh+ehbybbA+oesuibQyULB9llGi86GFQnqeWcxyzc2IjCmHKCv0YEyNI?=
 =?us-ascii?Q?vxHE4wHo5ToImUmQQ2OeKLTSNjyGknUyNGOgsThI6PUa1laK7CoDy7hcbjhm?=
 =?us-ascii?Q?YxLYLYcvjCoCDFGSFUn0SEE4BBldN5T2s0dScrywIPrG4rBSpWf7PSswhWGC?=
 =?us-ascii?Q?olh0Ff5FCjhUullVca7MOvt4z74bKlcGB3UbaijaGUZmC9rmVIZ9K0X0b8ZN?=
 =?us-ascii?Q?zu5V/j/Ubqzm1hF+ISCceGZXlBPdUzZTGvn/Ylyx2F0h7ruE+AVxzkzQDLS2?=
 =?us-ascii?Q?ZYC8Auz9OXLsSeIHDxz9tZN6UmVF1AcSkbk/pU8B2deMvWK3CCTsC8OvQ5W5?=
 =?us-ascii?Q?p54B+WfB4j0eHOqaSLSGXCJ2jjW08cMihWLHy4prnerXQ2JllG3kAYukkQBa?=
 =?us-ascii?Q?e/CY5HHcFt/vmFsnQQXBck5AUCDx0abG5xsnPmQ2LCY8kdZ5blD3vZ8dmwmT?=
 =?us-ascii?Q?AoQpct5W6uWkeUzVNUKug4wSgg8T1hjduQb9e4JlYmHEyWqpj+U4BhA/sN6l?=
 =?us-ascii?Q?cmONPTCv5PFeEX8MjYXKhzmanfJh+XGT4Q2nVUtn6hPRY3/cbAPybN1ZRSMd?=
 =?us-ascii?Q?R9yvJYCK+95WyVIH7uSn4KCEfCL/RcdN8cZEa0Zlt3b+Q6ZuAoxtd9+SKfRy?=
 =?us-ascii?Q?jXGbHx9H9rg95252jW+9wQ1WhP/5ffODTKAzYoL4Yvziknu/X/xtpap59Lvo?=
 =?us-ascii?Q?sMo4qwJl9IrJaF/AwHDIxtG+qlX+fdkiMZg/4ZQMAG0K4Ofa3oJB05JqvKSb?=
 =?us-ascii?Q?UkMgagaUVrRU7IpXvm1gquXZjGphaHMq9/fX8f74M2278kfipQ0pIv4OeLAz?=
 =?us-ascii?Q?nbrybmHEuQIb+MFJ8qrOvTkyQNYxG9FGNwtAOk37OwT3qJlwIeXOqp2mNJr7?=
 =?us-ascii?Q?NBavDcm29JDZPOax0UyDM9VJeFv+uA8MYfNYtyQmQSCyaEkth6eGwkDEtsMK?=
 =?us-ascii?Q?Ds6L3OPjqZajZwBa6guPoU0PMqB4yYNFBbJHLYXQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b60104a5-eb42-4f5e-4750-08dcb630a08e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 15:58:34.9062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVGPdDYpwOTVe9tc3CsQLKT+CdY+f4lKTaLtkVsBH8h2bOY0vLYSIs6hTuW3sdEctUrHJ9Uw9Hh/eF1deHNuNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_085840_302914_386322F0 
X-CRM114-Status: GOOD (  21.74  )
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

On Tue, Aug 06, 2024 at 02:48:50PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
>
> According to I3C spec 6.2 Timing Specification, the Open Drain High Period
> of SCL Clock timing for first broadcast address should be adjusted to 200ns
> at least. I3C device working as i2c device will see the broadcast to close
> its Spike Filter then change to work at I3C mode. After that I3C open drain
> SCL high level should be adjusted back.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

A small comments below

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master.c       | 12 ++++++++++++
>  include/linux/i3c/master.h | 16 ++++++++++++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7028f03c2c42..6f3eb710a75d 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1868,6 +1868,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  		goto err_bus_cleanup;
>  	}
>
> +	if (master->ops->set_speed) {
> +		ret = master->ops->set_speed(master, I3C_OPEN_DRAIN_SLOW_SPEED);
> +		if (ret)
> +			goto err_bus_cleanup;
> +	}
> +
>  	/*
>  	 * Reset all dynamic address that may have been assigned before
>  	 * (assigned by the bootloader for example).
> @@ -1876,6 +1882,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	if (ret && ret != I3C_ERROR_M2)
>  		goto err_bus_cleanup;
>
> +	if (master->ops->set_speed) {
> +		master->ops->set_speed(master, I3C_OPEN_DRAIN_NORMAL_SPEED);
> +		if (ret)
> +			goto err_bus_cleanup;
> +	}
> +
>  	/* Disable all slave events before starting DAA. */
>  	ret = i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
>  				      I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 074f632868d9..02e4f47f9d01 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -277,6 +277,20 @@ enum i3c_bus_mode {
>  	I3C_BUS_MODE_MIXED_SLOW,
>  };
>
> +/**
> + * enum i3c_open_drain_speed - I3C open drain speed
> + * @I3C_OPEN_DRAIN_SLOW_SPEED: Slow open drain speed for First Broadcast Address.
> + *				First Broadcast Address in this speed is visible to all I2C/I3C
> + *				devices on the I3C bus. I3C device working as a I2C device will
> + *				turn off its 50ns Spike Filter to change to work in I3C mode.
> + * @I3C_OPEN_DRAIN_NORMAL_SPEED: Normal open drain speed configured according to
> + *				I3C bus mode.
> + */
> +enum i3c_open_drain_speed {
> +	I3C_OPEN_DRAIN_SLOW_SPEED,
> +	I3C_OPEN_DRAIN_NORMAL_SPEED,
> +};
> +
>  /**
>   * enum i3c_addr_slot_status - I3C address slot status
>   * @I3C_ADDR_SLOT_FREE: address is free
> @@ -436,6 +450,7 @@ struct i3c_bus {
>   *		      NULL.
>   * @enable_hotjoin: enable hot join event detect.
>   * @disable_hotjoin: disable hot join event detect.
> + * @set_speed: adjust I3C open drain mode timing.
		adjust I3C bus speed, which is generally used for reduced
		the speed for first broardcast address.
>   */
>  struct i3c_master_controller_ops {
>  	int (*bus_init)(struct i3c_master_controller *master);
> @@ -464,6 +479,7 @@ struct i3c_master_controller_ops {
>  				 struct i3c_ibi_slot *slot);
>  	int (*enable_hotjoin)(struct i3c_master_controller *master);
>  	int (*disable_hotjoin)(struct i3c_master_controller *master);
> +	int (*set_speed)(struct i3c_master_controller *master, enum i3c_open_drain_speed speed);
>  };
>
>  /**
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
