Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A3FEFCE42
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 20:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQQX0TIZ9JNu/CJ4WxQQhIetetDWA19asWSoyy4RpIM=; b=fGnUMT+7vI/43F
	ffodqToOo46XY4ys8Q3N2EAB7575uZDVWQwe/DGm3sA+PUnBhbhoKQB49sqErNCSzGWIqqFH9FTQ+
	79SczpUZRlZy8GTigzPCkokisUL+HqpCGU5RY0DukIMXUrLL5mVn+UmxfRVgFshjIEgi++bMz2Gd3
	7c8UwIuo83hyjZQ9qS3m1wtfJmLgefKhabkSu0kW3u0xXPFNAoMyGzyPb8MSIXKSuw1DW1xHXr3Ah
	RAcED3ReKeqKMGtUSyrMlwLVBtKApJgm22OmNHIYS5q4XJi59KJPdZggBio2+ERMEHRcTriKHOwn+
	U4eHRnudOJQDbG2+mGWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsP1-00000000Qmg-0BeN;
	Wed, 04 Mar 2026 20:01:03 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsOy-00000000Qkb-34FL
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 20:01:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0gax0bzbki2UAKXlGhVCuMfvYvN9dBFneLbLjY1GszouCQE99N9prHZEv5EnVPpr+8g+pvF3ekI7DnSjMscAKghthr+wF5Tud+8eSToVqeYLC8UawNveDMO8uxkOEopyDFQjsXQEQreM1ZIrVu8fYbm9ezQRObSBshK5CQPMw+W+pLr+elqhwtGaZZS2AKTD8KgIJXujgyjntrNa2UzVmEUw8gSjFv201CZWKclLO75PNyFo2tzTlKZpoDQc/GM0CihmjAW1QLlvLQx7yhdM6abAAHqoVXativhUT4so2RRsGP6eZqNPdwCOCVlID7DSbkRll/KAlFpzfrQH2XWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afIwMyIj3saITJhlkPDmPqgZhpyD5UygLqArcugT//0=;
 b=esxaEgTjnNkS0seQwA3KgE2LIj8A9bdyjMe7E+IYWKl4+hH3vQZYcAihFPkKvNqheFYEoKsEJ8CuDOghkU9RAPANH8cYcmmBk2RQL+S1y4MV212s3xE4/V7gcDElrXnGP/oHWvXGG/ot0OcDWScnYc7F8nwNVq7ayTGv9A0Uolzi5Sb1VM5LXU1ATivGBoqxzDV9ajpXR54Rp58MHULoAUQpd4RhH1KfWr03lJPH3yGQDOwlkuoiUZq/BOivzg4IgPhMq8V5k9kPZ1TdAWZPFazMOggPpDw95cQNHorJhm1MynOJgScdMd16tiQIzBUqprNd9Med//WnTOk0/vy8AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afIwMyIj3saITJhlkPDmPqgZhpyD5UygLqArcugT//0=;
 b=CT5jcRm5m8wofrJmTQ+h0ru+7Fog4nzckE8EcwD61gLzl+PsJ04480CPkK3QP7ITu+v2h33uV75QwyE0evSkZkOW8rD5IU7PBJE7KblMbeWJweBObAUvidoY2ODYjAKZEIwv4hnpQXG+wGN0MnQVRTJ1eQDRH3d2usILUoRBNIQ1Jd4qu93U6sSfJR8LPd7keGLIAEKUwGUMdHnmW42fd4cgS+EzPJ7EuJLI1IJrNoGigbyVzMoxYjpLIqTStCp+TixEkZnR9GzQN+vJTQ/kUMc/9OyTd+FfIIsDPBTjhIl4JgDXK1b/kzD/nxIoKVFFhUpMvmvE1nAN9tkPaVB6Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VE1PR04MB7406.eurprd04.prod.outlook.com (2603:10a6:800:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 20:00:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Wed, 4 Mar 2026
 20:00:53 +0000
Date: Wed, 4 Mar 2026 15:00:48 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 06/14] i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
Message-ID: <aaiPcEN4D3uFGeXF@lizhi-Precision-Tower-5810>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
 <20260304181706.143841-7-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260304181706.143841-7-adrian.hunter@intel.com>
