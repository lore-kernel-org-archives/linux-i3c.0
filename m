Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D10606A31E
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Nov 2026 20:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zvJvX+f3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jEHPhCn+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x1EOy+MWfnChxF3q/9OrxC1IF3BC28PSykfD01ihl1w=; b=zvJvX+f3lst5SpNdpQoNn6MOKM
	tuYWY1ISAJ2XLYANq0ekeRA0fhg7lW2MDTiuUsDsK7AD7+rcmtMjECzs8Ovv2NMa09elU3zhd2xgF
	b70gUB7Ei6EJfAb+Mtyyy0locqoIttEpaT49n7cnwEjXfKDdzJOlLYz5shfx/T1ezh+dS9kEkQOzs
	05UwIz8KmscLxNGGXPrsO7g0X9LfQ3aUy3binCWzSfe4UbiR5KV9r2/nq1phuZK4UkI96oF2kn5ss
	Kjw2+85DLMSGiCQssd+2275OEKmOvSj0aoE5l6j8Zzq85BDgzIC+y6JyiVC2Dn7Z9H0VWb2LEMwPU
	mVHk5kgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxRR-00000007mDj-3e9z;
	Tue, 24 Nov 2026 20:48:41 +0000
Received: from mail-westeuropeazon11011027.outbound.protection.outlook.com ([52.101.70.27] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQp-00000007lrc-1lxv
	for linux-i3c@lists.infradead.org;
	Tue, 24 Nov 2026 20:48:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xG1QiTEUc4XxGK6uXShl4L9aKXeeYOl4etzWPoUJ6+VcMnuM2oxrKHVL77sXQBH6aU5Bqow0RPwFLSs5awL1WGd3PYGnC/infNs2t6Ayv75Lcgf9iCUVuGnPqGz3TWHbLplBA8J+crGsiKwIRN/PTSijCpeQuWDD2pUPjg3j81vQJm8KGxygW9MIipYgvkf9ZXwj6/3TGYq04jcJl0fZAk4I5vOJM3BO0Q2hITZzlgmBP888s5SON4rqmMWJkDr6/px3UaF6nEgbgysnyekyfSBVvV5U3LHWhUvNJeA94i0B0pBOvweAyRy5ovipCvkePdwr082FcTJ+xmCO999NKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8FMyOzevlVNdeikv7Paujid3DrMXptWqDB7Hnzeoyc=;
 b=JRdBPIVClu83srVqNEUJIp1HDD8TMMz+Irxepmj5CirB4cCAjpqW2QrDUvrJYZpQ6am7UhGNfv8SqA9P7+BB3ntR2XKuLWHWcuu77rB2T1hEH2Qrf6HgMuHseVGyCfCQWT513I3ccETNYYPV54C4Wb5vK+mybobr7egsgZ42tLleq5AXylNZf/h2hIl+HOOGfxUdYBd/OB/TsEXznduj6vwo6miIVN5nBwVkYLmi7HA634xH4QOLOmKXFn3AybBqP4yBszpcvLL9DNpFlAzBAJsSpwORR8Gl/xlrfye2+Ms7RTwC7xkUq8oY7GOGNz6DgTUHdDo77c037bADQ6jZng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8FMyOzevlVNdeikv7Paujid3DrMXptWqDB7Hnzeoyc=;
 b=jEHPhCn+zImr1d+OujHCxC5eGDiXZAtfpMx/KqPPZKUE03NBmjYL24jO6Y5C8+0zopMS7IK/0WS93vC6HYQmjBmiiIz9e+LwASTgHi6fjzHYZJ9FJLHwDJLgo3RTnTez0KtFJJrGsKk1czGSOTi0tHZsuhk2u8FvgQ7TuYjZTUqKjLslyLWHaIEs02ZTNYwHhDiYR2Oh/i/v8wq+VGRYb3jS/nYEe7hlC1hCSby7rpBUp2UbK1od4gxF75RIvn1gSWGcIogQZ04JH3ckM/4UJSyjfyCxB8BPqXYM4N2+L0BvOdK0iMudUj44fyGS4xsi5+4dvmRk3GmANyVwsBCEtg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Tue, 24 Nov
 2026 20:48:00 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 20:48:00 +0000
Date: Tue, 24 Nov 2026 15:47:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
	linux-i3c@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i3c: dw: check the response data length against
 the receive buffer
Message-ID: <awX3-57I5tP3vLXp@lizhi-Precision-Tower-5810>
References: <20261124081839.3890375-1-maoyixie.tju@gmail.com>
 <20261124081839.3890375-2-maoyixie.tju@gmail.com>
Content-Disposition: inline
In-Reply-To: <20261124081839.3890375-2-maoyixie.tju@gmail.com>
X-ClientProxiedBy: CPBP307CA0016.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:2::16) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10275:EE_
X-MS-Office365-Filtering-Correlation-Id: ec2e7c8a-a37b-4064-ddf5-08df4a6c39f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|4143699003|56012099006|10067099003|11063799006|261021121427099003|261026121527099003|261022105027099003|261021123027099003|261022075727099003|261022113327099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|261009220027099003|261009221727099003|261009223327099003|261009221227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: c+O1Qe5ehTxrPcMcNAVua+SRRIccrU32T8zuebrVGA+RRfiLeGgB50sV9aO98jE8wpibmT+gZXRYt1aumZ/fCZ5T0Nzatu7VuZfyVRdmcd/dYTLbOhootvzkzSeO34gc2rO5AIn8WnFXUToiZ4dseckKxwNUevwxrt0iKzADo2u+/lAiJGo4xwn8f9MouZRHWUILnK/ZpQZ7YoHI3UCxc2IBQqz3i2qNiiNZoolSPYADpOr57Yxh3JYWQZrL3y4ru+hNwxU7QZf64GcAyuXGWmMstGrail5c8npt4845HBTdur7s7LSgOkUSjVK2tjrIF7ZVaVE7r5P1IyiiZD2OTBfArrOGeu1YhcSf0jZQcW7C8n10LcbpZNNnOhfMWZSon5gQSNpu10gxi6SS00GycjKDcJ1LfEeSpmqiBS9vDpXm3YOj3I3eDmQHTJe7wewXweb64A9YiQLUd3ir/Ez6jORUikQEQbrQVebS1UIOd/Lu551YvXq/uj1+5YtJb6Gy7MhIAjdLP+8Bf6fus8bKnhgtHmIwb2bVoGOHXzu8fgcwWqLW9u2WRq0NXkIdC+NmHk5b0pt/ZNVVwwxKengN2DdzUpEqJ5N6qgYzTBOzU59ybTK4nTBBrcMY2j/2AvXp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(4143699003)(56012099006)(10067099003)(11063799006)(261021121427099003)(261026121527099003)(261022105027099003)(261021123027099003)(261022075727099003)(261022113327099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(261009220027099003)(261009221727099003)(261009223327099003)(261009221227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TvC0vWxmIHIz02X+TEoScCXYHODJ1PBTMVyrrA/QN5jSdmbza+4kyI7wPGsG?=
 =?us-ascii?Q?j13h6/i+Pp20xBU8doByyUWUOCgFpWaUDVL55YynzDLFJxYElGwUyGakT/Qa?=
 =?us-ascii?Q?6DNozAaBJInF/VI9DVzD/RxzDdP1ppE90J7APwZoBWsPmCExx0nN7WKlrWyZ?=
 =?us-ascii?Q?hzyE1n2adg94pOEMOzqtWT/R/nm7vYxgZ5TYm/L7FrmG2dhQJALeTnEFnYbO?=
 =?us-ascii?Q?rZAme4bWaOHikdPr2LAuOsAovLZHsDB1wZ1Ml4IysfH6Dn1yZJp6poB7apeg?=
 =?us-ascii?Q?H0ICw+I1OWEScKfdDki85ZdsI+VN8sDiuGvAxbEFyZmBLc7zjsL5EnwFgrWP?=
 =?us-ascii?Q?88VC36GBhqByUb44uIqHRgIKDoI1NlxsaQDHG97AdIZNQUzK5AASurMPI2Vw?=
 =?us-ascii?Q?/miGW16KtiS7bIjz6MsXeYFFIu6nGMgfhgQme30hCtoRVFl7g0PP+JJzuAEz?=
 =?us-ascii?Q?hYbDEa9yp9p5IkxIlmcfZKY5g0i7qn/rItDzI4lByr7T3KbB1G1JeqT5jpmq?=
 =?us-ascii?Q?R/+XjG0OLZeJQLj8NJ1wJR4sUfHWbIeA6Ty1/6a2G3zo03m0EtrP2WhoEKb5?=
 =?us-ascii?Q?DFeK0oBqO85pFYbugkx+LarFtOSy3LxMzDNhyWUE15sXBxAKUqwA1D3Vx5Sm?=
 =?us-ascii?Q?IxHUCrBOP5IsVeNsLuTpC8YtyxcFs+xeaUo1cx1dDf/MoUr+ehIbq0+8C3x/?=
 =?us-ascii?Q?XCK7vFiF8hPkrUV9/j3oW4UT6d8yKpClCcz7Q1MwFxUr5pxodL8g9Rmov21h?=
 =?us-ascii?Q?h9fhnpltQop/EYjzOOtqEGQ6pMa1W0/Yr/0Uj2ptOAvbbnTKm6o6hRSvjVYV?=
 =?us-ascii?Q?0Iob++GQcxXWMELTAxdz6JQyhpVX9Qj4AmIro/Yo78NdwTCkUWeZ8ftNu7/Q?=
 =?us-ascii?Q?xGyffY1/SABL3IA3ragTWD9acMlh1IeO5HYPY4BPsLfue1S+76iorNxjsqNB?=
 =?us-ascii?Q?vNFDN3mZloXOO3hmqr2C+EsSE746k7EhjOtxZB19LCkQpcfmKtdAxe48NK/J?=
 =?us-ascii?Q?HWhcaXP4LqoZfXlXxibmbwPW2xCk1EYDLuN9Gs2L21j6k/T27/U02otuPPGS?=
 =?us-ascii?Q?ydCMWNnGQe0c/H6K56XiZpwL+7EXNNhLIbcKHkzPAVUxr4hg2GJi8SP6EO7G?=
 =?us-ascii?Q?BCRBnqEHZJsVb2n/VbCQtvdAhidPXiPd5j1oJoo+lWpb8tqX4WTaWabmGRVz?=
 =?us-ascii?Q?BTXTV+lHdesV/qizaf14o2TAWywviqcQ9ERGPEgIXTMGgltvjIZ7zY/oEzTn?=
 =?us-ascii?Q?n+pPjX6wTq+roGowNe8XIGnL6zBjlVUv3f6OSslVUxcRGhDgUyaX20sRisiA?=
 =?us-ascii?Q?bBV1SJ4AlKx9D0R7nefkGGnZwLAaoFtbNDE+FDVHbUyhZ74h2RhVSerFuvMA?=
 =?us-ascii?Q?ERwXvzNcedxjGULGFPYVandr4diIzNh1kjRpCmTJe3DLveRLVCNtlDRsaMhN?=
 =?us-ascii?Q?Yc5sGbJxKQdDND10WmfNKJveURfSpcmyMdgIQFMLBo8SI9Lz1i/5NwdpY9VD?=
 =?us-ascii?Q?466yXpYpBY1eI72lXX4YFopLc3yXqVsvExnvD2ooWNUwZbXrvRlssMM90+Vs?=
 =?us-ascii?Q?i4RR3aMdeKNQJrkryizxcplfa6B84mVMZt6eLDb+UsdxDJXSnTTzj9O6A/ba?=
 =?us-ascii?Q?eTmUYd3F+DV0hfoXgXl8CSNvtc1vO+9c53qNW4nXWrP1JoFc8zbIw51M03bv?=
 =?us-ascii?Q?X3W6TD5niT8sJl9oBLq248jipYqOSXJ+j2jUMaR0rlDWbppUHCTpJiEksZJj?=
 =?us-ascii?Q?8Yti+E3ZQb2HvTEFOhZub331NIyCSFO2+7B/FNXFHivFP6+WsPDU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2e7c8a-a37b-4064-ddf5-08df4a6c39f5
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 20:47:59.9945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNPgxJ67Kvn6IxHI/8IQMmcqh5MSyiLd9ZMcWxlxip+iW4Kyfaf+QHqUaCkHsd99O7piAI/fuPwA9lIMWO4ciop4vukuZY6YPbHcECW9QxWjv2TOTU+K1MYnP2OtodfT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_124803_483918_5E124ADA 
X-CRM114-Status: GOOD (  23.29  )
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

On Tue, Nov 24, 2026 at 04:18:39PM +0800, Maoyi Xie wrote:
> dw_i3c_master_end_xfer_locked() reads as many bytes from the RX FIFO as
> the data length of the response says. It does not compare this length
> with the read length of the command. With a longer length, it writes
> past cmd->rx_buf. Data for a command without rx_buf, such as a write or
> DAA, is written through a NULL pointer.
>
> Skip such a response and fail the transfer with -EIO, as for a bad TID.
> A response with an error status still sets cmd->rx_len, unless the
> length is above the size of rx_buf. DAA reads the number of unassigned
> addresses from cmd->rx_len.
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
> v1: https://lore.kernel.org/r/20261119122637.1368308-2-maoyixie.tju@gmail.com/
>
> I used an LLM to help write the harness and this patch.
>
>  drivers/i3c/master/dw-i3c-master.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 1e0fdebf58d654c..895cbded5b8129c 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -478,7 +478,7 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
>
>  	for (i = 0; i < nresp; i++) {
>  		struct dw_i3c_cmd *cmd;
> -		u32 resp, tid;
> +		u32 resp, tid, len;
>
>  		resp = readl(master->regs + RESPONSE_QUEUE_PORT);
>
> @@ -492,8 +492,18 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
>  		}
>
>  		cmd = &xfer->cmds[tid];
> -		cmd->rx_len = RESPONSE_PORT_DATA_LEN(resp);
> +		len = RESPONSE_PORT_DATA_LEN(resp);
>  		cmd->error = RESPONSE_PORT_ERR_STATUS(resp);
> +		if (len && !cmd->error && (!cmd->rx_buf || len > cmd->rx_len)) {
> +			dev_err_ratelimited(&master->base.dev,
> +					    "response len=%u, rx_len=%u\n",
> +					    len, cmd->rx_len);
> +			ret = -EIO;
> +			continue;
> +		}
> +
> +		if (!cmd->rx_buf || len <= cmd->rx_len)
> +			cmd->rx_len = len;
>  		if (cmd->rx_len && !cmd->error)
>  			dw_i3c_master_read_rx_fifo(master, cmd->rx_buf,
>  						   cmd->rx_len);
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
