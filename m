Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA95CD98E1
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 16:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/A8OyIbY74PXF+twsyVIOsamJsC1f+K8PfYNUbKZzcU=; b=JTc6j4DNTCELcm
	lC0IEUL+76zc0oDx35ZkNSM62iNf46JJSwZyJxQ9oWI0tZhy2kylHlxaROgCsXaA/4VXi9JLzdRh2
	39dHZH/7fN9cKr5rBtv92DUTAVgvUruEMavPxL7w9ERc5KuMdKql+x8Uo0TLx31vujYeke8fKHMeK
	VoE++m93vuDXXEF40+6iq7a/KB/OmtO8ilIH3NI+CenxIEChaSNg9j8WPBZLcanrvpE8QaTIaaOT7
	P3gpPrYM0gFs9givQ54PGuduXOnFefiPlHfQKsIQ1y9pEjxTMzzrxdSmp3gimuS0loweIPEEd2LYj
	OyOIrOv4C1YjDy6GoL1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZX4y-0000000G88H-1OoN;
	Tue, 16 Jun 2026 16:56:00 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZX4w-0000000G87i-2Xx2
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 16:55:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmi1Bc99vl1zylWNHopPMj9R4Eb83cAToXzFU9JgEfvsj1EosLpKW2MYXfg24Ww1k6dDxHnypBwmLJvW366E0Uc70kyfmi0XdG21oe2kaBM8pMAloWjKB9ewILQ9d3D16un/5I3rtdRJy3LHZNbYjMSpx9xd8/66OFwlxfVsMSscH3Tal5bvTzR9h+VQxH5Us1CaNp2ZEFZEQQdha+dx19j3ect6gEe9lUtXvFf0KdqHtVa7HOamo6wpFkT/j9hJEQ5th0DiteBgG9bE3x1jLhNPe0bdgjUdQJvollBvtpJ6/fN8uB0CmtDJyXFBENgIEaLhO1QGWMRzGbsIPLS+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbkRCJ5/l/BQKcfiCxkJRURMnu1HXphwTjhOa4pp5rQ=;
 b=gpIisOJAQX6psXsDErIYZNDwNKak07zrxe9jc8fgtO1/yS9duL+3Qbc57LRN3DlGaXY2TjB2t2RfwKU+rzn8acw9jGz/CAVItg7bMDfccWBHgbzOXMFQfto7RN9/yW9YljDEnLC7RV6QHlaat2Tg+/Ygcvl3LCFu+Jr0uy3D/swo8q0YRLzRmbZEhdPnumfzqEQFkfQ4TrahwtncF4euMIGfx+HlxGGvWl9oE1XIXWu0WA5Ll70TO0fGkpHPMz4KcdeyGiacjo2qKmDcxjUsdtu/qKjuYcoem20XNhuqUDDRU53KxMbVzt8bYyCqMuZbuE4yEAeUWvVc5TUTkOEdjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbkRCJ5/l/BQKcfiCxkJRURMnu1HXphwTjhOa4pp5rQ=;
 b=nQfjdkNnmQOlXuooF3etkF/WwdVp9jn7sG9KnGKQAatPMIzNTVKG4uaHfT6vCc4RzkyPdZWA8pSOaACndRC85qC7grtbkbSRqTmMeMXPJZX66hHJsxJW+FvxlTBkepllm2YfzfrSB/p5U3ZgrvjeX7XjJoi1Pia2Tmt0NwyoghXEFgrSH7ZU0dZOypAM/C4HW9CNVO4//GI1FQqbAGYK30Yi7AWyJ74At0tYSP4OOF9YhBwVxZqHHnJNXJatMfGFiUxnz0qXpLDPobE4zc+q56KLRWaqH6t5hxZXz0vBamGBtCzWHVVj8iZMv4koHI3VgKIGpYE2b59wZAs/TAQKNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10789.eurprd04.prod.outlook.com (2603:10a6:10:588::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 16:55:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 16:55:54 +0000
Date: Tue, 16 Jun 2026 12:55:47 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i3c: master: Update dev_nack_retry_count under
 maintenance lock
Message-ID: <ajGAE9Xw8b8ubMwi@lizhi-Precision-Tower-5810>
References: <20260616113752.196140-1-adrian.hunter@intel.com>
 <20260616113752.196140-2-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260616113752.196140-2-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P221CA0085.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10789:EE_
