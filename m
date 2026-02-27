Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89ABFEFB6E
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 16:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2SC5SLOLh1zJPIXMd9KijVIqx5sE7WzYFH83lyBlLpE=; b=HiKUf0FlMSsuCV
	bpWPBQ8kh1TsGQ136/XFubKF1OaywjXDSZdgsSx2EuBzHwsbawYkWEJOpePZ7urnfsp52Y6af0s2U
	7cPQYmzZnS9DzwkSLRSnkB5st8ioDcphRi/GXqiIzAnTGd8wwuEG1by3q9Z2v+Fo6rTI+OSEKsu98
	V4NnN7ZXFghTX3Tyw6hhm5x9QSAhfKIoXbqZL88ncDPAttNWS1boV3yEG41nbse9GNl6FQshXO1cg
	OscQ7rvIx/teLugQk9iKreryH1B4TSY1psTM0ofwY0lBI3UcmXLy91hVBSaI+cb+Fjj9dfepQeTsb
	vQ8hcAhbO9mAWP+MeO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0vS-00000008kYg-23jh;
	Fri, 27 Feb 2026 16:42:50 +0000
Received: from mail-northeuropeazon11010033.outbound.protection.outlook.com ([52.101.84.33] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0vQ-00000008kY9-1WAb
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 16:42:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylQ6x8NAKVdkPuuD4O4EDuuzeWoSttWaAyclrUqv/mrFebAdJKAZvy5LpZZwg/TPMOWTG+U4v9ypdqITfSRUyjyOW51iBRyfLl38LYQM885XjS86a3sSv/yVk1nnz3frBEC/WIEOybMK2OYZDjXp2D7PkctBXsAjTKoRj2ZgP2X/19SgkjPuxo92GdP2bNlx+vZSMPjzFiqvcViW7Klg6CuwivyR79MnwAu77LPQhlqyrm8OeNYpjCOhmzl/a2g96ipAqDrUoRtzfwWBD89bmS0fT+paHThHxdbmqQvHMPsRq/ElB+SwMZ9KKOJycII8hUALJ8oehh1TRJJom5UVcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5Fjs4IzO4XJI0Hrn2b/Xc2LwsOgTLYlpuH7PXsqDmo=;
 b=WcfMJUW43uPxgcQM1mxoVp0CmCez/PffTKdrvqH1ZiFZXHUtJsaUk/82mVYBbaWI7uUb6HsQQytPQfVOKZ0IjypJJG0wOVAdau8WhQZ5C5moBUV90nGpEZb1UqBq7u4D+ogbzsQ/8T6lUn7DXDDoxdCUTHEn9FiT34NQhaIVxE0D7WuW1vlwPl2qZCq4ED54o67LXVdKAVFsH4qhVi6qt2DIn74FE3Hpgxq8cbvGPhNFXw1og+kNBgQz5IBNiLwAaqy4tJi0Yt/Oplv8dOw9UcctB0bW/6SBYRKIcWEAWZwB03g/pLJx1GBrQeneYMl1JrBv9oAg+HnnT+ljJ0fJmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5Fjs4IzO4XJI0Hrn2b/Xc2LwsOgTLYlpuH7PXsqDmo=;
 b=W50rqC7VUXB6pcZiK5kT83azwHKDO0jSexy9vb2RAAQTCdfC89q1l0IgOYFxEGchpbNcqRRe48chWr41bqUXwm2F8WDdPPkPwIqk+NqhuZ5YpAefzAoFuKEReCtjPLNFUMwT/K1CAzmHjMeDP0DCGsigQOhxEHdbIkIMtpWLagkzmgnXD0VjDTUOnMw3sBa5N1KtC++JAwKT/Kj5uPqzVSKgoLFDTFWeM6IpuYNrgTwEOFQArI19DejTdrqMJgr7NBAaxSZkViRY2vzw1FPcOkkVKafgniuzDvpiNwYk4gkP6Su/Z6tVHWNhNB1tFgHQ0f3LRbnNuUI7xkPnbU9R1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by PA1PR04MB11471.eurprd04.prod.outlook.com (2603:10a6:102:4e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 16:42:43 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:42:43 +0000
Date: Fri, 27 Feb 2026 11:42:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 11/12] i3c: mipi-i3c-hci: Fix handling of shared IRQs
 during early initialization
Message-ID: <aaHJfRoutBmihGjR@lizhi-Precision-Tower-5810>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-12-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260227141149.184980-12-adrian.hunter@intel.com>
X-ClientProxiedBy: BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::13) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|PA1PR04MB11471:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e1db3cf-d399-4454-5742-08de761f3acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: 3FA/1XfptutRrF4awiNC6iJWvyeWx7XytFmF6jwPtDi+Z5WrLAQGBI3uNuiAvtn15ED/C77VEzM+TvwfRQdyU2rPD+pKLA3HfD6dtusxiNOyPqpkijoV441BOPZyJwytnj02PVITmKaHI9ymzMBv6cDwmtHFt+ugV1JL9Umb/YwguFiALvZCa+TsOrhyqFhChB7vFoU21nm25s1hFlnZq3sibEdWK5VPwZxQdohPjQ1LQkApMYtqHoV+8wAE+AR/4zgs4e1mIP0+ls94qFrmDV3B7oU66ysRLz1PS56L9QpyWgf4dmsciipEukUnWYeBT+n4HNQT4R4qwlMCwnbUpFMLBB+TxNOxbQT2MYvRBORCjvJX2xzNMCLsD5BZAl3bCG1ZMjoBiYT8A6KsumjnXn3kg/mYUG5wY9aPfn6G4/25F7L5czL13QoQSEozHWsI1pwPXf5kq/fj3i/vosC9DFt17zEQ6a/2LN7SL0045QMSewkCVC7TNkS6Vh0txZwAHVuabUSj0w9ah3r8W68SbCvbtowq+jy4C9rtaK8kJewvKC+r/ysh0RnC1dezSbSwQaLqWs6Dhl0mI1HqjkoF2+Si/juuLhcDV7QlqQxLjrTC61FNXGein5W6H0R2cg/Wqx2Cw4mKwMoW4LbFKbDNCKqOJPjImnHv7/LpSbpT8OQKOGbhFVw+g7I9aY2C49SL1e9jP6zKifsgqt7411Fkn3XQmekSMN/KtZjVp7TZ7AmmScgXBp5+UvsSbLF//trJ/gxSyZuyY7OoAFRWJ/FK7tZVmiQp8mGZi+DAGOzxfe8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3J5TqR8CXu2Dz3pslRajmdmyRDDs1QbIG15G6xuTTdrCSn+UuBYux7T/ydJS?=
 =?us-ascii?Q?RLPgOJdOi9lQOz2hxlCYtVCdtrMy6CFFAXKEJzAyR/2YFFAXHbajnhcTds7m?=
 =?us-ascii?Q?GbcTQwsa1lSxVE0FQ4bRvUJT0xh5ak1mC3Ikb6QIJdd8MLzzPYZxTrwZ21BW?=
 =?us-ascii?Q?OExPcIjIjF8RtWKwU2dCXaJKKs9XZShkWeQqOSspObSB2j9tM99gtA5WeDEq?=
 =?us-ascii?Q?Uq53BP/DUuD9x0BYYpZ+i0oOGSD6LcwU4D4IQlCu9gbP8/BGS7aVmDeYVa8P?=
 =?us-ascii?Q?8wbNlGzroejnrIn21QjaGuTK40p/LavBxZru+j78sLSPZYBdSOBje9UPXnSo?=
 =?us-ascii?Q?DjhF7mnEW5RFmXeee2GbUdIDmUDT5e6+faQx05wkehl+tEd555JmtRTBc6G1?=
 =?us-ascii?Q?2EA01WOGOm0AIyo++TgoiduLzsdvC0DLlLSvS7LHBOj8dA36oZ1X5zuX3WG3?=
 =?us-ascii?Q?IGom9aTdAKJtCFFvGKThmlA2Knrxvd3cXjAusD042nx5vHZIXV3vfZSm8Lbf?=
 =?us-ascii?Q?G+0NPKuZFmpBQjam9aH1uFzgv2Oh9Naq4RVCOP93HMzVXt96yCVlrLhxPb+q?=
 =?us-ascii?Q?O6LqoC9j5Vb+DfzloWV+rLHRHVwsrR0FXhauMkvfTnlGFyCXt/TZQoyAAQVY?=
 =?us-ascii?Q?QT2KDxb1Fwnn3ugamh+emlAyZgbJ4b3PmHV39ZQAatswEBAoZt0xmzQVAi6I?=
 =?us-ascii?Q?CouAkNdSkCAdyf5PLok5lt0DHyNQS0GpmJHf+RldbpTJqplo/AFVrfOk7qJB?=
 =?us-ascii?Q?a5bc26DnXrMpiWs8zIHXUSe8lxWNeAZgY5fYmp16UrA3wP85rxpUXDsoGBrB?=
 =?us-ascii?Q?Ir03vdcdc5W4lZbY8NuFZoTdgX+JiNYCtiDmAg2yNBM5E1gzvU2VUkQD7+ee?=
 =?us-ascii?Q?2df+4ERfX1phH/Yc0Sq/TQlDfmjfElc1XDPGMdH1DXmHUITVv2Mrgff3KzLJ?=
 =?us-ascii?Q?oCrp2GouF/vOGI1wHYPQxWToatKd0FGF/NyQvKMDAuU0i2v/JBPO8SLQobhT?=
 =?us-ascii?Q?fT4OXI3KEZjcr2A2t4PmLmyGYo34nmLiFkIamYmo5bTg3kx8aiIHDRAKEO3B?=
 =?us-ascii?Q?iJEyr10NboyOuNm8uBxm0MMdFZzOxCKveGRcZ77t0F3IvmKysZ0YcWQSJVDx?=
 =?us-ascii?Q?L+I/0wfpZPsFiOayW6ddCO8cL60AJ94iXBkA1CFaPglZ0emaEXdKUgC2PZd9?=
 =?us-ascii?Q?YAUhdghCyen4OTJfEGy9tjvTUTGEtNhGEbUV8RgBtWax5d8gXaE7LaN41Kgy?=
 =?us-ascii?Q?MyKT1Xhhb0o87nWSvZbyWDIJUMHkRuMwnPuQcPPdJil5+4xc/7vUHIbSH3Zi?=
 =?us-ascii?Q?2ogQLhImakFmq+pPOfn99ZWue97GqbLphCxg1kDoIQawa5Q2MqpLfSplB0Nb?=
 =?us-ascii?Q?mckIPu3uO0Xs+9dhcfYD15caaC52iW2I4fhfjMyKQYKw5XAfClm8xg+HQ0dc?=
 =?us-ascii?Q?PfN4uYHmZ+FPsjm6JhCVU1B+EDKiN9ZlzB0l7A0sIjk6Nux+hunSR12BsyLL?=
 =?us-ascii?Q?llxh4MiSfeYs4tv/Yr/7154caONvpUz9YHfpNzRGL0hy6Gmy5bwS/qy+X+nm?=
 =?us-ascii?Q?P8Z7VCesk9DOKnGOt94IBShKjPbJlJ6vRa2Jt570XeSnh69BsWmL81+x1i6o?=
 =?us-ascii?Q?Tbbn30l/ET8rJLk8V2BfTlrqldOuAb9/FKgCXaZ7/o5tM0r4uTNQb+/EhULR?=
 =?us-ascii?Q?B9mfNYzLhLvuC8Eeb0CzMACstz/rqC0s4fhMAftWMrIh/c9VhB8wDaFzBDMU?=
 =?us-ascii?Q?QWQ2syvfuw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e1db3cf-d399-4454-5742-08de761f3acb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:42:43.8787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9ahj5p8XImKV+FB4whnHcSNVLBYAIlnM+358VcEgAe6/5J89zXM69IKRBwjk5jlsWogTzoByOu0ziNFkW9zDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11471
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_084248_402767_C10D33BC 
X-CRM114-Status: GOOD (  26.84  )
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

