Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD55AE9D82E
	for <linux-i3c@archiver.kernel.org>; Mon,  6 Apr 2026 03:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jopyGNBWOmWVSz7cGLs24534iVGEl86FjyYLSztNeg4=; b=eVwOWao/XHWegy
	ITI6CQUgUSHf53DZOG7t1E4rvozhGR0O8LJslW3xNtEIivpSE2v+5X4eebmAvRo5CN83XVdsFlTSm
	aZ9ZhXNysnzfVu1IN11E7GchH9y9yHfSZBsWyFP45Exp1+hH4Oe3dWYbckG2PVqblaj1amDl3OdOs
	Iy4gH1hu7sgnkW/jqL9HJ3U22kkcn1s9/i1kyKDMZdYJw0wMZBkpZUrEd+ixXHuGCbfNIUJ/q1cct
	nCK5t+AU4HQlRxSHBcEeOR18/vZ4wX9OlmFri43MSBsBIy2taYb41tgANwvwxbk95mJxmZkcL4qEm
	0tffDGFXbyPjuNALpUcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9aFg-00000004ixN-0t7R;
	Mon, 06 Apr 2026 03:03:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9aFd-00000004ixH-47ye
	for linux-i3c@bombadil.infradead.org;
	Mon, 06 Apr 2026 03:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EWdmOkwTFSvtMuTGewgvIY/OKfY5yteGvJK8UDVOiC4=; b=JMbg9BnHGKyK0M2gP2aAAjJIui
	akoJoxTHsIAWRIy7uNjoGxz627bVIxLtdbGXtze2SDEXDYwYa5EtmV5OSaGPgC4AJz/PaWfl2EmwP
	JQUV8Cvjdzcjt5FlCIzHbE6RQrmKzQEa4XPGE/SafeodbtcOE9OmYik6oIE8WsZNfeGLRIrqjNJju
	kyWgro4NZa+hi9qsfe5Fy9fVzbndEQRa4fwGMZnDIUnZQ7jGgAlimDE3Ow8A+q6BZlSSiK30kvSSp
	0DediYQ2HKf2sSiexbSKwvy0i/L0xCBlttWfPFEsxj/39y/O15t6F2d1ORz0rLskoA68D2V7BTE9e
	OQOEAQ9A==;
