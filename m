Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0C3EFCE42
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 20:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Bp0IHL6Gwx81A885jolbE7prrVUQTBBpmlXgYjnHl4=; b=3e1Xs0pFD2zcVu
	1J81exXAv+slJadMsXlcSpdnfpTr3fSF+hjAJboR60u1ho7nVK91vFTdLJxwtwKR4Y+ZzZMr7YCFe
	EWx2x/I9naSNqkwoZ1aOxnAbdmUvT6vi8hVAncdir18FuZD8cJW7+1QhKcV9eTCinv6KHyEVeMsfr
	onNV7Xathb4BvwQrwywkkrKO2zpkRavjVYhz9pBcATKOQtrnt8jYyvdscBbIIRnhJaQFTrw6fERtX
	a2k5dSPSqw2JjieEvHnHxhkTcMH2PidKqYYZQFvW2KSrXNPa2NoYWHFgFa3AY9LJCV6MphbcPBRd3
	Tvs9kb+IHI1XspbPkBIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsZD-00000000ROO-0i0a;
	Wed, 04 Mar 2026 20:11:35 +0000
Received: from mail-northeuropeazon11010046.outbound.protection.outlook.com ([52.101.84.46] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsZA-00000000RO2-24Hc
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 20:11:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yiaQ2SHyG1RCpXf0EhcPnUMe5c6ypqR3myQffqgJyL8jwByjUcXqxjgoymRamb0bTVYrHdugn+ZYJQ/f9hkaCd/6bCw8w/ebVGSUh86LzbOpi42b8AAEpzJA6AGHcYXgo5uE1TQsRh4wPN7Ofd2sbk2hf81YuIxHS+a8FNAmznsJYd9w/sB9Df2FVP5JOo3ilD3a612fc9WLakMaB+IFOn4aa8VsBpibrxIrmDE5TTZHHnVDJr69Mqbi0HKfQuKuFtmOTngK3uFnP1nJFp+jeekGTRqCFQIGsR5fA1zurpjb+BdcYL2JBXMTqNN9VP/DyCPUYyswp+hE2vvGDK7paA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2KAHGtidCnme8EswAKVt4eTdtiXF4Hs+kcBx0uyxTw=;
 b=ubuW8d1PSi+BCka5T1bw5OFmC8JLFzG/03GgNwmmTAktwXVzGZ1FwmsZSP5F7FWPosamICO/DxsbqMst794Z9nvLoGJ+JY2A88PFWD938h3IUUbSI1MAVOxQRQiRp1rQ4SqE0Aqsz3maFkFdklSd3TWVM5Chz1e3Ze0bWcQ4qmp1Tn9GcPuDSM+TGq/rG/FdJQsOPQIEjWbSaLJ7WYRYi4cvNBVyANcYA6U/1GC58DvT4GnxKxIxD68jHPjmc2VOaPnWdyicISt/LtZL4mJT19weg8vlJ4o0HhBNov6SOjw2djq53LPtCAKfP6U1huEnPugMxUu6vPT1Ikt8ouGpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2KAHGtidCnme8EswAKVt4eTdtiXF4Hs+kcBx0uyxTw=;
 b=J2+k9gxo+96iwUSE6UcUyeHZUCtsaCbf7OGKqhnMJAwH/R1uIS2N1cVf8jtMp+hFpRnh+o5EcF/kyEqzmARC2lNddLpjZIYvXQubl7pm5FIOmGOIrWHTinNS9/2XT8uVBJQK00AWWvMbFLy8LJ6YhjxzSoCS352N+BifBbZQQcqkG7QJc9CjMA+CpnJ4vmCGUNqtY4y/ITsNpLwvRb610kjXJya0gEUKbCIgl3Yx2oSAesoGfl2JwBgSrjXwNmTsvb8tkh2D+d90JSVlIcMIVBlL8CEFqcv/XQqneeon1hSdoqjz9EEH69wBEQUsswxm7TOAL1DoAzV1F1q7d4aGZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB8249.eurprd04.prod.outlook.com (2603:10a6:10:25c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 20:11:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Wed, 4 Mar 2026
 20:11:27 +0000
Date: Wed, 4 Mar 2026 15:11:20 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 13/14] i3c: mipi-i3c-hci: Fix handling of shared IRQs
 during early initialization
Message-ID: <aaiR6E9KzFN25PWU@lizhi-Precision-Tower-5810>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
 <20260304181706.143841-14-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260304181706.143841-14-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P220CA0137.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a81e64-266e-4a9b-8b14-08de7a2a375b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: fuLOhgcvMHa5BC7ZMZEbV0+GuwFiPevnkfCFXfynPGNOnsQAIOMh+PG4jQkvm+D8whAreoXJQGFD/7ildWcpvRxaG92u0MV9ijNsWxGrLsuqIIXd5XCRTu1t4thcTFdVdzBwlMfGixzhOvzUOU+qZ4DlhIKolumzhahgk68KIkYBNiOxZpqa32FueuoCv8YST5K3m5ie+sei+dxXHBMe+cH1SayeGKvrFoEC3uQMWZnYptD7yEiDDHlHW0qcA0QmoYZdx2ty3166B8YWD8iWhFK7kzfS53VkX9kR3ODhkQTaZksJOqNbaQXf9CJ9LnWueeYVaLF4XxOTfTSTa86siZ7IkPkTP0yB1EeUNMfUV2EMFc+DQJTQXHw80sdn2U+EJjGOmiFk4PzBuD0th9+7C18y2FROSRkW7NkNxsEhrjoEq/1s1fvDpZaSDC/jUH+x9XtkolwrY9yTpANuzRVW67fKPO/Y5gJXXy5pTZ5b4SaVvhNNpRKH79wb/NCZPkNnDZ4jmKQvySFTYgdkPqEvPKDmuEwiKoeQ9StDX239fA8rNFXtj+buSAefNsPDR77YIwZzR1yo+1idrwORngTEPabNmYEUoChyBEcML/FiBvBykt3bwf5ug+lYbmgiliBHfg5yt2OaOPgailNrdz6MqvcAcUtkaYDPkwBshXmsJLLA3mDl4bYwmvWrPTW4tCFRIp8eC4NIbyC9K+uc2BfNzzdj14ZI04hrW2TtlYcxEpUOM4+EJQfMgchs4k6ugU74981srsxoSShzExEmuUZHFsbVqtL50Hsc5rgPxeRyX/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h7ws9mOzPtQBsYkmUkTgbUNAzFclZlIeD3qEVbopKEwrk2R28f6k7Nbp+uUJ?=
 =?us-ascii?Q?JjqpPGA122bnCD1BIPAVRNHd2WOCetd87ppFXYsw8gTrVFlsWjkR77nz9KTf?=
 =?us-ascii?Q?nC9v63SZJGEaIJWWr9F/3bLgkO2v1RoZtYcm/+vW97CT677UFtj9iJzdg639?=
 =?us-ascii?Q?lOxr/dvf3d71dFXfYdpKaILkVpbc1dg9FEeSPeL8zmIfyebqnGWtsQkdPppI?=
 =?us-ascii?Q?SjxPxOD+HuuqcQDzOyivUb/iY+Jop7e00Kuq/cDfmUFB4+JwjChG4jJ/PdFu?=
 =?us-ascii?Q?FS5wFaMmLmUPdHZEQI/QeaclIHk0i6V08cnPO9MOgw4lGLLTKD99CAc+MszS?=
 =?us-ascii?Q?cKdeaUMMEm4VubtC7CMevj8492bVPUTZE78JpIGVUyt4+oxepSD1PCCrg88J?=
 =?us-ascii?Q?vMltVYWth9AD+0QDqRvz74810FnkCwTyQD4DFWaz5lrWttBLUVJO2ZTL77bq?=
 =?us-ascii?Q?uCASuey0H3mwdWobgshlZjmPIV4fyFfogto/9yF7NBsaXtw3Dos04rX+1P/l?=
 =?us-ascii?Q?YGBkjQZ6PEObLDBUYYlccX58i8zf21L0lJUM5CvSaA+b87mQ2m7XFHaQh3LE?=
 =?us-ascii?Q?K7czi2E3DDvBj3NNoCQy8mo24aUgGuTAj7k4m9j1AicFt+8j/8BlKMlCgBRi?=
 =?us-ascii?Q?Mf0dAhWnB5+4MddIhuBOcN+3GbMc/G+1oeU+KX2Hj/eGi79p+UOVo1j2Y3ib?=
 =?us-ascii?Q?8Z5a5CrepHRVyTGoQGINuLNH7VlU90zFlZ+uk6YrcEGkTDBrT3Yia4PGjCOh?=
 =?us-ascii?Q?lR6REF602iFsdj5FKMo20rz2OE2uQfHaRcYiJNFmHCWOm7xbrGVuRcWXj9s7?=
 =?us-ascii?Q?Z2faqN/kRySKuJDd16cRtgg45fF0Gw4OdIzhfr1HpQNQwNqEt/JSpRXzvFrC?=
 =?us-ascii?Q?a7KQLGiauVtc+mz0KEtxwPjRvLSMWbUuFucrQrbTmKioSc5d67fDJY6c/jNR?=
 =?us-ascii?Q?Fa5wjh0Gs5x31PV66j3K98S1Hs4SVoVTuN+zxFLw02N4EK8f22/LgeyM41B8?=
 =?us-ascii?Q?V8eo1Mf5iR9jQYJSnKEaFXQUNQFdsKrnwqFU5Q65kiOrgBVzk3eeLJVqRyND?=
 =?us-ascii?Q?SIFSxM4GWYMkt0EL/7P8oZRLH+FSR/TKEMDlErzAdvMbJLDHy0fItKuguUOZ?=
 =?us-ascii?Q?ti/kOUcJwocq0PbQHXjkeYAzJaFYZQrkAtNTG3UD7gT/jZNXdQS9vzOlf8Uf?=
 =?us-ascii?Q?NmQFk1UXtEBXdEYX4GUfgy27aqGQV8e8WfJW/Lyue8tqoWCswyiDgP+vGctl?=
 =?us-ascii?Q?qz7+MELDuaytF9tdR9NM8puuD2SeuOrSyMxCEGZGEvRguVvFa5/ga+sIycvG?=
 =?us-ascii?Q?eoGk4SOe8/NmPzYB6i0NGMn14TTwqrFFcy9znXUuIzD9NOM8S9BkI8AfZd2/?=
 =?us-ascii?Q?R+c0aLiPQstAyckdsJv1Tlz92bESbQG21iV1RK8UU0sfSIGF9wDepgxKvObj?=
 =?us-ascii?Q?ULwMSFdvj5/dpNR1CctapD6m0D5AQZvxVGhqlcbzTDLjV7EP6tR2rqRyBISz?=
 =?us-ascii?Q?IliX4IiVSizQ3Fgdw/n9ZnEqVZ8IqrzYONNd3G4ufu+LS1J6XFbJL06o6JAS?=
 =?us-ascii?Q?t/Qlnzhyj9G4G5B1yKBQIu2wItPDCWEwHeRIrG27CL0mLoUvB5R/tHZOTBg/?=
 =?us-ascii?Q?bHZyYfd7cEQWHL5SbEBynuIOE6BcjMrqhePJWe0G5UcI2YUq+6ivcibo2Xzi?=
 =?us-ascii?Q?AMd3owdMDWDPJx2iBOnS9BrA699SyUkDBJhrpAbxaUp3O2a8BbSSkmTqV+eF?=
 =?us-ascii?Q?pNGhJP1LlA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a81e64-266e-4a9b-8b14-08de7a2a375b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 20:11:27.1575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGVyVPABwiAAM147XIyuIVgKIhFRWWpIDNwwgpIPy8Dd0pXAOzRHRVng15/9HeHw05qI+LYRXF4DvilrEo0O9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8249
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_121132_563503_7E82AA17 
X-CRM114-Status: GOOD (  24.79  )
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

On Wed, Mar 04, 2026 at 08:17:04PM +0200, Adrian Hunter wrote:
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
> To guarantee correct ordering with respect to the IRQ handler, protect
> all transitions of irq_inactive with the same spinlock used inside the
> handler.
>
> Fixes: b8460480f62e1 ("i3c: mipi-i3c-hci: Allow for Multi-Bus Instances")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Place irq_inactive under the protection of the now unified
> 	spinlock, eliminating the need for explict memory barriers.
> 	Correctly position the update of irq_inactive in
> 	i3c_hci_sync_irq_inactive() to after synchronize_irq()
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index b98952d12d7c..d5e91af7d569 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -152,6 +152,9 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
>  	if (hci->quirks & HCI_QUIRK_RESP_BUF_THLD)
>  		amd_set_resp_buf_thld(hci);
>
> +	scoped_guard(spinlock_irqsave, &hci->lock)
> +		hci->irq_inactive = false;
> +
>  	/* Enable bus with Hot-Join disabled */
>  	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
>  	dev_dbg(&hci->master.dev, "HC_CONTROL = %#x", reg_read(HC_CONTROL));
> @@ -184,8 +187,9 @@ void i3c_hci_sync_irq_inactive(struct i3c_hci *hci)
>  	int irq = platform_get_irq(pdev, 0);
>
>  	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> -	hci->irq_inactive = true;
>  	synchronize_irq(irq);
> +	scoped_guard(spinlock_irqsave, &hci->lock)
> +		hci->irq_inactive = true;
>  }
>
>  static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
> @@ -781,10 +785,11 @@ static int i3c_hci_runtime_resume(struct device *dev)
>
>  	mipi_i3c_hci_dat_v1.restore(hci);
>
> -	hci->irq_inactive = false;
> -
>  	hci->io->resume(hci);
>
> +	scoped_guard(spinlock_irqsave, &hci->lock)
> +		hci->irq_inactive = false;
> +
>  	/* Enable bus with Hot-Join disabled */
>  	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
>
> @@ -975,6 +980,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
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