X-MS-Office365-Filtering-Correlation-Id: 96056c5c-03fc-4741-acc0-08decbc82152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|18002099003|22082099003|6133799003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: mMYwR+HSxKNNCepcGHcySJqZo+DNStl0l6VleUOq2/6bBoNVhJuVf7vZMt2rnB6cP9KheWQMfgrfpNwAo7phcOSfpYCeSxAcO5f3bupcCa9aiRnIY9y8jdKmr+5S9l8pAIIpgr8DUxc07+SfdYs3/UWjHXjPnjqxrmi/4R6ySAfZmpFBgNVccdts+AEUr8PErhzhOu77KG6gdLMMUUoI7WjLRgXuyaxUqmyhWBMpCMYFLoE6sqh2fG8f1DEuF+coGdbR2sdxIXkyYQf7XYLwMUlEWWvSzD5VZyrPXsgx+n1pBzsm7gM5qoOHF5OnCFZ/e6Bf4jB1GYUdn8YeNRcli3rTYAaV/EhOYkXnlfMFXC8Gjqdxjk+AILvVFRFvZHv3zYiqoy7pw7yPoovcYV65tbe78Lvt6xTv6+LLrsqm/EZzhvSjuCPbGEhK08ap/Uk2lQvb0H+KG78yDG5Shq7SJRruQPHwopJ16wyLbrM5WI4yQ4bYAWnK/ETyqfxwwHGZfvkcSMbhNuQ5rARCDJuLUUQ5FHLxUKMl0kqquKUuC/9sd15cwzamCs0j+2LPQWWJqecfN1UpMdiou3EJHhwBjoXlbMOTwbzrNZfK4jfCgGMP/HAGbVaUnI4b47PrWRWBKzgNEGnxzeBsBxFKl4GulnuPp2ybAfkXFuvfMdSb14TdaYjgCssbZtcxgZ3Y+wsF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rC71w5WTDQr1bc3vgAdx91P4fRZbc/lUeDZ6sJu4gZkodKSESv9hQLU6H9Kg?=
 =?us-ascii?Q?S73t0YV9UfvZ9hPx7qdNopTzFDVbUHQpnNhIkZXl7g/ZZJYfg79Y/p5O63aA?=
 =?us-ascii?Q?QbO279FO3rAK0WtS7mdgLaug8lY0NkvqfCd8UqeOqLC9kyzNtcvmWGXeY/6X?=
 =?us-ascii?Q?wXBM3986BgyKBk6Jz8OdHTdqltlelEVCYNRl68h6Hw5PphKUZcXnIeIs38aV?=
 =?us-ascii?Q?V/P15A57Hw6mrFkbxjv0tbeY0KE6hEZ/S6ryoRKmnsF0W6AUhyZMIORELkJJ?=
 =?us-ascii?Q?XOY9RHDyEZJDbtzCtmu+oWFf9JV6PfmfjAhkUHLs3NRS3q803Mb2yIfjizS6?=
 =?us-ascii?Q?E2tQggE91WkOkCScR87UkrohbderVioGCcv+Zb4qT7dlmp0utUSLR1iuKHcw?=
 =?us-ascii?Q?5T4ZMUWypXvVcKCCi7JIKQnpnCOhI3TZuMy5ustHdUUGajsX6N/kPiZRHphK?=
 =?us-ascii?Q?utEK420Op2iCEE1iYRlZCXcFOmnMaehBlVu0baNJlW6aF+znie+A+aiPdld6?=
 =?us-ascii?Q?JPwFnJalhN3n7GDSlcrcsZkUeyhxw+KD+8u3dnf98lo2FgGquJ8MmLguyZR0?=
 =?us-ascii?Q?9nmxQ1AvYpnrHxXFiNDgAbdk2x9bvZOzEq+zHyz+FFajShdL6f7S8TfyJAO6?=
 =?us-ascii?Q?eajVc6qaFFTqh5fXSEL5KFXnnp17sCT5YQxGfnRBRjBuCo739OOdTdrB9F2A?=
 =?us-ascii?Q?1G05n4VQSJquin4ibBniHGJ0tHen2YS71lfI8fli1KVO8eP8iV9TAsw34Cji?=
 =?us-ascii?Q?TcPGHGviScBr1vmQ+6EYhjwceaoD1gZ7v/uhMJtetLArZiZA+rqAk5rMdy5m?=
 =?us-ascii?Q?4ZluzpD0Mm2eAMNl3oVe+7ZV7BoTxdxjUaoVZAn30V1hEmTGVG7F9dhD0bHK?=
 =?us-ascii?Q?GHV1I7R08ML8+pHivRpt3UQeqIwh7gA1SfFKIg0271b1wivt5s2AqoFtxDVJ?=
 =?us-ascii?Q?SWIjIpSWXQ06hpWwPcHi5j4/+egGaiYyjEzkAhbtqSnpmRm6oCsaVt5SIOYj?=
 =?us-ascii?Q?T+MKHHXZ8QJ2WcFUTPJf9X8VTEB3NQ5iPXJQXIJY1xqgWsEAu54sJS/0Z2sN?=
 =?us-ascii?Q?0FWTwahtLx7yPA5iv3o2CpFkpwKvBeluLorEL1suRQyFXws8MS4TkrXoR/rH?=
 =?us-ascii?Q?U52KtNrf5B6qZt7m4PqMflwggW2fP29TnhGUtYsrpn/hqWkIlojyYhf+twip?=
 =?us-ascii?Q?wqlexFVE+scikTmuugZVcyivmrJQ4WFOpN1FUwbagVSKeQN/khSaBEQokJRA?=
 =?us-ascii?Q?Y4NFpg3NOKNVfPXo6gXw9CB8arLBFaD79y04VZuC+h7eKSUbnYfTfz+VQN9t?=
 =?us-ascii?Q?CwcbWiZZXkMdIc7Yx9Q/Y2IQVp9mzsG0Kao+MWacyzgL1fIhx3/v6XsCa4bB?=
 =?us-ascii?Q?YDVOJ4RqqAkXstCXI2cQ3v0P04ixrBjoqWVlS+G0bV8uFC8B6TChN49CdVKB?=
 =?us-ascii?Q?03kSjoN0YGV5WX6g8V+CJ3m1feHbaRfT9N05iT43/q/ORxWJQgfi9paVVmDK?=
 =?us-ascii?Q?E92kkDxMXXgrIYQd3HOdl9D3A0LcDj8RxhvhiCfWX1Zig8a70u19HtHGGLdR?=
 =?us-ascii?Q?SzllXPh/QXeS7o+7KyjOhg8EEa5KWqfoqsrKygVh7oF+d4pntdMOIpjvSnep?=
 =?us-ascii?Q?gNVd7wpYscKVUuNmU1/rR0AWNX5TG/aaLTljWL/pZ9aT9Rz0JfzsmiS0NAkN?=
 =?us-ascii?Q?2Z5ZYB4BX2P1yL4np9WhuT7YqFR2LLgqBSET5KPBCsUWuD/0c20KnjErMgQE?=
 =?us-ascii?Q?cnctjNCGDnd8mIt1Aul/GJq764QRl5cu6NpYjgZRHxZhZjWfr1nG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96056c5c-03fc-4741-acc0-08decbc82152
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 16:55:54.7887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJoBMyS0FIS7BgdAYAfhKgsU19DW5U2kSRlQ3Zl5J8MnxuXTUv0DwSXVsRrteI18/XKqAg4ywC7/HF5hB1bW/0DlISeRvJ6z7wZIc1ts7tbyfCbjeCrL6dUe594t9TCo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10789
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_095558_797714_2C034FBB 
X-CRM114-Status: GOOD (  16.24  )
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

