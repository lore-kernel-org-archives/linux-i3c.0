Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B22DC982C9
	for <linux-i3c@archiver.kernel.org>; Wed, 16 Sep 2026 19:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvloH09/g1X/6ZFA+8s3lJ61sS+s/kiuBsS95G2qKYw=; b=U2hnkhh3VDQEK7
	d0lfJl+Y5W8jRjyMTTsh8Lf/BIFHegevseAWIs2pXC4q2lFhJVO8OhgLOLcjaTAWOHWa5JSbObBB4
	Ep/4zpPX4ZPz1YvkYtG9R5nzOn2JrgRiNinZdTPOrpMbkPmZRk6qinG1O0Mm88Aub1ESx9UojTu8j
	1zt7sUGvXZtEWNx4CPNv/QL/HkZCuFsZvGRoVrNPLI3uAvEVKp2ib51ZMWzhXIYH5uZRHWpvTohH9
	DBHjudbd+1/mTAcu1V6juM4/ICgWYk6Ku+xcX/N5DWGgJyoRE8VlIP1gRk71/4hHZu+ZpdOxWKoVu
	dYNazqXGS0z1SsUyleLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vka-0000000A3mn-3NMa;
	Wed, 16 Sep 2026 19:57:00 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vkY-0000000A3mS-1Eyn
	for linux-i3c@lists.infradead.org;
	Wed, 16 Sep 2026 19:56:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S55V50Oz4rPusjJIPOJyIJIDNl9yr5LXx9/LSJg2rBpadi388Nc3sUj0d969tR6pdakd3PKZMwghAfaJs3Yh6CERDLyL7JE4ALXwNIHqYDaT8341Ka0yEUI7WQfVAhbigwGznrJK7h/bEx0m48GjRnZzJmB/VN33L7MsfVIuMFSMGkDLH1bXQoUx8Kh4q4tuSIN2VriCbmJHKb2fiPFhlmtfZk510H4XnS13VoBCYHxU4r8TIf1s0b6yPcx4eVM+4bUCl7chLtXHEPICT/PF5Pb5PwgEELvAxv35N1BOUzwE+GWxBOUq7Kyvz+L6xx1gaHDAcnI5nNsSQXX/XQJVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLfiDBJSsjgR89r20q8F1fzBtxo5uAkYAqJ43L7vZ5c=;
 b=UYDQk3mjyaO+SXvAt47Rwk6KK3OWMV+rAGQJYJw/DGph+8ORl/r/+KTIdH86jpm1GYYT/1Cwv6LvbZfoY0HqloDWem3RihRvXNJYS5ZFLo5njmzJRrO0jnWy5RsYq8WMT3q+/vqC7Ha8mXdGeBLaE/IqcvJYagptW5BtUt7n6jhCkO/Ji1Pc5oiSxjIgEzCej0a8jrXNaYYDhwkeM3Nh98QZHpruoZzjIFLfk/3FB8uk8AWV2oGwZccodQ2PQoP3sZaAz9csE6Z634OwJIPP1waAqOvaxkCP3fWa/CxhlZzwpKhVVONQXqM0giKICGcXOW5E2Or2s0QR1qKluAQ65g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLfiDBJSsjgR89r20q8F1fzBtxo5uAkYAqJ43L7vZ5c=;
 b=Zqkk/akV6hFZjXzGIPKBf2lItCQvTOcjxo6lIxoKCP8uX9o4WsZTEmexbYbp55GX39KSGXKBvhLzpyP+53MWVjKOjswEevG0H5cJcTfrp33KsKart39LR4hrj8AOlSlcjzYUlaqfvHriz3hAZXIQqi+IXgmTKaRYtmLg+42jNJW7DV4SSUDdTtNkxNVbeylIa1wRbRQkXnbOuQ9ZDB9bqHzzPs3CAVX9VrMOW91Ld6Zyr1EZIzd0YYmk8hT47CCr3jCMHyszOZyUUi506QMR7YAOAtacSLf5luhWmm07llelcsim85xAdu8E0/swLPlmpVXTDDCrBooEbjsnU1ckjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB333174.eurprd04.prod.outlook.com (2603:10a6:102:54f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 19:56:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 19:56:51 +0000
Date: Wed, 16 Sep 2026 15:56:44 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Frank.Li@nxp.com, alexandre.belloni@bootlin.com, arnd@arndb.de,
	bbrezillon@kernel.org, gregkh@linuxfoundation.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] i3c: master: Fix of_node reference leak in
 of_i3c_master_add_i2c_boardinfo()
