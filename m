Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF05CD343F
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J+h8eUEEJ2A9k7smB01lul3Pc2ulgkPD8fCcPXvi/d0=; b=NPI7OCH9tUF3sm
	u6R7UMGsUUGJrMSHWWrNSp77QrJ+iEH38HgiPAh/sGD7OX5SZv0E56FjqoIYNX2B/0UnCHa4KFCmR
	1ew0R9gpjo+0f2uUonwUIF2p9Q31VS/ThysH+3fQHI53L+tdARNqiMuBb1py+mWZB81FcPPeIzobk
	IkOSx6VIrBoHTX2xPjsqhMzs7A8h3RqmdFVASIjbAilWMzWRs+5No5KXsSM7Fw3hnjBORRoOsLnpb
	pFs4Sij3bOEPAwBvhonJRWZNrJy9dNcrwiFFVfnX8JqVE85saCxidT0d2kHyRGZ5gPfR3/pyF1pqh
	jL9dDQmShrOdJwE62/gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqUM-0000000HT8z-3xAE;
	Tue, 12 May 2026 17:01:46 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqUK-0000000HT8N-49kb
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 17:01:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K154PtNmN9kVCYm2HHdhokAhhvRB8RClMLJGIbISoNmyOg0iqYXBiLOxvwUyhRGQYs+VHmXs1rGAoz+A3tbruWVgU5eo4Wz+vKhzODzCAudA2sDrJookdfomqWZLY9x15KaHBsAQ/Bg82q29buK2DMiBgQ+GlBuQS7Zjepa/1lTMGmJSBuayphiaRc2TWqdqXq4rdLWR8fe27YkM4c75dHOPtLGhuC6sM8GWSYLBYh9szl25YYQ3MbCkZOxqIK4Ag/Zdsapkga1+Ucbk0GSkAPCHsmMLl4UXG8QNRoGOS9ED5uNyLP4M/Sf9E+TQNoyNdwdf2Du4oIAuOHerZpf/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2EdpkCHpM5IkxfCKQ/KOhPtO+NvOfd2/+A8fLqMAx0=;
 b=BMeBmCQyOek7N9wDPDGdHFz7QPJDmFbbfr7LPPBuHWIInSh9Ixwstfl7Z44zg0yKzmJYiZeBHD6sRssDeCQ248yYkberO4Xkgq/isMJ4LQmBSeZ9xnQzXsrIjE41a4B4MRwNOUnqSJzjFw7uQdjtTY11eCGK1xVY/w51kFBmNVReqOhDeXqVof9stQmu6Jst/IMMXAERYsS0tdaRZETHT0FCbGgbkcQ3M/X2HIrVZzsWM5CdSmYfFuWmsddRd+S6BuxO4EB37V5A2PApn9uaAjdfmU6cE6K7TXuhR8dBFZKVGVV9aK9oEPI3rq7qm3g4CXRCMV+SzDpM3JmsB8Ff9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2EdpkCHpM5IkxfCKQ/KOhPtO+NvOfd2/+A8fLqMAx0=;
 b=RUC+KxKIIT0ZMP0H2Kiqhnan5zVuuVT+/sUZCUpmK2B1eHgGuKXDcfN0ELBXz0LxWbaEWE7E7BJ/7rwOv1fDBIuleI1TsBxZ+aeNFIIzvuOp2rAELSE764BNe4KXwQC84+/eZfOzwlNMFMavdvJQgHCyMa1I9PP6Qts6hUPfGux8k4zjI7uH0wJ9m+zKGCd4MdteUJr3GSuGH1Io8KY/6MVkIE4U8rdr6OuF8i+T7zG96pFxiIE2b/yCK0gETz9SW82CJxUOPi9s+DTS8RWiZL7DXM0LG8tX4MOdoCHeA0S9612t791L3GUAN+/fPl+kvwsOasOApWgb4CKvh+BqtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7207.eurprd04.prod.outlook.com (2603:10a6:10:1b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 12 May
 2026 17:01:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 17:01:40 +0000
Date: Tue, 12 May 2026 13:01:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 10/16] i3c: mipi-i3c-hci: Add DMA ring abort quirk for
 Intel controllers