On Tue, Jun 16, 2026 at 02:37:50PM +0300, Adrian Hunter wrote:
> Protect master->dev_nack_retry_count against concurrent sysfs updates
> by updating it while holding the bus maintenance lock.
>
> Consequently, combine adjacent return statements into one.
>
> For consistency, read dev_nack_retry_count while holding the bus normaluse
> lock.
>
> Fixes: b58f47eb39268 ("i3c: add sysfs entry and attribute for Device NACK Retry count")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 367e0d6d4a64..66cf5d3bd987 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -744,7 +744,14 @@ static DEVICE_ATTR_RW(hotjoin);
>  static ssize_t dev_nack_retry_count_show(struct device *dev,
>  					 struct device_attribute *attr, char *buf)
>  {
> -	return sysfs_emit(buf, "%u\n", dev_to_i3cmaster(dev)->dev_nack_retry_count);
> +	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
> +	ssize_t ret;
> +
> +	i3c_bus_normaluse_lock(i3cbus);
> +	ret = sysfs_emit(buf, "%u\n", dev_to_i3cmaster(dev)->dev_nack_retry_count);
> +	i3c_bus_normaluse_unlock(i3cbus);
> +
> +	return ret;
>  }
>
>  static ssize_t dev_nack_retry_count_store(struct device *dev,
> @@ -762,14 +769,11 @@ static ssize_t dev_nack_retry_count_store(struct device *dev,
>
>  	i3c_bus_maintenance_lock(i3cbus);
>  	ret = master->ops->set_dev_nack_retry(master, val);
> +	if (!ret)
> +		master->dev_nack_retry_count = val;
>  	i3c_bus_maintenance_unlock(i3cbus);
>
> -	if (ret)
> -		return ret;
> -
> -	master->dev_nack_retry_count = val;
> -
> -	return count;
> +	return ret ?: count;
>  }
>
>  static DEVICE_ATTR_RW(dev_nack_retry_count);
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
