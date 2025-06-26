Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BB4C7EE31
	for <linux-i3c@archiver.kernel.org>; Thu, 26 Jun 2025 16:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7u9LlWTkvWaNmr8elD+DCuqksk1WFVSLNHmeHz+RNqk=; b=fof6gTGZ4+hywB
	7pVkpYEBp/IVlSG8WYVRUHxzC+TQDIXDgRqWRT3Agcx4yabeAevlEP9gYuFSoruFpN8OmcEB5oJGa
	dA/SEheJtsq98s/EDrARfCt42Wn1k8NyB/OeUad1FPlSg3+A3mm33kD7ekUOWyKodfvtzn8C1T9M+
	YDBur27Bp88c132tGhRikEzc8s24IMDeAfh9TxyR/41lqFWuRdsjfqR/urfERDZpZ24Ifool4iPTo
	+03vk+LsqUkVK6k2AHgWCqaA6CFTVDrrGcKhf5OYJHZmugHTM9w2hefHarig6WenZpkPiugHcah0+
	8/OmX2WnKcaQplTXueaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpti-0000000CKJk-1I20;
	Thu, 26 Jun 2025 16:56:26 +0000
Received: from mail-westeuropeazon11012018.outbound.protection.outlook.com ([52.101.71.18] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUptg-0000000CKIw-0CZe
	for linux-i3c@lists.infradead.org;
	Thu, 26 Jun 2025 16:56:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZiRdilp0kKz4GCjqE5YmUPR4hs5BkwR1JiLFS2UuK6SCbs5ugmB6hFrVkiZicPuE6PnzZ67D+DHG7vbw3rECQcHuXOeqqIgLlvkgfunxCvZ+8eswT62HA/OyCjivkNgVRqEZr2ZxyzsJH4WM9u+CysMEaMiGGkt6Ve+cUu7r98Epn7lWxpna5UC6O+ZVOxMPVrlG1Zbpev6XigeNtS0/+juK2Zu/gTkBR41PdSvlefnz9xWexznwyGt1C9mW7XeoLqUswELxds2d1XowWhnMoiQlcs7PJ2MeIv6lJwqxxDBUxKrf3Rix6A/cxPQTdM8veBkTpsKX/bfgzXksxEu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Umw8nKDJRcoqYeHMVEGkYpklzBhXJAqW7wTSlz6lLAY=;
 b=oyj/xHX0sxgPc2v1YRD6kSbARrPiW2SA+4WVi3EHDd5Gl6mc4lCRA+ZgFxo8KVypUtRC7lXSm2gB0IZXMi2P6XCOnheF2FZW0lDmSaFTJ3O2QechtseAcsAtyv5sH8nFxvaV4P9pd0Rq4IqiLPDsW34jggaoSnBXvEKM60eEK+ICE9eGPFUMpKJK6T2avaF5eIVcTf3wrfRzEbWPcQlCvunKJjirzD4TGhT73zNBwJCZCeoel3teRCKbBxUOB0u0ixjwsD2KSctg1HpqGzSVSto3m78G5UnZF4jH5s8WgPZlviUdB1xEyK3r97v8Lvc5g0lmEe9NN5JKh83VMGkrmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Umw8nKDJRcoqYeHMVEGkYpklzBhXJAqW7wTSlz6lLAY=;
 b=fnlDpR/y3xzK9O0wl+xfdoDFvQaKYAqz/qh3iO4BWX96RRGnTJilKDLmyb+4lgHIB5zBS+T5bFoSbJ9aqqk/Pdaa7euav92v0sIXo1AZRj176SEuzd/mn0uaCtvgBAsTq841dNw+On8Z8oveXoeV1AkViJ9uunyu1SyqmrgXd1np6FuIwIyUPmYWz/hSE7MyT0zbZ+YquCLb7vuST9Dt/ZC0nQcQjNuVjgUa0z5PcB6KaUiSsCdQiPIUWRUaIcoRmLuaEgVEoSvdnFb2K1fxJn+aKN1N1Tzw7iy2KJdwLA4jqGq7mr29zthAhEEq4ZPd5/cEYzTsU5kbyMbLEyuG2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8149.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 16:56:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 16:56:20 +0000
Date: Thu, 26 Jun 2025 12:56:16 -0400
From: Frank Li <Frank.li@nxp.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux i3c <linux-i3c@lists.infradead.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] i3c: Fix i3c_device_do_priv_xfers() return value list
Message-ID: <aF17sD+4F42RL0PL@lizhi-Precision-Tower-5810>
References: <20250626042201.44594-1-bagasdotme@gmail.com>
Content-Disposition: inline
In-Reply-To: <20250626042201.44594-1-bagasdotme@gmail.com>
X-ClientProxiedBy: AM0PR10CA0131.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::48) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e94af45-b6c3-4ec5-bfc2-08ddb4d25fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iydRgRwYM2gXQxTdHWE1q/eAu7vDITisWckQe5GUDTGmNfAwgJ+8+gT9ERho?=
 =?us-ascii?Q?Cu7G65qLFQqMrpmhIM4bOjEMqj4Flar5DmQ4X71Bm23OsmnSRQ8Xy8+obvXG?=
 =?us-ascii?Q?FkY7DvAfFolDKj6t0ulJsHkEGBcXw60Naj4yADjJKaW2xtXHpCmsWBR5Qrth?=
 =?us-ascii?Q?/XunIf/s5E733jmG6Mh/Qe3z2t6hSBwttKsuXwaDvYWkKishImgDa6RF/fHo?=
 =?us-ascii?Q?MpttPcVdsgGAPzXRAPXqJWIZc7YDhQo4hsTA/bthfRvTAaZ+dj+m9KPOSGKL?=
 =?us-ascii?Q?eApa5Yh+IbMkKkp9Hwa+ohGeiUNScfbL/E0Dq4Zac5PKzeRa9hsn4J5f36zH?=
 =?us-ascii?Q?V4+fSI4+nBTl6nfdWF35GiuOuayLnr4Mcr2PaoKWu8mJF7iE8x5272eJdiGD?=
 =?us-ascii?Q?GhO6lRZ1o8TrVGIicw4XArgDlXbwkGzxSPhEsM7+mUA/Firi1WOBfZOU6GsS?=
 =?us-ascii?Q?JVrqQ/catIF2ybr+Z62hMFjDfXcDGkf6Xv4gMbezwuSc6trUFjZMHLXrLDMG?=
 =?us-ascii?Q?CDQ9uxQy+ouH+3EOAP5q9w7nxksvqGH4TxepM+JpSiKo3qn6Qi+1y/Kfy8yk?=
 =?us-ascii?Q?LnKGE/IXPKR6hnXEEbL/Ze23IhZH21nEAjatpWQoqkiTS5bAoFEmgziLpmUB?=
 =?us-ascii?Q?vHZTmwxakEAfmrsOAtN5Lg6xkGGHJoZMCTltMrAp9OrGJd0rvP4U4mh7vZ1g?=
 =?us-ascii?Q?L+QxKXA5Xdn38EzJtDLIuoanC3KQqCSsZIaAnmi+6okbPvCk7SgfYmoDa6Gj?=
 =?us-ascii?Q?5vHvLHSFYIOvzOGiKeQI3yyUzW8vSsepHeI47kMh7aAJTIrYX14qX2X5kbdP?=
 =?us-ascii?Q?TCqkLSlzHynfiBmu1D7juOrFnMUQuIyMun9zRw2YmFRWEsrQvyIeifCPon7t?=
 =?us-ascii?Q?uM9wbRH6xSqx+ubS+DhokNxeDPLiaYOl+uuWgLrfPV+U3NeQuTMRUBl8Tjem?=
 =?us-ascii?Q?YMFzCND5/dCMhasBocePd9xkNtgDF7fVrTYvKg0yQ0n7a1SzXXCD5bRrTC0y?=
 =?us-ascii?Q?Q2+2CYjMnzdnrChVCKucw/tUBxS39kLjpkPACSzlvT78j4dzr8vWSuEXVNTt?=
 =?us-ascii?Q?kBY+mLx7wTsAIzFhv9Ooz+YFz+JRlpZw9z00WqtDXbXxA1dsnFQ0OK9zpvBu?=
 =?us-ascii?Q?dwBO9E+opG0R9UAU8RVXyMio/RaVaop5V3bE84r9e4KTNZ/15SsT05Xlp0kR?=
 =?us-ascii?Q?E1fqjcoxE2zN/ZGye+/ZsKwIRERj+4vGAGSKjBfd7ULJO3iGiULl2JlEqLHL?=
 =?us-ascii?Q?kOIYn2V8srPu2kfhpxl9mGczCzObl3e0Lv5HiuQf7gYBseivtGr/PqO6ps9b?=
 =?us-ascii?Q?8R9l7W+NnoJ9HuAuiviBTuFTeRMHw0Nb1qij818QAgjfpDOnL0/MzQlLdDgK?=
 =?us-ascii?Q?UOhWN/thsyl1lccIvvvaNVJ95KDUgut0+VmWg/GrOomAX2pVPwN1iq8x+Hcb?=
 =?us-ascii?Q?zsMJxeQO5Q6oyS7R4fKG9FeMwbyqgfBV4RaWSaXWge1Qd5maptyYag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dWjeYLWsENvzalMA0Te7oGAUqJ9MdBo0csIwkImL17lm7WKjpmy3IyHP0WcJ?=
 =?us-ascii?Q?0K+OR08gx1ASmquVAQZOdn+mIUlrc2hCsvHvVkFf7T0tvEaKr2lR837VwBGv?=
 =?us-ascii?Q?l00m+PHg7f4sP9q3bpnUR/YD3PHoJKdjTtq5RRC6olYF1n8VrofwHA5Dljvj?=
 =?us-ascii?Q?j/IrWCucZtL9N8vjhcTfnhcW0KCDP2aFqE7W7pOh021AssJqamEc1UMjS15B?=
 =?us-ascii?Q?ME5SlpALFZcu4pGf5qOSr9IgxRLPPCU9emgRz0TxyprQW2qDO93HxjZaoSVW?=
 =?us-ascii?Q?RS0LUlwWWTr1FSrKV79T+nCWJ7c46Dr+RNVBP/qJRa7lzo3YCiOERUGKAhF/?=
 =?us-ascii?Q?BNibs/J4Tl2iFK6WDhkD1glJf3ruO3W84w6kgoVbWIk8mjk7JtC+BO/KFCbT?=
 =?us-ascii?Q?69MP9IGJOUC9rjUBJUy+2HZV+ahsUEHZYz5wiNuYeEXD232I92P4Dt2zFD22?=
 =?us-ascii?Q?cZU18MWMS7xIUxfLdLtHJziNzeni2Zhnpk3HugQaF84gKJMFgSwjusPPgtmw?=
 =?us-ascii?Q?c0hm6G3T/y2SDVgC9rUHmNqr604pw4Ab3D3oUpFtSJryPPjVk3FF7yfNdU4n?=
 =?us-ascii?Q?muZqTBAifdYLxXzmtxlZx5yWKQ4tyaPW9oFK/GFlp3A9SOjBDHOHvtn4+kF9?=
 =?us-ascii?Q?0aQ6DFwhXzA6QMfC2ch0H1OmY0mIgGDi/TtiafebTBk7lfopladHvKTz173P?=
 =?us-ascii?Q?Q9Ql+TSJTLXqF2R7G2GGHji5OnNhj618OHhE1jIB7I0W9642H2INuTYxRxza?=
 =?us-ascii?Q?gSuZhy5ptLIrFL9KKBbjJLYRFQrhm2UQkhUJU1SA0RPdUfltrUd8I1E7OwlQ?=
 =?us-ascii?Q?ZPxKDCw3LODOmmjXzlsqJ39+N9DS2+F/bR980+kWzd4xkPU7OfGuPj2In85V?=
 =?us-ascii?Q?sb53kiUUo9ns4RWYfnE1HXoLIBwfTnavgp4sdoyHlXjU1BQH5D0ZQdnrDOTY?=
 =?us-ascii?Q?KO8efbnOeKcvBdt5ud2qKlQ04VWFGl2GEv4pUJzv87y6XB9PqHldeSh1rU9V?=
 =?us-ascii?Q?ZGdTGQw+tk8Nxi0UWwjFqo9yXb5QN5uf965OgfVoVABvaXH/FgB/A1jqoFBp?=
 =?us-ascii?Q?ASM9J+1hPjbY6pTP3w/1UwdkW/yYF/C2BENxW2lw+29YYi+WxW36ODd95Rw+?=
 =?us-ascii?Q?9Moj+YcsF9Gy4VW4LPuRUmHWh8fnuSZP9gX3jzztOidNI1BOhfxuWAwprcgS?=
 =?us-ascii?Q?L/6kp1hTkd8JBT3h+VdFAr/kyheg+MqDijTZGSk030vXF0q9MbPvWowleA2V?=
 =?us-ascii?Q?3tNYdGX6+rbp8u/qiPVsaoKXD2d9ujMnVv1847mxCUZIROpSJWwnKkmR3grw?=
 =?us-ascii?Q?mTVqWlFjVNxSBY95sOomq+5k0ECjCPHIgrBLbzG/GMTg6pvD9Jswo+BVkm7A?=
 =?us-ascii?Q?eyvyaesndTFYk6bxWHEWCAq0mwkqbMmFJpK/7ENV1VCDEXj6NHUjRCOuZRGU?=
 =?us-ascii?Q?e5gvTT2kfmN23/f6PAtMAqLTxsrvYjv2z8mHXS/mhFgsEbMmKyoOwShT0sSY?=
 =?us-ascii?Q?diU6u7opaP9IpflUh/B04E+EwsZ5IhrXQUwtR7tqL03wtVM8vw3LvP14BnD7?=
 =?us-ascii?Q?nRxSF9MSJycgjqiFqjtRXODGJdWI3CgzTmyxhRYm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e94af45-b6c3-4ec5-bfc2-08ddb4d25fc2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 16:56:20.0754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FddjPNsrbJEiFoyVzevvrHmtgPkNwTzdcYNytdVukWpdYBznLrh8SJfnJ7YdhNHC/1PwAHaLJPlCChd9GmoAOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_095624_088332_8DBF15F9 