Message-ID: <agNc7oxOJORb0qwW@lizhi-Precision-Tower-5810>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
 <20260504113352.38490-11-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260504113352.38490-11-adrian.hunter@intel.com>
X-ClientProxiedBy: SN7PR18CA0027.namprd18.prod.outlook.com
 (2603:10b6:806:f3::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d4b9aa-6e73-4fd2-3969-08deb048229d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|56012099003|18002099003|22082099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: je5ImWk+iTYQgke9JkFlCoMw0cSLGQKLz+eSB4oiQpTrWeESKXQ+3TaidDPtZZ3rplOtl7ErUwoEAxUW3MBe0REN4yPJcGgjx7wCVQ37lFj/V1YOkVUbC/9a/ftxIiAUeBknFzycTx1H3BsIWzXeDebmZy2H3YbOk0HuvI0xsFRQbfieGerXpMuq6TP3xiPqXMP8kpvFxXaNlmVZpglDiw9WKQNUxtHBBee9zquE384THOmOtDX7IfFuC9GVcFkQY6dJil6ywWxy45z3I0XGpZWnzKOBxvXl4Uy9H1YnJVGPo3BvQeW7vkQnqk2J/WNtK+6FQC5FSPntx7aGR5ZYB4RiN/Nkv/MirqRoDXF+3S3gGiN4iVEC8rmyLeWOtSOz5ZSTL2AAtP4WdZHUHC8PKGDd8nZh+1StHyVl4HuS8GhFeoakSBP7611kdcTrOx+gSz7C8jjXH9VtEpfyXJjESu1U3EeADmBhD1QfW/H1I7GIJG874LBaIl04xtW2aYcnErij3kES00GDLaMoscXqV+qufOj44V0Hu5k+0fDgN7ZO/ogTSeMSa48biZMn1UK3iyUw9DfxJ/6mybETuazqjNbdgpmUgv6jNo+9fQaGeOj0D63t74x00QTUXShcA70WvVVJkKeuzm5dyRq4+rFvJXQU1D5ef8Spp3yuTneNN7WT1oPag/bde8mTBvavzjJRI9oISsEcSxwcUWO64mcfKfjvt03ZTNe8Ahhzs56d+SJz8zbGSvCsN2Y0FkSkfVpo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(56012099003)(18002099003)(22082099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TzyqBOou7+zaCZMps5JVjr8CE+ClUSAi69UQ0lYzu/ZjluTmcwnu4/tErtqz?=
 =?us-ascii?Q?xAYtQYd6KcVEQDSNDv9FNX22GUr0r6Cw20UAqC4C7a1nf/9MDd0N6EntGxBA?=
 =?us-ascii?Q?+ClesjMhe96AOTmVDJu3lcM/u+drqKfP0FLK1FUr45g63FBv3XTaklmSH4Ii?=
 =?us-ascii?Q?lyXoHVfuM523Ic6Hn/PRBElSHv1yooZIJNax66P9DZ/uXwqiqcVEWWzMuMGi?=
 =?us-ascii?Q?J5y9z3nDnqRiMUCUSXhkZYBX0sLD3Y9DpahukjGKhCP6+Dmd6UnjFrf8N4An?=
 =?us-ascii?Q?ZuQZGwfi4FoSafSSq8dYhMfKnFZ9NIu7eWnqwD6EIzVK74j2lghhcbOwg2NL?=
 =?us-ascii?Q?1i+Zext79XHmjO74JUDxKuNGBJtlAolXxuepXTN04yNfpefx0C6mL9TWXZrq?=
 =?us-ascii?Q?ix5QEPaGoKKb9ymzuLKUz/Ltmf0b/7nSLbSNpDr5PzxWILC3aBk873sPT/nr?=
 =?us-ascii?Q?4SOpBdgT68iKso6Ou1bA79P430L8NRJOfJrBglbf8pJE3G7GP7H479VFshWM?=
 =?us-ascii?Q?4GWKqv8E1xGdbiAPTqx26c/aut89i6MKjeIM/ajfVWtdE5gJDNkKy2Lwj047?=
 =?us-ascii?Q?7rZscA0VPJoReu7YgPDUKrxvqF4mz+a1vUF8/1qf7Rdm9ATzYPYUDX4IrHrS?=
 =?us-ascii?Q?A7G8Hr+UnZGE2+lCGXLI4GWeAkr8FkoKhK7r5Gm22fiW1KEPDctg4aK8C9OP?=
 =?us-ascii?Q?UOhsaH7vng4nd7HtdTe6NQDix0k1TtreWiCWzWKA7s3++bt0BLZbilYGQJsM?=
 =?us-ascii?Q?eVFA8H0KkGCEwWHUDMN2qnI5jHYcb25t2LLEg01enWjka5fFiCqVyjuUoVQz?=
 =?us-ascii?Q?K1KlgDiExZfbpgWMZ4gwZxT0ByFZ53TZOXlx0rDbs92TdNp+/lowW6ctzOTU?=
 =?us-ascii?Q?gjKGUTkigzpmLLVy5ozPUfC+tNPC6x0/xpdpSdkuYOt6WaB204aGV8Xnth1v?=
 =?us-ascii?Q?a3wacs+nEwjDGQavcGr8nh8L1h9pw+2ewY3G8bMp7W1ptfNzXqcoNM5DRMMI?=
 =?us-ascii?Q?jOCZMM8yydTLOkVcBR7wdu2xTyGu5k/NfxMuO8UN2Sx/BVQJRDAOY9UUKvc0?=
 =?us-ascii?Q?wk5dOpE3cCvrP9w7wchX2IylfYgOz1FZt8qfglP8qNOGy5OxY895jTJfDwPU?=
 =?us-ascii?Q?dZ1WRP+gkvWng8ZgTNSGkIcKpX7rAE+YcVawDWI8LU6+r2QzQgEh8DbWgNz9?=
 =?us-ascii?Q?Sbue49rBVfTvbW9Y5WOr+hbzHLWrkRk5zH2BOcqDfG3Z95/lg6BuoKjeMvtv?=
 =?us-ascii?Q?V2D9SnyJUjd7E7SWwIJk1UarLaq5xEigQiTvQpvqy46bWdP5Out+4zGNnJg+?=
 =?us-ascii?Q?/WI5ghRn1IaQ2u4jBqdiYGuhU2fGoLt2FZG2de/dZcYX7qOb83mWnLJgfiJZ?=
 =?us-ascii?Q?ANGoXuE/BIxYHmuYMIZjDfafBG0RisP0aXpGpTQKZhRxVy6r6NSE+k+y+u74?=
 =?us-ascii?Q?5UV3WQcEe0GnK/wnZZDheBIRRxfnGODJuqU6vC7x1gxWUgsuu2Y58UN4TlV4?=
 =?us-ascii?Q?puY8mQhpM7DFTUmjSFFgQNhxAhW2D2NT4GAtnrVfcUtI5nF/Wg7Zk/bd2O5x?=
 =?us-ascii?Q?zzxqNMyDLiG9wCb5aYJuTTFG75vVweKhwCEa0Mue4k/Y1vCosNnNTv3R+6wo?=
 =?us-ascii?Q?gAKey5yYQjaMwpFa6xMF4a//QrVRW6AAx3pVCsabBTZVmuYdtcMtMmc4mO0e?=
 =?us-ascii?Q?6DiKUH2eABkV9seuH6ylf0WbpmajNFGKHQuIedWd+izicdGt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d4b9aa-6e73-4fd2-3969-08deb048229d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:01:39.9570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMsWTNOcFsZwi/UPpX4Qu08Ru/y0J8dW+6tsIH+ESQEaINwPhgM/WEtY++qPMDoBcB1LJCh8bWva+aFDZz5g8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_100145_031130_921FE944 
X-CRM114-Status: GOOD (  25.77  )
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

On Mon, May 04, 2026 at 02:33:46PM +0300, Adrian Hunter wrote:
> DMA rings can be aborted either per-ring via RING_CONTROL or globally
> via HC_CONTROL_ABORT. The driver currently relies on the per-ring
> mechanism.
>
> Some Intel I3C HCI controllers require HC_CONTROL_ABORT to be asserted
> before a DMA ring abort is effective.  This behavior is non-standard.
> Introduce a controller quirk to select the required abort method and
> enable it for Intel LPSS I3C controllers.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V2 and V3:
>
> 	None
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 18 +++++++++++++++--
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 27 +++++++++++++++++++++++---
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
>  3 files changed, 42 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 770235ad6b25..8274c84b16be 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -231,7 +231,20 @@ static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
>
>  void mipi_i3c_hci_resume(struct i3c_hci *hci)
>  {
> -	reg_set(HC_CONTROL, HC_CONTROL_RESUME);
> +	u32 reg = reg_read(HC_CONTROL);
> +
> +	reg |= HC_CONTROL_RESUME;
> +	reg &= ~HC_CONTROL_ABORT;
> +	reg_write(HC_CONTROL, reg);
> +}
> +
> +void mipi_i3c_hci_abort(struct i3c_hci *hci)
> +{
> +	u32 reg = reg_read(HC_CONTROL);
> +
> +	reg &= ~HC_CONTROL_RESUME; /* Do not set resume */
> +	reg |= HC_CONTROL_ABORT;
> +	reg_write(HC_CONTROL, reg);
>  }
>
>  /* located here rather than pio.c because needed bits are in core reg space */
> @@ -1053,7 +1066,8 @@ static const struct platform_device_id i3c_hci_driver_ids[] = {
>  	{ .name = "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED |
>  				    HCI_QUIRK_RPM_IBI_ALLOWED |
>  				    HCI_QUIRK_RPM_PARENT_MANAGED |
> -				    HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET },
> +				    HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET |
> +				    HCI_QUIRK_DMA_REQUIRES_HC_ABORT },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 699c6d523eed..41bbd912df7f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -597,6 +597,29 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  	rh_reg_write(RING_OPERATION1, op1_val);
>  }
>
> +static bool hci_dma_requires_hc_abort_quirk(struct i3c_hci *hci, struct hci_rh_data *rh)
> +{
> +	if (!(hci->quirks & HCI_QUIRK_DMA_REQUIRES_HC_ABORT))
> +		return false;
> +
> +	reinit_completion(&rh->op_done);
> +	mipi_i3c_hci_abort(hci);
> +	wait_for_completion_timeout(&rh->op_done, HZ);
> +	rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
> +
> +	return true;
> +}
> +
> +static void hci_dma_abort(struct i3c_hci *hci, struct hci_rh_data *rh)
> +{
> +	if (hci_dma_requires_hc_abort_quirk(hci, rh))
> +		return;

Move check logic here to make overall logic simple

	if (hci->quirks & HCI_QUIRK_DMA_REQUIRES_HC_ABORT) {
		hci_dma_requires_hc_abort_quirk()
		return;
	}

> +
> +	reinit_completion(&rh->op_done);
> +	rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
> +	wait_for_completion_timeout(&rh->op_done, HZ);

move these codes reorg into new patch.

Frank
> +}
> +
>  static void hci_dma_abort_requires_pio_reset_quirk(struct i3c_hci *hci, struct hci_rh_data *rh)
>  {
>  	if ((hci->quirks & HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET) &&
> @@ -630,9 +653,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  		hci->enqueue_blocked = true;
>  		spin_unlock_irq(&hci->lock);
>  		/* stop the ring */
> -		reinit_completion(&rh->op_done);
> -		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
> -		wait_for_completion_timeout(&rh->op_done, HZ);
> +		hci_dma_abort(hci, rh);
>  		spin_lock_irq(&hci->lock);
>  		ring_status = rh_reg_read(RING_STATUS);
>  		if (ring_status & RING_STATUS_RUNNING) {
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 01237b12d32e..97c31a315a6e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -157,9 +157,11 @@ struct i3c_hci_dev_data {
>  #define HCI_QUIRK_RPM_IBI_ALLOWED	BIT(6)  /* IBI and Hot-Join allowed while runtime suspended */
>  #define HCI_QUIRK_RPM_PARENT_MANAGED	BIT(7)  /* Runtime PM managed by parent device */
>  #define HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET	BIT(8)  /* Do PIO queue SW resets after DMA abort */
> +#define HCI_QUIRK_DMA_REQUIRES_HC_ABORT		BIT(9)  /* Use HC_CONTROL ABORT to abort DMA */
>
>  /* global functions */
>  void mipi_i3c_hci_resume(struct i3c_hci *hci);
> +void mipi_i3c_hci_abort(struct i3c_hci *hci);
>  void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
>  void mipi_i3c_hci_pio_reset_all_queues(struct i3c_hci *hci);
>  void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