Received: from mail-westeuropeazon11011024.outbound.protection.outlook.com ([52.101.70.24] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9aFY-00000006M4I-0b5k
	for linux-i3c@lists.infradead.org;
	Mon, 06 Apr 2026 03:03:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJmQroImfdwpoLGaEAtFtIq0VbKDCpxQ16+36XvZfVtTVwnnzKum0eRiVf4VTm6dZ3xoxqFv+o5hhZZl7sjfy6EzO1gPeooKTNH9QGnhOQAugrINQT9MFGIt/qrktJwUaKKP0IjDn0V5W2HvTVsw5CM0PZyTY8Pu1zlK7PIbp3oTLLI+JwjGKd296DmaCfeVEHMFk1JArI0MhGNNA43E9b6pOklaNCfZ62G77dEYnugurW7E/wxIMoqcWeKuA7EDol2q4X05Irq8QxAoGkqUoar3cXyib4xD5pdyBdCv+smRgWt/XS4whFwSGFA/TQA+SAw2+TtVjqetXLMmpI+m5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWdmOkwTFSvtMuTGewgvIY/OKfY5yteGvJK8UDVOiC4=;
 b=k8BWd2gU5MeTWCy/0hGQJoyk1QRl9Al59LQmgwDXRCb+pvlFJ7fo1xNso186glqLEncEqlCB8APdd4hcDgYpUk+3lQmPX5uH6M5WeVgMSmpoZpew2JTG/Z8TSCLApLTL9EJkett4vRFYSl/w9bIOsHHvdSsKebeg4TUMLpZquG4N+uKk34M+FTcW5qDjs+QWT8Ifn7qfKtL9N7zKjx2kbam/hGnsmDfz6EpryWrwYBuWaf9LJ/SDVcmk/3jqiGvFhH+F+VJaSqJtoMDfR6/M+FTk3K5BD4fFmKoRBdyoRkWgQbKckwuFCkQVWQGHlJLCbf+8YxZVoa+dQVmtM6RSQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWdmOkwTFSvtMuTGewgvIY/OKfY5yteGvJK8UDVOiC4=;
 b=Qjx260r6QGw/GuUP4QZLCytDXzE+zJhh42dIfFZtQouq7c58hELuSn9tkqDpwodZEdhmS837M+iAgIKbFtVc6b2tKcOwfdl75jxZDVcf9/zuiorz8Eq5KL5dknTRmLk9iUZsctvDvycsPC3BJz/igJKHOiKJQpX5CnPVtAS/moUmkre273Pi8a093vo1qWBb5MJJEsIuG1ebwzG/qc3xHmOhX/7tQvs2o2ATxOVy9d/JGvhSUJNqLxRC++Ka0/MNCWsuX5N+UsFmJP/V4Qyy32X4pGSCzj4M9lrX3Yb3l4U5ibjxWzibF4PuP5XCQaK0EaQidLo0yaGbbGQsU0zc5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6791.eurprd04.prod.outlook.com (2603:10a6:20b:103::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 03:03:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 03:03:35 +0000
Date: Sun, 5 Apr 2026 23:03:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i3c: dw: Simplify xfer cleanup with __free(kfree)
Message-ID: <adMigffIK6Fe-A2Z@lizhi-Precision-Tower-5810>
References: <20260404-dw-i3c-2-v3-0-8f7d146549c1@gmail.com>
 <20260404-dw-i3c-2-v3-2-8f7d146549c1@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260404-dw-i3c-2-v3-2-8f7d146549c1@gmail.com>
X-ClientProxiedBy: PH8PR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b291f5-9fef-4265-408c-08de938917de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YcdIEqTfHblwH1d+FT96gf8s61lkAZryaEOUs5NfmWmAxaYK9fUK6bj0F0vyIGrzv0pVr8T5UXbAeAgu1jJlGLoGRDrHkhqLhFJan5bodeG8DS+0VXzcHSjH8W+lNKQg8rpejV4aDYJHcDJSfNbtfl022GV69T0J91gOqDZ3XwwybqtttO/AgN2l4cpDadySBAcWypeWVvUCvalagWkSoOz2D4QD5XsWYeZMxr7dhzd6Ab4uAhIxYSKwBXatEcC+7Pm21EczH4V2EnJK3me4G60vdNaTS0EE5YWbES8R5vGQjuQj24m57K3SWvzFjO7d5oSA9Kd9wuIT3GOf7c3iJ+aFzZrsvxqndso6g7i+zzDW/j7mFvyhpzAWM0f2NdCIXpshXwAN+jvBZ7yaLDCBSji01pNcdft+3ULh8OF99WJ0k9pB1pokI3ps8qSBKzRotznT4SWjknp4UmZWI34HABkYE/0WEIujvoL+qwSq3McCF5VV8uF+5VHBNOotaFjfTTnIMiyTgZKhBNUkye8S3ww1c0SKwkLJ0GR1i2QC6ZlrD88xxYvtPDU0ifBItu1wYl4f9PG9F56xWPnJMVGrArSK63amH9nCF0AngsaFZx54UzrJpLifxr9PFEilShgBLxL3o9WjbpqxgNVobRcMfYuIDDaRUSSkBHik3xCLlDRooZbL0A+Nlly0374/W8DBPoa1NBOOd+zMN8QLnWxtY/SejB9o1konHgnqqgquRmUK6QuGecR3t2zSWaJhw4Ercm0uAJuVkuvF95VXRoNxmAOLWRN29sqS106iNABiUzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dmge8PbEca67XhMV+NjLyLR630GnCCsO4AcZQrvz+31dYUlsLeKERn7Ss+do?=
 =?us-ascii?Q?Sa4A2Ec0D0FP2GJUNhRZFMvq2EpZQgIcVb7jGhruGCoOLu55XRxadRolLvkn?=
 =?us-ascii?Q?OTDbDfCklNf+Nq4oH3jkA04Z82B0p+rRY3VMr8ShZCwzdSXYc9h3JxrQoEow?=
 =?us-ascii?Q?2N7tc1icn2kt4zfVWoNV28DKfm3t/zaLel5dTM3BnhJkS8oJ5NgGrg0mrJXb?=
 =?us-ascii?Q?ViGc5zdAbh/VxzdZybI8LeD5QGy29iFlCVoQ3ef1bydR4HtDWT+DzwL4qMKW?=
 =?us-ascii?Q?l5NgGDcuEjnd7ubtYeBpA94bIccV7p/pGmqzqXkRIWgLQ+yFqAkPcdXAiN0F?=
 =?us-ascii?Q?ZoXoJjKYdS4N31fr9sHxqGL/jbsHpyyYm4hHo6L/xU2y8drYdFpQ4S7Ja1F7?=
 =?us-ascii?Q?Ir+D5RsQHldTGFTJoxz2tCIWurG/UkAl4p7XzavlougGbu+ZlLvMWu8RkbFV?=
 =?us-ascii?Q?gLkuvKIItSSPglv8l4njO7OpTXA+QDLSm/sL5sSFF7/A50/e98tGqxh2qgu7?=
 =?us-ascii?Q?R7gBrau2tNsYZAey8Agg8UrwFJ+Qtm0U2hjada6tSg5WF5dN9fy1a+REaDb5?=
 =?us-ascii?Q?tnGbMYYkA9jYUyrfBpjFeBNiinLZENGB73lLsK4N5p2H89A9hTxsYudKc3+g?=
 =?us-ascii?Q?hH7bIp+OFOpZZicqJkQ90G2rC0wH4GpEfIany2ciObnft7l/MdDE47JZwyhJ?=
 =?us-ascii?Q?EHao/M5LE1XLgNIAYIWK7WcF48pxBqAxUyIMKxYuHbZB6AfNawuLkB2nwfnn?=
 =?us-ascii?Q?VGVh1wHL08fu6653pTobAA91iqYtZ6LRRsselbKDpJE/FlSjxpgZPE16dUiu?=
 =?us-ascii?Q?sJfsivvzuZa/gZoEA6EUOdGNnZ/TA4u4Kmvflt7wwWYi9L8NscuamKeHotJ7?=
 =?us-ascii?Q?G6MuMIeOyu921V6Bi2q3OoWfJ2J8Q6FZMGCa+NTrsCOJc3MrKDAdfolGdkOQ?=
 =?us-ascii?Q?SXedXODgXYaezhUdBspbuUqr8Py0sbOLEJ9xwKC5D2KxFdVnCT3TA5xSozJt?=
 =?us-ascii?Q?Eszu5vvmHr+xlV0qAUP1Qr+KY55sJpweZMxMDzcdDM2Y7efdW5dhPHNicA+u?=
 =?us-ascii?Q?ytm/n/Omrx8Eb0etDrDlesZbIl8YeY/6KccA074B9qxG7dPEaMpocjkzQCd5?=
 =?us-ascii?Q?80Ty6BClH6etPbI/lVTsNJ3SaQhUfsIzaLEPNxn065eGzQac/j55y2cjollt?=
 =?us-ascii?Q?d+/DMZHBjU2dCFeZ5j9uINDJqyWuSodueBZDy/rTPC5R/8YngvrVZ5jrXFiF?=
 =?us-ascii?Q?V2jQxK8Lemo0p7Us23eJ6aeTQFRT9QwOZ9tgg1wnA/TKK5vNaP6WLkQnJN0T?=
 =?us-ascii?Q?Y1ibZ8x0Jx5yDRcUgAdq4JmeSegd5ZQd70lu2XHyYF/0vMdBV0NiEfSBib2P?=
 =?us-ascii?Q?A1SzAaHC88tRBXPHarc0Z9/zhInykUVElfky7BKEbwkRKtKR+y103nikpZ3o?=
 =?us-ascii?Q?BkreaINMCM18FsaI1yHSB49JHypY7vdZTkHMoceyL94yznOc+nqyh+bYc7ue?=
 =?us-ascii?Q?rsUgZw5ey0Zbw2tpj52t2EcNbdb1p62G6RKGo9WDiA3CGJQgj1+ZFsQVh60L?=
 =?us-ascii?Q?6wRDuOyRPh1eUBPF9cMkkPPqabp2DAjZTP6chVsCS4Z8GkUhRDiYE/HPtWAI?=
 =?us-ascii?Q?zWGeaOCeX4ACijtucmTAFnUlufV7AclQ9qQ73C8WHmI86/rUM3yV5MWcakLx?=
 =?us-ascii?Q?MtpmfNbjsQXv1Oo35aqKf+PrzV51ClSP5lp9iVTtVLAfqRaq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b291f5-9fef-4265-408c-08de938917de
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 03:03:35.5040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPpeNykWx9DBIpu4LiWeEo3Ff+ydfLViOY0JA9z8XEbrZgpUk6D14LB+i/AdTZz7noGLSegD7f+rpjsPBt0dTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6791
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_040342_679234_2F35B463 
X-CRM114-Status: GOOD (  18.90  )
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

On Sat, Apr 04, 2026 at 06:32:31PM +0800, Felix Gu wrote:
> Convert dw-i3c-master to use __free(kfree) guards for struct dw_i3c_xfer
> allocations. This frees xfer objects automatically on scope exit, and
> removes the now-unused dw_i3c_master_free_xfer() helper.
>
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 33 +++++++--------------------------
>  1 file changed, 7 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 2e31228b3809..41ef37115f8b 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -394,11 +394,6 @@ dw_i3c_master_alloc_xfer(struct dw_i3c_master *master, unsigned int ncmds)
>  	return xfer;
>  }
>
> -static void dw_i3c_master_free_xfer(struct dw_i3c_xfer *xfer)
> -{
> -	kfree(xfer);
> -}
> -
>  static void dw_i3c_master_start_xfer_locked(struct dw_i3c_master *master)
>  {
>  	struct dw_i3c_xfer *xfer = master->xferqueue.cur;
> @@ -716,7 +711,6 @@ static void dw_i3c_master_bus_cleanup(struct i3c_master_controller *m)
>  static int dw_i3c_ccc_set(struct dw_i3c_master *master,
>  			  struct i3c_ccc_cmd *ccc)
>  {
> -	struct dw_i3c_xfer *xfer;
>  	struct dw_i3c_cmd *cmd;
>  	int ret, pos = 0;
>
> @@ -726,7 +720,7 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
>  			return pos;
>  	}
>
> -	xfer = dw_i3c_master_alloc_xfer(master, 1);
> +	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, 1);
>  	if (!xfer)
>  		return -ENOMEM;
>
> @@ -751,14 +745,11 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
>  	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
>  		ccc->err = I3C_ERROR_M2;
>
> -	dw_i3c_master_free_xfer(xfer);
> -
>  	return ret;
>  }
>
>  static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>  {
> -	struct dw_i3c_xfer *xfer;
>  	struct dw_i3c_cmd *cmd;
>  	int ret, pos;
>
> @@ -766,7 +757,7 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>  	if (pos < 0)
>  		return pos;
>
> -	xfer = dw_i3c_master_alloc_xfer(master, 1);
> +	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, 1);
>  	if (!xfer)
>  		return -ENOMEM;
>
> @@ -791,7 +782,6 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>  	ret = xfer->ret;
>  	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
>  		ccc->err = I3C_ERROR_M2;
> -	dw_i3c_master_free_xfer(xfer);
>
>  	return ret;
>  }
> @@ -838,12 +828,15 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>  static int dw_i3c_master_daa(struct i3c_master_controller *m)
>  {
>  	struct dw_i3c_master *master = to_dw_i3c_master(m);
> -	struct dw_i3c_xfer *xfer;
>  	struct dw_i3c_cmd *cmd;
>  	u32 olddevs, newdevs;
>  	u8 last_addr = 0;
>  	int ret, pos;
>
> +	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, 1);
> +	if (!xfer)
> +		return -ENOMEM;
> +
>  	ret = pm_runtime_resume_and_get(master->dev);
>  	if (ret < 0) {
>  		dev_err(master->dev,
> @@ -877,15 +870,8 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
>  		ret = 0;
>  	}
>
> -	xfer = dw_i3c_master_alloc_xfer(master, 1);
> -	if (!xfer) {
> -		ret = -ENOMEM;
> -		goto rpm_out;
> -	}
> -
>  	pos = dw_i3c_master_get_free_pos(master);
>  	if (pos < 0) {
> -		dw_i3c_master_free_xfer(xfer);
>  		ret = pos;
>  		goto rpm_out;
>  	}
> @@ -910,8 +896,6 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
>  			i3c_master_add_i3c_dev_locked(m, master->devs[pos].addr);
>  	}
>
> -	dw_i3c_master_free_xfer(xfer);
> -
>  rpm_out:
>  	pm_runtime_put_autosuspend(master->dev);
>  	return ret;
> @@ -1083,7 +1067,6 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>  	struct i3c_master_controller *m = i2c_dev_get_master(dev);
>  	struct dw_i3c_master *master = to_dw_i3c_master(m);
>  	unsigned int nrxwords = 0, ntxwords = 0;
> -	struct dw_i3c_xfer *xfer;
>  	int i, ret = 0;
>
>  	if (!i2c_nxfers)
> @@ -1103,7 +1086,7 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>  	    nrxwords > master->caps.datafifodepth)
>  		return -EOPNOTSUPP;
>
> -	xfer = dw_i3c_master_alloc_xfer(master, i2c_nxfers);
> +	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i2c_nxfers);
>  	if (!xfer)
>  		return -ENOMEM;
>
> @@ -1112,7 +1095,6 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>  		dev_err(master->dev,
>  			"<%s> cannot resume i3c bus master, err: %d\n",
>  			__func__, ret);
> -		dw_i3c_master_free_xfer(xfer);
>  		return ret;
>  	}
>
> @@ -1144,7 +1126,6 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>  		dw_i3c_master_dequeue_xfer(master, xfer);
>
>  	ret = xfer->ret;
> -	dw_i3c_master_free_xfer(xfer);
>
>  	pm_runtime_put_autosuspend(master->dev);
>  	return ret;
>
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
