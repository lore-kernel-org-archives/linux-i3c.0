Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0C7C5CFDB
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Aug 2026 20:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTljqSws8PR2LCVm+cp+wZOzJ/mw9Oo0ysVkCQndJ7A=; b=R3EhZ1Vutrhqom
	A7QSoloqHvx+SydHzSXJRujEoxIElxivOBdn40iuxmi2SymF4SErPBLnLRLpJWTJFV1SQl/7jEemx
	PJCw29NrDGnmFDIWHkN7vrFtEdjcmOe2/vtYcsgXRdGs2lAQi/Zo4ZXeIVkNzreBf4mzlRRtb6yE2
	03eqn6WzAceBHvaD+/ndP4xl1HkevFmPq26nquEoamTqQy8UHtBWviWLOGYwlhli9qSWQmrj3OVwE
	yt+BrBua2fzXmZDE0UIFzGfWX3GjjbqHaSlk9sGxVz0huSD8qyeF4c5GyqowGVllUeal33nEPiAyn
	cL3jAQv1YVGoVEvMzzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucEX-00000001WUG-4Aoc;
	Thu, 13 Aug 2026 20:41:01 +0000
Received: from mail-francecentralazon11013066.outbound.protection.outlook.com ([40.107.162.66] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucEW-00000001WTr-03x7
	for linux-i3c@lists.infradead.org;
	Thu, 13 Aug 2026 20:41:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmoC7q4QVwgwqpHL300ddBBo4bYH/nuOjhiBdpS6Hw27kVhomNrC8CZsTy3tiN+H+kSNw1/4JQVy86ToEgQsotD6Hd0qAV9acOLAWXJMcR4AeRnx7Kh5C2aQ2uaC1rm97LVbYMNg0VbA60rvrLc70wdIInpwxSR+MVf1EpfNZ7k5bwXGPengiqyZKWG0oCi89AWdUWSVucAdwPgjlWMQSDn21y1/TsLtyRPFG9a/gQgDyVyK7kEAm/316OQtU6pmUql3ov8s3vdFg1uhcb9bl+szKJofgnQuyWYPhitPIZ0GD8WeyosVnXb/JX1uXpqcfdcvwfTWBf4rb19JEnjGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghuLNr2hZx0i2x/0ys06SieO8ES5iSjn/l2YKenpD9g=;
 b=bPmqBIII9C9z81hK+SRJ9jUyJkkaGIaTG+loKiD4Y9WL8MTAVHUs6YUQxM6UKctaxtB2l4rdBCpLLzMMge9mOWB61FwL9BswChHtR9fkSuubEGH1QYNSJyDVJbG1BbqwdgTIISSZ7+yG71ZUqEG3JsxoOrJW4t16nQPZEbvOmhXGpZ7uwoqLnNUAT2cd2hdc3IvmssJy8a9boEw1cGCSNZKsCWxXEOGxYxhwbE9TAp5rqd8TPWE8L/GyaHszsLWq1VYqwv+6phxQuohoD+Rqw/grfivC6+NxRE3FRJt2I8om9+XSkzR6sgHYjeajSWImDkinCQCYVvrSfNXRlQ0xiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghuLNr2hZx0i2x/0ys06SieO8ES5iSjn/l2YKenpD9g=;
 b=nRkVguxqaXAqYAXjpFv0g82jDKcVvC1s0+Def+qqaIVd6uNcqIyUS/34+YibRpjFqkzFLN+xN2Zm6V0gFPBqiB5j9a+9UlZfLS5a5Q8MGyI/JiBK3qFyhQw4cbio8y+ehDrDxES10X6zvCtAyr6La5EJ+GG4+r4W9WNKlH4QAWN44TXZ0/FoacgGCtLC+4KdUHcnvzNtWKQW09Z5rVotpBRvHp40kzgUlwMusGQyT7QRlm1gUjVVfOschKYsztdK9OJiKiNktvS8CYh3JV9nYHPrriWxVFNIrxEftslznR0oKIgY50YeOC3z9JFIKwSjzk15ApGI1ZmPBMphTl+4nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB7048.eurprd04.prod.outlook.com (2603:10a6:20b:11a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 20:40:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 20:40:29 +0000
Date: Thu, 13 Aug 2026 16:40:23 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: use COMMAND_PORT_TRANSFER_ARG instead of
 hardcoding
Message-ID: <an4rt-UCHDQl2xOP@lizhi-Precision-Tower-5810>
References: <20260813044225.22237-1-jszhang@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260813044225.22237-1-jszhang@kernel.org>
X-ClientProxiedBy: SA1P222CA0107.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: a9bc3fb4-8b22-4b2c-261a-08def97b1cc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|23010399003|366016|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 6i9FBG0pU8dmb6MyHml73Nckmc1fXtoGLn0SKUnNRXMoTPZbcWzUhiM6INBNF1xP618haW4y55vAfGgpfrxKu3D6KAfBjRvzLXIrt6pjCwHvXg5EtCs9pfhSZ0nhiF8VnjS8RiBWalNwzQdPKpTQlKMaDiYf7Q50r887ojTo4OApplM7Ku5KqBzxLawPw56c3TMRJO45ZtqDZQwocVo4KMCOm2A8E+JDehgPkB0jNDRo/vNMsFCm8tcJoIrO4DJ/ehsxS8H6h/mFsAiUE9MLXjt2lGEzKKoyIJkha/mrSAa55Zy+lJ6Ei92JAD5HiHl1SrMcf4cQ/V+ER4jyhWwSYflYHeawDut0QzZ/naln++9pN2eIl1j56sWi4jj7SUipzL27Q80Xm9Z1tycWE8BHE4etgMiwPzUxCQd9Cxk+x+HNuwEuIFa2uuXwd+XcZbyY2nSvTJ+YTk9RpCcgDPi4d/j8EvhdjPvZiIQfR/9EN6H9iSDfyyVQlAbnK1/Hnzx0bERi19xzE0DwPG9ByQP8an6+88D1wCbMxM4vggoMiswM+zNhnnR0TrBmREIyySawptEx8BRVhbjWxUun9C3zdzMRILx8UwevKS3wSg97AdRGKg/bwlxPcxv+VxdYjKWX1LfR2XJr46a0mIgmEFVfrLbzuZ0zCju7kQkkT3gDx80=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FSWa0x6XsLL8s0clmmzrkFw8t9yJU2fOQibtwoddTDf39jgHWgAg05vUb7Qj?=
 =?us-ascii?Q?5rUKSpGoiwuRqJSYGNloUtQcYnY/GmECM+yXaw0Fiej8HE+jaDY79QMI/5tB?=
 =?us-ascii?Q?0ku6+Ge4Ylr7Ao6quHVsU+8xGrTUpef8Ij4NWw7uIkxnaEdn7BZr80arQd88?=
 =?us-ascii?Q?1sOQXgUkbspfHb+lcBABUOXBOnrUWY1nu1wZrAxUoR8R0x4+O+rG5UNzCWqW?=
 =?us-ascii?Q?foWI7g52WYF++3FuLqYiwXDsgEfHOnsUrMXgvn5nXPMBtEtMHEgbMRyc6KuB?=
 =?us-ascii?Q?6/ztSkNiP5yoFKMUg70juOTnb+ukXmzZLk7ZHQq+5JEM+7oYeDH1cxI8g651?=
 =?us-ascii?Q?/0+NFKB5s4mqXDehjq1gr7acKseUrfQ39s7vOVKNeDcN5Cd/J5sZuAsiL6A4?=
 =?us-ascii?Q?SDPsClt1fPW48ItoDYs72EQZ2aI1M6MKPGQjvPw1Fm+x1/1OXi/Qm5a3Bzac?=
 =?us-ascii?Q?t9bA/K9tkKZAw6tK4Of+U4+PXH1DE8FUWAgRfHUF4RooLQsR7hulTONDxAaV?=
 =?us-ascii?Q?NdhDiNu0z0g/QrmMgVZOMbvxbw1SvxH1ZazxpU2aWa1tdsWAifk9dyTwXhC2?=
 =?us-ascii?Q?fTKnKBHRNPLmAZFLuyDDCTWGn0/vcnzd6SMXlot+QTp9ti/Y4e8+e7Fv4Fbh?=
 =?us-ascii?Q?6zJFItpqFb90FMpcF/j1Tsu8WC+/CeJHl+xR9Tg6ZCvniv3j9yqTI/gcytRD?=
 =?us-ascii?Q?B8GjF4XPQpROj4xM+lueYUSsosAIjR3XRUPtSGwuOtbNefyXq1hfJVMq4oAi?=
 =?us-ascii?Q?99+giovSddZozXZUB+4FfbE3N7DKrog2cnAGxWZ/fY6RwjAEMj962nSfHpDc?=
 =?us-ascii?Q?2gcOIVMFKP+ek8L8kcym1+FNIa7n8F+eifIp0Eqj3gNr8Mu6WFIgSKUf2HYe?=
 =?us-ascii?Q?W5xziBMHekjDuM8Exc9jz/JwJgSvItHUAtcKDu/qfGmmVvnvE/tPcb7ZtN47?=
 =?us-ascii?Q?wi5cPvQ2G+DNfGy0HM68Pk55xhN20527v6uCRTfEUMr3I39upSdFYuxmwMr5?=
 =?us-ascii?Q?e5IhxHSJZe40rHb9xCblzp1Hn2p537Ez+zk/KvupLnVijohyzz1rPQ/CyRjh?=
 =?us-ascii?Q?x64cu51ZJzngUOA5mMifEbH/puSF3DrmlJCMmpkivDP9QB5G1YNLwQ/eMEOg?=
 =?us-ascii?Q?8SJmFpdDD6zk4H88oVgDPUQJ55bAqet40j0gsP34p5yeBsecbvR/qQUFFOD+?=
 =?us-ascii?Q?HtWwHlpPavYjeYdHi+rRkDC3eMNm4G2bnSRaK6ZdiZFIdxkEuXYzEaYGiTq2?=
 =?us-ascii?Q?WgtzDNUq3hFoo5H09UtjjNxJp0dqeq3ZP1k9Pws9Ij/qp2jInFCN6u3ihL49?=
 =?us-ascii?Q?DJLW2gWF5gV9zwgufa+x8SofNRJU2jrMIq1pd2ZsQatikHkaqAdm14a8rP2K?=
 =?us-ascii?Q?VSffQS4HcOrfO2BSIm/J1RSdDwwRbI/CA650jQ/1y+Gv2G0rpLdvKXPNRYV9?=
 =?us-ascii?Q?5P3r4b/vl50ZkN1DW+akHvzKAZfoFbs5lGgfgo6q9Ikjs9PwA6gpNJrT6oVx?=
 =?us-ascii?Q?KBdn+BYHAKa1LmsxPymiLGVQ4mOsU2jXfGeU/sMrJ9YhhKHp+px2uQw0B+eH?=
 =?us-ascii?Q?DY9mHHJ1qYiSN2/VgoS2rbTpoXJEJGonM5F1KhuVPGIKx8mcCSnogewfyo9Q?=
 =?us-ascii?Q?bpIY5zkNMV0BlPLNAya5wUi5MwirLdfTPMt+NMRPN/QtXHgPRFMYbq1FeCIC?=
 =?us-ascii?Q?Ek5Ru3L2wXCg1vwFqJG3SsMHGETXIx9hknfWj2IRi0BosP0FNg7PYbhxdkbb?=
 =?us-ascii?Q?9rH6IUIM5pOcCTHv93SuEsWV0O8AhsJFVKRJZAuFxVjARCEU8EhX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bc3fb4-8b22-4b2c-261a-08def97b1cc6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 20:40:29.4828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+FkA0FveESwQ95WQ/W4e6CFmdGKUL4n4guc+ae1zCrArTXVLO+N+wfEopewuKbadRpZ4dPNtevJnjHy/D3mWbnYW0wdv1lm5SdZK/A/mIJ5srJzKfRJgaleVEqLloKb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_134100_075789_2198759F 
X-CRM114-Status: GOOD (  13.96  )
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

On Thu, Aug 13, 2026 at 12:42:25PM +0800, Jisheng Zhang wrote:
> Use the well defined COMMAND_PORT_TRANSFER_ARG macro instead of
> hardcoding '1'.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/dw-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 655693a2187e..6ba84a97765f 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -876,7 +876,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
>  		goto rpm_out;
>  	}
>  	cmd = &xfer->cmds[0];
> -	cmd->cmd_hi = 0x1;
> +	cmd->cmd_hi = COMMAND_PORT_TRANSFER_ARG;
>  	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - pos) |
>  		      COMMAND_PORT_DEV_INDEX(pos) |
>  		      COMMAND_PORT_CMD(I3C_CCC_ENTDAA) |
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
