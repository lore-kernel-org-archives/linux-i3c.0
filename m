Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA858CD8C9F
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 18:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r2iErN5h4qvSRdl9TL0t96FF81d7B388/94ivg+INEU=; b=oA0wfHLmFXOzq1
	3GCSGcs+FBxQe81PAQYqb3GzkAVYhHw4bfqHRP+Sb754FKPn0U2Ec7LFfCoc+WTKpCpL8H3LXt+Le
	CADzM8eu74D5nVP77Yhnq0HpApOK6Q95N3+ZewFjxNcitFZ3330uUWRX5C3N5NeQnTkhJLraMAxSt
	pzJ1qZS4ZziJJskmFI2WP4qhnqhaGoDy/faDV/7FInpx1ZdgG3HMSraJi+/stA9yJRAsAA4eMJgNN
	iCPQ40q1siON3JXZr5DoDQcsu7T8Bvi9hTAgb5PXnmRwIYV9T+wyc153LncB7jN0NPB0DHGatnlQu
	ABjP2t2k0GEfwBkiYb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWeNC-00000004FR8-1wXP;
	Mon, 08 Jun 2026 18:06:54 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWeNA-00000004FQO-0jRx
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 18:06:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I692RcKmYAJZ28jYmUrZpKiG5mD6MtSgJsa4lvwoGZ6BS2P02lAgHutvNLW25YtbQPCEw5X1lcq2RHaiH0PD7XUXZTucMpmY+ZllrYB2YWGHSx5C7J0WMIdnABlRmzrxJHcFPn+nFe0HfCQNxw1kPMOmvF7pHZpj7XqLkPkmIiMkv5fhOyGsRWqxFVHXlg74mFKQ7gL7RvOE54wsEBA+TN1ud/utmBD2L9wvUsVMyrJiKpMSMq246YWO/9IzaWvYVml15bGdHT0dNgTfDPY2obopHukjiNBjU3OhYfM+shDl0alQ3qluwteIObCvr/olheSXvI7vgR0hPHdh0rod/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4wCOVNnwHKuFrP97KqGHI64/cd7SAu4qGrgphgsWvo=;
 b=hVCDVk0woLupwK/3tzOIJfAKWJ3CKcq0+JuBni2/L9PoYG+p94EBDH5OKKrN8FGP3caLwJWmzwIBXMvJckj0IfDYQV2zYTtdug94fx/5LVynU6FFrc3Y+F1npysxORn4r4vsdlB1BXdUjE2923j5EmbS//UCtdJoGQia6trb3GdAobiiNtdyWO8MjAsHono6+qH37tul+T1E316xLbJsmScmIiqxAoKP5yABOZyjn/t0WXvlrw6ybEXCoYJYtmXIhiRdXglf0hOefk+inJQWSTVPzQqzHmIUbvNYJNbOuH+6tQyahnrAj3SaJyBHA9UTxC2r4NSsqeA4Dz/NFtn6WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4wCOVNnwHKuFrP97KqGHI64/cd7SAu4qGrgphgsWvo=;
 b=OHPENw9bpWIo4PyO9IFPYH6+nQex/nhKYcm9qjsr6n/JhYoC1vxqrAxaAwIMDm90vgPPPR+UdwjG2uMfbrwm/oVHz8pABk9bUQCwVv6SpOAJnCFp1gGOPjtCipNbi6vP4D4NcYftVv7VLsW2nfu/5iWX4a25oURHCTZiLmkwznO5A5OVIrzKr6BRzP3CRprRygc4M4GP5+p7eBa1r4lVvm7lWe7p9Ezy/8/fizI448UsDgzuGPTVdNurWAhWhER7o0NtwoFOhopU5C9ofUj9LqX5Tvqp7+O/X2KEAl91HRnHnO7V5ZrPIQMF5zs2jEC9T4F4ei2ygZ5bRWMp306JRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9407.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 18:06:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 18:06:46 +0000
Date: Mon, 8 Jun 2026 14:06:42 -0400
From: Frank Li <Frank.Li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 7/7] i3c: master: Reconcile dynamic addresses after DAA
Message-ID: <aicEsjs6oZxp7R4N@lizhi-Precision-Tower-5810>
References: <20260608075801.16111-1-adrian.hunter@intel.com>
 <20260608075801.16111-8-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260608075801.16111-8-adrian.hunter@intel.com>