On Fri, Feb 27, 2026 at 04:11:48PM +0200, Adrian Hunter wrote:
> Shared interrupts may fire unexpectedly, including during periods when the
> controller is not yet fully initialized. Commit b9a15012a1452
> ("i3c: mipi-i3c-hci: Add optional Runtime PM support") addressed this issue
> for the runtime-suspended state, but the same problem can also occur before
> the bus is enabled for the first time.
>
> Ensure the IRQ handler ignores interrupts until initialization is complete
> by making consistent use of the existing irq_inactive flag.  The flag is
> now set to false immediately before enabling the bus.
>
> To enforce correct ordering around transitions of irq_inactive, add
> explicit memory barriers: place smp_wmb() before updates that clear or set
> the flag, and add a corresponding smp_rmb() after testing it in the IRQ
> handler.  While kernel I/O accessors already provide ordering guarantees in
> practice, adding explicit barriers makes the intent unambiguous and correct
> on all architectures.
>
> Fixes: b8460480f62e1 ("i3c: mipi-i3c-hci: Allow for Multi-Bus Instances")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 741f543aae68..2909e3d35d8b 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -152,6 +152,10 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
>  	if (hci->quirks & HCI_QUIRK_RESP_BUF_THLD)
>  		amd_set_resp_buf_thld(hci);
>
> +	/* Ensure changes are visible to interrupt handler */
> +	smp_wmb();
> +	hci->irq_inactive = false;
> +

