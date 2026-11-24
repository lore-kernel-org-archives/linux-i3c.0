Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BFD606A31E
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Nov 2026 20:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aD7vjf3M;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=S3a/6iRK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZbkoRPdXxFSBQ0nvuIrdNmmDUrtc9bB3CAPO5peTARI=; b=aD7vjf3M1FrxM77SedJOTat7st
	pG2r2sBAUJRFsgKosrEZsQ4iQeVo1WlANRvh3ASNHmMzBOkJVajtMJ5jLXmqbmQprkny5jW1l3Svw
	v87gEw7hibIAFwIUa0y8oRsVHLP9b8GN8AYYogAbeZTteQn6xTJoAAI/xNKUE/OEHhZXlxgn5nfBb
	llsAfPF+6xvTMcKiYVIOhT+aQ1IpeLZRCf/lW7PTs1Akj1QU5Pb6hMqf/rh1ntlACgJnrJVA+VVly
	x0grXJd1w/6f1BoG9/3agc7StE3+/l49AmSOJ0cxsbGhOyzDnQvl/YEwGr8z3yyr1KOcI/V/bAz22
	kUc/Tkrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxPQ-00000007l4b-0aTG;
	Tue, 24 Nov 2026 20:46:36 +0000
Received: from mail-westeuropeazon11011058.outbound.protection.outlook.com ([52.101.70.58] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxPM-00000007l2Z-2kf7
	for linux-i3c@lists.infradead.org;
	Tue, 24 Nov 2026 20:46:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6L3nuXoN2HrjudpxVNJFt+o5CO/zRIKDlggw086meW0Ez13UMY7dXT1HryGpxI6NBUvNTL4O4CWhAWRaU3L76fPZv7EUi5pe+wA0ukVaRPLeT2HtXGMR9jMoZwT9ZGmVk4KRKpZ1gOF5vYAxaIwmljB7Bn+F5y0zb8SoP02UpM78oprDNae7HDITyQCq2po0T9OJF3S9VK9qYIY5pNu/26Z79jzWW7r4vK28akEKRDR88gO8R8mgZrfsBQujwYbhJldgJPgnT24Muo1lXMNzLqP+E0FjTV37lFTUrintPmB6BmtjpLT2YytqQRG3eHeC+Xqcy4OPrde9s117kB89w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/rLwLPjwk/sW/Jgdrr9fu0ZvkMG2lrU8OrwbaeKSOk=;
 b=tZeK1p8FqGdVM0Yz0t0EM+KieQrU/WnA6y59RTnagvhbsllqgDWoMYfsVGSGhkNHCSCnSFGPvW+rtaIs01c8b6+iBeZstkq4GXXBAamRg6IwBRCvWGJirHC/woNm7TqJhnVB7W6+pJoBYXca5/T3lAkfT09bLqX8etjtdUFtdfovpMCS8aXOMixNJSfaK4ljbXEweVAxLLl6BgD5Ff8awEub8aIg1X1fdYkdNlhTieV+euLBGRHA0uuN+NxWMf9/OIxZVqdEpn5jNywdIx1HnUcCTGH1k7ZyJnYsGFiLg4h3e0chydSm/ZlLyFyAPEzlAKAX+jKKdvlYmDG4cynhWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/rLwLPjwk/sW/Jgdrr9fu0ZvkMG2lrU8OrwbaeKSOk=;
 b=S3a/6iRKHujf/iAM81ZIg4p5yX3sfLT5S4uemzk4x/7/6hnuVSZMqaHK6Ls/WC4aePuQgB5uqgJN3abg8w+/wq/JhQybJSSIiT6pjfYk6sV61yoa11jq+DY4Q1PgnR2l/Bg1uLD5vKki2jnykWvg7flKe2DiXBg4mmR129NSMuYe9qZ/qK6EG0shYmSy1pEkAlX6/k+WLa4Ccnh4I1ESktTihDi7Fw2AIJZkEKIAfzbEHldINraHCSCKv6XmqR4sXtPObWMYrcu+B4InlBD9cvru7ntLLbgU19uBbDNbchWDq295t9mL47H4c9CACZDvo06O979dBpkSyJH9RUy1Xw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Tue, 24 Nov
 2026 20:46:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 20:46:28 +0000
Date: Tue, 24 Nov 2026 15:46:23 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
	linux-i3c@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i3c: dw: check the response TID against the
 command count
Message-ID: <awX3ny25Yv9V2qYu@lizhi-Precision-Tower-5810>
References: <20261124081839.3890375-1-maoyixie.tju@gmail.com>
Content-Disposition: inline
In-Reply-To: <20261124081839.3890375-1-maoyixie.tju@gmail.com>
X-ClientProxiedBy: CPBP307CA0005.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:1::8)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10275:EE_
X-MS-Office365-Filtering-Correlation-Id: fc2045df-c1ee-46a7-8db2-08df4a6c0379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|56012099006|10067099003|11063799006|261021121427099003|261026121527099003|261022105027099003|261021123027099003|261022075727099003|261022113327099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|261009220027099003|261009221727099003|261009223327099003|261009221227099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: GRaLXukI+1QGc5slqZXIHh39F0Gcer2F9L12gCALoFKcgwQUbL7k2zvSKFBnN0Z63Pilml9HV/CwHKRDDm+eoZeMzsH7EFifmWeNQUIK6WGR91nsIMxv5L7WHgdvUxW3X6ql2aoGEZeEfpmb2j5NyaQ9c7+iw63cAfshmJhOzhgEdXATlQD4wGFdL7TrXGWWCKudVEoKVzU12RaFqHE78E7IRZmwhQHL0dUcMm0/Y/5JxQfbeA9ApPUie9XR6UC5PHGVk5SKzwa4F7CF8pnau5PVDaw4cDLBIgL/C3hCN01snM8EfmkgJu8BHQTZLqj2HJTmR+8E02ex14Yc8Ms88l4By2NiXSEbvC7GAjI5shxUnyiY0I0RfrG1I7ykzR0ALED8Ayu1aMxx4+JRyxfMpBOth13dCB5Brcb+f785QpyYEIoPI61K1vh+pW1AYENxr8iR7TYNGaFMjemYRKdPwrt0/iqcGPXHai5PjNMNaBpN9LhLGTDisldRTG+e3a3D1ps4U34dsns+fZEf7ljCKhbK26b5+32ipAd3KYz1VCZaovQSsALVHwU1XNqb0CPkNtvhfqAm0mseTbuq/cl5WOgx/O99ifUYnQ/OdS70FbMibInvkmPZIijmIziz6++j
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(56012099006)(10067099003)(11063799006)(261021121427099003)(261026121527099003)(261022105027099003)(261021123027099003)(261022075727099003)(261022113327099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(261009220027099003)(261009221727099003)(261009223327099003)(261009221227099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KXP3f1jJ9Bm8WvRdtk5zmqdy6c3wxM5GfLTUeDTxM21JvIjpuuBbCLjILjRe?=
 =?us-ascii?Q?pcDeM2fWh518LaNH0S9YDBL6GaJ5WMX7EMCT6Fkpw83MZnv2W0Rc3ymyhTpE?=
 =?us-ascii?Q?DzYTU/5jB/S02b7+TsBDORRR9n3ipmrCZiR/NHxH1jp67UUdEbLsGdP+eDk+?=
 =?us-ascii?Q?F5Kvf6XADbey9Pl03z37M5F2LoETl/fFhbIDdZFgfhjmE+vSEYWDndpOA0Nm?=
 =?us-ascii?Q?jQvw6cm2NYMblj0SkIykAdlNLmbgZVNOwmbfpx4DHKXR1lam+8TRg5Xx0zwT?=
 =?us-ascii?Q?xNw1rm/UoXgb0yQc1FJhg15cuFVfCBkIIUZb94aFM0UCUW9bUshG/IMLa+8c?=
 =?us-ascii?Q?4Pw6jx/IvG7APZKNWc8D7X4u98R7UccVOkbRgRlA2FNlwZvYZpv2Rly3JIOI?=
 =?us-ascii?Q?4ZQkPve/kEDvasAov+gsE3Jr3OCDTQjfLQM4tox4u9RTBtsPLTOfAocatmAv?=
 =?us-ascii?Q?UXmEQLDL4lGuFDljobnUllhRbERhoW7H9qF2zyMdr9u0DXoLs67VGK7wtGWe?=
 =?us-ascii?Q?Z3sfcL2nW51g4pOG/hi54fib+/L28Wan0DpqiIcKdg1YHacJXNEYPmemeTkZ?=
 =?us-ascii?Q?4ngk0vOjy5s09Nn4iPdEF3MRQHXN1UVMAahv4OvX7WTfsfVeoNyGWwQjalV3?=
 =?us-ascii?Q?a6kVqmUCe6080RXj1Bdg40vKbHiSmA3AYKo6MOXFrfMw7ugd+hoVsHCKpBKh?=
 =?us-ascii?Q?SiTDtKPgRs+a0PyDt0VDy6XO6mV2a/TMwDE1yBr5HIrhY79O1u1mcDt3nkzr?=
 =?us-ascii?Q?Fljo25jHDSGY4lI2VoVPOSRWX67oM/Q41xim7PeGRvT1HFQpoeWHib9+TE6B?=
 =?us-ascii?Q?nk2gzSJt4TzihyRNQarl3J1IoaUBTYo6D9GgEYu511sOEOjraZWA/OakWvpp?=
 =?us-ascii?Q?MSJwXLfWDPCGcjGBIS0ZcqBDlLUwtbbduVOYRL/pkbGYBSKR8wawEcZveunv?=
 =?us-ascii?Q?zKPnpzh7y//j0LKeGKdIkehj/5IDL8W38rKQ2Er0CahrCMpCV5sysM+elpVM?=
 =?us-ascii?Q?MHkEYSQxPAVsLvjntx5NsdwySbNQxNwCMqKEeK5TDSZFCteYkiYrW6GklXGm?=
 =?us-ascii?Q?ITTAS8y6rz3nD2+LzdW6UeeVte4K0UlGKEHCIQYaY0sCdnvsiBiDvTdxnB19?=
 =?us-ascii?Q?/8JWm5jk5dyVg+42W418+DcTvMRFUDEqVHLS/nSicLU7bO4vWDqzJHWg/OcW?=
 =?us-ascii?Q?u9syQZKYkxkx3G58G0sleAW+J+JUv47sBRZ4q04t4i6YQCdSRyzsId7EQUx9?=
 =?us-ascii?Q?rGaWzvO+Ntsr0nJMDqFU7JVTGh2GcJjSNOroObPIc0OEb3bf3Kn225IiCR3D?=
 =?us-ascii?Q?fthUwhxhqqlARAah1HqvGspQfLns70MV9rAtEtE9fboo269UG7OsX5jQO+Lp?=
 =?us-ascii?Q?mC4PMbQJT4R3zHcmCRRAbS5rtQKq4LM5+zQWGoI4pOVyTvalWuCPxDfGKX7V?=
 =?us-ascii?Q?HUuYiy55ze4fguPCeYcvgaKL3Mvg6CWyX554NYWc6OgGaxjTZW/Bj6Ch8oY0?=
 =?us-ascii?Q?MKVFU1HhbToFFPpvI632xs808V6r+Rd3B4Eqmd7nETtzJ5Rwxi4WbImjw7KX?=
 =?us-ascii?Q?coYHJBEmyYJ78uXihbmFFVpFop2SA3gEReBBpzT/B2XDvlbp49VRhYyx7VUu?=
 =?us-ascii?Q?y3LZaBmIQOUdkmWlxZG2uPfJY5ONO10CErKLU9Uhs9oULCmjflRJoabne+oM?=
 =?us-ascii?Q?81Z4MZQ1GZHLsPVTke5JjvvGKPQRUI+fMwaQsuaOqHChXnV7PKULGkCPcn/O?=
 =?us-ascii?Q?ktFkqKYm3P0tOsQMu+YOYdlvr8SAOVo1DuK8L8qwkBrrKfh/qZKD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2045df-c1ee-46a7-8db2-08df4a6c0379
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 20:46:28.7090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXJiJN4c7eewYNeQcTw49sPHGB9r5z1D2poEj8mEe8Cn5/M8mLU7m05BCwEdSUEy84CJgiQRvb5rZK7AR/fiqq9nhGonh6m5Pz+RYbl5HovA3qXxBH9peEukDUy7vZD2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_124633_548528_4FA0E97A 
X-CRM114-Status: GOOD (  24.12  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 04:18:38PM +0800, Maoyi Xie wrote:
> dw_i3c_master_end_xfer_locked() uses the 4-bit TID of each response as
> an index into xfer->cmds[] without a check. For a TID at or above
> xfer->ncmds, the stores to cmd->rx_len and cmd->error write past the
> array. If that response has data and no error, the driver copies the
> FIFO data to a cmd->rx_buf pointer that it reads from past the array.
> The error scan runs to nresp, the number of responses that the
> controller reports. It reads past the array when nresp is above ncmds.
>
> Skip a response with such a TID, fail the transfer with -EIO and let the
> existing error path reset the queues. Scan the ncmds commands for
> errors.
>
> Found with a CodeQL-based static analysis tool and compile-tested only
> with W=1.
>
> Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
> Cc: stable@vger.kernel.org
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> v2: shorten the testing note as suggested by Frank Li. No code change.
> v1: https://lore.kernel.org/r/20261119122637.1368308-1-maoyixie.tju@gmail.com/
>
> I used an LLM to help write the harness and this patch.
>
>  drivers/i3c/master/dw-i3c-master.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 34aa8f8e1a0a26d..1e0fdebf58d654c 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -478,11 +478,20 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
>
>  	for (i = 0; i < nresp; i++) {
>  		struct dw_i3c_cmd *cmd;
> -		u32 resp;
> +		u32 resp, tid;
>
>  		resp = readl(master->regs + RESPONSE_QUEUE_PORT);
>
> -		cmd = &xfer->cmds[RESPONSE_PORT_TID(resp)];
> +		tid = RESPONSE_PORT_TID(resp);
> +		if (tid >= xfer->ncmds) {
> +			dev_err_ratelimited(&master->base.dev,
> +					    "response tid=%u, ncmds=%u\n",
> +					    tid, xfer->ncmds);
> +			ret = -EIO;
> +			continue;
> +		}
> +
> +		cmd = &xfer->cmds[tid];
>  		cmd->rx_len = RESPONSE_PORT_DATA_LEN(resp);
>  		cmd->error = RESPONSE_PORT_ERR_STATUS(resp);
>  		if (cmd->rx_len && !cmd->error)
> @@ -490,7 +499,7 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
>  						   cmd->rx_len);
>  	}
>
> -	for (i = 0; i < nresp; i++) {
> +	for (i = 0; i < xfer->ncmds; i++) {
>  		switch (xfer->cmds[i].error) {
>  		case RESPONSE_NO_ERROR:
>  			break;
>
> base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