Message-ID: <aqr0fHT3EcOlExAj@lizhi-Precision-Tower-5810>
References: <20260916160654.2081795-1-vulab@iscas.ac.cn>
Content-Disposition: inline
In-Reply-To: <20260916160654.2081795-1-vulab@iscas.ac.cn>
X-ClientProxiedBy: CY8PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:930:4b::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB333174:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8100dc-5976-4e36-30f8-08df142ca68e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|11063799006|56012099006|5023799004|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: u1Gt5D+8HWRIMLOOMH9oGFoqQvX2FxZnYABWsLAmD6gVTwwlvr2a2bRfAOs4ksF5f8ExEYRjiWS+zSbrIj4hTn6uXknFwtp0txbuQ/B4RYtzog9Ce8v/24TRG3kxbhhfZNI6P+ltKfNpVgDsrBRD+Un9F5BdbGFo/NSKLh0VUP1WkfUp6SmC1jt8EyKusdUNFl8fDSGHtETLWYx0hgZVuXURQeJv6KnRaniHJbFkDqJ6XeXIGLNRdwmGAuTM58rtp9/u+XfGglbeUzyA5qggotxEUoMiLf3hzPt7uKml1Pdx125zJA8WgHaW1WDnOfMBUawjE3cVXQ0tOUdSNr3HNHpLX0fLEmvpUnIhckuQf7srW5pbWxPRr4Nv99mGtwhEcwvOLARhFyhkgTGrOZqK5A8x4SxHFtdlpJNkrKz6JKX0xqJeA74yWMbiihgxhtc0YRgaPkeZ5qx28cc5LnfHiI24KW85wSLkNucupoRSpY275xwVUU6Nee7G9WEZk8V014Pti9zJAmBr9MFy9hHilvCvrFoMxpS43JpUGKl0ZUdv4EMVgggeP7RSSGHZN+gdODP5d4xZKZ0iYQnaP6BWTjcGerzqP1M1XuASiY5eThmlUs8ZlmSDSle6iaOVAUFtFq0PYFNTVNw/S0mfqLknVwHTvDCCxSDGYzG2O1CTwx4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(5023799004)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DfwLOhjePDtGFWpSkIk/xF1a/Ev23YBEfPkMPaxjM85ypz4BdW61qS1lP4b9?=
 =?us-ascii?Q?hdjFs49O+tRoRS7kqClSD5rXDw1CQ5QhT48qhrWWPjcxaO3Gt3hNEJwjOH8k?=
 =?us-ascii?Q?7BuD3/woTClh1o0w0JDTRBuxoGl/DeSqp+1JmqFPjdIpKgXwdgaFNt74h1LP?=
 =?us-ascii?Q?AM8vGCKWn6k9r/Fmjbo3xzbcR67yrsQ/YZ+Tmena74/r4ttZzqj3T243Jxqw?=
 =?us-ascii?Q?sM6zaDoJ/hNPIuXl8syce0D1b2rYq1V6VgNtlYf7h2F4QIGiJxKuy0Y7F5l7?=
 =?us-ascii?Q?uLaxsTsAXf9Jw+LmMX9fmn5oMftfXzJitlhL7PAuTPeW8oxKQZ9aYwaJb1sz?=
 =?us-ascii?Q?N1bB1FQ3+ssyrzyeD6Xw2HbWbAOwxGoQniStanjD1DjK497gNdMa/eJOBKWM?=
 =?us-ascii?Q?W2dEXISGD7d4CPAAWHwiCzNJrrQVwPvJsbs4NvCajzVF53H01Nir/queCU1d?=
 =?us-ascii?Q?VM2pOKSImgtgUqn1azSwGK9HS2WT70dWMfZ+MroRWTEkNXgtSHPIp0bMimq/?=
 =?us-ascii?Q?F9yG0KxxAI+Gh1Ed2IVG8QPVX7Ki5EswVOQyyDyJdGyTh70I36i04FFVuphI?=
 =?us-ascii?Q?yst7KgBjnHk+OKCERaui3WqWhKIeRFEUEdnLydlrQNofXCbVxsbjLSlUMt6T?=
 =?us-ascii?Q?f6W4HVC9tUBD5oInA2qelRZZxdOao6vy68UXHaSI4u/k7XuPhsw1ZQbD2D6a?=
 =?us-ascii?Q?CxmCRsDPZsuahIyYmL9dmnUnF1RWaUQcqK7HKvUqRmYW7KFPYZj0IThstLVH?=
 =?us-ascii?Q?uhaDcuaUmrAr9MKsUzHNDo07sP7W2j/DGYRN3wtzAJ+pJvAtmAUNRvlmS40I?=
 =?us-ascii?Q?ZeMXx+0wiDUIOxx9aSdeK3CrRDeJwRk6uuvHPcYAp9sZJs71QiPFRTZC5vlu?=
 =?us-ascii?Q?TZYEFtVhx/zL2cbLM6vG4QoiSsAvE9/K02EjeCeG669voHyvlbZZecwHLyaH?=
 =?us-ascii?Q?W3smRCY/yLuxU+wOCtjDJgQSDM+7IhTUeMVJWXyDFCGoOGKW4sjPgrqo5oc5?=
 =?us-ascii?Q?Rl1m1/aOM2K8SdXDWmuaHjGGhM/t+jIQmtVJb4LN92enAjZOcXzz3zfJ4TUO?=
 =?us-ascii?Q?dsAkSWztViM4F3xD1X+ccsJbr+9pMiC/DU0TYWGDaQrlUtv1b12dbIEznYvy?=
 =?us-ascii?Q?+ihghUEX3V/RtmXC7lq4F/pl1tVE7xp18v9ZNkmAbFHd2B05ZfzxTIBK8MPn?=
 =?us-ascii?Q?IosIbBdAjg8KzvosXuxjJOdoWngSEE4XfaxKmynDpuqoQ7jv3oI3QwNIaubE?=
 =?us-ascii?Q?BzOtvn16yobWaLRbY20hAWUt6ZhbF1SoYgqgMsFEzSppkzXJ/WEhVSOMywZ7?=
 =?us-ascii?Q?nEr/Vplg+pTW4LqkruzXitnRmHlcbxo/kZeIZ91eLSGfh36wIdZBYYJC0cpg?=
 =?us-ascii?Q?QxKoddtCYJJ52+NMrnnuPB3DYDeJEM1LJDkgmqzYvPBB6/Xvz6iprnKJoRrq?=
 =?us-ascii?Q?QfC6tCsEnTi6n6xyDQ32UGtBARB4Ouvvcpr+AwSbBrqbAe1F1G2CPohovdM/?=
 =?us-ascii?Q?WjiR2KOwfp1mvVdEQFVYGg1gbj103QfLrHBac/Nm9AJo0nTn+60LA5MM4vCp?=
 =?us-ascii?Q?qJivFX7k5sVgJxQZjeFaNF45BD5ksr8rABzv+D36rKK/wJ7KQHizPRTCEX8Y?=
 =?us-ascii?Q?wNmSeGrvjacVNAh6ES3s/LJ0+kcs1+MKt3j4cco6EAlrLxE8GrEcZRVxS5wl?=
 =?us-ascii?Q?eZvB+YjD1NNsafmmW6NpR3yncYcGpIimAad66m6/gGXhZ5yOlx5+kwcTcC/P?=
 =?us-ascii?Q?+jR1NUgRDBn+rkTsZ0xf4QdhQ3Y6VeY3LH3hTKouafVhDYvqSwts?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8100dc-5976-4e36-30f8-08df142ca68e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 19:56:51.8796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zT1BKAHg/lF9q6rVOLBZi4DuMpvI6wlJAZx8rk1Yl9oJ08VzffjnvTumTOaViWjICmOnB9aWFdSZ5whftHyphprOq45erv4DDMbICzjLIeA3R35JguP8VasAKnLK0frV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB333174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_125658_334696_E03E6D00 
X-CRM114-Status: GOOD (  18.24  )
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

On Wed, Sep 16, 2026 at 04:06:54PM +0000, Wentao Liang wrote:
> of_i2c_get_board_info() stores the device node in the board info's fwnode
> without taking a reference, so the board info relies on the trailing
> of_node_get() to keep the node alive. Nothing ever drops that reference:
> the board info is devres-allocated and has no release callback.
>
> Register the reference as a device-managed action of the I3C master so it
> is released on registration failure and on controller teardown.
>
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/i3c/master.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 23f490a00591..30b3822c530c 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2407,6 +2407,11 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
>
>  #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
>
> +static void of_i3c_master_put_node(void *data)
> +{
> +	of_node_put(data);
> +}
> +
>  static int
>  of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  				struct device_node *node, u32 *reg)

which code base do you use, now use of_i2c_get_board_info()

Frank
> @@ -2437,9 +2442,9 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	boardinfo->lvr = reg[2];
>
>  	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
> -	of_node_get(node);
>
> -	return 0;
> +	return devm_add_action_or_reset(dev, of_i3c_master_put_node,
> +					of_node_get(node));
>  }
>
>  static int
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
