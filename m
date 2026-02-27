Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31316FEFB6A
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 16:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oz/yicFU+UplGqzCgKAzyhSvyA+ZMuTh0zm7pCi9KOA=; b=KQSedwNHhsPX2W
	RT9RCFgXCXU4xtxual2a3kmZ6C1YWb2R4uR5SfNZPbfyk5QpDLZxzghx7+54ecVoipPrsSYlJ0Xs5
	y2ax7AhqGIWR0Ik3u1w5zDQhFJN2217Yzzq/jxbS/fwyugJY2Sn5xtvlTzPd7X3cMqSTFeq1tWnPl
	AS3g4JHZeOcqqPWuaNIRNvMjGPOXmIoo79TXUR3dxEhMqPkZc7RTUrLpFmQ1o0QugCfXOtx8NiZ8P
	CAgAMyI5cDiZixk4feMQtZ3qlgNR6vxiYnAT0mOmTXLGGAWHe+wCzotfoDX9HdOQN7z58HXy/RDez
	8rjI5LEDaUFn1fFG2GfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0tF-00000008kKd-28NM;
	Fri, 27 Feb 2026 16:40:33 +0000
Received: from mail-westeuropeazon11010017.outbound.protection.outlook.com ([52.101.69.17] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0tD-00000008kKI-0Kpo
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 16:40:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVlBfQykVNdI+Bw4wRjGp42ok9G/VpD6/5U8lYxrsN4Dum3BIB4Pa8lSZ3q2GkTA3jJchSLd5hFMGW4cmxXH+sSfBDlHrs0aTBG2oIGBqdRV8Kv0V/6LjVogfQH5xV5hkCnFZU3iVrrwLT5BEs0g4qP7y6b4A4Ylwemp1iI63p+0DMn6loAm6FY3yfROuAUIuwOwrhDHG0OydoBMM6MmBcalF7l5acEflWwZUWEbcNBea4fcegsfMK9ANuiIDHum7iRw7NCdY4m1SYlOhwC1EOb5sJKXSsvtxTW7xUvv3HMK2qgxP1eoMC0kvRepuoRATY8QWOJUOG36CPJeF9KLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yf8mMe4tP7TmUdmCoo2p4ujpgYK3XNpwCahZyZk6How=;
 b=XV7Tk88eDlEUEQcS38KBLS2f4AyUahptHqVckxghqMyI1TVuyR1Xr55IgE8leq941Wws7prI4x8TguHfMvKYklVyYWQgNk/NRmP+aqMxrohlYVpA2uuhkmTccpO7Dcq/9KmEV72QWUFSxgS+KhxuUKpoUYoCKvsY+Lw8vH/jO2fj/+r8FmhOfIMlAzrHiu/PA/DJAmlXcPIaIByu0TCpItDh5HCpENcIP6XV1p6U4BU+E1/rZ8rGcTCEGFvl6N971OrOOB10qbiiQ0aLEdhTcBygb10xf1K2hc2IpG4OBSgUQaiJStV2qMOCwsqr/Lad9NNyBug1RwZr5660uiAZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yf8mMe4tP7TmUdmCoo2p4ujpgYK3XNpwCahZyZk6How=;
 b=iFhvfpAEPY6OkEULX1cM+O7TNAQNpRouZPRxrB4D+5tf3P8+gDTxLkm+hWUd7f7FYhLbMxfxHE0mvKmzqd6J6wRdqYA1UMI1nSOQWls3GwxjspClDEy8J8P/e+ReSRUYUBKol5rQ1CkNCc07H+fjRMAeC/41zBstv1fDu10uvVYwsTe4kLwksTbFYna49a8xUBYcv4lNSspBPqgYlCUFTsfuiG/ElHW2ierQKzLPT3jWR1VN+W6Hr7MNriV9xJKRJ0cBPn7PyQnygW0Ord3o2LkfbVUIp03/Tp2OxAxaLxnpBItp0cMIIt4MlmoSpk331npWIaYruaQ9S1teReq8Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by PA1PR04MB11471.eurprd04.prod.outlook.com (2603:10a6:102:4e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 16:40:26 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:40:26 +0000
Date: Fri, 27 Feb 2026 11:40:20 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 10/12] i3c: mipi-i3c-hci: Fix race in DMA error handling
 in interrupt context
Message-ID: <aaHI9A2LTJKHo5Rz@lizhi-Precision-Tower-5810>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-11-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260227141149.184980-11-adrian.hunter@intel.com>
X-ClientProxiedBy: SA9PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:806:24::22) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|PA1PR04MB11471:EE_
X-MS-Office365-Filtering-Correlation-Id: c68a939c-55f3-4a60-588c-08de761ee8ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: S27TeGXQ8XNVynB+KTwPp4ZOiTtgeJgfFxTScsp+Blz9hVOSXOI2kIULDELPEGV4+ZkfEl3mj2cMWf4Rq52oh0wzlT++rrLHtkLWfPlS99666960dtrxKRV/fA+lltjqBpncIgQAlNSar7pb+Rk5psuHapmMXCAczbWFWV3Gf/TP3jl+NX/kq5v0guOSEB0HchXRTTCPxmwqNjXerCSMZ8DJ1mjtJJWz1g0w7dAWpfguVdywSJxqIt051WGNqdlBGvsWehafXMMmunBhffGDLp/cemgVnnuwJt5peQvw40qL5Zxm7ZzATyN7Pnnak0nqtzZoIThpodYF693+Xg8TO+lDkQOQVwBbOSDK8bGyCZddbbI0FawrMTPjYkkbBWthNCt7wNCQ+owQbRu+BWAbECuPmP4fIHRUDp2I9O21GbT3d72dDtFxGnZGklW0cdUART6qGwAYoWYQm3TIyArfJe/SIvrMJL7LbRPs3+vQRxofjfUvvYfg4zadPwpPXMwMmARD95+ZBJuiQ9aU9v2OF7eq7jaUaPZ1qHQlS9Shvfy4x9eKPkUSMidZq+BxV6eDwYt6TlGINtZGxN0Pd11K5+sYbTQDRVRoR9n/au5uy3/5Zplf7O71fbsRb9xOeG10q/Nzz7nejVQ/DATA9KkEAJQhQHgArhp9AjhhcMAexsDnHEa73PnXK0pmDWCzoYNRDjprma4Jakw9AdMx0o6mo/oCrX3NubryKeqXN4SxByXcxwF9FZSTEgBxrCA4G0JZTh48/NKygkUYjfKea7wqYaPMLRlfLjrEKMmLS+rBCPE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FyBrBanK/3tM9v23FKmrRjmyj+q58HJeJgcpfrjhcT21Idb0ibGdFw/+6p4X?=
 =?us-ascii?Q?Xg5D/gx/+0feHKsP6/tZ6ZkTYoXVa9urLfTGqk4N58WNPJ9EW0R8L31RT7Z9?=
 =?us-ascii?Q?eYkYC8Yzgyc/UloqxobdA5dGUxcNWQomjuX1NBO8l80Dd9utk6QkvVq3CJD5?=
 =?us-ascii?Q?TMXQuQce1Zvvev7qudR4tMfyn6GGSKGrYmUDzva84H+v40cgTRK11hwpQJWR?=
 =?us-ascii?Q?Qp5gHSWyVfC/HvhNomPK2QIxrXPK0FbL2DDpVte2iuQ7bcRK3b1DTqoKNdLR?=
 =?us-ascii?Q?g0x6MwbAKA8volZkdxQX9doMOX1Gbe617PbtN82RY42y1z2Qdi5qCQPaWppe?=
 =?us-ascii?Q?LrhyWzx9ZDCKwqw5NdwnHeel2KFuV82cBBZEurg8bDGiPpEMAq0TS4vTHYBP?=
 =?us-ascii?Q?1rVbNBAYooMFl9DZv0ArigwgJJ15MRaynqmsEII6s8sIUrbFDlBkMlliMIHX?=
 =?us-ascii?Q?BtvUdTZ3yRl7jgIWMm3qEY4mGmpRNbFVYqEnS5pjH9k+fjbmh2leoMQX0eME?=
 =?us-ascii?Q?5liq3flR1DwTBGcxDrIGvPhh9/dcIiLB1D134Tev+kO6WmVzhjsq4QuhspCO?=
 =?us-ascii?Q?+ZK/I98spORUfLFt8RWl03kMJbFabzs7zjfEyo0I7NccyyxB+1k8Io+sdvET?=
 =?us-ascii?Q?31Kv9j8Ytsx2vLLQLR6JLORpC/OLxAdt6dNPoM+xKoDzQF1hhRYmvFAbJ7kE?=
 =?us-ascii?Q?l5S+n6qFeZh7g/J8H+E3lWzBCO3vCJw0Da0/fGOEowdAh5nWsfLKbOq5beg2?=
 =?us-ascii?Q?4oNQWBuu/wsr+v1atC56GxM7OD9pLqs4fsOCFL3/ZZVVQrXl64mgUy9GtaF/?=
 =?us-ascii?Q?wDMcC0qE/XKM66vUfKKHd0YCjd36Ptwc19kbyw/v40GkljqkObsBZOLbR0r0?=
 =?us-ascii?Q?/tmzEz+ftv/ENErW5J/kjQZBh1FjY7p9Z/P/YVDECqklEB0Qs44WptyM92A4?=
 =?us-ascii?Q?aGawvOo2d5s5xbFqCtYV2lK/jq55vhY0YtR5Vm7axizv9URGQI5dMkhi1GX2?=
 =?us-ascii?Q?mBLmSEEOvueCzC/zX062nc5dqvTa895eQ//kSP2CASRE+xaMYWxytjwEt95i?=
 =?us-ascii?Q?l1UpuyRnLOzgbiskoLFqUxSgBRpxh9BNBQj2XoHRLsw+UOR9wsLxfVV6F+MS?=
 =?us-ascii?Q?ZVsnfjWjGaHVejUWMusMPxWlK0Dqz/bWnksX6ZzJt7hi+otvaEG05t7YJbas?=
 =?us-ascii?Q?I0AZ99P6TsUZ863wmCh+8TnnEleQy0eU0FJflJTJ4agrm51+cc+tIBnyk6lY?=
 =?us-ascii?Q?/KjKpcTkvBH4jM1kRSXlW+XGa7x0Ay6LmicHTK5nv0JerQc+0nPL8CpYnC/4?=
 =?us-ascii?Q?FUSU0blEHc25ld7SSOeDSG6JGZqgrCsoJeElwGZn3Geavb8l3tph1Q0gUJHA?=
 =?us-ascii?Q?3pnyuMqk8HV+aLxePfAgv5b9IQlnvkWIZsalHU+GRVhL3f77K5nTmfLb86HG?=
 =?us-ascii?Q?ckgObbAbLRzLTNy1q7qy0Z1ckP/d8xSpTXBb9ZEtGz9TroZSWis5PcQeFiqR?=
 =?us-ascii?Q?nM4n0iw1dvXcfrNrHL/7VekDfgIL44W0Eb9yhIr/vUkba/KnPG79QcWCI5le?=
 =?us-ascii?Q?KzJdz4IXQ5uiOwLJtvVE8T/7d9E/zuZWphbEvdT240rRfObhcy3i6Kcqy8Qc?=
 =?us-ascii?Q?c090y55r3Mfi8zdtaioFHcwF7zbUJsiP9Pwc34lUuFoDJcxuoL7HKbVxn/0M?=
 =?us-ascii?Q?fpndmC7natq0lg3uVy0XcuOrh3mQFtvBcFATc2hIGRSzDLMX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68a939c-55f3-4a60-588c-08de761ee8ad
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:40:25.9702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsC0RFEGWXXitCB+cNVqlNZ95YzZyq4cE6XEXg2w03/XBh8w6aPiXz+9QHjklLFhVm8jrJLbHmJEiOliXmlgrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11471
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_084031_124613_780688C6 
X-CRM114-Status: GOOD (  30.16  )
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