X-ClientProxiedBy: SN7PR04CA0067.namprd04.prod.outlook.com
 (2603:10b6:806:121::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b0822a-a132-4f81-91c4-08dec588b451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|11063799006|4143699003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: gZJyqOcdDPB9EgQ4fAx/eAhzeOOYzKa2Ai45KscN6IkgF2xonugctrSnYXErnwwuoG7JlsQ45aBonjfBCnPKfGlpmraZz27606K8lpTXqhwf4PuxuGi97c4fQsR59AIDu8bla4nOT9BVAeYoDoF8ElEtAIwUljv5VoFLiMxzRlJuf8U2QD7goqHh+KdinyvozwlFW8+W9YELPxoDqSZAnGIv4g+/AdUjCS61N/980Q0iBUFUBjHZX1SKHW3mv0NsHPpff77mlajHvWbRWTuk4ZDWEVXMNkac3hiKk0vLcu0Eo7mu7pvR6cRQ8BPrxTlfsg7hyO/40NtreWSZ2eLT+F4EkynYXpaGNv1AZe65ClNIksbWTzxbfBQcmxg508/32sEzHhT60p9BdWScNTi/i7Rfq80FV9YvBg+yWYwXQmgaUnsOs9kvFj0D6vR4tFjbiOpmJ8rMQQXV/neI+u5OCjUABxh0zXc5QD5O2yQdwPzqY8MeDq/MNfeWIw0Adg3B3ghb5ibVmikvqSBWAUzukLfxDqQPn8iiEGXQ5HdJtCm3zP8EDE8WvuO0Liw/IEOibT0Po1N99znJiChRGS0e3m2YfZG9lTNbTPFt1l5Mk/MC++7lmeDDc6khuHITFWFkqEmVBwfy8u6EKGbH69guGuu5b+M82RpIJBSiyEanS4VIxdh2GNSEnjKPyrS9rp5c
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rA0my0+lmWg9y7kb0KL9uw8SWEAHmj7ssofEUEijDpUPfSURuahgJqst++rI?=
 =?us-ascii?Q?Af9y2MAbrJbi7pigFlRKkC5huWHlR0pbQbz/xD9M7XM3KziG7+MvOrQplE/F?=
 =?us-ascii?Q?WHw4ST9rSiltGaFZNgkvhzcbSVy6U2aA9tbeDvuoobhlAUJWQL/fPgsEtb0V?=
 =?us-ascii?Q?GKDDI0gtebnvkQJmTqI5tvIy6GWdyRAf7UJ7yhcbIMhEiWcrQzLDV6AEZziI?=
 =?us-ascii?Q?nJesgxawocH5xbcqB+EQKVs3IvjKbsyjNyHQBcpxJEaggpo5dLfSSuVsaN+6?=
 =?us-ascii?Q?ZhDzfNJLmu/JlKVou7vHWzd7LCAxWNXaXeCXVz0huo7/rppcj1I3a2+JqBR0?=
 =?us-ascii?Q?MXg9pnVZdO5fct2pWtxyOvdkSiFleSRcgyyxPTLqOd0x3FspfkXAxJ0HUbn3?=
 =?us-ascii?Q?pnXA+T5YEyXdHswc7oOEK443f963hAS++k6j1nUZdiFvi1WtMl9Bpx5iy/ku?=
 =?us-ascii?Q?y42xqNjWQ4HhNOJeaaMrvQlIsFF+nCtJLF3EH6ZeUH0jyYpWAsg79OgUTdtc?=
 =?us-ascii?Q?i7cZMEN8F8ksqm1GgwkIqwpbS9tkYOXDJusstgn+zxzgFhCFP5gh2YNE6Pso?=
 =?us-ascii?Q?mXgyfZJP3jRN6Q2g0hb5oZniZKSUOFQw5/BTJP3yb6B0Rubd+xH3XKgpaNtu?=
 =?us-ascii?Q?TnXYHrOdJX+gaq2M+5DyPJHXlDrlbFD0Jbei/db+stJ7GLE9POeLw2vOYIe0?=
 =?us-ascii?Q?5Rm48wBZWtyG3sl0Y+6IrsmOaEIv4+S5D1kILWK0uyaJKtrRUoiVMiHWX/yP?=
 =?us-ascii?Q?ycL3moEYT4wCYUlmzL/KjM98zOCvqFMgXP4dFcKoBcumsRD8PH9QPCrPETne?=
 =?us-ascii?Q?ITuApELAANwfR2WucFBY9N9Bh5YbNvqeaRl7/f3pb9gsjeTAzpmKf6vJKcty?=
 =?us-ascii?Q?eyuUKm/1HPMby/DUFTGhBRtQcZyb1Uv9wmVODcnxqiVXdVGharn6BrKmUmnR?=
 =?us-ascii?Q?D2/Wiv2lHmiy42c46Oe3ioGmShyHLusAZWoOPcnDrDvLHKSuSt0CmQdm30/B?=
 =?us-ascii?Q?wjZj/+slCjhEiww5aVOKe8hmnQEtDzx22bC3QgvqgSP6trbVKTlZcFOVy+qs?=
 =?us-ascii?Q?GkGJ1KpvKL8wU9drwDlrMNqf9n5+34p2W5Mlm/xKWiP0eZyLultRm7T310Aa?=
 =?us-ascii?Q?GJg4mXGHGnIT3PL94qslULlgNd0OqCJp1atVR0Pz/tPTYZx5OdufqMp5ETU/?=
 =?us-ascii?Q?Z1frC3VgrxZ3ixV6VIh08Rs6XPwi14tMSEDjEE7+KSkNwYl++6MHS3LwEnCJ?=
 =?us-ascii?Q?aUMxwPUZzixJbybOtgk3Gsb93q15iJeuzeOLyqiaqj3FTWJzStlD83myZHlf?=
 =?us-ascii?Q?yYYscbXcKZLHhsUOhhnkHihvswzGfvzAGMghRcojWRZeK11otG5VTMBlLCuH?=
 =?us-ascii?Q?2qYkyq70d83OuR82g6/hAGxxg2l8VnAhNWujAs1TMNdF5hn2AW4R2f1rQfkI?=
 =?us-ascii?Q?Q8QclVQutam/+dS+ozz66HSBE1tdV5QDw8/+/jjzOJsirtnmSdBjjxRSc4qE?=
 =?us-ascii?Q?aDXnxDPVm/SJBIx1Bwv9/ui3BJ3hHMThF+lf0hGUyAUt55NPscPMaXlX7U3N?=
 =?us-ascii?Q?g15dfAI6hJSOCPhDVAtgeJ7HxNeVcVkXR7yiz0F0JnWxXIU+iDcp8usLrb7p?=
 =?us-ascii?Q?VhUt1Nia72grW7HGR3m3SzdD6cpxUmfhhAYoLj6AvGo7uFWN/BtyKCMC5r8W?=
 =?us-ascii?Q?EiV89ES4hGkKUhfNyOgH0kTPbCTC9lTIO6oXCapfnQWuhsxYMhWd71Z5s8kb?=
 =?us-ascii?Q?ixLeiEcvhEvgsCQd+7T0yIWKwIdVvZjs3zbEr/f32ZjRCEDNvHg8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b0822a-a132-4f81-91c4-08dec588b451
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 18:06:46.8265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUdjg5+7pP+SFP482wdimxfQ0GAKpxHtSPFqJfj//hS/w0EcXgEoVW4hPf3+5VcoChVfhFB3KsaJtl0iLBAx7myyiFWz7A2s6RJHw9vIMi6QyKy71xBQLx3WvdgOCYZd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_110652_220768_5ECF9413 
X-CRM114-Status: GOOD (  34.67  )
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

On Mon, Jun 08, 2026 at 10:58:00AM +0300, Adrian Hunter wrote:
> After Dynamic Address Assignment (DAA), there may be cases where
> devices have been assigned dynamic addresses on the bus, but are not
> successfully registered in the device model.  This can happen, for
> example, if errors occur during device addition, leaving the bus state
> and software state inconsistent.
>
> Introduce a reconciliation step to resolve such inconsistencies.
>
> Scan all address slots marked as I3C devices by the bus, and compare
> them against the set of devices currently registered.  For any dynamic
> address that is marked occupied but has no corresponding i3c_dev_desc,
> probe for device presence using a GETSTATUS CCC.
>
> Retry the probe (with exponential backoff delay) to handle transient NACK
> conditions.  If a device responds, register it via
> i3c_master_add_i3c_dev_locked().  Otherwise, free the address
> slot so it may be reused in future DAA operations.
>
> Note, i3c_master_add_i3c_dev_locked() may fail (again), in which case the
> dynamic address remains marked as occupied.  A future DAA will try again.
>
> This also handles a corner case where a device is assigned a dynamic
> address but not successfully added, and subsequently loses that address
> (e.g. due to power management).  If DAA is run again, the device may
> receive a new dynamic address while the old one remains marked as
> occupied.  Repeated occurrences of this scenario could eventually
> exhaust the dynamic address space.  The reconciliation step ensures that
> stale addresses are detected and freed, preventing address leakage.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V2:
>
> 	Add bitmap.h include for bitmap_zero() etc.
> 	Re-base due to changes in previous patches.
>
>
>  drivers/i3c/master.c | 115 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 113 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5021d25b718a..6656c8591fab 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -6,7 +6,9 @@
>   */
>
>  #include <linux/atomic.h>
> +#include <linux/bitmap.h>
>  #include <linux/bug.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
> @@ -1613,6 +1615,56 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
>  	return 0;
>  }
>
> +static int i3c_master_getstatus_locked(struct i3c_master_controller *master,
> +				       u8 addr, u16 *status)
> +{
> +	struct i3c_ccc_getstatus *getstatus;
> +	struct i3c_ccc_cmd_dest dest;
> +	struct i3c_ccc_cmd cmd;
> +	int ret;
> +
> +	getstatus = i3c_ccc_cmd_dest_init(&dest, addr, sizeof(*getstatus));
> +	if (!getstatus)
> +		return -ENOMEM;
> +
> +	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETSTATUS, &dest, 1);
> +	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> +	if (ret)
> +		goto out;
> +
> +	if (dest.payload.len != sizeof(*getstatus)) {
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +	if (status)
> +		*status = be16_to_cpu(getstatus->status);
> +out:
> +	i3c_ccc_cmd_dest_cleanup(&dest);
> +
> +	return ret;
> +}
> +
> +#define I3C_DEV_PROBE_INITIAL_DELAY_US	20
> +#define I3C_DEV_PROBE_DELAY_FACTOR	2
> +#define I3C_DEV_PROBE_CNT		5

