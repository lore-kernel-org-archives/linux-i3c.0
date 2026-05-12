Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857EECD343F
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 17:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4bTJa/InKHaURDG4SgCcloL1EB8LqgdvH2vH/1ULqA=; b=Nzml2qFi4rtXnc
	ZxYNdvUQBnBfKsg39CF2zxjKk3bwc2F4Vtno+XzWV3XnvISRtTMo2UyFROld33kY2+SHMKniqUnbq
	aMEW9JHH2ffnris1UNs+95MWBIcWl4BO1GLOsnr08frJ9u4hsLSQaaJoEzu2J2oPbJJFrANFwG0+Q
	bshVr1IbNsBew7ME+O3959Sycy5H5DGTE+1MoqPfWqLnRVtvfOHhv7JhnlwqqeU20pCMn9EtZTmau
	yemNGywdl9j+ZgC5Kpf1yFymTW35UkXyMkt4OhO1kLFoqCBZzs0Cr9D9uI7aqkdc2C2ptKvcGykd+
	rH5GlFjv8d+NwJSU7Ysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqWM-0000000HTTx-1Eus;
	Tue, 12 May 2026 17:03:50 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqWK-0000000HTSk-0U5S
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 17:03:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Puvud4hr2Aj1mG5zGBnase+6PxekLmbxiBPWIeWzzQ3U74FKrPzrP11q6Om5SqkyThZpQ3KOcznWYqG/d3rgdqRGQLb+hbwU9/hCzRn+p+C0OY3mw/6g3ZBMVZyeLsuXllZT+3Q3BSs+Ch2PZgqHP8a7UXSjnTRzEGq8ug3q+RsHLu0fmYX7yj8/muqB4LMM4lH6NB8r5LPIJ5+rYkTC2WGXy/4Rv4bTRUsZhqfNrb7WC7Bc4hHaXsoTq2bOdXbXrW59spXm+i7f/4JVDNIuzuWoawRvECPPViNxXxSSuAIS0iMDAdqJfFgNYqYLHPLw3FVmuTuydiACAMmzejsImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Awp1s/oRq51U7jB8D4nmcQXImCe4e6mQEwtJrCYfFGQ=;
 b=fVWAXwGE8+5fYjtZjmPgZaaSUZY79SZ/QbI5hDQT2dEOFkHMow8rt8b2vfOgVOkmTwcvutye/vUlXGbBQAZ9L++e+VGCBb6vD4YrHP93+YTswOxYJZHYpndDKZ66wrz7426X56Wxs8Pmd5dIgG+4Y5h0QtzK83iUgBDQsmLPfvmzM1Iqk80ykdVXIv532GmyDy7OqFT3F6FFfToww9jmDs18uabgbSlwl7KckuFwhRC0hAvgrdX02X4ej5P/bxEwx6LeNt+U83eCW/akCC30xGiPxSQRp/bqKIbb7/4CrhZYoIaQO9iypD7cQIvK9pdTY8+9dBlDIBsPL8HbxzVFqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Awp1s/oRq51U7jB8D4nmcQXImCe4e6mQEwtJrCYfFGQ=;
 b=eWlMomHlrI2KBZIl2I2R1JtZ5MXwfRn6BORQx3ryqU7vLLf6giUYM8+qaHewy6AqGaILSQH0YscjTlVP4cfn7mD8/YB9QAFLaPVeXJl59SzcZE5lPI/Ejl546Aa4jwnjXI2wgGxsIw5NR7QKYYd6hUNIWLO/afYXSaj7x695r96VYZCoi63xOuc3JPq5HpOPcBDLj1LnYeTzCs71EAllLoZsecRjlzhrtOAKl53E5XwfftOVgcGFhOfZTFJctLPLLxni/fXdZdr/tewRi0AH2vrt2rq4REEVHS30WkQC43K2qYjtbIy0zBWbsznGmnuohmNFlgDUhAewZTOHsJmnAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7207.eurprd04.prod.outlook.com (2603:10a6:10:1b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 12 May
 2026 17:03:42 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 17:03:42 +0000
Date: Tue, 12 May 2026 13:03:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 11/16] i3c: mipi-i3c-hci: Factor out reset-and-restore
 helper
Message-ID: <agNdaBruGi5a3tg2@lizhi-Precision-Tower-5810>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
 <20260504113352.38490-12-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260504113352.38490-12-adrian.hunter@intel.com>