I think you should use atomic_t, which already consider barry.

Frank
>  	/* Enable bus with Hot-Join disabled */
>  	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
>  	dev_dbg(&hci->master.dev, "HC_CONTROL = %#x", reg_read(HC_CONTROL));
> @@ -184,6 +188,8 @@ void i3c_hci_sync_irq_inactive(struct i3c_hci *hci)
>  	int irq = platform_get_irq(pdev, 0);
>
>  	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> +	/* Ensure changes are visible to interrupt handler */
> +	smp_wmb();
>  	hci->irq_inactive = true;
>  	synchronize_irq(irq);
>  }
> @@ -592,6 +598,8 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>  	 */
>  	if (hci->irq_inactive)
>  		return IRQ_NONE;
> +	/* Ensure irq_inactive is read first */
> +	smp_rmb();
>
>  	val = reg_read(INTR_STATUS);
>  	reg_write(INTR_STATUS, val);
> @@ -779,10 +787,12 @@ static int i3c_hci_runtime_resume(struct device *dev)
>
>  	mipi_i3c_hci_dat_v1.restore(hci);
>
> -	hci->irq_inactive = false;
> -
>  	hci->io->resume(hci);
>
> +	/* Ensure changes are visible to interrupt handler */
> +	smp_wmb();
> +	hci->irq_inactive = false;
> +
>  	/* Enable bus with Hot-Join disabled */
>  	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
>
> @@ -970,6 +980,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>
> +	hci->irq_inactive = true;
> +
>  	irq = platform_get_irq(pdev, 0);
>  	ret = devm_request_irq(&pdev->dev, irq, i3c_hci_irq_handler,
>  			       IRQF_SHARED, NULL, hci);
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
