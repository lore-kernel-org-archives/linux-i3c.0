Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44A3C5CFCF
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2026 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iq03GH9VSer3W7xReTuGLZnM84l68IkBPHoBMPmgtI=; b=GKg4Rj+K3XKOCS
	yrZzllcrjMcJrMGkYJL8qOclHpgX6QAEBi296yaJKhR441tEDnH7bw8ueoxJpNz4DdnkxvqGwx1ym
	2lPJ0ZfM9/JexItYFwbT3X0QhskDXhMIFIzohUyCjwwh48FJWUjzXTMQRt2i6VZjdJaYpYCOMn1O+
	pFEZBgFOgOuSRBEJEWY9ZTunJiXpZQmwMPo3wFo7Lkd8kmYQEKiGrCTK9U+RM+x/Im1yH+6zDNMlx
	RSl5/gXWLD0Td9kzA1GmvQbmCwzDRv1SfhdIIdEMBy1zb858zCKNoKuGcoCs8daJbQG7XI51cv+LZ
	qQEBM/98oQdq6dinL5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuuvd-00000002vww-0yla;
	Fri, 14 Aug 2026 16:38:45 +0000
Received: from mail-westeuropeazon11010033.outbound.protection.outlook.com ([52.101.69.33] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuuva-00000002vw8-2Lgt
	for linux-i3c@lists.infradead.org;
	Fri, 14 Aug 2026 16:38:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XscSdTn66G/zVYOmTlebnQOsKVt4U4yho3RivaZnM890p3zQKzn7/Nj/FX+8oB3zpLZvjYbzOG9R7JHUBJTkc3Pg4SAU88jBw/krkENTrsKqxE7DI9fmyC4UPiNGWB0fcSwkcORjkndA/IQEMr9lFDmQ7OdWGIpMQlFor8lzcDN97BEhWs7d7ALTZVuvVyWA6CAk5VVanHgVRwucPXW4+MOmeS7Cxsypvobir5wmVzqm7YLM3A4DLgb+jB04uyF14MtVGHPzFrtDp1ME+llfAgABgWgbIU36jXxsmSmsonQogfc0W3Dl45T4d1TAGsR1Dd8PIZFHw1BoEMdsOo4rQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2D/vjLKLdu7M5q7kGG6eNjZt8sKFEfiJLvxQl7oQe4=;
 b=ojYjIoiyUJZJaRZdAQk3bKjNTXS4qn6oyiPrKnBXV6IqysaF/khhVjHy/AXzXj0I0wzr871kcE4gx9I2Cwx41KjeznYDy9KMT0F9fO77Z2grg7RxKs5/Vgk4NWqWdEhrotO4hC8Gz18jvP2uFZHcpL3AtmwIrIG+aAhfpZAVNwvsS6Nz0bTTLYHoxMgQgMgYyA7BW/424R3ypb0O9cItiz8N24b6QgNnVgbfF6ZmETYqHgUGTvUKXN/CrS3G0W64hnfczs9yc+iQOz5E7pkxDIintDHuRWPWXw0DTohfnjOTSZEiRPQJRIBTb2PZ7L7UBSECyrCxlAdCg9Bo4xrCzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2D/vjLKLdu7M5q7kGG6eNjZt8sKFEfiJLvxQl7oQe4=;
 b=Jhx/ZUghAeqi8IqwL2ddx5huqX4B+Cic3++h99vC359VcGvU2gZ6U2mBnCMx33wk5uCpo6l60W1RenMfoPe7HpjNFRF4sLmjxMNXMzqd3au3lPUOJCyo7REGEUzhH6L1+zEMbgY36GrcNiLRql52jqy3obAI/cDL6I08oZR1oWvLeCtcfBdXQUaEiA/m4skgZKhDBYPrNslkw/QIqRDY49Fg7lpLjHOacsQr4TsCon8XB427ILujWXT0q0xRhGkUrGDlRjnZNyiKIXVNSMNSGXyjmwf0n/pO0yxnSrbI9lySQSGspwbFEM8nm34W6TzWpLgJjasYho+bmsYMX2zemA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by AS5PR04MB9730.eurprd04.prod.outlook.com (2603:10a6:20b:677::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 16:38:38 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 16:38:38 +0000
Date: Fri, 14 Aug 2026 12:38:32 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: dw: reduce do_daa time if there's no client
Message-ID: <an9EiK2Sulx8jye0@lizhi-Precision-Tower-5810>
References: <20260814042015.25397-1-jszhang@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260814042015.25397-1-jszhang@kernel.org>
X-ClientProxiedBy: SA1P222CA0108.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::29) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|AS5PR04MB9730:EE_
X-MS-Office365-Filtering-Correlation-Id: ac27ea96-180c-47d0-b452-08defa227ddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|19092799006|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: U2AeO5EGy8Mayjo5vk/XuJWgh5AZBMl3INFrTwEQ8ew5K5GHlx+87VR3MhnvFV/b1Oqu02xy4l2O187rKgqqJWl69fWUiocKf0aXhZWNMBm4Cw43OV+8dwuuSdLPv/0SOqAm65+bpw0GR+mMJ3ca+sR90YR2TyhtDWN5oLRWfBwkK/h/7/khZ2RlxDg40RXLyinYYNmvPNm1wIPbOkT7zSvs5vzgJdEvm89Z0qkzHbAiGzszDPN4grpQgAKuZdMDcGcbO7p+3G2+MViHQ9DgPYcvxgG77VndoI6b+cTZSxMU7pcQvN+LBcq37frk6nmQlZ93KtzgvNKcIR/My2J79KOnak6FsCwj9S77vKyA7jgLAowPymvvFy6OrhgS0ZL388xf12452Xn6OteU0Ql+QdT56/jepM0GeExQI11XE1GDG+/kB0t9XaObq3fW4+5rW/TrdJHzSBV2EP28CobNuwFodk/+5RPB+qq00dwbDEs6FOQXp8InLzp4r+etjRGLJJcK5u+NFF5lUNbhfx4gjRtgUwP/3coMc5WhI2ojyxIw7u4Tf0azP260C1oAhlyXGXpZgsj8duE5REQP7QaYInZ0Kouk87ZRHcxbJ1v66Zl95Cy07d5abiCDaLEsUMkaZ8653iWYXRRvdz4qktaG/sqEpF8Vr3xo0b5tuHT9OWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?be6CseSU8oc0MQO4Ra3qjDvw161TgVew8r6Nx6DDIc0uyEcnNDLrMXUKM2b3?=
 =?us-ascii?Q?oksNqb6Yp9tbs8TtXtQCF7ShaGGsa4uu9Fw9PWk8Ia3hXbGihtg17N6zFSCU?=
 =?us-ascii?Q?dzSMEeloZP3Y+sIXF2vrOECTL8wjHMGpQRuNTEl2NFdut477K7KxwrGZPhMD?=
 =?us-ascii?Q?g1b0uBGJpPGjBtGnweGw3E4EIIlI17NmUFbnKj+o6Ha0fZ5R/IJQL9KbskUV?=
 =?us-ascii?Q?+Q64hOPk7oak3rIqgOL7e/EFJeEm8qWE0LsmNLsN9yU9DWYQuSvd3NFWIFW0?=
 =?us-ascii?Q?3KZHW5fpjAvReUEb5Eh0cBSC+n7eN7FHxqeJnATMVOrQ01SD2kt4roDop6Rh?=
 =?us-ascii?Q?nQkCarvgmGZ6Ijgy3y0kpCL8SIgnZ9WQsA8rw1tE5GST6npH7StghtoBquk2?=
 =?us-ascii?Q?P7XxOXO5mmfTMSLELetCL8Osqzh+s1fYVwDvMsl+bnA+/m/uTVdNjgl1DZDD?=
 =?us-ascii?Q?WRyW+GKuDAFKg4fUvflYyazg3XU57VjW2vaZodXM2AqnIlpCC+ZrxPTBZ2j2?=
 =?us-ascii?Q?0N/PJtveqnaGnC+bXaKhk5yMW5JVOiYSfEmwem7cJ0iJl5/4BJMN4gr1Ndjc?=
 =?us-ascii?Q?9NqPcItIdk9mwPmQZDw5WByMyido6NJhJyYUBSYRUwmqk7GS7AUTPArIIIkP?=
 =?us-ascii?Q?J/0Bsjo2MuCrXI8hdCMJzr0ur+eLjfM8CU5tAG1N/AIUYRxlD2m4azoJ1qPA?=
 =?us-ascii?Q?gQk11+na1WZSEhQSMfffbOeP/WAQW9qOxdzHrC/S6lZp6Ete8aeBycML5xkZ?=
 =?us-ascii?Q?ysBurWq+2DJ48W8b333HIe/P+0tiwp3SX0kCDqimNpmLQ2mnuJ5M9R55JNJr?=
 =?us-ascii?Q?Bg1rrEe18ph9p4qx6dIgk+ytyu3YQDv+AejvXivb29b5G9Zn2nUCrJJSBldR?=
 =?us-ascii?Q?JLE4W7T+18PDkTFfRFOAsuadyLGsvncgBMFNdy/Gr87FKXglp8j5TRZ2OiFF?=
 =?us-ascii?Q?XCOJyMWitVKknIVcIPs4/xpNc0DhH5RpB+38wLTBguLiq+EO7IaoozqpgDjy?=
 =?us-ascii?Q?UO37tb2Pj0FlY5RwCGgDDOtjYxL7twxNr4CLreh4dbJsVjhSUESM6/PqR421?=
 =?us-ascii?Q?zD/IFheYjx+iBvRJpoAyHGIRjkSMKKeU4y13JszRjvZqszmsgZSHAGC4CO4t?=
 =?us-ascii?Q?Ze/FcLGSbLL4lUekgUnUpFtLZ6T4xHGe15aIG/CT5Z+0hZz1oe99tYa1AIl5?=
 =?us-ascii?Q?pqKJ7j3A+YFlnM7XMjCN/e1Z6Ug8KE+LKXU9IkGzhW9gPqv20ERtyXxWRGoV?=
 =?us-ascii?Q?1y7ZrGuH2qvo56ICTrz+x4GmTCbDLfTi+Nvbgp/d4KbKR2bJmhpt0RA2CtUu?=
 =?us-ascii?Q?+BTJVGm28VP3k0XGHkaZDWRDUKCEmBOJemmgbh/gpYFdjA+RacuztcLYGsdk?=
 =?us-ascii?Q?5RBZdSOAXaZAtDqRIl3/i2LGrorPL3xzigm+Csqh4lqmvv2g72jy/LZjk162?=
 =?us-ascii?Q?TXw5wPaZchaVK1giVS04x2boB8yzBfw4aDiikZTwD7mjZ4hwo+CGNXF7IYtd?=
 =?us-ascii?Q?QR2g1rh/QzvDp7lGH8PUpd9NcSK4DF7RZD5tiekg6dGGYOsannkZltoAEq8B?=
 =?us-ascii?Q?dZEiGn/6vSUInYbrRGSYeH52GvjasJ/LTQLiIAbNEbtoAVfL6DZSuXyWDyui?=
 =?us-ascii?Q?kD/rWibI02la+sz7ObPTQ1uDGQn6pOWwR1YZWNgcCAyFPUF54PhY0XAevFVE?=
 =?us-ascii?Q?K0RggoZPcrDeMvqo3ClPuEMmm1ekTJZB1anL2uX2MpvVK/3rob5zq2j/0Vdg?=
 =?us-ascii?Q?RspGvPSAzI7aaDTIqIxwANiHKpRDL+Daopr5fKo20I/LmMz7YQ7Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac27ea96-180c-47d0-b452-08defa227ddb
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 16:38:38.3206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LP6MWUdB2fRt/LJDgyMIQJeUH7ZzQSCOncbEvwKglzpZpyYqEBaojYUfcbH260Y0aOpAFvj9ZzMADwfaOISHU6Kdvaosehy5N2Tz1RH6MbfkUGI37JHbxioa+s21xEnH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9730
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_093842_622797_E9B4BC7A 
X-CRM114-Status: GOOD (  20.81  )
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

On Fri, Aug 14, 2026 at 12:20:15PM +0800, Jisheng Zhang wrote:
> dw_i3c_master_daa() derives the number of newly assigned dynamic
> addresses from cmd->rx_len, the ISR sets it to the number of address
> slots ENTDAA left unassigned. It starts out as zero, which already
> means "every address was assigned", so a timed out transfer leaves
> that value in place and it gets used as a result.
>
> If there's no client connected, the addr assign cmd times out, then
> the driver calls i3c_master_add_i3c_dev_locked() to add devices that
> are not there, each costing about 1s, thus adds non necessary boot
> time up to (maxdev * 1)s.
>
> Start from maxdevs instead: no address is assigned before ENTDAA runs,
> and make newdevs as 0 if the existing rx_len >= maxdevs.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> since v1:
>  - use another method to remove the non-necessary calling of
>    i3c_master_add_i3c_dev_locked() if there's no client
>  - update commit msg
>
>  drivers/i3c/master/dw-i3c-master.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 1053cfb05c05..883b542c7bfc 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -876,6 +876,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
>  		goto rpm_out;
>  	}
>  	cmd = &xfer->cmds[0];
> +	cmd->rx_len = master->maxdevs;
>  	cmd->cmd_hi = COMMAND_PORT_TRANSFER_ARG;
>  	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - pos) |
>  		      COMMAND_PORT_DEV_INDEX(pos) |
> @@ -888,7 +889,10 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
>  	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
>  		dw_i3c_master_dequeue_xfer(master, xfer);
>
> -	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
> +	if (cmd->rx_len >= master->maxdevs)
> +		newdevs = 0;
> +	else
> +		newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
>  	newdevs &= ~olddevs;
>
>  	for (pos = 0; pos < master->maxdevs; pos++) {
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
