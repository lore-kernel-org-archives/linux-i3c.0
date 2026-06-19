Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41800CD4F26
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jun 2026 19:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+PvzMhFFtub+dDVBkemLhgDmV9OayeX6dtqR4ZIYko=; b=g1v6Hfz/neAYNL
	JQgV0Ifp4YkLad04F9zhZ/RHJPrgEYOduuu1Gbn5srvUzfu/YN5mKQ2HhYX2x84cVgztzh0t/uNHw
	2XDqFkzK0AU16+OdpGWDGj8sjN0spgf1cx3PlNa5xHXyx1dWHDFPt9OAPGnidZ8piy4AtbUaeNEil
	5j7sOR1Gwbj4brKIYZsRU12cpKG5bog0LON5gq1YHDkkdnbZGUWZSz1Ja7hBxDnNqt7tZVEVu7qqJ
	PKRppyyCD/oMnovDKR/MPuIrkw8+2j9KE7Abq5pW3w/+S/ZS+unOYcKY8eIL7DDB5PTff7tH3Sw/c
	JkAiltogx/FF2QcywO7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waerL-00000002upM-3SIC;
	Fri, 19 Jun 2026 19:26:35 +0000
Received: from mail-northeuropeazon11011027.outbound.protection.outlook.com ([52.101.65.27] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waerJ-00000002uow-1nHB
	for linux-i3c@lists.infradead.org;
	Fri, 19 Jun 2026 19:26:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLEKR205Z/4eTH3lFYMfqSqa0ptcdWdCJLMU7XAOfE7IBqmpUmh7PAJHX3jEsKR7dcyYiOe2Cat6pBfjDo9uthgcBAGlV+RcnHPYU/9eW9eKWivjx2+LSdqn1KuSdAE6cZ4FnOWAMFp2K9/bCEHAeS5t+RbfxcOTNGH17BGmh+Bll6LABTiUXyIUsh5pLF6ygRFte7utFt3U6p5FwCgRDwAGBajL7i18eoIr8iw7lni4s8NKO3byyIgHr3xjO9m5iH7+yIKDiwZa+6t2bNRvHlx0T6o2drzW9NHOzkBBD9mGhzeFJt5tbUDdAIXA7ExGhvqLwZSg9rYw8mriFiqVLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1ReOwvVqJNM+ka9KqxaRkdFAGsU8wk0TT3O7WJ29nI=;
 b=rCoILNGBcUmlyKGXzP11e1f5w9kMY5PYFanTcASWaO0SkSR53JyCWLIoxKZsgcoiahtXrth3fIDyRPefmDOTVWbwuoXp9A4MdeOFrB5GwE1ZUa9088u86MMgp6PEB3QeOaTo6iG0DXd7CoHt9G/FpYjh/XR3yEM8PVrjrAZphbRXfr1tJbHY1GVGw3WxRXQlRu0+w6svJC8Vyh2V2MA+aVlMRXv5Emf/CfBZtsn7IdzI/d4soci1bofnDNkzJ8CG5si+ea+i8DxgscIarD6XovabkInZv0w1LSV3XM+R1f3mHGNJA5bE8oUzgQVSMwRj5du3v+1atITgz99GWOUp+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1ReOwvVqJNM+ka9KqxaRkdFAGsU8wk0TT3O7WJ29nI=;
 b=PyoKKwWwKEpqqM/sOFcIflm23EbG9B4MMPRW0jYcAiI8afQnlDqBZLfjYq96bQZ5x5IJCT4bJQz892zaXeZKcoP8/BmCGDCJvMNCMoGBApdQKro5oWsK7wa88KcNsCgQQv2o0Gxkem+Q3QFGNJaDoVNFQ4N3SefGOFTW5efhLzT/7IFfvhbVtSpHnt3eGuhzcB55tmuwE7+nEU2M7HUiJfscg2TK6ccU76GXxrb4DAYbP9RpBJzatiFSlYWcGiwv54FIeHEKejQ82XCZ5oAiMJFAuPIyhqIZ6P5BZKBx7S8EuIdjgLAYKkvnvum23ghnZFSTdd0LMRJ7OS6zkRF/bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA2PR04MB10279.eurprd04.prod.outlook.com (2603:10a6:102:406::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 19:26:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 19:26:28 +0000
Date: Fri, 19 Jun 2026 15:26:20 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
Message-ID: <ajWX3JExFZCqXj13@lizhi-Precision-Tower-5810>
References: <cover.1781142158.git.tze.yee.ng@altera.com>
 <a4d909479fb8d78e930398fbdc94289d0a173a09.1781142158.git.tze.yee.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <a4d909479fb8d78e930398fbdc94289d0a173a09.1781142158.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: PH5P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA2PR04MB10279:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7f552e-40b8-4c24-7265-08dece38a909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: dSumntupDYxTWttRsGVw1jS0ZucYq1P7Vk/mpTfpu4nbaTvU2CNM87AdDMOiHpmllftwAQ9ZydOySeo9rkvoD40bX4z8KI4YZnMJm7jKq1JV9nInVUIOebK3MUPw6UOHkvjywXUtndE6DYKv/dHT652yup4Ujhfd33MJyFQN2XOU+JLAFsm+IGM2eDIrWGbdmBreAK+wJqOLFcavw009FV6vQqd7rpx6T3Th/qvpvnofy8K6VnNoh/P3Uwry/e5vZdgBIoZ4MUIl4ezTRUbq09mofEIxXCJy5Vu4mNbU9ERTuttxkPt6yLiEYznwHpZK8SXT2itFOb9IFDv5btr94V5H1SMjLkjHuHy4LwsdPGuWUbIOcdxnXj7HNNYY1BPwTWKigy/kPpJyGLI6vZq7bNxENGdsSDHcwmEY/3RXBdvR4tXVi8wbv5t2cbJYNR65Y9wsj5J2fPVh9M8Zagji99X1TsF1CisqMWJcd0dyaUbUmtVWWzNYgsKnrPdFty0CuLUYochFR30lPHJIsPYfLhgw8wR/QHNQbnLrh4RmHpukmu22jhdoDhz03Uh/66WdqDIYbrG8Z33sYA/bITVHq1KMM7qzK9l72mZSsNLrqSHOKQw8dv+ScUHp17d5vP9J5IJf0JjBNaJZnSkI4FJ/bi2Os21QyTJ7B2KRwgDXifw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6TnoH10rd/pYZLLj13upPONfc7GbpZgCygib5Ub7rHMStQmI/Zbw7vfcxO/i?=
 =?us-ascii?Q?DYbwVWtn9rPQ2gGRVmoMS4qQgotIXJIn/s9qSYHfOyBM7N8jlhKJpNRHzE17?=
 =?us-ascii?Q?ia35aZhPliLN8f9THD2IITTexZqBbtYvaFGOJXzLK5dsrOHMy2xx/x2Dm/yP?=
 =?us-ascii?Q?I3D/4TF0bGwi41jRZQuN4Wv4Qqdno9DwLdo1AKHdk3FGkrOaBjYrz9H5Ift8?=
 =?us-ascii?Q?omhxZo9F82X/sufzOTVTHgDsbYLRpPSgWAai97mAIMBSr9LXLYMLPGkKp0dk?=
 =?us-ascii?Q?Utu5kiS5Sv62cKasqWEh2tjzC9neQsazn7CPzMhVJQL92195YyNGvCwTo64r?=
 =?us-ascii?Q?pntMLsngjyDTZSvF5xScDJ1FavgoGsMiVpqly2P+pi3B+QqW/qoLOvWZNJVx?=
 =?us-ascii?Q?Bzl7tgAzJA8tpbwfmHM3ZMJ7NH3MEjfszIbFbQO9FItyyFTicPESJSyE/LjX?=
 =?us-ascii?Q?hbs7HzWhzw3gr0XNG14er7RZ/0lOhN8leE7pPA09N4bVrigcHtUQlusCPWR+?=
 =?us-ascii?Q?oV+GOeu0GsICRO087Derl5q+iYFnkeMSlVhLx1KOswBG8HONsn4VP+FpITWN?=
 =?us-ascii?Q?WmIZYhKmAG8haMxiIxlTtGtDqDPwpCUPadDmWVGdOXOdjpkv8ieBBsbi8nUK?=
 =?us-ascii?Q?4Y52qIqDF9pV0hiS4icZsIKqepYEcHWnAgN1dBOSsfK75m0995QW5sciGqNY?=
 =?us-ascii?Q?DN8DoH2xQJBbu3aCckDGkaZJyBZK/mnMREQql5PNZ0S4SqVBzGkpJmTNy7bO?=
 =?us-ascii?Q?Qm6gkJf0hZaoqekTumkGiUEsyCDshIKLgVo02Y/Kn5IoSg+y7jruAwEN6ZeF?=
 =?us-ascii?Q?zbRNPCG70vBaPqUMvI6PVsI7IgLnGMlJzSgoEDsSe05PpGJZl1Yr2jCHzIHA?=
 =?us-ascii?Q?30tWzdXyIphLIT4dl+hv6Y86UnvkqNvpk45cVFXpEOGvT+at8l6/c6wY/rX0?=
 =?us-ascii?Q?ToDg+REYqU/S3K43IssuDI2f280Cx+ozoqh+0emHXF6Ip/w79QjoUghHYqlh?=
 =?us-ascii?Q?1AIwtsF+aolH/fCZ4SE/+2r4eEDR+ied4+mLt589nS5pFFtigVo4jmFQTbvu?=
 =?us-ascii?Q?Yt4AMVYZdzBm9CFfsAoSHkiPhklvZ0H1lEnzMf/MsCUaxwTb6OtWCADpW7Fa?=
 =?us-ascii?Q?yjlj2m0JHdCNxnz+pSC8Xn11nWJreQAmV3OLshvZ6Y/+ylifu9Jb7sp8+Zek?=
 =?us-ascii?Q?DKVM0kpPme+oS+uDOA5cSN739XZyz66aH5RnTERM7teTV4Dxti6UfXL2II2N?=
 =?us-ascii?Q?FGhBfNL/vsfN+dknuXmarVYSjWDP0v9EpljyorDCmTbdXlGhTBJRJfDlf8Zn?=
 =?us-ascii?Q?CPPChwfG5uHeRMHzEjPvvF49K8AFZQ5iowvrA4qOMJTw+mBWnyxGG8EDenCg?=
 =?us-ascii?Q?+gKofHQQozHmTXsaR/NaUY6oDDVBAez+XaGTCCgrh4cXFobactLCzbFRVQeI?=
 =?us-ascii?Q?9l1D0e/pudNWmyqtzHvAreIme9gNhjcXW4lhPDqCBF/uA6m0wTfdNUDrKf0M?=
 =?us-ascii?Q?iK/onZqSg5F6FT/CVQU2EylsTXBYBK9pOU7LcIcdfYu2mUyUew44MmpvutiB?=
 =?us-ascii?Q?mf9vxj5UU+4wdriaBCQ/ybQIvofDa6CeGTnnz/DXGF7glwFdnywFja3c8HP0?=
 =?us-ascii?Q?rw/LoJN34oQb1ciXFqPJAV9P8lS+aXf9lsrJ0IPwrOvx58fdYKIUCplyoEIS?=
 =?us-ascii?Q?oFU937MloC4i2KCln+FcksYwJgl7hO2G0vL5iRoDMRVoC2K28pA9fZYMWvw+?=
 =?us-ascii?Q?xNwwN5nYJuWX78R7t5+DNf/tH4CfM37dlXk7d9Tq1OjW8kKYkM6q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7f552e-40b8-4c24-7265-08dece38a909
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 19:26:28.4025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWhfUSSipTm8qLa2QCo60+ec1mNvPnj4WdkPsQze+kOmk8XQBi77FMe9mus+iNXIlQBkPGRgbdz2JlKp989zX5I+/1KESAYY9EUa283fzPZsoyS4f0Z9p4ntPBnM8/Q2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_122633_494453_C8853761 
X-CRM114-Status: GOOD (  20.34  )
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

On Wed, Jun 10, 2026 at 06:54:07PM -0700, tze.yee.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>
> Map DesignWare response-queue status to standard I3C error codes in
> ccc->err:
>
> - RESPONSE_ERROR_IBA_NACK and RESPONSE_ERROR_ADDRESS_NACK -> I3C_ERROR_M2
> - RESPONSE_ERROR_CRC, RESPONSE_ERROR_PARITY, RESPONSE_ERROR_FRAME and
>   RESPONSE_ERROR_TRANSF_ABORT -> I3C_ERROR_M0
>
> Return -EIO for RESPONSE_ERROR_ADDRESS_NACK so bus NACKs are not reported
> as -EINVAL alongside I3C_ERROR_M2, consistent with IBA_NACK handling and
> other I3C master drivers.
>
> The M0 mappings match the generic I/O failures already reported by
> dw_i3c_master_end_xfer_locked() so the core can retry transient bus
> integrity errors on CCC transfers.
>
> Reset ccc->err to I3C_ERROR_UNKNOWN before each transfer.
>
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 31 +++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 06fdf8857b9c..45bde92d0342 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -493,6 +493,7 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
>  			break;
>  		case RESPONSE_ERROR_PARITY:
>  		case RESPONSE_ERROR_IBA_NACK:
> +		case RESPONSE_ERROR_ADDRESS_NACK:
>  		case RESPONSE_ERROR_TRANSF_ABORT:
>  		case RESPONSE_ERROR_CRC:
>  		case RESPONSE_ERROR_FRAME:
> @@ -502,7 +503,6 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
>  			ret = -ENOSPC;
>  			break;
>  		case RESPONSE_ERROR_I2C_W_NACK_ERR:
> -		case RESPONSE_ERROR_ADDRESS_NACK:
>  		default:
>  			ret = -EINVAL;
>  			break;
> @@ -708,12 +708,32 @@ static void dw_i3c_master_bus_cleanup(struct i3c_master_controller *m)
>  	dw_i3c_master_disable(master);
>  }
>
> +static void dw_i3c_ccc_map_err(struct i3c_ccc_cmd *ccc, struct dw_i3c_cmd *cmd)
> +{
> +	switch (cmd->error) {
> +	case RESPONSE_ERROR_IBA_NACK:
> +	case RESPONSE_ERROR_ADDRESS_NACK:
> +		ccc->err = I3C_ERROR_M2;
> +		break;
> +	case RESPONSE_ERROR_CRC:
> +	case RESPONSE_ERROR_PARITY:
> +	case RESPONSE_ERROR_FRAME:
> +	case RESPONSE_ERROR_TRANSF_ABORT:
> +		ccc->err = I3C_ERROR_M0;
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +

generaly this type map function like

enum i3c_error_code dw_i3c_ccc_map_err(int dw_err)
{
	....
}

ccc->err = dw_i3c_ccc_map_err(cmd->error);

Frank
>  static int dw_i3c_ccc_set(struct dw_i3c_master *master,
>  			  struct i3c_ccc_cmd *ccc)
>  {
>  	struct dw_i3c_cmd *cmd;
>  	int ret, pos = 0;
>
> +	ccc->err = I3C_ERROR_UNKNOWN;
> +
>  	if (ccc->id & I3C_CCC_DIRECT) {
>  		pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
>  		if (pos < 0)
> @@ -742,8 +762,8 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
>  		dw_i3c_master_dequeue_xfer(master, xfer);
>
>  	ret = xfer->ret;
> -	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
> -		ccc->err = I3C_ERROR_M2;
> +	cmd = &xfer->cmds[0];
> +	dw_i3c_ccc_map_err(ccc, cmd);
>
>  	return ret;
>  }
> @@ -754,6 +774,8 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>  	u16 req_len;
>  	int ret, pos;
>
> +	ccc->err = I3C_ERROR_UNKNOWN;
> +
>  	pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
>  	if (pos < 0)
>  		return pos;
> @@ -784,10 +806,9 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>
>  	ret = xfer->ret;
>  	cmd = &xfer->cmds[0];
> +	dw_i3c_ccc_map_err(ccc, cmd);
>  	if (!ret)
>  		ccc->dests[0].payload.len = cmd->rx_len;
> -	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
> -		ccc->err = I3C_ERROR_M2;
>
>  	return ret;
>  }
> --
> 2.43.7
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
