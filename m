Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81216C021B2
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2025 17:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1kOs5AYUW8wTcQfVk+nnP5zEzv1xCdZItM3iCLGdH0=; b=CDY24j7y5RMCxK
	MbKFiXf5LLkNqroes8HRCwzAECVx/TmTLdyADBQsO8NyDbu9ZI19eItqa7NyphYMMzPMgj5rpC9dR
	s6CLCghgIQx+Vk/ClGBWD+BUi5xibd6sDhwcyMGxGV7XoYf3WgZdQssepAfQ5EAALY5+h/yZi3fbe
	L5F3+wt3hpcuK7uyS/LCuxeb4EE9zr/SWmDm2YDbopqdsMOrc3LEFL/rlB+Cmu0FUDKxGPzMVQMic
	hFUOzh1xf4SCUwJE/WEtxOwsbf3DOVxI8M683t8kHsWywbVpmAK+1SmAP/VtekjrKfG35ZTKZ/EGu
	wHKSsQRRVxnA2MlEvcdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAag-00000002CXn-1D3Y;
	Thu, 20 Feb 2025 17:44:02 +0000
Received: from mail-vi1eur05on2061b.outbound.protection.outlook.com ([2a01:111:f403:2613::61b] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAaQ-00000002CQJ-1UUx
	for linux-i3c@lists.infradead.org;
	Thu, 20 Feb 2025 17:43:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjhSpTlViOdCYPdaDENAaUjk+joQBCH7gSmAoUIMY6kP/+lVuZJKkNWqELs2YzL5y7hG1r9AfK0YqSG9yc49li/HGAdAnXbEuw/OBRr1DFCXMrVhq2YkLGV0vIJdz3GDEmKN0VKlBQEfYE0IjLIV189qhQr752NQM6U6n2oO+GyOThrDDCTj/jeAnZ+xO/B5OtFIGBtoGEsIMQwBG48U5zPElAIyhPPosMgznf7OekBt2zXVDxW0TcpGnjIc/D/nD7Q2hD4tlwpemK1c8vStMpb7JQ4A25ABEOpFiZYef4C9oBHTySYmLsSveYZ5sTcKxp/dtgr3pnl61L1bCWHQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmVc31UtX3FXObNam1H5iB9AqX9y7b5CMKWQ8f5LR8E=;
 b=QsqXoy1CwU0ZNzPsOTgs6ATgYpPnLnL9X2PwBkpwSs/CaNmX5g+TSLwBBnbAMaFd4r1kXXS01jbUNuyrZUqHdNRnO0PI+j2aeJ98R6+smm1UUGkUXQDpe9yEe2qcLi9d1wJ1+up78BRWlODxGsRaoAS5Bl4k8gV6NioCCKz6Q2h7AywM8J36UDPQruFoxV88CTbPZJDy4LNBw+hd6abtSAwoAD0YCPz9TJjIhbD/6rQxo7qe2WBglvkOYN9HwvvX19bh2OZGtmhZ1gX0M+miLt83TZvcn6JGd5UG+kNEvk6UDStw6xW1PaMGQPvPhHfam3Q3m3AuR8//ppWqpn8nUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmVc31UtX3FXObNam1H5iB9AqX9y7b5CMKWQ8f5LR8E=;
 b=mbanfL8cQ9cxGGLkI2qjKE6yneXbTvnCwQdoSTKenh+w+5//GR/lyAWl5Ty/x0MwlcGGtZWKrA20SbbIoU1TunLcZgIWHa09eIe4HOMikZjtZ7Ug46xeuK+4xUrl/kE5tEvOtSgkPlxMihemmv86Z/ys8Qyazjd5e/leLU5/K4spL6Ngv+9tXRJtAysZa8OuWj5LToOiVnH3wEDlG42vACTN2XJLtBfeyV27UZu2sLdv0KPa4UC3hMqMMZ6EDT+TGC6f717gfatE59ewUCDFMmHplutgHB33AhcrOMprg7uHkF4vFFCD/Zs4rBFJ1gGEi7ViRLgFdCGpg0F4XJm0ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9077.eurprd04.prod.outlook.com (2603:10a6:20b:444::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 17:43:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 17:43:36 +0000
Date: Thu, 20 Feb 2025 12:43:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH RESEND v2 4/4] i3c: master: svc: Fix npcm845 invalid
 slvstart event