X-ClientProxiedBy: SA9PR11CA0012.namprd11.prod.outlook.com
 (2603:10b6:806:6e::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VE1PR04MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: 47fb772f-c76d-4f71-f979-08de7a28bdf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|19092799006|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: ujdtacvKSp0/dmiHXeuWT47zGJ3E0c3cCuTV+vU1V5t9SpyBES+tvapPs9tYx5deGe1weQuFfMCid35yHgfuFEL5PWuPwsIK1a3+85fvrhAYqnp+oC1gB/McfRxffODw8wyfERP30lEcPPEBnPcWIflN3wBckeyRJBFkBiUQ+CqQ1xGaDJwomO2D95hL4evWBAbY/n0hFEVLldCTOIfLqrXC8NrkDke5lvJ2GXVbQfeJHbrPjHiyvPiRbjGWpcXIVi3AJPCLoDZN3fzCx6JiR0SFXaprVufUUXx2Zkc6mJo5aGb/YZkU6+YDdRTfqjK2C3X3os8te4cfu5iBz3+9X2r9TchvwiPpratz1SPluB+aAjZ1cJz6hRz/mGi7viBD1J+WcGSczLPfb7V+VeH8/LujcxVKA/Mj3sm+Zfd2sWTZYx2H6wm44ZRKzfj7WQ85Ahjbjpr4M0TPTYxmOoteCimy+o9ZQio/wrPrcTYpRgOZAET34PHD4uHsav5/FEQF2KlyvZqPabLAy9aQpK0gdPkG+JHCaw4qx7RumypaAIh2AXUK/JNKSr/AdvAdzIshXFIrCe7ItWzdKjz7VtkhJe59oUlfj4Pm3BiNmBKDAPcx/w+hnE6+O1d1fXRHN1tmKBdpQn3YTlQsUFC6rKCqAPV+9nsLUJnXWe1AEd+T28YSUzVS6Rb6D4BxCIjD9lkKEsX44yrbCujkv/AYrrqYF9/2OCXForPCfy8iRSM5MYdnCP+zfrnySRD3/1wYYfVr9aui2xgeWalsbF+9iE6mEJ5Wcd3XG0WzVVGNqFS38zw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(19092799006)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NhcIyvoEzj85Mr9QwnnO0hs/9Ws5ZlbGsgHmRukpJijbgOAJGHA6+40KAnNV?=
 =?us-ascii?Q?8pF1OEdDR9KEJPwCoPkXhybJ6ohergCpjFrZUMuGKCJfaMxyBaxpeo5XOskI?=
 =?us-ascii?Q?pfdSu1xBfNzYOUM0yqyczmuCKr2AAHfqXQYQWAqXV9HXeRy3G0x/neEyW3GP?=
 =?us-ascii?Q?tBNK2qooQjBiSN+8ud6ecXyjGBieAHhRoxA5y64onA8EWmz7gLcXUx25Cb8r?=
 =?us-ascii?Q?oH6WqflP1N8P1057zB4K2U0ezy+s1DchCKacHN+po5moOgHvt+lHS/6avEVN?=
 =?us-ascii?Q?CZ8OUNDZuEAb5AhwxH8TFOeihSYHUjnYoRocH3cYFtaVt1amopDNlke08yJc?=
 =?us-ascii?Q?nUw9b/dYKh+4Qp+Ex69pMP9x+u9u15m7EwZ3H4CtalWqK+YWipAraEzpCqCQ?=
 =?us-ascii?Q?i2GDMRsbzk9yOFpDWRzJwEmF2q75ZGWujb8xaj4rhH/ZD6273RVkerzkxXi5?=
 =?us-ascii?Q?Dd0zlOH/bZA4030vhZ1VDU8KfipfC679aBPm07mEG25cXoPK+UGAvB/HsTIf?=
 =?us-ascii?Q?wSbjs9VVzESY0My4boGYpqFJ/rihsXM9xB3mnsqS54aDCkvGYGmsS40TM5rH?=
 =?us-ascii?Q?yRRrkDg5Dvh4vu2rtu1oki7Y4qGK6VFKd5MCwFm/Ty51pUaHUpabC16UdXUc?=
 =?us-ascii?Q?s7ABiLTQt4suzZFL4B/6kppL3OCKTPaXOLXQlwTt2Ky7GA4xmzyNz/wQTsJI?=
 =?us-ascii?Q?e1BATkbtJWStOFwtHMzXCK051ghT5A3HgJldJPPBv3AhP2t8TnLY35BdKkqo?=
 =?us-ascii?Q?Bassg/2FGBnSAm3p1pjMdTeinUFaDhf1hTyIqno1OREH3s/YStw8kElaQJxM?=
 =?us-ascii?Q?hDEak4nPwvWw54JN+3glTqo1JrfoKj3xCKprki8KET2GOuwD/XCKtEEjZTOu?=
 =?us-ascii?Q?mxgyEfj4wOAALw0nDePImTyNhWDPBGuMIw3RL2KD6/r0NbiHD42EZt5kDq1n?=
 =?us-ascii?Q?j19YcxEj95UnQmmjOCsIeY3v9hhAnEo4WIjT30H/vX/5KPZe68h5YnGodXO/?=
 =?us-ascii?Q?UsRuulHUZxwzJIA15z2LgV1cXpwRQqu27mWInVdC7tGZdkeRpeCMYaNrqlQq?=
 =?us-ascii?Q?vaGFsbXTmD3PSe99v5hYjFaJy7ZJDb3dIYYPTu2hc5Nwy/AvSDJyOD02mnra?=
 =?us-ascii?Q?P17rv9dEPwStuwnVk6w13S6RwKB2oDULKpKFdnqvyqoygXkVlrP/TBaSWtFn?=
 =?us-ascii?Q?r35fxb/jPA2bAtEbR9Z3pCx8QxJBn4Mxf+q2jWHnTb+4hPrlThdzn+gpl1NG?=
 =?us-ascii?Q?o9eNpklVh7VYrDh2BpgqAmmL4I/A56ejhr92zlm8eJte/+d+LE4adb20M61Z?=
 =?us-ascii?Q?m7sbRPLyVInp7lBN9lC1sIXIR5OdNlKBg0honfJi+2cpYY8gtcgACxCcbxz8?=
 =?us-ascii?Q?7uQd/VrMFlUT55h+scD29lDRc1qMcHeKI5Avdxx0E8CmQIEh/VLzrn5HGHH9?=
 =?us-ascii?Q?oWZHIk02T71vB9gYfpY4Cr2NppJT/s1bhbB+8MJtGvIqgis15BR2bMvMqErn?=
 =?us-ascii?Q?RE5XtqHJmd/xGC+oVJBAHY5kFCpnvs0AcKoCvgMl/7hc3WHyLNmuFZhujHoz?=
 =?us-ascii?Q?JWMFiDvwXFRJI+NWq/uh5q1yTzOZjtFgusIL5cIx9hNJ4rcvgV4SBpm7fXgO?=
 =?us-ascii?Q?AZlYjFFVXQZCJaw5omN3WJHUwDsbbXfa2WIX5Ts44Ot7TsLirx9Y3rzmopcf?=
 =?us-ascii?Q?nv9uuTCZi4u5R6B4MMcggWVk7mjDPWFsh/FRI97GVSnVG1Fc9cFwpxz+JZf5?=
 =?us-ascii?Q?CFAGPjiCHQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47fb772f-c76d-4f71-f979-08de7a28bdf7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 20:00:53.9004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCMW1+Ua08Qm+TVHQkP2Jg/fF9fnv0X7teO2RFnXxDKOjDA3JT+vE5Fp8hIh80V82hrcP9x4k/nxiJnQO4b5AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7406
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_120100_772498_F86328CF 
X-CRM114-Status: GOOD (  24.62  )
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

On Wed, Mar 04, 2026 at 08:16:57PM +0200, Adrian Hunter wrote:
> The HCI DMA dequeue path (hci_dma_dequeue_xfer()) may be invoked for
> multiple transfers that timeout around the same time.  However, the
> function is not serialized and can race with itself.
>
> When a timeout occurs, hci_dma_dequeue_xfer() stops the ring, processes
> incomplete transfers, and then restarts the ring.  If another timeout
> triggers a parallel call into the same function, the two instances may
> interfere with each other - stopping or restarting the ring at unexpected
> times.
>
> Add a mutex so that hci_dma_dequeue_xfer() is serialized with respect to
> itself.
>
> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V2:
>
> 	Mutex now defined in struct i3c_hci instead of struct hci_rh_data
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 1 +
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 2 ++
>  drivers/i3c/master/mipi-i3c-hci/hci.h  | 1 +
>  3 files changed, 4 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index faf5eae2409f..061e84a5c412 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -927,6 +927,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>
>  	spin_lock_init(&hci->lock);
> +	mutex_init(&hci->control_mutex);
>
>  	/*
>  	 * Multi-bus instances share the same MMIO address range, but not
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 74b255ad6d0f..f7d411e5e11f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -547,6 +547,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  	unsigned int i;
>  	bool did_unqueue = false;
>
> +	guard(mutex)(&hci->control_mutex);
> +

if dequeue use mutex, equeue also need use the same mutex protect to make
sure no equeue happen during dequeue. Or you can guaratee equeue never
happen when dequeue.

Frank

>  	/* stop the ring */
>  	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
>  	if (wait_for_completion_timeout(&rh->op_done, HZ) == 0) {
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index f1dd502c071f..9c63d80f7fc4 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -51,6 +51,7 @@ struct i3c_hci {
>  	void *io_data;
>  	const struct hci_cmd_ops *cmd;
>  	spinlock_t lock;
> +	struct mutex control_mutex;
>  	atomic_t next_cmd_tid;
>  	bool irq_inactive;
>  	u32 caps;
> --
> 2.51.0
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
