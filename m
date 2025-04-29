Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6156C3ABA8
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Apr 2025 05:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iYAh8MKDX8IKDtC0BSLSQ2Cc4LC8UF+SnjW/fm1ngyY=; b=XhQ1LVo5irTVaV
	r9uODE7zL2B7AS5SwHJIMiTk2pesrqFDftwG6dzrq5LXFUgPdYiR4zb+dMZ99ywl5oAz8qgskCGH7
	WE2zSjG0+ykGdVg1HLaAr5d6Q43KFsrovziS2Y6+0uW8VzADc+Wn9Lts4xhFtTjFmBeX3kQZg30SL
	t3P96UGkc6nyzyjJ5OYnbpSilsA9uRLzeB0SBVqjYlGv6C59QRtr15qa0txpq+erxKBpMN7xDAmjn
	rzhxR7ItklzcaEaP3BWEvgfGlCr7XD3DHk7STiCwHQkfMssaJ/E3YQ+nCXkC9D5MyHk83B1Ip3r+0
	tRSBuDQovfzdxbaE0ewg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dgq-00000008PUO-2NJe;
	Tue, 29 Apr 2025 05:39:32 +0000
Received: from mail-db5eur02on20601.outbound.protection.outlook.com ([2a01:111:f403:2608::601] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9db5-00000008OnR-1z5e
	for linux-i3c@lists.infradead.org;
	Tue, 29 Apr 2025 05:33:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjFPYkhqQ+ErSLsyXNI6c34TKanABbUZTys77se88SnwuG6H7kvfpF5gNqIdMsuIiAa4d950MXbRQnLMzgoR2rHSbeLoFAKMlRotijLS4/vRRMo6MBMmOGLSkNSDKEU/CHpThqDwrP0Dl5HQb2zGpIAgXMfKZuEFsWAqHuiZMSoy2df4OAB9RGfh8MtU7WHfi6uXWfqXeiOi2cpKXS7VS3myscAHUNnpFA/Tfk8oqt24r/TPDwZtSTAfJaPaKQTuq6syjfpJWuNXqxfbpf7rWPVr1k6hK6tH9MSdwcWLTqIbfbDFGwhWTx4p9RfauZHvYvYK0Jxv1rTMSoIgl8JjFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lb9NPeLqAp0/WF+2xQ2NmZZcW+CLoMIaf5qiF3247UM=;
 b=W7Nd0VdyWS4Mpf9oa9Uy9N2sk3xhajMZXj2XVWCPl5oyH/Ojofu+5BSUzx7CwdgH7q9hOpVM5GJE2vijv8igRVTtGSGkZ0sCHGAgZ4zS4WCAPiayKT4s2iwu+jYzdqCkxoYjO5NmM4dRAcar2G5fmWBYVCd/tn0QUeKdB4W/c0BNgcE8xgRuRvDTIW1zW5oGGEnwV7RTRFeBWEVzrG+gDbk7/V7nFO2q/22G0pRrWqMX54Y+AB+Y20/M8Bp0/FvJDLyDFib25fH4EHAnxxA2hfP0upb19fD/cbuqWN9s/McBAhGPFKZnYdtRWZVudSLInTgQbbPU0uPkTBg79PZQVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lb9NPeLqAp0/WF+2xQ2NmZZcW+CLoMIaf5qiF3247UM=;
 b=O+YV1e3ELjztotyvbDs5X+KGmfi+fWeaiTGOtQcxgwOQYr4KzcfaolS2QnGziBasNMTbQvzzUmNs4XTCt7GUvX/lwx6VxJxcMd0V4rnIMW9rj9NJs7m2j9LAgAkyPmVk2/9HsyOgAk+J5Jnp+r8fhrZU+lTgDNntpIAZputMoUCjHUc/24ATgYIQkdysDmu28XG4i+bClB80Ogl9GAUZWdA16fJoW6ZZC33xe7a/k5jFslg1q6HVrgd+f8erC5yx7yOGLpXMJxHs1/0EyvoFPQnOwxzjFK3hICSL8stCueJtPo5NoSJkKsV4fTgP2J1seAcJzarby1JxnEqeByx3Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7949.eurprd04.prod.outlook.com (2603:10a6:102:cc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 05:33:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 05:33:32 +0000
Date: Tue, 29 Apr 2025 01:33:27 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 3/5] i3c: mipi-i3c-hci: Clear INTR_STATUS
 unconditionally
Message-ID: <aBBkp/Bkc50NW/0j@lizhi-Precision-Tower-5810>
References: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
 <20250409140401.299251-3-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250409140401.299251-3-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: PH8P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: 0337770f-a794-4c21-f545-08dd86df6136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BMEqwL6Wzsp6VUBOLATO21hSCp2PI2DufrL47mqmsbAkrHxo1X8eTwmNwIud?=
 =?us-ascii?Q?IEo3N++RJHUXyuviv+g39bCn9vv9BwpBKp5KpjzQvf5aaSxuhOLAG8w6Y4f1?=
 =?us-ascii?Q?e3s92BrxE1tX6uDVyt7+voTkMdiVPcfwOclhGkQjEzPs0N6V7l0aLrDqY7rT?=
 =?us-ascii?Q?eqIeiNWhyViNJYkPLLwHIhWkZMDKVxyz1o6GxWeMiVV5LnGomFZ9A3+0GWi0?=
 =?us-ascii?Q?i4eCwZ9/wTbX+T+3mWgMr4hrS7EhA0+jpNdk6QlSPe+aby6gkxPSN4QxIP3L?=
 =?us-ascii?Q?UwK8XsNiAABGTY+pHbzX4L9A/wPLdAXt3BR6CoK5QPRfLaxxFkQxFKMnJj81?=
 =?us-ascii?Q?EKngLgLWU7k0xuDUun66j6yDGKGRT///KhBRKdou9ukKznEI48XjUSGPZso2?=
 =?us-ascii?Q?JiruFxQ2LRYAIEA/ifAw1cZIXQcRhFLTXzWrZZVJ7qyU1vvLnAWjur9iDZMr?=
 =?us-ascii?Q?bgpLiP5iGDME6NGzvqfSVb5rT/XpO50VE+GZMfycV1TTChdkEePI+mIg5YkK?=
 =?us-ascii?Q?VHgL5R1eIx/AcJgHczxDaFBCSvcgFfTtCI8lqmbUz83k6EdvcX29MyqXU2Zg?=
 =?us-ascii?Q?hnGT0fiXfJO1nv5uTs//QUHT2BnE1P3l2dTz61ola3MIiMtToDpzgrGdLoTE?=
 =?us-ascii?Q?3lPIZlEqTu6xE24+2pOQELigU5BTb87YX/TdTuSQyxVP6smVGkST70PSMSq/?=
 =?us-ascii?Q?XfvciA1wR33abmOl1596onJbH8oEvBMu7p+dMdcxTyBsCew53Y2PKudgAo8x?=
 =?us-ascii?Q?hNJKVrML9ZFoP8ErxVdjlhcidOj96Qytlwm1x07BMGDeMjYDPuwh40cE3+A0?=
 =?us-ascii?Q?dVIru+5JcSnt20aGbCNOvZTPl5qbVnweysrRIADMPOPdSfGIMyBTLadXURtG?=
 =?us-ascii?Q?gmACjyThumDSkvXIuY7r3LPiZrmEcgtcfoLkwkTk+Nlo6fQgbFDbLx5MoiSw?=
 =?us-ascii?Q?fO22NAaxaV6v0C9fQXAyZ5yMnuzgaVq4UFVGlH0AyspvIBndNsVcjxjXY9Gd?=
 =?us-ascii?Q?dFn2AHSTPtHVfgyivzKMQGfccl4U6pEVuc41gu+Jsg18OIsBfaDoETkL+Y4z?=
 =?us-ascii?Q?4mNoYKwlZfra+QUtGbmfgTJNpGFs9p0Ynye/M5XRsr2oZqg5Uf1+btSkmI41?=
 =?us-ascii?Q?xA0b0hCEaWeDXPLYrVm52BBDTPUJjkcUmwJ+Gzbs/rySthvixyEwuYMtYa9r?=
 =?us-ascii?Q?y+McT+GuBFsMuV3jwQ/ru1xWcjFNuFGtqLa4b3cRw8xaHiU6gObclriB/E1U?=
 =?us-ascii?Q?aFF/ZCnswTGT+bAZGYUIJXZBJgxCzuUaeuC0IOO2Or5y1VaS4LUDXkjOuvZc?=
 =?us-ascii?Q?upPnhUZ1bTooYQ6SKvkTKLrCWBJZ/hBWSr1txskjtxiRb8DTDPMAC+q7B3tX?=
 =?us-ascii?Q?Xd54rJ7ofCdMQhd1XOp91RfI7v+p1M+fbDdjVa3cpvytyQu/+AeDGWr2nKIX?=
 =?us-ascii?Q?ObIysfkz8CPucDgg0RgO+F4P68uSQP+p2h72qYbXvjd+pBL478c4NfKjwuGo?=
 =?us-ascii?Q?NPR868/Yqkh8buw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aOYdYTcHkVXld/T1Pt+W1p1Vq0mNNQJCrbMdzXZoxrEz0u/4iRsnvQVMCTSE?=
 =?us-ascii?Q?wQMVHyvkKAG9LWU3GF3lfkQmeevsFb5QGTSzQEJM4So0JlTQan/dvZnBmbpp?=
 =?us-ascii?Q?Wz2u5NNAvikFYnbJGTkjNf1yd7gbCjf356dG4Go/NYsn95MfF4YjxD4Ze00D?=
 =?us-ascii?Q?HY0LoFShbNOjvXNnkCggDVO4uIazBZLb8yeOLufBPEp9975pvjdUjx6kZ3Uj?=
 =?us-ascii?Q?HxxrGhcrdWDxr9uRS86OnJmjLT9qnUDXGD+Jay/7BirJpyTJYEOZTClQQjda?=
 =?us-ascii?Q?bnEQp6aVPW2Xneo5ddwbG8jW3G4jTOtBe1yLBHvBzZhY1kYUtt9ea6nE0MrQ?=
 =?us-ascii?Q?K3ed6Qrniy9OVWIXJL3Bcl4Gv1UOlD3M2G10tzxBNSk5L2S2Ku0FmMRRuyyZ?=
 =?us-ascii?Q?TgSHJVbKUm0L+6gXOhRnx7X6cb7ZRLALdHoeyiy7Q/CYD5EKFPvgv6FDWahh?=
 =?us-ascii?Q?S2aBNfI9p7mKiEuUNtG+zpOAqRZKq4vHV4988c1yRqokzUwZDUOki6NVRHQK?=
 =?us-ascii?Q?Ass0YxYmdUKmViMDHHrn0Qs4ojaHUCVWqqvlxF6E6rnaHtNc048ay+hUBE+R?=
 =?us-ascii?Q?aTS3Hpli8OwDYGy/bvXQ8e4lhtY/2fLtDPMjEobUDJmjGhBgXdsT8glJUORt?=
 =?us-ascii?Q?tDhMO7tDWEnBaj9X545QQleZ8QMF4ZNCdcknHPhsEmbQyeGmWFvqqhKzs/G3?=
 =?us-ascii?Q?wXbEsutYWTfjmOsqXg/qcaoRKLpccfV3Cw8eWVVeq2W8YxiNfYElHkfaNX2U?=
 =?us-ascii?Q?KZzHrfcGi7JCPVePC/SFXzizz0PQmizEXYPr2jYvk05yQp2EzlVk+0oEmPRX?=
 =?us-ascii?Q?VQsOZXEGENvoebsud/4ZxtWCAr0wBVzokfJLYHEoQqd99msXVSkaNdSCnYW+?=
 =?us-ascii?Q?B/AIyzi1RV0ANS9lP/FolPMlMtPRAqFxff4qk+uo7Y+GAPZXjQKE1hZSer2v?=
 =?us-ascii?Q?S2WHBoT09U0Fsju2puoaa1UoxgcDsBe8qWSJfnG8+Mm+uv/mFXXSmrkaOI4r?=
 =?us-ascii?Q?tj9hMyR3Ci9OOaTefvWsBy9gLSMzUvswsZ89EBs3G6DIjzVbNjvPo+4S9DL8?=
 =?us-ascii?Q?9Bt4qbCP6Q1YPQlVV0Tx/eF7UERhmTZxLFZGCG7dN6Q3Y/4YQ+o6pIk1FRQL?=
 =?us-ascii?Q?9Jalk6oAzyf/DwZ3kr6vswasZXHhhYLklWdRmlbPVoJFWc6bcUgLaA5GZIFC?=
 =?us-ascii?Q?kBOUlXO+2tpDhA1NP7EFHjtsGW/fxZEpO1yxu9NEMGfgkFTi5oJntrO983l1?=
 =?us-ascii?Q?s/6lLslbNGoQ7Nsb3DVVPBbFMaFoxSgqJeQNY45YX9y1Em16pn3tRND1iK0C?=
 =?us-ascii?Q?QYUsHlEWv99EDq+H4XyQAUdvX2z4W+/rAfNHovUiNUIwYX5a/9ftIWCoGNjh?=
 =?us-ascii?Q?NdtQcrpVE4UOWZzOmdfqTYC9gqwz0tv10XLkiWll2jm6+AVKKDiP2hPgDPGR?=
 =?us-ascii?Q?9VtWFHTFg62fQD0CxNtEYC8gi/+AxqqZ+2jBBRhpn/+VAj2e8TPLea2mM+SR?=
 =?us-ascii?Q?XzhEG6YDP3eo/BU/ydfOcnkNJsraTBCqgizE+n6eMwUZJhrcV4f+ZmcpIbUD?=
 =?us-ascii?Q?3b7wQ2DGeoqEm4civXo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0337770f-a794-4c21-f545-08dd86df6136
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 05:33:32.4853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqaxUpKytJEQNfj80E/BgLz2TknXxiF5AA/kZt8GJ0JEa0kE9SdpNgTW8t0MBponbnx2/x2A3jYRq2n7ykydmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7949
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_223335_515791_65487753 
X-CRM114-Status: GOOD (  16.48  )
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

On Wed, Apr 09, 2025 at 05:03:59PM +0300, Jarkko Nikula wrote:
> Status fields in INTR_STATUS register are write 1 to clear so do it
> unconditionally and move clearing of them out of an if block.
>
> Suggested-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 780e9db7e21e..4c4100d2d9af 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -590,12 +590,11 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>  	u32 val;
>
>  	val = reg_read(INTR_STATUS);
> +	reg_write(INTR_STATUS, val);
>  	DBG("INTR_STATUS = %#x", val);
>
> -	if (val) {
> -		reg_write(INTR_STATUS, val);
> +	if (val)
>  		result = IRQ_HANDLED;
> -	}
>
>  	if (val & INTR_HC_RESET_CANCEL) {
>  		DBG("cancelled reset");
> --
> 2.47.2
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