X-ClientProxiedBy: PH0PR07CA0110.namprd07.prod.outlook.com
 (2603:10b6:510:4::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e6708f6-d3e2-4a0e-ce1d-08deb0486bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|56012099003|18002099003|22082099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: 2UNNJmpJbwaL45qJE8W97/1qzsIpIEdke1pCISZSYLVfbUOAUDQVyubcd/UJ0GltvZLunufXYAWj799/HXSNJ2UKQdW+dgHlPgUFmto0/v0ULVaY1JlWLgIzZXbTqLSQh5UXMcrDomT4rYz4dFlBFCP5/tA8Z3KbCMNGhpZ5Z0TLqlXcMgYauLoRaLtRnKOwOWjQQXVKu5wqQKeN/cOVn7yurcc19l2cfsfTEqzzpi8RthKOEqH+/ypsQ7EPQVYDCgC4SZQs3Q+4KK9vz97PsnhbU53Z8NKRuC8/cQ+TdHugCyW4dtJUFDD/GNrRpNRsFpttPaNUqJDurRmWf3xgR5ZgU4i8bDcz23QYaMMiGh8wgZ1WiTtiM0iAU+wqlzRiMV8y2k3da+Fz8BNXJ7GWdoeMwhAxunaiKre7iTuTBUYz6WWUUa8vam1MjzwRHOhvApiWVWK+Q6ix9iu+XvwTdmY6JinAZomNoAQ727wFjfAKLwyuYQd+QXo1cEqaWjyhXeaonEl3aDJ1+Icy+TXXS0G38S7EaUJAmEUu0sT2j6BTuEDCOHMPrEnfQ+KwmoOseNkaS1OfWwjmmFW/ZKTndcv7KkQGZec6OQmFditD0wBHFmCHZYoQ6eQQj5xA1oc3Lt2sIyQzFi87VX6evr5C90ZKImfu1IYcXtuyTttmexkoh5Q1ZVGLMIv28+tffepQ/6Nny8awMe7eM4rGovCLHT325ihulY2G0n33/G2kY1s9Dg64UKZF0hQIx82FtW4k
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(56012099003)(18002099003)(22082099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NWTJTR8/jQNDB5quvoI6/s+05EL2gtXMaS5YHheCgKtLXmzTjg9+6aIdRJma?=
 =?us-ascii?Q?b1XwpSoyFiAycLFZbX+N9TYByhAtl6QpCpLXNhlIHoye2ltpoutpYwa3veGh?=
 =?us-ascii?Q?TPmNkjFJ+9htcU1CSF+JN0TCqYsK3yBifhM0i1hpKD29GpfbjKw+fF4jOdIX?=
 =?us-ascii?Q?f+KvFGyIUfrAvuKK7wAQk6/cXn+zrDQYa7YEo4mynTQrsuoCwpulV+Obdlt/?=
 =?us-ascii?Q?D6th4SGCSgtQLoYu3sc//uQG0OzRvbA8MVqROKCzWwLU4TKCTfuRPBd+dDbO?=
 =?us-ascii?Q?pT22ofHy2tiApGkhNVrwgBwoQGu29stl2NaCGZPICA4i3WZtF2DwvpIdUfVy?=
 =?us-ascii?Q?02jEzvieB3LQ+OmIBgpijOQ68aL8pf6rvQsnBXKbJH3eq/WaNERYpggIcEUx?=
 =?us-ascii?Q?aymygZBkh/dVCa1pBJuDMydASgrAJdMMG52pD12MBTGXFBgQesbTyI6U4lwZ?=
 =?us-ascii?Q?KqdvgZCuaIebOfxD95YlZT9vl4xIEnBztj4urGlr0GKoyjfuf3ZRfMYU5pgE?=
 =?us-ascii?Q?sR9Bj4Dl7Oa1iZbmlgmEzP8UC/V0rYCzSq8IqPfzuQXeMANMq31amNnXeF6E?=
 =?us-ascii?Q?gev0RAzPMv26t5YXZYPt2zEk5NRqGtQFaQXotg8zOZSrc9Ji2Iys1kg1xrpF?=
 =?us-ascii?Q?aeMwy5J7wUm6wbR6n1uXon44p7MI6lXtjAfRFczsOUWz9L3VqgzNOwYZmSDY?=
 =?us-ascii?Q?f29JyUzc9IS8EunwUFC52V7FzeFZMt3idcMHtDsfaQpEvYot7yHvF08qKVJ7?=
 =?us-ascii?Q?1x/Rdy+4+DMNR2231TZ3wusRUZtIdLK3Dwhof+8C2i3n/6L7OCRs14agHTat?=
 =?us-ascii?Q?WrAAdHZB9Lhxx2BwnezGwz7K5DMY1zzg5st2pVfJcbO5vLnd5FR5HqhA+JbI?=
 =?us-ascii?Q?KoZkYwBuMVsYDgS+8IEff3vvua6/IHAKPZ2EFX4LEdR9cXQPvQ51XmDWms3D?=
 =?us-ascii?Q?fubjQ6IKJGLsgo+dp+5tZ1f4iuxHZXI9sziKLGI5Vjmeo7uIKXIUx6R6Yxs0?=
 =?us-ascii?Q?uePrRRP0lZKWxglb9thZUPsCWoIQxmrrIOPzwdtqG+gF53cvjftHl1sdi3sR?=
 =?us-ascii?Q?gqLQwwqf3kw1I+TNU7FS6JB+V0N4nqocdUXO0H8GhX4ROlhOJ1JcvDL7FUCP?=
 =?us-ascii?Q?xubbq2kOvhUtRt3px72sjiLQB7/mAZD6cTRqc21vtxNpMPTtvDj9OPKo7UT8?=
 =?us-ascii?Q?Qu1IexfDdnUSpV9P5+48QhV5rEcDVZFZRFUO8Zj0lZNKvWTJQeU5DmSTmCT2?=
 =?us-ascii?Q?pbgoGsqj01NH+qdoMGMAG8x3tvuayDzV22xzdej1zh8uVvFqKGRl87tqEazL?=
 =?us-ascii?Q?BmKp0ax5rIrOxR20IAM7PqLqanjoHz369WSS2CZfx5GWywHFr9zGc8kAaEjx?=
 =?us-ascii?Q?z14YhA16BPD1EcqB3rRw7BaXQbSWAqiICXjQ2700O07YG799cnWOyHjxadPN?=
 =?us-ascii?Q?jbYgmnNenO+wpqGvufMyc6ZHlduDZETtZTEzA4fji8UVPo4oqVn1sQC/6FIj?=
 =?us-ascii?Q?SVqJVsCOAlE/dHMd44XdeIegPILKNczlrg7IfSL8GItkKCxm0+ET+5xW3H66?=
 =?us-ascii?Q?UOutMdioGr+nMNSKQ745htRiyrRaZiYiG2KZiIHfLzk5hABRY8O5rAfucOWl?=
 =?us-ascii?Q?0IyoI0NS5hho9Hale8sHQa/k9YUOzVD+J/INgAgjenzqOVwmiC6eWI2bvXdm?=
 =?us-ascii?Q?2lZnWXmIZ5t4c+tnmKqst/t9YGwFxBUAEfrXvTz467IOvuuB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6708f6-d3e2-4a0e-ce1d-08deb0486bc1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:03:42.6800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGjXd2oDUbNkelz8/h6kMjNxgwuEWGhSSf8c27W7I/VGELKZfkP/V+fc5s6CXeK2U92hl29l4Dv9kKRi7aVBeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_100348_163389_08B170E4 
X-CRM114-Status: GOOD (  18.73  )
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

On Mon, May 04, 2026 at 02:33:47PM +0300, Adrian Hunter wrote:
> Factor the reset-and-restore sequence out of i3c_hci_rpm_resume() into
> a separate helper.
>
> This allows the same logic to be reused for recovery paths in subsequent
> changes without duplicating suspend/resume handling.
>
> No functional change.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Changes in V3:
>
> 	None
>
> Changes in V2:
>
> 	Drop redundant i3c_hci_sync_irq_inactive(hci)
> 	from i3c_hci_reset_and_restore() because it is called by
> 	hci->io->suspend() anyway
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 19 +++++++++++++++++--
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
>  2 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 8274c84b16be..12a0122fb709 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -798,9 +798,8 @@ int i3c_hci_rpm_suspend(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(i3c_hci_rpm_suspend);
>
> -int i3c_hci_rpm_resume(struct device *dev)
> +static int i3c_hci_do_reset_and_restore(struct i3c_hci *hci)
>  {
> -	struct i3c_hci *hci = dev_get_drvdata(dev);
>  	int ret;
>
>  	ret = i3c_hci_reset_and_init(hci);
> @@ -821,6 +820,22 @@ int i3c_hci_rpm_resume(struct device *dev)
>
>  	return 0;
>  }
> +
> +int i3c_hci_reset_and_restore(struct i3c_hci *hci)
> +{
> +	i3c_hci_bus_disable(hci);
> +
> +	hci->io->suspend(hci);
> +
> +	return i3c_hci_do_reset_and_restore(hci);
> +}
> +
> +int i3c_hci_rpm_resume(struct device *dev)
> +{
> +	struct i3c_hci *hci = dev_get_drvdata(dev);
> +
> +	return i3c_hci_do_reset_and_restore(hci);
> +}
>  EXPORT_SYMBOL_GPL(i3c_hci_rpm_resume);
>
>  static int i3c_hci_runtime_suspend(struct device *dev)
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 97c31a315a6e..a3151c26827e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -175,4 +175,6 @@ int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
>  int i3c_hci_rpm_suspend(struct device *dev);
>  int i3c_hci_rpm_resume(struct device *dev);
>
> +int i3c_hci_reset_and_restore(struct i3c_hci *hci);
> +
>  #endif
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
