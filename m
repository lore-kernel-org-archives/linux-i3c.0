Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447CACD6E56
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 02:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dyDtDrua5U/F6fCFZp4w5uOfimwzGa92A0tmZJc9V6M=; b=KpzEp8sphqQdp3
	OYwqwRuB7ZWRV/4eEj7jy8o1VyZW7jhp6UrYqVN+5d9YUZ4hvXvqfag4oArkPU1d9o64wlBfmkmNu
	TRwgOONuH4tM1kmJYGbXRBe/872wHr2UszDY7lOXqpMRJaUYped1lNLj+DZbyVqwFpSc+7Me8R0fM
	64Rq5RFXmzpLu4EIKhtd1eeJoQpmWuxtCyX/QP8nNA9vD9G6gqXo8Fmrb9pQ6ZvmnktvXO4V7tXTB
	BVjrS9xOK6PzMnLHZAl8YKLMBBAsQ5nsBQEvPSnOc4o/OdVkSuCNuQKu4ZxOpQMPBVvjAz0v8aObs
	STe28C/G4Pq0OEP8MkhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFFb-0000000CCRG-31N8;
	Tue, 02 Jun 2026 02:53:08 +0000
Received: from mail-swedencentralazon11013045.outbound.protection.outlook.com ([52.101.83.45] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFFY-0000000CCQh-2NMg
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 02:53:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHXw+zgNEOo9ait+8YvieXser/s6boZTTEfC+EDeNRm/QRjc8eYEnu8LIqSiSq06EuM/A5Z1xqxIbOKMiZ2bdnt30cipjQQiLwVETQnZTel7QwIroBbjO7YMVTEpQlG2s0JUf0uS6GcIgh5okKyhusiWdwbYnzwJGOFrPmOvOcHUDYXx9qVnhnHFl8EySfBmLajKCwAca7ReVvWcrfMpLDhRzitXWjh8EApC3nikMekpcHm8xG4LwOofqNViv4UBu6xOhdhppah15i0IvOFf0toYh6CFekJOW4OTXetGqj+TekX9SGRAkE0WK++h1wAP8/Wwj8XJiCB9uhyX1IdnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9f3VhliydA/KDB/lIuM1i8Egu3Mg07F0cCLGZTaiYWA=;
 b=y2swxCXR9DprmbJc1s58R8aR0tYI3GcNevS7kPyYIadKDtwmZ9KihSaKTIqc5Zvx6S0z7L0bDCEECqvMuPsSSfT7NMpB9gNCC2Y/SI5nChgxPJFtsuw97CU1MuvjxP153QDOZ2ZKcgG8sNyOtWFqmcBl+jihitSnMBB85F/JABbxbkn9GdYNEQOP3iLto2EMC8Vft5ZOLgzEKetQGvFRKL4RbQIy7G7cv+mXSWq7SPzVH/3Q+/BWp9vuR4CkwTYa+qjodBT3DHWCOQj3Y4/FNDh7SmEWrW5QyKPc7m9meq9nKyGQXu5u6liqbmcoRbtKYrS0XwuBlLmvZIS55t+E/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9f3VhliydA/KDB/lIuM1i8Egu3Mg07F0cCLGZTaiYWA=;
 b=R/Smxw3UkdDFYFy+u8Ndb4r/VRX+wbd6xMVNLSn1mKv46mKD7Y1LhPjS/5h35xB67KUmhBx3qv4p7OvYbyxkuA4SCkVGyu6b8aVOYg3/Ll6Yl767tBkLbgWdurhyd+zA/FbBExW0aLxBbEE6Qj0uHvnJpQlUJV3lbC6T/M0LTHiPLEer7PCCnsb11SynaL/pyiSDjKYdmuE74UjmKk/SOmUNt9HgIv/QB60LCtERqlH7n8d3j8rnUcSBEaUQrGBtiQcAu6Saj6pdzO2/957FvEOMTT8ZUfGhpu0JpgFJenovt94gBuM2WWrivnKORFh9AlrhHmmgPByC2tLzxu9o6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB12149.eurprd04.prod.outlook.com (2603:10a6:10:642::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 02:52:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:52:58 +0000
Date: Mon, 1 Jun 2026 22:52:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 09/17] i3c: mipi-i3c-hci: Add DMA ring abort/reset
 quirk for Intel controllers
Message-ID: <ah5FhfB52aaj0AYd@lizhi-Precision-Tower-5810>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
 <20260515162621.57719-10-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260515162621.57719-10-adrian.hunter@intel.com>
X-ClientProxiedBy: SN6PR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:805:66::39) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB12149:EE_
X-MS-Office365-Filtering-Correlation-Id: 69def77d-38a3-4045-41a4-08dec0520df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|19092799006|6133799003|11063799006|4143699003|18002099003|56012099006|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 0lLgI06g2goqIErnPcFcmElZkgYGysm6N0FwDKeWyBh/2T87Jt0t9UqBSfE1BwMuuk+FeGD5W38AQy/xESydGqPoT5MifBgVty27AKyJSDJ76MSbg1YZO+CRInmDgjsSMD1tjzZCSz3IkFqHLJXD/JQsQKGEledKrgopumzdR96p/aSTNbvn2inqYyheYvxsRmffabZq46+46rPAef1UsLOQQpIazatkMdfj42JsFgguOKfXCBQeJdSXkQvye5tlWWkmCQbHkZQRSiAxJLVPMSxeB5Ye91gqVRbxYRi+IY7abXC40UY+0Ktancn+6LFBVK0QvzCEKMfILqeU9U545zWEM/gdbzHU1EOY3Cn86itG69fIJqHjzfNpksLYAtJXRo8T80SaeNhZvTEOc1Up2T/xD/4hAvbJ0R30hqSXsxjfIh6V/cOz7ygChCiF6vgp6OGtXFRkWf5a4mRXkQQSAZnm231vFK/t2BTEM8ywJ7CssMwZ1pyRkPT7hixFilMFyI3I14+pOTzUjctjhNPmv7VvEaxCKRR89AJY6MhouT2Is/d1b4/nocXvIwDaCtrOSB2OXDEnJmp+6lbGJHuLUcedN3x7h/7lcX2c9lKvpKEMZSRyBWukFAcv3i1opAKFPsz1eDo1cf8LRphREh6v/q8xJxuR7usUcwoBcESOGtPPCAI+DWeVba3DoXT5Jio0qbAdXFnUxNmFYOuFWBTD70wsoPssz4SF3SYw+URnazwRTPYbKctaTfM8YEOZWi0G
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(19092799006)(6133799003)(11063799006)(4143699003)(18002099003)(56012099006)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B+7JaFMB2GGb9uZqUC5TZzolo7HYdnuY5ryGpsKXq69vKx0Wy936kiz1x0PD?=
 =?us-ascii?Q?2UxPDpB5RMQwg/k76A+U1ae8vwUXYvbi9l7pPNGaLqGeTbEw56DO+hbkZToJ?=
 =?us-ascii?Q?dfX57Ks0uEGz0ch33UAKk+baeQ0IuQaO9b7+GKL2iqzDVcebR0Y+WruD1oyo?=
 =?us-ascii?Q?AsEiFEwafDh/2NFaJkQsCjafqNKlIrWv+lnapqQn7jbI9Rs0eSB9JKRutRGW?=
 =?us-ascii?Q?3ORITiEbnmINEHGyMjReBivZJDKiemMDrXVUL7Dm3IuwkUg4t6fqwdyq7bSv?=
 =?us-ascii?Q?hwOR3A2Z/XHbjlu8yMLwGORfl10BLsubRIePJiXR8dLXnqaX2VkynS3asvxz?=
 =?us-ascii?Q?7/6FvWbSGgKfO00eGrmF6BCOBocHjf39meVeXWVfvHDucwoTgHopJ0Zd4jm6?=
 =?us-ascii?Q?na20IFHp1S1mvRFcoGiVk6KlRJMx/mGVcHUkhNa7nR8ZegnHSlhT5ufRRJjg?=
 =?us-ascii?Q?jtecGUIj+A7eLcH5QB5fjkPHeH7Jifu9rtJIcOSeRUNGNyFqNMiTUn6Z8zuZ?=
 =?us-ascii?Q?/4dEpu3kLyMqePWzv0UJDQ7vXPRn7cNqoftLLey4XMd3C/lfXlQOk+g/n4ji?=
 =?us-ascii?Q?uJQ6ZQUQyy9j5f0zWS1n3R7mdD5X6g4jeJYV6eLGJ/2zrm7N5X19+Gukmwrc?=
 =?us-ascii?Q?TRiY9axf3k3O498rchxBjUYEnD9fPxGYntCPTp3vP9N3Pn56kdOiXdHh6nrq?=
 =?us-ascii?Q?eIi4MqzQPz1PVcvzbViyV4/2KA82/4QLD16xGoHHF8xxEb06vpmwqaNDzj8L?=
 =?us-ascii?Q?xaHG+hy+A6E8qSa1gCng2AVP+aRUx37XH3DQt7VyRZwaKgu5qry6pjbY2OP0?=
 =?us-ascii?Q?LtUj+dBrBxScBikNLWY2Kb3FbHJ3nFIJTsZrPjcD0xKNeA378yCNiv+Pr0Hp?=
 =?us-ascii?Q?CHvXSjU1orpEc/yYKLW+wI5Y7kars06RUGs9yoRR7FEKGl43Jw++T+c42JfI?=
 =?us-ascii?Q?mBfqljPvzDyvh/MTY8wcroSh4yvDpfy6alWnfOp5VsrJq2Xv8K7FLrcPyAMk?=
 =?us-ascii?Q?cnNpTDiI2GKCLIBcd+uurwP1oWPxcedx7pucAV2DGRK/zya5pIKKdp//lG6z?=
 =?us-ascii?Q?RamzokaSblVWb1ZadQtlznSNdHtqHI1P23JEq9K7REQGEp0VcxXapKTIl63i?=
 =?us-ascii?Q?rkKvuCfBpX8zvuBiX96bGfG7BGuLfgjKAKneDL8jX1qrwgN9rYsAxQhFKJaT?=
 =?us-ascii?Q?5v9OMKNT4FSezW8UrAg1mX7UHf8TREo7f6/wWO1bNc0Xh3l64jyIokubimv4?=
 =?us-ascii?Q?jGFl49z6YUXEf8djr5WIgfAceI2M5FHcFP9N3Xbngt+cmYEj5Z0ovB9E1yFd?=
 =?us-ascii?Q?WYV8cdFL/bsbXEW5+9YwA+Dj8PlrmvajI9XKsesqKtTWZuRCW2HsFQ3RkJe5?=
 =?us-ascii?Q?kX+XFMpykleAlw94E8hWwKzDspH7q/QDOnAHL+LIPscgEvryME2/xWHyYQqn?=
 =?us-ascii?Q?knlNXtTDEzXjqPy8Rz9aVG9RxABNegdC1KQq6E0WcfbVz++OAtz5ZD50bNGj?=
 =?us-ascii?Q?LNscqzV3ObdM2FtXj2ApMBfHFGGzcniT+NJRJPzo96BhdMxhLvwOIJvDf/RJ?=
 =?us-ascii?Q?54fFODVyyc6+hR5BHqHfHF3ECmn9K7559wxZ8DrEM87grSyfD9bIzDGlY5aH?=
 =?us-ascii?Q?lNxKPlY+cd2egeakyH79fCkAVquuaUi2J+XFXmwmVSgr5AgcgNIjxh89U0q/?=
 =?us-ascii?Q?CBE8AHhf8X4Medwc5Nch0AQhnShkvhfr+oovfgkklnwRD0JTz0yt6WHJPbu5?=
 =?us-ascii?Q?uE/rSfcOIw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69def77d-38a3-4045-41a4-08dec0520df7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 02:52:58.8632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rX/PuOIg0N4hthHPL5/ZQPl8nm/yObsoSg63EBL9SWAEkXWYWZquVubW+8dsBNoh806hadmMIXQlZqe1li6bog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_195304_633899_6B7FA380 