On Fri, Feb 27, 2026 at 04:11:47PM +0200, Adrian Hunter wrote:
> The DMA ring halts whenever a transfer encounters an error. The interrupt
> handler previously attempted to detect this situation and restart the ring
> if a transfer completed at the same time. However, this restart logic runs
> entirely in interrupt context and is inherently racy: it interacts with
> other paths manipulating the ring state, and fully serializing it within
> the interrupt handler is not practical.
>
> Move this error-recovery logic out of the interrupt handler and into the
> transfer-processing path (i3c_hci_process_xfer()), where serialization and
> state management are already controlled. Introduce a new optional I/O-ops
> callback, handle_error(), invoked when a completed transfer reports an
> error. For DMA operation, the implementation simply calls the existing
> dequeue function, which safely aborts and restarts the ring when needed.
>
> This removes the fragile ring-restart logic from the interrupt handler and
> centralizes error handling where proper sequencing can be ensured.
>
> Fixes: ccdb2e0e3b00d ("i3c: mipi-i3c-hci: Add Intel specific quirk to ring resuming")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 19 ++++++++++++----
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 31 +++++++-------------------
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
>  3 files changed, 24 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 9cfe12fb9a0e..741f543aae68 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -223,10 +223,21 @@ int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
>  	if (ret)
>  		return ret;
>
> -	if (!wait_for_completion_timeout(done, timeout) &&
> -	    hci->io->dequeue_xfer(hci, xfer, n)) {
> -		dev_err(&hci->master.dev, "%s: timeout error\n", __func__);
> -		return -ETIMEDOUT;
> +	if (!wait_for_completion_timeout(done, timeout)) {
> +		if (hci->io->dequeue_xfer(hci, xfer, n)) {

It is also an error, why not call handle_error() here.

Frank
> +			dev_err(&hci->master.dev, "%s: timeout error\n", __func__);
> +			return -ETIMEDOUT;
> +		}
> +		return 0;
> +	}
> +
> +	if (hci->io->handle_error) {
> +		bool error = false;
> +
> +		for (int i = 0; i < n && !error; i++)
> +			error = RESP_STATUS(xfer[i].response);
> +		if (error)
> +			return hci->io->handle_error(hci, xfer, n);
>  	}
>
>  	return 0;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 323c5ead82a5..4951fd0a63ac 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -613,6 +613,11 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  	return did_unqueue;
>  }
>
> +static int hci_dma_handle_error(struct i3c_hci *hci, struct hci_xfer *xfer_list, int n)
> +{
> +	return hci_dma_dequeue_xfer(hci, xfer_list, n) ? -EIO : 0;
> +}
> +
>  static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  {
>  	u32 op1_val, op2_val, resp, *ring_resp;
> @@ -880,29 +885,8 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
>  			hci_dma_xfer_done(hci, rh);
>  		if (status & INTR_RING_OP)
>  			complete(&rh->op_done);
> -
> -		if (status & INTR_TRANSFER_ABORT) {
> -			u32 ring_status;
> -
> -			dev_notice_ratelimited(&hci->master.dev,
> -				"Ring %d: Transfer Aborted\n", i);
> -			mipi_i3c_hci_resume(hci);
> -			ring_status = rh_reg_read(RING_STATUS);
> -			if (!(ring_status & RING_STATUS_RUNNING) &&
> -			    status & INTR_TRANSFER_COMPLETION &&
> -			    status & INTR_TRANSFER_ERR) {
> -				/*
> -				 * Ring stop followed by run is an Intel
> -				 * specific required quirk after resuming the
> -				 * halted controller. Do it only when the ring
> -				 * is not in running state after a transfer
> -				 * error.
> -				 */
> -				rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
> -				rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE |
> -							   RING_CTRL_RUN_STOP);
> -			}
> -		}
> +		if (status & INTR_TRANSFER_ABORT)
> +			dev_dbg(&hci->master.dev, "Ring %d: Transfer Aborted\n", i);
>  		if (status & INTR_IBI_RING_FULL)
>  			dev_err_ratelimited(&hci->master.dev,
>  				"Ring %d: IBI Ring Full Condition\n", i);
> @@ -918,6 +902,7 @@ const struct hci_io_ops mipi_i3c_hci_dma = {
>  	.cleanup		= hci_dma_cleanup,
>  	.queue_xfer		= hci_dma_queue_xfer,
>  	.dequeue_xfer		= hci_dma_dequeue_xfer,
> +	.handle_error		= hci_dma_handle_error,
>  	.irq_handler		= hci_dma_irq_handler,
>  	.request_ibi		= hci_dma_request_ibi,
>  	.free_ibi		= hci_dma_free_ibi,
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 6680b8640c5a..0f5e5bad9fb1 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -121,6 +121,7 @@ struct hci_io_ops {
>  	bool (*irq_handler)(struct i3c_hci *hci);
>  	int (*queue_xfer)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
>  	bool (*dequeue_xfer)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
> +	int (*handle_error)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
>  	int (*request_ibi)(struct i3c_hci *hci, struct i3c_dev_desc *dev,
>  			   const struct i3c_ibi_setup *req);
>  	void (*free_ibi)(struct i3c_hci *hci, struct i3c_dev_desc *dev);
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
