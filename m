Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B23EFCE41
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 19:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SpkASf9Azl+gNAjJl1ER+IFEca5sJc33A6rpnbeZJ8=; b=p7si/weVguUthy
	yeOvSpJK02r/G0aNpIiceLKiRee2Phax5uq7+rl+Q+4ayFdDllc3wZOhWH6bDvxqJysLbs1RxyOlk
	cnFr+4h5LF08bPwe3ZzqV4vxmwwD5QfAohqUKoMLnLJzThphpbpvFFTyIOFuxk6UQ9GDm79kijMvf
	w9RvhUfj14R4y8kJZKcHFBwbm5mf2yFZmLoi8WndJlKxcB9oE5U6jynJQTRN1AtolMILCyapFXdOq
	BAnR1RX7DdBYNREWVYqV92mNY/q0rmeiR9AsPohTPCJJUjPrytO0CK7WfdUsDrUIcL2k8JbcLdh61
	6wjM8WIfeNdUvVwKsvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsJ5-00000000Q8v-1iQy;
	Wed, 04 Mar 2026 19:54:55 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsJ2-00000000Q8S-1pXY
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 19:54:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dM1cW/XzCVhtA2CCHnG7VA9Moj884In6I/QaTaYPDoCB2VtIArqpKubTRopU1qqtrbA75G49S/QjntffJKFgeUh/5Ko1ElBmETurRW+08dUvZfKoaU2dHZSX9SpkCfxI8JClMA1L8rll2UwA07QYRgZMULIXdBreCT2v5wLYgr8j32SDxBHvBn3xDBWqyVSx+1LEEFGzpqyp6AN3+aP0v9nd3Tl4EmvheP82k5XDuXqTecvXO1W/ivAUnv620PWYeXTti9ReVIWWWWvFV2lsoa9ikzFOvSk6+QUMbdmiSmMEmHM74yAsXven2MAGywmvBhW3J4cXjM+JAaBGRTj+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghIe5Ss/CI6z9aQEZ2QSIwjzxPUMJfhDAx8LDb6q5lM=;
 b=huxNaYMiuf///q08nSmT8D8Wf2KYdvOJQiNNnOYKXbHDFvahtaFkP34L79u6jSM0VK1JmvBQOkF/x1JHv8r0f94IhZYu9OByw0OXwr32C6KKJQ8mcLnRMtltltyFTUiG5M26saFzIpCAOPQ/cyuhBOycpG8xbAqRrUMUvVdHzL5qQc8etl99CKlwL/1i4RBZepq72ufn6jTvfSOAWWWmuhiE8PSOlqF7FmGNOLREGL7bEL7WN6E5sDSMcsRirMaIubZBYOFX1GzehBp30+q6XhUSRYlt65WB+JbNUeR13hoAoHM1/A/FUw0F5al/QiV37RJkNhiAn09c23RDU07wQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghIe5Ss/CI6z9aQEZ2QSIwjzxPUMJfhDAx8LDb6q5lM=;
 b=XwayuX4I+UQhFFBNyV/4poryTov1WO3H7lyc0KFbUW3gJ/qstmQA405KpKCVh/tIyY7LazQrNrgbZSpf93Qal7MgQX3l7d1vpHVh97NU/R+V6vkP/UJYefbynt3FbT7/OzDEMFdGSm6R/oq3j3j3YF4D1hp+hINOHnvsVZp5T+DhrHDk60l5QAsw6B9NGA3ETEF7drauyGPuP8YR1hdCTCq2lEHcO4DMpDFHAgwTafY0viJ4GjFtWEOxyZB57h6smrMvFu3IbU5BK5jfHTeGSdR3W4ucfyvqejDseylPnAh33y8w56hOPlEyuvA5swNJYgbrFfDnYDnClgW37tJ5/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8798.eurprd04.prod.outlook.com (2603:10a6:102:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 19:54:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Wed, 4 Mar 2026
 19:54:49 +0000
Date: Wed, 4 Mar 2026 14:54:43 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 04/14] i3c: mipi-i3c-hci: Consolidate spinlocks
Message-ID: <aaiOA_QoKkmJahPE@lizhi-Precision-Tower-5810>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
 <20260304181706.143841-5-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260304181706.143841-5-adrian.hunter@intel.com>