X-CRM114-Status: GOOD (  26.42  )
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

On Fri, May 15, 2026 at 07:26:13PM +0300, Adrian Hunter wrote:
> Some Intel I3C HCI controllers cannot reliably restart a DMA ring after an
> ABORT.  Additional queue resets are required to recover, and must be
> performed using PIO reset bits even while operating in DMA mode.
>
> This behavior is non-standard.  Introduce a controller quirk to opt into
> the required PIO queue resets after a DMA ring abort, and enable it for
> Intel LPSS I3C controllers.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Changes in V4:
>
> 	Inline HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET check at call site
> 	instead of using a helper function
>
> Changes in V2 and V3:
>
> 	None
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 15 ++++++++++++++-
>  drivers/i3c/master/mipi-i3c-hci/dma.c  |  4 ++++
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
>  3 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 44617eb3a3f1..770235ad6b25 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -240,6 +240,18 @@ void mipi_i3c_hci_pio_reset(struct i3c_hci *hci)
>  	reg_write(RESET_CONTROL, RX_FIFO_RST | TX_FIFO_RST | RESP_QUEUE_RST);
>  }
>
> +#define ALL_QUEUES_RST (CMD_QUEUE_RST | RESP_QUEUE_RST | RX_FIFO_RST | TX_FIFO_RST | IBI_QUEUE_RST)
> +
> +void mipi_i3c_hci_pio_reset_all_queues(struct i3c_hci *hci)
> +{
> +	u32 regval;
> +
> +	reg_write(RESET_CONTROL, ALL_QUEUES_RST);
> +	if (readx_poll_timeout_atomic(reg_read, RESET_CONTROL, regval,
> +				      !(regval & ALL_QUEUES_RST), 0, 20))
> +		dev_err(&hci->master.dev, "%s: Reset queues failed\n", __func__);
> +}
> +
>  /* located here rather than dct.c because needed bits are in core reg space */
>  void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci)
>  {
> @@ -1040,7 +1052,8 @@ MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
>  static const struct platform_device_id i3c_hci_driver_ids[] = {
>  	{ .name = "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED |
>  				    HCI_QUIRK_RPM_IBI_ALLOWED |
> -				    HCI_QUIRK_RPM_PARENT_MANAGED },
> +				    HCI_QUIRK_RPM_PARENT_MANAGED |
> +				    HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 8e27fb6f18f5..906de7dbfdb5 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -638,6 +638,10 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  		}
>  	}
>
> +	if ((hci->quirks & HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET) &&
> +	    (rh_reg_read(RING_STATUS) & RING_STATUS_ABORTED))
> +		mipi_i3c_hci_pio_reset_all_queues(hci);
> +
>  	hci_dma_xfer_done(hci, rh);
>
>  	for (i = 0; i < n; i++) {
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 83d4f13a68a3..01237b12d32e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -156,10 +156,12 @@ struct i3c_hci_dev_data {
>  #define HCI_QUIRK_RPM_ALLOWED		BIT(5)  /* Runtime PM allowed */
>  #define HCI_QUIRK_RPM_IBI_ALLOWED	BIT(6)  /* IBI and Hot-Join allowed while runtime suspended */
>  #define HCI_QUIRK_RPM_PARENT_MANAGED	BIT(7)  /* Runtime PM managed by parent device */
> +#define HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET	BIT(8)  /* Do PIO queue SW resets after DMA abort */
>
>  /* global functions */
>  void mipi_i3c_hci_resume(struct i3c_hci *hci);
>  void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
> +void mipi_i3c_hci_pio_reset_all_queues(struct i3c_hci *hci);
>  void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
>  void amd_set_od_pp_timing(struct i3c_hci *hci);
>  void amd_set_resp_buf_thld(struct i3c_hci *hci);
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