X-CRM114-Status: GOOD (  17.35  )
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

On Thu, Jun 26, 2025 at 11:22:01AM +0700, Bagas Sanjaya wrote:
> Sphinx reports indentation warning on i3c_device_do_priv_xfers() return
> value list:
>
> Documentation/driver-api/i3c/device-driver-api:9: ./drivers/i3c/device.c:31: ERROR: Unexpected indentation. [docutils]
>
> Format the list as bullet list to fix the warning.
>
> Fixes: 0d2596508201 ("i3c: Add comment for -EAGAIN in i3c_device_do_priv_xfers()")

Needn't fixes tag here because it doesn't impact user.

subject:
i3c: fix kernel-doc indentation of i3c_device_do_priv_xfers()

Frank

> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  drivers/i3c/device.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index e80e4875691467..205fa5066387c8 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -26,11 +26,11 @@
>   *
>   * This function can sleep and thus cannot be called in atomic context.
>   *
> - * Return: 0 in case of success, a negative error core otherwise.
> - *	   -EAGAIN: controller lost address arbitration. Target
> - *		    (IBI, HJ or controller role request) win the bus. Client
> - *		    driver needs to resend the 'xfers' some time later.
> - *		    See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
> + * Return: * 0 in case of success, a negative error core otherwise.
> + *	   * -EAGAIN: controller lost address arbitration. Target
> + *	     (IBI, HJ or controller role request) win the bus. Client
> + *	     driver needs to resend the 'xfers' some time later.
> + *	     See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
>   */
>  int i3c_device_do_priv_xfers(struct i3c_device *dev,
>  			     struct i3c_priv_xfer *xfers,
> --
> An old man doll... just what I always wanted! - Clara
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