Message-ID: <Z7dpwL6GGN/Msm8+@lizhi-Precision-Tower-5810>
References: <20250220061107.1718239-1-yschu@nuvoton.com>
 <20250220061107.1718239-5-yschu@nuvoton.com>
Content-Disposition: inline
In-Reply-To: <20250220061107.1718239-5-yschu@nuvoton.com>
X-ClientProxiedBy: BYAPR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b97b5f-df7d-432b-5808-08dd51d61a3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kEhmgFxiuwFhpE7AxJZuqUClhC/sOYID+1+1+XkfGJzobthPwnkDu2KweKpS?=
 =?us-ascii?Q?+6SF4pcqzucyaKwBlhwpEHJbvh9aqYa4WeiTMzzzgH2F7rKZd/RFdOJ2HL6r?=
 =?us-ascii?Q?ZQNvrLD/7ycIR9xnexn8gQNnkBOdVTx4RoK4kPY71MM0uCwYURfrn0LC1pXd?=
 =?us-ascii?Q?wJSOlasUAAjHfCmsO2UPOlrRLLHBh7XpT7ksXfwjuckPtMYu7nQ+wSASMA4r?=
 =?us-ascii?Q?erEuPFBiY3nQiPIEZSnSE09eCviUffVJJzd4mHc6DBh3d0kHCuR6dWC2JYmz?=
 =?us-ascii?Q?I4Ef9mrDpBNX1CSZ+2Li3vp77MiEKXGnWH55Z/MnTUjQe/FLOOevsG5fKUIz?=
 =?us-ascii?Q?gmaUrgBov/Iy9jnwFYivsr2XMG1zTtZIqMw39sd4YEEs90FeH5cDiZ0nh+k7?=
 =?us-ascii?Q?2+++dah9FIEMwCSwkStVZP+iat48l4YrocTK5dJ0Z/7NoQHr87pr1xQf2ybV?=
 =?us-ascii?Q?F1CSl506HLOpVMrLXzJQnZ/lXqpMWMTJwvIRYzz9Jvkp1sOzYgA/RDO792le?=
 =?us-ascii?Q?d9DK6c7Ea7y/0AwwyGHjS9KiNKsGHttbB4MhTuIhPx/tJqSJHNFoh9fu32SK?=
 =?us-ascii?Q?ph+5y3D5cKP++RvBy8kMpB7U1+mCE0CoDf30XJ3nC/sDu7dQvu97ZZvwSSr+?=
 =?us-ascii?Q?FNLbcLjYNFrDfZ6Y7sA0be59+4Cwe/DPYB6ntlW7AUqZ0tRL83kVZXY2RjIi?=
 =?us-ascii?Q?03wQ53tkYztNxf/o5J2/Bl34tvrmeZMvWoLcQ18PHMVwxBljq+CzuC2ALB3q?=
 =?us-ascii?Q?sCogAmRYGgEeKJxLIdepIGLYdlqXVgbpZGuJus8BJDjydLt84DpmBbUjhHvV?=
 =?us-ascii?Q?FSjx6T/iQQDuwxAWI0LZj4/nRBgyCuOzsCj7jGnc0WUgn3KHjbC3STdi6rnK?=
 =?us-ascii?Q?/VvRhOq0zU4dGSX0ScAVczLkOldFQ8eyKMyLbpOv6+JLXvlxo5DkeB5xPchi?=
 =?us-ascii?Q?rJ6oK/EPf8icdRjG/yAE4Hl9zTWPn0wJfvlEQCd9l1eSiaw0t8zTktOnXMiN?=
 =?us-ascii?Q?S0y3qh3Ovu257Wq/b/35+RA2ZmrAs82GGfDPc51P9hwVOSQEImiOIgzba65X?=
 =?us-ascii?Q?lAXxwRcXEVqAaxdRfFCH5bsFFmpO4FQ/mH16tzRnRVvOcxP9EP+GomJejblY?=
 =?us-ascii?Q?jHBFOrU3T+OD3fvZEQZVqnof/zdRtONVwbQ4A6bQcvzxzJJdpLF1xmTB5GrL?=
 =?us-ascii?Q?QaCQjDoOEe0cV6/56b3sDimPPgdwzeUokdN5LZ2+0ypnVkSg+dcoV5YJ+bGL?=
 =?us-ascii?Q?CoHz2+b1RFAV3hgLvARd2BjILQn6n4yqw2s287PB1zg68uyrIWwt59BEcZgB?=
 =?us-ascii?Q?nOZV41hNZvDsdWjQhJRkwDw/iEYSXI3kkCzkpOs1gxbp9UgoVhamR8ORDQb4?=
 =?us-ascii?Q?XUJNs0tbDRBNK8TiX8cWd0DqmSwAeSAGdXGJNxG+sqbKhCokrtScpKspURvw?=
 =?us-ascii?Q?DdgLVa/geUzs6GhL+OqBM1qkUtnn7M5u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9zbzC0xCoe1zS3KPOBei49eMT4Izyc6tl463/B/isc/N9WyEed++5RCWnmQF?=
 =?us-ascii?Q?exMtP7mP9Dqg/XqdixmjXMYrFOvt7iXpSmqQQiCLN1pAlC14KpEALogyngeh?=
 =?us-ascii?Q?dTzdm2Zz0YLV4f/i9RmcRQcViIiab7xD0nG3nMAiXacryX5+n7tG46FD+ufq?=
 =?us-ascii?Q?dCATX+CPC2MRoe0VuE+xrFQiQKhLltFnZcI07YcFmnShJosqdRrBgpkgHKkr?=
 =?us-ascii?Q?MRpSHnkek6SQAJGH1hTBHWcoXiSoMDHqUooz8Tddqu7DhwSDtpWDHPM+UXNl?=
 =?us-ascii?Q?iICJr14/u1CkJRSsMjRvJafVnB1MZLEgLJ0cBOSoekc2OYCT/pOoWfjttpGl?=
 =?us-ascii?Q?1dwChCKDnznYLwEfyehLWC7quYkJLkmP84wiDBrSA9jWx9ORH4O4j/kzsrt9?=
 =?us-ascii?Q?74jJ0LbRyogCsPyM8muXObW0W+1x+RRBYNxfdWA3OpEO84+M43wWtfbKMRgc?=
 =?us-ascii?Q?2kgBSPHQCw+YOIhNYsR4O9GYiM4jqM3YDn1/eDxGRP0MRVuVyrypZi2SGehu?=
 =?us-ascii?Q?G3nKAI9D16KBjNgKxnMU3VTSennaZ40xEvCyOclenK2KkC6SR+PXUo+IPefJ?=
 =?us-ascii?Q?Bv+eU/CDJLCJCTx0skMvZqNFoT4d7gYsFAEaJVnc++ZkDBOLnYGbWLTRL5gw?=
 =?us-ascii?Q?WTi6zyfNNltBZoeuRquxt2VF9j6STmgdIuhUUymjHKvu15RIq/ocyf3boK+j?=
 =?us-ascii?Q?pfsG0DQVwSWHS150S1ark3zRKgA0+Ew5ls+NaWA7lONKFcKKLW7V88iKypJX?=
 =?us-ascii?Q?2eHd1AznKECJNx/5dOV80RmIVULsLVokm//NdNwIEeWF/B/caM5x7joWAyG2?=
 =?us-ascii?Q?Dqr1Pj36ojDqDYMZs93Ax+XnBHipbqAsLksP7Nwlr8qHoJnoXJ5OionQsO4h?=
 =?us-ascii?Q?qPgVKER04NJAKY0lVWYBlQ84UT/sYFGkHP2z1v3g4rVWzfApy7ZhfmraBki1?=
 =?us-ascii?Q?crV9hmcEQUn2LbuIlP5F/g1Nm7kO80GqreBeAbDvt9pUKgb9a/wakgHipFmh?=
 =?us-ascii?Q?TpI7luK7FeLGHPWz2af5OW2KX2zrgqZMGd1F3CX574Tcq86aSzDJuB0iXwgB?=
 =?us-ascii?Q?WMYYyLNcDrYJ2p5rzKAuqI65xyuqlwRjIjnFLClPYxhsN0Xf6QxC+73znAvG?=
 =?us-ascii?Q?RURs9yXkozZXMTdIJZzqRbpOPtvawgCUSKxHRU8RchOD8cl/PA7hS1WemBb5?=
 =?us-ascii?Q?+z4s+xwfr0GbvMQL8w+Xfg9CCg+VImO6ZrOBW3g3a/1gMzisXZbCEjfJhtIb?=
 =?us-ascii?Q?uJfDysLXRoGGzhIS18Ytsgt7xt64PHj3gKhSrYriY87h3z+7q7LP2a7NLHSo?=
 =?us-ascii?Q?Rv8RSdkHcjdEf7LOfv4JXu6/DlvkqYfPb8Mqbs23zinuLL2hczz2/30e9V6B?=
 =?us-ascii?Q?1/Zjf4ClQHHE0FhYkzQmag/1fpLG3OGfSU/qFvw+FUZOfu1ITbXuyxp6wMww?=
 =?us-ascii?Q?GGbW62stUmldPcIfcaEfc0yvhfx3Yj35YCTV05izvVRof4De0z9Z6D7n50Qw?=
 =?us-ascii?Q?/wva1UkfpqJSfTNSdmB4t4Wibz2UzyW6i/G14l+f5pyJVDxM08en6yf/Fv6P?=
 =?us-ascii?Q?/WguCw8Oxji/7yRRAmLxWWf54vchHtMZRQgYk57i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b97b5f-df7d-432b-5808-08dd51d61a3d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 17:43:36.2756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l++BwwshcHmh9BS5cvvr46Oo0rkUGsukGV2J0+qbDrp0gi/TaReiFgvgLnXu4UV1iWkCa/mnDxiKHHdnzr4pTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_094346_399818_AE25F383 
