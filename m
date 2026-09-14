Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF695C88E72
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 16:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QgU86UFcJYHcLcwNpRqSBjtHP/QTGrVcMrx59J+dIzw=; b=Z74eKIlGNlSvKy
	mCyxUt8yo0kbB+nUSOx63qaaj8HF/+22tKWU7YvIrreTnu/5oNcZvhuE0DHj6LcfcgpAF+fv+1GZ0
	1aLALR9JamYjkTS0vXyUrMMZIPDM+/y+WH04dxLXWNpzWHU3qO+N+342MSRyBZYhAADFczmRcaUZP
	GLNhS5sGeF3YFYLV59xUxsnQ4Ipt54VRf85VOi4CPf8sjS56Wolh7A2Cit2hKkbzlbWfKBhlylPq6
	h/kP8xteorWMX4vuhdNmRH3w78nVDUNtYohCPGQksxy57Yxp/+D5IP/YGEW4iDZzfevPjwoc0ExxD
	5+U/hbmQTU6eq7dFpxwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69TE-00000004HMC-1oM4;
	Mon, 14 Sep 2026 16:23:52 +0000
Received: from mail-francesouthazon11011049.outbound.protection.outlook.com ([40.107.130.49] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69TB-00000004HLQ-3dLQ
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 16:23:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYkXjIvVdqevcxSt6blF0Hu3mVNTPzKNVhGi6fIY+r/c0CM5ZoCRB5/ZDJ/ju45mUQVDBKmzQ4ZtaO5Z8OAqOwQoK+qAzDoNIsahSCms/UuwmmONy3dMCbOJi03Ofp5hmpGJG4RDwBLMGrLLDOq6WjCzxumvh27xQDb9eSPf69R/pIhdF8EfHI8mBr9tkFXMEmamJZDhDE3SOLDoSGPlfMgZjoQAoCXOhXfYKGffVi152/q3LzCQQTwYgXQClS7993mVOScItEWf/lfa68ChRrXkTPXegOpUlUqFVL87fFFKhTMCtAzec/bEZDGQ4+QAcQwxISQFo1twm0OYNphXCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsCIJ/sUatvv21p+w6h5VTdtse2DoTYdTpzBa1P6QcM=;
 b=SMej7iMgQKiCmhGfTLjEXpSTN0yRRRvacHKw2AiOSjRVd5kzRNbuhaBn/A6IaNTW5uQW0go7FMWh1oVC/eNgt56wpKDSMZktipw2dOjIHx2SG0XzIeuQ0nDh96tayYuwO1LrPoaTnQGVwW1jZWNKltc0E8i/sFiMwj5u8VEyfxFlB9OoCVsklEr8wDQpxbVffMFEmuFtp0g1iMWXMYOyNCUWzecLeQKAfR9+9qx/z4M4RGM0i+x6QeJRwx7jqDatDuU1aDp0qCWZ5xugQTyRCQW7v80WdTlKHQAI3+QwlqwxY+S1Wi0Dn7LgDIwypSYVACY7jkBK7mg7h0yLeLe+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsCIJ/sUatvv21p+w6h5VTdtse2DoTYdTpzBa1P6QcM=;
 b=K0zU3fY8P3KHhSpCmgFUXR0pDIZ66jOuviVK4YwNEHxE7FlP7lrfWf1f4i18FJ1FDlAuWrm531Vqd7Mw9L4RmWGUua8Pa/MbA4Y8uE0xmuxRPLNQNWIYdwEbdn3iJhH9W4ArkZk/oI8eQ2ME04wR6LW407kqaZl1Pf727tO4QzchwGzfVSPQcXDQY8o5S8Dj5Fsoqe29JnsCdbO9e4qqKwgb95qPYcV9v0T0TFAKasKP5eZQbBl4QXaV9RjTz9+ZJVh05vzgHYLzMjLxdRLzXp5jaZVOYZvsPY59Ag+sfAxuOz8KUkfE3TAJ9nq0CEJGt/dM8v1pVWtshYNMPJZj9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10181.eurprd04.prod.outlook.com (2603:10a6:150:1b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:23:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:23:43 +0000
Date: Mon, 14 Sep 2026 12:23:36 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/17] i3c: master: Remove stale GETSTATUS length check
Message-ID: <aqgfiBWoCk3IE8Ke@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-6-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-6-adrian.hunter@intel.com>
X-ClientProxiedBy: CY5PR18CA0027.namprd18.prod.outlook.com
 (2603:10b6:930:5::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10181:EE_
X-MS-Office365-Filtering-Correlation-Id: e4659eb6-7499-457c-6732-08df127c8b12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|19092799006|10067099003|4143699003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: fBh2S9LjCjKTV8iOn4HcvYGXr3Azp5T2P6FzR/op2qUXD8DfoBEG23K17VN3S204HXabaF0zcdkgRGbOZPa5rCN8t8/uttsuu8zXKryF5rWHAX6uXcCSJDZaIsiH751IvFDj3RIjnWMQ9oJQF+JUWhR+uT5iLmwWBpaP2ATMk8dczV4h5vcQeduf/jEH59brTkV34j+9yjaSAIWCDdMq6hIyEPgtVrOgESLDd7a8y5rRESu8QN3FoNGmQEoigYTIw4hZm2GXskRU3Bdr7Jhs0ECrsuZVY69mx8MLftbvSlvja+pUBzwyI828FNYkOPHRs7XltbuqL1LuqhRbrJ7QjS5UNoTxINyPmX8hSTdJ1F0Peil+xQUupgiW1AxzcmjQkjaxFDzIoqFY87kaKypLQC+WDAB1Kmen/ZeQMpTXZQu/Uw8ZmGyjP0T9IaTiSgxh+MpmPH4Thqe2+DwMEIDmSUxOZKum4Z11Yb0cP64fC9Lm2Ej0AxSja+bnhSS4CmpbJJUtpBKdJtyIQbcuFz9Fy7vXKGRiRjACXJVpnnFtgkqilBM8WS5UnU+b+f5Yf+R6eQQJ+9B+uEg3WjFCQcYR5Lk8eTMdfMn9dfq6O3bXKZovv2rmS0mTxuuHu0XMzllzaLD7JYiz2Q8yAws0Slw/1hh3KMcEyP2htGvjcSA0uVQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(19092799006)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?23XJXJSs1MwM1KM7Lf7UDvlcXM/zkwK2b0cqEJCpEW/GFs118K/LPcgAxWqe?=
 =?us-ascii?Q?BCQhZfuktu+TsLWwV4bgL7fKCxKp+/akTNcRWyqcMo9GzNDRJIHDSD+Owhun?=
 =?us-ascii?Q?51Z/q2P6nHoE3qCmhA1+eLpntR2z8k2DGUR7OwGGWJjHEMSTBUQegpicgMck?=
 =?us-ascii?Q?qDQX4zgbDvSxa7avP5U3T2AODGoP4OfKaSoFogscRiLvyyPwBfG4jpyPySW7?=
 =?us-ascii?Q?aeXhX3A1NlETep40shGi5SraI39OCF2TgOm111rKTZZ1gwTqC1zo/Ntd4Yih?=
 =?us-ascii?Q?HTSwMYEms/C5X9ivAFrbbLBylBbbW4CFqnwjg9YgiGuC2oxnGQ6CpKaNnIoa?=
 =?us-ascii?Q?cymkB9/Xe7B0P1O5FGsCGQ4DKFTDGUHDxDAnatz8xOHuVBMRkwOgqCeCujm7?=
 =?us-ascii?Q?VWcKhNwdPqF4K48k1nXtYYCLz6snjf/9yiHyi+VzRMvMLStUr2uEo40Ga6Ny?=
 =?us-ascii?Q?NaaQYSCVvHYLsBGAwsWBWkujh77KGLnsDON49RuWUPC/rsylKq58cChPTvde?=
 =?us-ascii?Q?7tFdRqLgusLbo045NYmEXRk1bbqSRHn/Rco0etnD3Bivz7x/4rYdVZW07ycE?=
 =?us-ascii?Q?gmxG+XezVrpxW10Odx2pQ2kimT9R+yN7eFHdWhfdAcoRJGsIjwPolam4t2gk?=
 =?us-ascii?Q?YfhNJo0ABrIlokceZH7+yB4PRMu4WYRrXYxenVJyb6NdiDZ1hA3nJAiOHdsj?=
 =?us-ascii?Q?BH2VQROwqG5XjaAtncRuWIomoxiAovjF7x5hhfoBXQNWhOm9miXpeUreBp9h?=
 =?us-ascii?Q?pPKcJgitbmTN7NIWT39s7MCRFX1E17yjINd9ifz/wY3HmAv4E9mmMnfGxayD?=
 =?us-ascii?Q?PHBXZowaVl8Rc0CM5ZZAhwSEkwYnyPFZcpHxsX9kB8/w7n7+Lc0ZjXhcvMYH?=
 =?us-ascii?Q?GuawBt90lPkEY6jGWVhc8GLMPNUnvnl2Zxprg5tFF2MLPI1vGuyoFKMaB2az?=
 =?us-ascii?Q?vAfY83i06QPrfaVhm1NPH8GJgvP3Imi/DPhCzeGqQOtiIFNb3wcO9TDF7Uus?=
 =?us-ascii?Q?rEUG+0LLVAcohnfO2f8OTUByWasUkUN4cMEYs3lGf36RQM7Bf8bvAgxDWg3F?=
 =?us-ascii?Q?Jx3DCnsK+5E9jFQs0DxR0mVOyiwKGYuxUPs/reJlqSS+ZIIfFtbyGOUZOJKK?=
 =?us-ascii?Q?qYyuRU+hBp74/xs5peUXw/Znv/a1J3RGQRgXPolgLQgeiRl56ZsaF7cf04CQ?=
 =?us-ascii?Q?CDbsnKOHHGxjPNbjsVtOX2n3GmqDgI4V49164cTLy8NXbDGJF9vd0yRkwXIj?=
 =?us-ascii?Q?OSNnvmw2FwgIotKs0gh5FhnZlX+2JFX4bBJohCi1BiflloCD5RyJP3CLgiEv?=
 =?us-ascii?Q?LNw6KyMRHx460+L7f9QCzvU+5WHDhetjLch9tqSJM6vOjrvkXbAvl5x951CX?=
 =?us-ascii?Q?xjCTEsyrTvoZoP8ls4uykI11/LEVucC5pCWigOirda0XkfpMOxX4u0wXGLdc?=
 =?us-ascii?Q?6ESvpADmBIF6fSUx1WtPywOZ6q/QLgn7nfALBZ9/lwn+oTBtcGYTEBOqqg7J?=
 =?us-ascii?Q?fHRaNTvv5TC8TBBKa4TFlOQ+b5q1yQ5rhjxX6S59X5HcAuUpsWIZKGES6UPS?=
 =?us-ascii?Q?Cp/a+Qfgkex5dfNZMLGeOzdSBEEvqLHng5rnirFYtSMkwi8VMSIjk4tzYRTg?=
 =?us-ascii?Q?R78Fn9274/Doo/6EwIW3dyYewtfHsK/RSHMnXy6m9xO9l5RUByUr8UnZwfvB?=
 =?us-ascii?Q?IrW3UF5Ks6T2IZTqnwJ0G15SvmQagkGhcKrFT5NKttKBqUfCgFWIQbctbJzB?=
 =?us-ascii?Q?YprHbSP3J7J0qoVzIrkwFYF4HBJ/jmH+XHSjxrwxfsMru+qf6GtD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4659eb6-7499-457c-6732-08df127c8b12
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:23:43.0552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZE9luop+LDs7BPZV2BRNpzA+ZqOs6Cm5Cke4/hkqR6xP6ZirMrW7yLvCKBHrnoy4D2JJoUmwWrHJfwZmJP93MTQFdaQDn32Gpw9WCDwiC4sbTxcVW0kLSWI8GZjdYwW2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_092349_908896_8C702B50 
X-CRM114-Status: GOOD (  16.17  )
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

On Mon, Sep 14, 2026 at 02:29:51PM +0300, Adrian Hunter wrote:
> i3c_master_getstatus_locked() verifies dest.payload.len against
> sizeof(*getstatus) after issuing a GETSTATUS CCC.
>
> This check predates the introduction of dest.payload.actual_len. Since
> then, dest.payload.len has held the requested transfer length and
> dest.payload.actual_len has held the received length, so the check is
> always false and can never detect a short response.
>
> It also predates the addition of generic read CCC response length
> validation in i3c_master_send_ccc_cmd_locked(), which now performs the
> necessary check before returning success.
>
> Remove the stale check.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 215a22f2c7b6..4296c51a9537 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1777,11 +1777,6 @@ static int i3c_master_getstatus_locked(struct i3c_master_controller *master,
>  	if (ret)
>  		goto out;
>
> -	if (dest.payload.len != sizeof(*getstatus)) {
> -		ret = -EIO;
> -		goto out;
> -	}
> -
>  	if (status)
>  		*status = be16_to_cpu(getstatus->status);
>  out:
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