X-ClientProxiedBy: SN1PR12CA0047.namprd12.prod.outlook.com
 (2603:10b6:802:20::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8798:EE_
X-MS-Office365-Filtering-Correlation-Id: 21939e94-579e-40a8-4859-08de7a27e471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|1800799024|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: PHOO0oGDAoFgvwdFXelKXIxi4f5xZWdMjOP6tOng7kjCCLwotfWwQWfCQdkaJspgyJ38sL3qBV6SGBgDu4nTsS0utg7diiNKZGyTsOnvPZmupswUq8ho5Dli49YoGR7vykQ1LCNlzwdDnMDged6srophkgIlUtps5HaN258heiFk8L1Cf0YTbfsuJ34fNu3xzpHig1ks1HgWcIK6xnKCEI13Z90xXqrpGPa1P8bkljK5dneNaPKHw2RkRGgZu8ojE7lqYo7xsozFMXmPd1ThzGBjI58j90CHyHyVz+JYHy5NSj9pk+VnxebdVPmXm5Xw4L1mJFRaRCouWSeSeHUwWX5wVu2eaxXPLeXR67C/gFR0Vgh0ANTjemNuwkp19AWWdBt7MfD+cHFYLzgDiU03GWdAsCK/g3Rd5ugYxmP7m3HOS364TlNBgVYea+L3kWo2r0h/nrTpEXXtM6rV3HwOvavFAwEfrzqcp01CUH0QvFRbqC2Q3lSR0hYkRldZoSECSXme6/AWQf5+Uk292SP9twcFPS/TbLdDM7BDhdh485eOd967Dc8jjIfD/zieGJvS5Hi3vpw2gRs27UxQ33oXJe9bPn1XRR+JZ/lDs1dlT2OwcCVXE2ttQErnxCwiTLLzto/U0oNoT8twvAmDh2+QP728CkPZaMMddN3/3R9iJvsWIZO8abeKGNd2tJxYilWm0lgQ+EfsRQYskHiISwXYOE8gKu17jDRex10utPbULXCaOzIttavZpPlDawgocbuZEomAvcM6nqM4Deb1/Lk5l/4MK+/I8KR/sPRxiv8Yjys=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(1800799024)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?96p7QF6Y/0XmdK96ARtYsMRNmnkEDar6mJeaGcevRGL/YyAaS4bB3frAQB3k?=
 =?us-ascii?Q?85eqxClM9gN9hV9f32NJgeCGQiuOdFcvU+p+MnfrUPpis+SMNUpa3RrLtF8U?=
 =?us-ascii?Q?93nNOS60mZPBzlkj0S4n+kz0EjlfWOPLh//Cd8r3MYRr51ph9OivgUzGHzXy?=
 =?us-ascii?Q?fQLRav2nHKvgn9NLPlv6qM5BvvwB7CGzOzDDbNDpmjGJCNaUnrVz6WDMSibN?=
 =?us-ascii?Q?H9xKqqegSm8lyAWccd1B2jbVKGZaaAb8NRkmQ6CLwqyUele31+PjqcJj3fYE?=
 =?us-ascii?Q?+bTB0oW5gsG5jxcLk6E9NfBVwDvNyVIK5cb/YVWkEwRgRI80fMmfyyWUoBdR?=
 =?us-ascii?Q?+WA9sWJmjvq1+/0oMlVU+yS/HUEUZu1wKgTsgUMnnmqRdZEPQV15PvGsqJvW?=
 =?us-ascii?Q?9j44nTl3D8kuQkbRUHNvmZXWP8jOFnjndyIdguumNr9bgWhAZMa60L4JZwVu?=
 =?us-ascii?Q?U0Cr+KIJGYtMLoX/byK95APVVRdlmYeh7bkxSY7nEVjQ4AzpAiyz0uzIvalR?=
 =?us-ascii?Q?aMoMHzT66Q7ogkvphXn17U0WjCHWu0Cqp0c9g1TNV9g2OAoSAp+fMwZJLtby?=
 =?us-ascii?Q?rXKnhe2c/vxVuon6DqDIxm5uZRmVT8prG3fSvotb9OSjkEPK0bGsfdYizlLI?=
 =?us-ascii?Q?ssWtHUEukk1x/ZUZ3ljJEe2O7fiF7UtHKwD3moB7uDtgMU7GaVDhUxpbPNHC?=
 =?us-ascii?Q?J6skbDVRc5Orza4MG/cHDDFRn4KnlQN7KUOzzKxIfvnHlcJbBBiVgHlcNL3q?=
 =?us-ascii?Q?X3C55SvKVOzEUENXz4rekOCuXmAcVq0fX/DtFxoejGnopITkmgOIRf84jxex?=
 =?us-ascii?Q?mWx+eaY04IWP5AV6mSmib+a6h6sf7MVNfq41l4lWgWiLpubO/WyWaBsyojzY?=
 =?us-ascii?Q?M4lEgl2S5Pv0tyIQo25tpw8m+Vy1/ocyeaU4uz0TKfPicQVHgxDqdjd9+qUW?=
 =?us-ascii?Q?nVBzuMEb4DhN/ql1zri0RGZxz4O2X/q9nRT2UqJqjd9Yg1XrVPSsadSVheMF?=
 =?us-ascii?Q?Pbz51SYsZQI6XqmEAopGgqJZ3hTcfscBpEIRVCDFPLzJWcIwCNbkqqkfE5NR?=
 =?us-ascii?Q?ac85od/cksYl31EU/c/6pgnHJcRpvEWg2FJDqevq24ZLPPbtMNQD/b9bVhd2?=
 =?us-ascii?Q?NffLV3+DnmjfIQ61J9yQhuhVHGeH5+OGW0I6jiZjpltHC8UFTaMtp9jbVdK1?=
 =?us-ascii?Q?QnXymhe7zRtJLUPaT0SouHnwQyl2ZD72aO7KVEfc8ym/EAPnYn371eNED/4r?=
 =?us-ascii?Q?s0qoenyMqBw7HF7fhGSgaQDgoFoXJqP0Y/H3CWmVlb0YOnQ32yT142QBg6hG?=
 =?us-ascii?Q?aoEvtyBz1K5x9uXOOqoabKF7pjwdT2kyTm9Gc4+HMfoD2Oo8eG4BUQYr3V2f?=
 =?us-ascii?Q?15DjhxpRyrHJD4YTGV/tZNktXxBpjflMBmcS8a16VCrs52VqicmkBFuE2n3L?=
 =?us-ascii?Q?3lhKAiA8WKsb9l+S1P7qbu2mEWHR422PuiFMjR3vP2zJ+wFyFxBrEC9GU9PS?=
 =?us-ascii?Q?cdTEcwVCu6LGivn10xg65pr4HDt2TmFd7VPUSTJEPzuhiP3WBQsYkSrtPq0q?=
 =?us-ascii?Q?5OA7b5f914OaIOD3h8S8rcs/lpZGdPuscrgSzGijA7WgmRbMTE8Q3bzdOKuT?=
 =?us-ascii?Q?iJLkf9mTgzSgLj5Y1ypHi4hZZu7CmWn1tRs8jJsy2ufkj+tSfrVlVQjfiSI9?=
 =?us-ascii?Q?z/IQs7EDAJv/nCTwPE5FJDVYlB+4cRbTU7yCyCBQOPaN1mYB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21939e94-579e-40a8-4859-08de7a27e471
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:54:48.9526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQYxeaAr/dOa8UNZTHODbtXMvydRsAwpc432LatD+r0cTLebItthlSXMPfsdI1zDaWmjYwF3OYVcCA1l0P9/kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8798
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_115452_646713_770D2FE6 
X-CRM114-Status: GOOD (  27.49  )
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

On Wed, Mar 04, 2026 at 08:16:55PM +0200, Adrian Hunter wrote:
> The MIPI I3C HCI driver currently uses separate spinlocks for different
> contexts (PIO vs. DMA rings).  This split is unnecessary and complicates
> upcoming fixes.  The driver does not support concurrent PIO and DMA
> operation, and it only supports a single DMA ring, so a single lock is
> sufficient for all paths.
>
> Introduce a unified spinlock in struct i3c_hci, switch both PIO and DMA
> code to use it, and remove the per-context locks.
>
> No functional change is intended in this patch.
>
> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	New patch
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c |  2 ++
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 14 ++++++--------
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
>  drivers/i3c/master/mipi-i3c-hci/pio.c  | 16 +++++++---------
>  4 files changed, 16 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 4877a321edf9..faf5eae2409f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -926,6 +926,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
>  	if (!hci)
>  		return -ENOMEM;
>
> +	spin_lock_init(&hci->lock);
> +
>  	/*
>  	 * Multi-bus instances share the same MMIO address range, but not
>  	 * necessarily in separate contiguous sub-ranges. To avoid overlapping
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index ba451f026386..2442cedd5c2a 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -131,7 +131,6 @@ struct hci_rh_data {
>  	unsigned int xfer_struct_sz, resp_struct_sz, ibi_status_sz, ibi_chunk_sz;
>  	unsigned int done_ptr, ibi_chunk_ptr;
>  	struct hci_xfer **src_xfers;
> -	spinlock_t lock;
>  	struct completion op_done;
>  };
>
> @@ -344,7 +343,6 @@ static int hci_dma_init(struct i3c_hci *hci)
>  			goto err_out;
>  		rh = &rings->headers[i];
>  		rh->regs = hci->base_regs + offset;
> -		spin_lock_init(&rh->lock);
>  		init_completion(&rh->op_done);
>
>  		rh->xfer_entries = XFER_RING_ENTRIES;
> @@ -534,12 +532,12 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  	}
>
>  	/* take care to update the hardware enqueue pointer atomically */
> -	spin_lock_irq(&rh->lock);
> +	spin_lock_irq(&hci->lock);
>  	op1_val = rh_reg_read(RING_OPERATION1);
>  	op1_val &= ~RING_OP1_CR_ENQ_PTR;
>  	op1_val |= FIELD_PREP(RING_OP1_CR_ENQ_PTR, enqueue_ptr);
>  	rh_reg_write(RING_OPERATION1, op1_val);
> -	spin_unlock_irq(&rh->lock);
> +	spin_unlock_irq(&hci->lock);
>
>  	return 0;
>  }
> @@ -637,12 +635,12 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  	}
>
>  	/* take care to update the software dequeue pointer atomically */
> -	spin_lock(&rh->lock);
> +	spin_lock(&hci->lock);
>  	op1_val = rh_reg_read(RING_OPERATION1);
>  	op1_val &= ~RING_OP1_CR_SW_DEQ_PTR;
>  	op1_val |= FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
>  	rh_reg_write(RING_OPERATION1, op1_val);
> -	spin_unlock(&rh->lock);
> +	spin_unlock(&hci->lock);
>  }
>
>  static int hci_dma_request_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev,
> @@ -823,12 +821,12 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>
>  done:
>  	/* take care to update the ibi dequeue pointer atomically */
> -	spin_lock(&rh->lock);
> +	spin_lock(&hci->lock);
>  	op1_val = rh_reg_read(RING_OPERATION1);
>  	op1_val &= ~RING_OP1_IBI_DEQ_PTR;
>  	op1_val |= FIELD_PREP(RING_OP1_IBI_DEQ_PTR, deq_ptr);
>  	rh_reg_write(RING_OPERATION1, op1_val);
> -	spin_unlock(&rh->lock);
> +	spin_unlock(&hci->lock);
>
>  	/* update the chunk pointer */
>  	rh->ibi_chunk_ptr += ibi_chunks;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 337b7ab1cb06..f1dd502c071f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -50,6 +50,7 @@ struct i3c_hci {
>  	const struct hci_io_ops *io;
>  	void *io_data;
>  	const struct hci_cmd_ops *cmd;
> +	spinlock_t lock;
>  	atomic_t next_cmd_tid;
>  	bool irq_inactive;
>  	u32 caps;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index f8825ac81408..02866c2237fa 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -123,7 +123,6 @@ struct hci_pio_ibi_data {
>  };
>
>  struct hci_pio_data {
> -	spinlock_t lock;
>  	struct hci_xfer *curr_xfer, *xfer_queue;
>  	struct hci_xfer *curr_rx, *rx_queue;
>  	struct hci_xfer *curr_tx, *tx_queue;
> @@ -212,7 +211,6 @@ static int hci_pio_init(struct i3c_hci *hci)
>  		return -ENOMEM;
>
>  	hci->io_data = pio;
> -	spin_lock_init(&pio->lock);
>
>  	__hci_pio_init(hci, &size_val);
>
> @@ -631,7 +629,7 @@ static int hci_pio_queue_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
>  		xfer[i].data_left = xfer[i].data_len;
>  	}
>
> -	spin_lock_irq(&pio->lock);
> +	spin_lock_irq(&hci->lock);
>  	prev_queue_tail = pio->xfer_queue;
>  	pio->xfer_queue = &xfer[n - 1];
>  	if (pio->curr_xfer) {
> @@ -645,7 +643,7 @@ static int hci_pio_queue_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
>  			pio_reg_read(INTR_STATUS),
>  			pio_reg_read(INTR_SIGNAL_ENABLE));
>  	}
> -	spin_unlock_irq(&pio->lock);
> +	spin_unlock_irq(&hci->lock);
>  	return 0;
>  }
>
> @@ -716,14 +714,14 @@ static bool hci_pio_dequeue_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int
>  	struct hci_pio_data *pio = hci->io_data;
>  	int ret;
>
> -	spin_lock_irq(&pio->lock);
> +	spin_lock_irq(&hci->lock);
>  	dev_dbg(&hci->master.dev, "n=%d status=%#x/%#x", n,
>  		pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
>  	dev_dbg(&hci->master.dev, "main_status = %#x/%#x",
>  		readl(hci->base_regs + 0x20), readl(hci->base_regs + 0x28));
>
>  	ret = hci_pio_dequeue_xfer_common(hci, pio, xfer, n);
> -	spin_unlock_irq(&pio->lock);
> +	spin_unlock_irq(&hci->lock);
>  	return ret;
>  }
>
> @@ -1016,13 +1014,13 @@ static bool hci_pio_irq_handler(struct i3c_hci *hci)
>  	struct hci_pio_data *pio = hci->io_data;
>  	u32 status;
>
> -	spin_lock(&pio->lock);
> +	spin_lock(&hci->lock);
>  	status = pio_reg_read(INTR_STATUS);
>  	dev_dbg(&hci->master.dev, "PIO_INTR_STATUS %#x/%#x",
>  		status, pio->enabled_irqs);
>  	status &= pio->enabled_irqs | STAT_LATENCY_WARNINGS;
>  	if (!status) {
> -		spin_unlock(&pio->lock);
> +		spin_unlock(&hci->lock);
>  		return false;
>  	}
>
> @@ -1058,7 +1056,7 @@ static bool hci_pio_irq_handler(struct i3c_hci *hci)
>  	pio_reg_write(INTR_SIGNAL_ENABLE, pio->enabled_irqs);
>  	dev_dbg(&hci->master.dev, "PIO_INTR_STATUS %#x/%#x",
>  		pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
> -	spin_unlock(&pio->lock);
> +	spin_unlock(&hci->lock);
>  	return true;
>  }
>
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