X-CRM114-Status: GOOD (  17.58  )
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

On Thu, Feb 20, 2025 at 02:11:07PM +0800, Stanley Chu wrote:
> From: Stanley Chu <yschu@nuvoton.com>
>
> I3C HW may generate an invalid SlvStart event when emitting a STOP.
> If it is a true SlvStart, the MSTATUS state should be SLVREQ. Check
					      ^^^ is? "should be"
				 	      look like unconfirmed.

> the MSTATUS state to ignore the false event.
>
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master/svc-i3c-master.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 2140da3f5187..5861358eb9e5 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -58,6 +58,7 @@
>  #define SVC_I3C_MSTATUS      0x088
>  #define   SVC_I3C_MSTATUS_STATE(x) FIELD_GET(GENMASK(2, 0), (x))
>  #define   SVC_I3C_MSTATUS_STATE_DAA(x) (SVC_I3C_MSTATUS_STATE(x) == 5)
> +#define   SVC_I3C_MSTATUS_STATE_SLVREQ(x) (SVC_I3C_MSTATUS_STATE(x) == 1)
>  #define   SVC_I3C_MSTATUS_STATE_IDLE(x) (SVC_I3C_MSTATUS_STATE(x) == 0)
>  #define   SVC_I3C_MSTATUS_BETWEEN(x) FIELD_GET(BIT(4), (x))
>  #define   SVC_I3C_MSTATUS_NACKED(x) FIELD_GET(BIT(5), (x))
> @@ -589,6 +590,11 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
>  	/* Clear the interrupt status */
>  	writel(SVC_I3C_MINT_SLVSTART, master->regs + SVC_I3C_MSTATUS);
>
> +	/* Ignore the false event */
> +	if ((master->quirks & SVC_I3C_QUIRK_FALSE_SLVSTART) &&
> +	    !SVC_I3C_MSTATUS_STATE_SLVREQ(active))
> +		return IRQ_HANDLED;
> +
>  	svc_i3c_master_disable_interrupts(master);
>
>  	/* Handle the interrupt in a non atomic context */
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
