Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2BAFB5173
	for <linux-i3c@archiver.kernel.org>; Tue,  7 Apr 2026 02:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3UckzR3l16ngdf5JlgfQzutRcpDAcnWbnh9nYOGpBoA=; b=3qFRSKT8uhq0Yd
	XYpmb7RBFzst8uVVCtqrXB+y5jWex4ESgCvOw19QJWygsMg7hnHva+Yi2uJg/BtfPnLp5DXBe08aH
	1iGtHeToB8cS5Lc3Ljv5I8axuP2FyugBtZFpV8zaSoUknWX3M/UAPbHPqXphak64g/gh8IDRB/av9
	G3mFKs+ZczwFsimI9am10fOnExdW47rr+oOHJpwxZrHo/x9oDVv1DPSpmgG//Dw+CPcxWBM5gEeN0
	adbHrM7syzr22hQONWMu4F7H26OXjbF/R85wA0pX1q1aJFFzu5mt/SjyRFVeoBXoBsZGwkTiMSJvV
	JlNEii+nr3hdbsFRmTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vmO-00000005jeO-3Eet;
	Tue, 07 Apr 2026 02:03:00 +0000
Received: from mail-norwayeastazon11013045.outbound.protection.outlook.com ([40.107.159.45] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vmL-00000005jdu-3vpm
	for linux-i3c@lists.infradead.org;
	Tue, 07 Apr 2026 02:02:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqZoI6AjTbJtgabjH1v5bcYtA0WRYy5MVqWIJV32dzsIM9MpD20xUo717o6LiVROvyvazjMZqKV5n95mDhNkKqm9LMUdoJw486+/vytIsZouJ8GFvZylYl5wTN0ZLu8NKvn9YS7LylNiVwQiRu/l1xZwuEu4dRIHcHC70uwVmBcjKPwBSW4oqQE6UCPhHA3NSQO+WghS6SLewTGFJW7jEPRduDdzGeWtoctDRgtV9JrhiL3OaYdvN2nSmyyidK52iLe1HFUV2YOZdvJHjCZ2+UXd3gAxTSqp1M8noO/0Kd0r/AZbTdgGIHd4JkK8RUhQwGv+cr6RwQFZVKG/MlR1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnKOt345qTRNpbmDHSr5rKN3wJraOXGngWRz/mfTyME=;
 b=rh+d9n4Ultxtq6KBiH1f8eBH12vXYsp4Q3mlIACioGAtk0kO8n2eRZrZue7KDSP2u7YTIvj3HvlFE4o9EdA/S+Wxno1QDV001KbiYjxXZTsk1q47zfPjRbLyBHUmmPQ+QlLL+jnQY7RtjtEIWW6gM/o+LvctTpqwtpgLUGAEsnBCBP1MM8wI/sH+AmlHuiE+XWkvq4m9Ys1L8UVNvUM2IxzVfuzW6kO+yyGf5OcOPfD/SC3z8SrUn5CiXaqRhAyQ0Ab16q3jixsWsL48jhkDnMPLkmx6u2jz70l+5cuiMbAeMy6VBBZn87cvnp42v4fvHdPIL0VptXwpvM4zqTH9IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnKOt345qTRNpbmDHSr5rKN3wJraOXGngWRz/mfTyME=;
 b=kC0OVl8I5j+MjtRXv2UpA/ceQgV+x+yC7cBI2QbtFGvGV93nSvvjQSvDhmwcVp0x+CPOScbe5YQ0U8gggimPd7q3/M6Qge0RfysW0tEe/CDR9TmWpNGuwDaFIDzc61YMhgDVPvdoL+qVQMil7QY64KW1r2K20ne315uuSCqlojOSPJ3DpAqMcP1LGh6mKWeADrfL/altlT5KnqSyADMMA0OdwTnOSYU5f5nZXITdporvYIg+oFx8DoFBwg2PY8DpWqCaQXlsh672cIDxUhEuUpe+IORsuyiMZLIhYXTOWcdmbD93Yf2XKvmqOmHn+cZ9B7EvwLGfBdpftMLw7x0WrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA2PR04MB10085.eurprd04.prod.outlook.com (2603:10a6:102:3ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 02:02:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 02:02:44 +0000
Date: Mon, 6 Apr 2026 22:02:38 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i3c: master: renesas: Use __free(kfree) for xfer
 cleanup in renesas_i3c_send_ccc_cmd()
Message-ID: <adRlvgkSDyI9xVgV@lizhi-Precision-Tower-5810>
References: <20260406-renesas-v3-0-4b724d7708f4@gmail.com>
 <20260406-renesas-v3-2-4b724d7708f4@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260406-renesas-v3-2-4b724d7708f4@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA2PR04MB10085:EE_
X-MS-Office365-Filtering-Correlation-Id: 3903c3b6-06d8-42a2-96ac-08de9449c25f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6u47lG4p5mLxwml9Uwl8g6vDsRIp/TTRDlpVvXslloYRYY5W3VIy90MmbhKThrCPgbogeb1kkMr9+iUwcU81QdEdCVMq2CN2qfltiHqkH9TCgfN5a9B6bABIA/6J4HGfUAO6K9G1N4l7sU8YMjkrRxIkZBcZF3lvrb3Zw8b/b/nCqXTObG/UlBrjHbo10zvN9eC/Sq5ik2VdFdw9ZEFTaNxx+6/nMQIAu6ZoSgHeucyKd7jPGENSTwbnoXOVB2JxdyOywFVmW4jsuXbWhPOdgOgCDlWLUJ82MhbNR/nDzpoo1CfxMZx40cFCcdWj9SsgOjvQOCMVyuEPPtQqTUiKTapKeVJqYvM2oglVXVlqPx1oTfQhZ76/EzeDQgPh0aiJqUylQI1r3DNKH0Ef7U2wITwEwuSCfTtVDBbvSNjA9abg/sa4A2/UEjLnUWIM1tBfVZINkKHEktggoruw3IjrBDpi4Dot4texT2SEoi1fUzfv0tviz/Q9mpxnu7LwA2lwVf6gMzy92WZUxHRw0zcwqDsjVueO4fQP7fICf2Rv4ozvOFEyFPhhdUda8x8HZfNQEOdqLXt8A6w6edQ2xN58Cz2mR1mf9c9kdOHjAqWrW0uhN5RPTh7Y6yXNY9UiXtTv0GwkwfUOikPze/P6eQbXyuKXFfxl/Q116WiLSWV/8R0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gprLxCCxH4uMTKSDub0v3bvpFm0NijZvMpItdXcNJuwL1sKk7Fx0IGzfHPsH?=
 =?us-ascii?Q?6AG+Z9puj0SafEZeoKEtWL1IGQtHRyvYasZLVBrLHXh2oHAHcf1w4Rb18QY5?=
 =?us-ascii?Q?UYJt+mQ+a/B1pnXEiepdyE074lUzDjESltgdsiIb0c/tW5Os6r0k3F9Y31Sr?=
 =?us-ascii?Q?xw/3p7QcNoKpdbS2U0P/ctBiYQ/ImoGfD9xQE0wEa6/72dXiL1B4b6J9cDbi?=
 =?us-ascii?Q?I/8SOeWY7IMy2X4JRk4O87FIrE2ArtVHGYT7iAfSkmOrEGpWO8062wzN2v3t?=
 =?us-ascii?Q?Kx63Ig3c7mco6MBs/Lzf+zOqw0G5x1Sq4VAY3KVrz/hAuTVX/GvzasT8frZT?=
 =?us-ascii?Q?o5XUWQFrvPaDmr1EW4REh8/yKZaWiLWB1kB/BkumfywWbA34U5GrpgP52klZ?=
 =?us-ascii?Q?Y77eVshnU0tjMrq0uHTqPagpEHzCdAerI9Y910he8d/1S2a2IN7grGe300Tu?=
 =?us-ascii?Q?UVcvHGKLzKQPuhBi/RkuAJlO2t0YF618685lGZFtaCXl/r22+vDL8FL2sVeR?=
 =?us-ascii?Q?QHo2qqpUSKYWrkdKYRpKE48ZuEwegB3YKRAV2egI+l39uTUCh5d8/vkPYNMK?=
 =?us-ascii?Q?1WM8eRu5LUL+p70kdBldTxpiSX4FavY+JUPc2uWc54eS5r662FvnTyX67oT2?=
 =?us-ascii?Q?tYyfnpl7o0xOyWJXPChFJfNDDAOiYuITUDH5pvBYmspRb7nJtOM0NfQI2ySM?=
 =?us-ascii?Q?pm5/ZJI1n3Lpmj10ALqEmVbRdc6lPckMHbXgUyjSr5wIx2pwUWA/rET87xfS?=
 =?us-ascii?Q?qhMC9qwBI4YOV23pWSdy2V5CwQLvKSzmj8ZH2sRVn+Z2/iU19ww3MSKtGvi3?=
 =?us-ascii?Q?oPc07ti453MEMlATzuq/WLz53jFgqe3MdQgVWfIAAL0d/Sb2SVsY+VDZxEYA?=
 =?us-ascii?Q?x6YcTAOFlbFNu5qB+W5M8D+83YWizVpkKw0ZLKrg/krQ6phKGSjUjWPI94gI?=
 =?us-ascii?Q?bFLrKiJoGuoZPTU3AMbNaNof4oPbl2Qb66hrBMTKLiQllWBcR9Gv1jL45j2o?=
 =?us-ascii?Q?CsU9Vp/i1J5nGIPkwja7CSB2Xv2kyMlb/DgWM2MLEmK6TJBNfI84P5ql+H88?=
 =?us-ascii?Q?Eb8OvwkOr/3u4Jfh8KKO77BUgk0xeyM0zuA11/28xqQZvm1qwAO3UcMd9FI3?=
 =?us-ascii?Q?4De4x8nyVYTeKgzxbn3t2ywX9obW6yF0d0Mr8L5pBTiVqotsy19I0XMaOEGb?=
 =?us-ascii?Q?oVLnu1SE12APgJl0TMyRUpHVsCDiqyhHBM6odpDBoVY2YoDwLgJgbLxhgvh5?=
 =?us-ascii?Q?v0qh/UyrYJSHa3kfqpHp+JlkpttlSdCvjhThrlD8GkPvKrDY/fyrL+O0Rvem?=
 =?us-ascii?Q?rJ23oaJel4ra0i0cLimhOY4jHKX6vfr66QvqLC0k3y9G9gQdFqzv8/Jid6NL?=
 =?us-ascii?Q?wjQm4Sch+DOPSaOFXAD0109jNZau9J9gD/KLlil5s5Nzf+/oOxaSoNcaW/sg?=
 =?us-ascii?Q?AvcEAUOAXoMxfjFhSnUTGyu01L+YWVK0ENPW0TzxbvrwTkxMZjaxtqfg6rtq?=
 =?us-ascii?Q?NOc5Q2RQWamWaIhoyOhVhQhZykC32oHkpY+4+8xss2lJRxuJtHg41iLp7Jch?=
 =?us-ascii?Q?yaFjiHgI3K/OB4wlNMLqt9exUjkaEmlccMvx2BZVBSaJfrX35z4Nro3Jd0Vj?=
 =?us-ascii?Q?IKzSVTCOuoqXVOwdmJGoiH6f0sMClEzDXr11rAwn2rceob+SMx887HdRNE6N?=
 =?us-ascii?Q?sqitPifxn9hcgfXov6DRLlsXVk/vspCSSzDP0nwofQO/QQok?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3903c3b6-06d8-42a2-96ac-08de9449c25f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 02:02:44.9197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NXbmN5eKLDHSduKpbJR8gEI/keIW3WVIw27rBLDk8hyEuWADBOQ2RJiDWzV8/jhIOv/21KqRE53IRgCiXBwQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_190257_992118_B0D33AC2 
X-CRM114-Status: GOOD (  17.16  )
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

On Mon, Apr 06, 2026 at 08:43:17PM +0800, Felix Gu wrote:
> Use __free(kfree) for automatic cleanup, matching the pattern already
> used in other functions in this driver.
>
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master/renesas-i3c.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index a8a9e89a9710..f39c449922ca 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -748,7 +748,6 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
>  					   struct i3c_ccc_cmd *ccc)
>  {
>  	struct renesas_i3c *i3c = to_renesas_i3c(m);
> -	struct renesas_i3c_xfer *xfer;
>  	struct renesas_i3c_cmd *cmd;
>  	int ret, pos = 0;
>
> @@ -758,7 +757,7 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
>  			return pos;
>  	}
>
> -	xfer = renesas_i3c_alloc_xfer(i3c, 1);
> +	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
>  	if (!xfer)
>  		return -ENOMEM;
>
> @@ -807,8 +806,6 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
>  	if (ret)
>  		ccc->err = I3C_ERROR_M2;
>
> -	kfree(xfer);
> -
>  	return ret;
>  }
>
>
> --
> 2.43.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