what's these value coming from? from i3c spec?

> +
> +static bool i3c_master_i3c_dev_present(struct i3c_master_controller *master, unsigned int addr)
> +{
> +	int delay = I3C_DEV_PROBE_INITIAL_DELAY_US;
> +
> +	for (int i = 0; i < I3C_DEV_PROBE_CNT; i++) {
> +		if (i) {
> +			fsleep(delay);
> +			delay *= I3C_DEV_PROBE_DELAY_FACTOR;
> +		}
> +		if (!i3c_master_getstatus_locked(master, addr, NULL))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
...
>
> +static void i3c_master_reconcile_dyn_addrs(struct i3c_master_controller *master)
> +{
> +	DECLARE_BITMAP(dev_dyn_addrs, I2C_MAX_ADDR + 1);
> +	enum i3c_addr_slot_status status;
> +	struct i3c_dev_desc *desc;
> +
> +	/* Mark all devices' dynamic addresses in the bitmap */
> +	bitmap_zero(dev_dyn_addrs, I2C_MAX_ADDR + 1);
> +	i3c_bus_for_each_i3cdev(&master->bus, desc)
> +		__set_bit(desc->info.dyn_addr, dev_dyn_addrs);
> +	/* Reconcile the bitmap with the bus address slot status */
> +	for (unsigned int addr = 0; addr <= I2C_MAX_ADDR; addr++) {
> +		status = i3c_bus_get_addr_slot_status(&master->bus, addr);
> +		if (status != I3C_ADDR_SLOT_I3C_DEV || test_bit(addr, dev_dyn_addrs))
> +			continue;
> +		i3c_bus_set_addr_slot_status(&master->bus, addr, I3C_ADDR_SLOT_FREE);
> +		/* Try to add the device, but probe to see if it is really present */
> +		__i3c_master_add_i3c_dev_locked(master, addr, true);

If dev add success for addr, but you free addr at previous line, any
issue?

Frank
> +	}
> +}
> +
>  /**
>   * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
>   * @master: controller
> @@ -2445,6 +2551,11 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>  		if (rstdaa)
>  			rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
>  		ret = master->ops->do_daa(master);
> +		/*
> +		 * Handle cases where a dynamic address was assigned but the
> +		 * device was not successfully added.
> +		 */
> +		i3c_master_reconcile_dyn_addrs(master);
>  	}
>
>  	i3c_bus_maintenance_unlock(&master->bus);
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
