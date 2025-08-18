Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A793CA0EE9
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Aug 2025 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHxvrL2m5aKF3S2pGz3lPamMYOHsU6uaiDLaL+4NWtY=; b=yo8tF77xSLQRuA
	/aXe5yaIWsvMWiNBGFM82b4gJlBLq4lshqlzMIvzZa8hdr+6jtQczlakecj4nrHPU1W/9fea4sZGb
	Zv6ANF1a9xuZp6UCySWhCpxCx7q9DzbDIBsDsOH6f44ftnUAA6LV5vujDvYBeYzHSpDfiLRTZyO5k
	VVKJiIT3hr1cH+HkUzaLGBSH2ZgXhmY1jJhq2YPX5LSVJMyX2ITRnaCNJQIP1voeDZ+eamu2dDgrj
	TfsY25dGTUxbFMsXdAQ87LDwbyFB3kamP3tJ64WuunXNyqXk+SylCMMsK1tk8U8GskgCLLasXHoW4
	UJeiovUIvNeN+M1MDtcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3jQ-00000008C1t-1fim;
	Mon, 18 Aug 2025 17:33:16 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2OB-00000007zck-24qk
	for linux-i3c@lists.infradead.org;
	Mon, 18 Aug 2025 16:07:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3ZS7PV6e0yXgi9wuzZgBiWMaZWUv+Jquth+wv7Yq5gTNzEs8uPlikFBdXv8H0XmEyVPCOXh+HknusDmCIoC/y5N4k1Sv2TLYN1s1auGC17bHkELuUeTXv/GW9BaqtZbDLGlLNIc5HQtHJcWGMO5sYw8f88yslyk3mtCa0DMjcaVx2i+ishT432/e9GUIINWuFuioQ44UY5hF0fPsiCpivchYlNuoryEdkV2Xtrqm3viwWdU12vC5XoVI6yvkYFqqFIvsda39VoK1xQMTuwMboEYi0fYEcXTqzBby2FUkAVE7e2wEekTqgkAuD7TcMGEZ+Q4woCMKqCCgZi/90XC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfuykVwcGHMamE9UZcgwp0NKbjN+SGs6BIIaBq45gZQ=;
 b=v2nnx4Ff0KDLU7vKhse08nqLKBGwr94g3xFQF9W3JjKgTTT6Cl+HGZoR7SGMENLqbrwk9O3kfB1hj0aslkn9o/IIzj8H3l/ArHfNDdlPmFdinyKvMzv/mAxmcNBx8xMZFEIDWRqAbUQlEGqOBmICmvoMuSYCnxP4v9QiZnjQh1xXmcJhFx+YKfmB+frG28J0iQKw+POvIgyG6mqczpWA4OG5I0EwFfbWgpLR3/VjM5yZxuj15JXwMNXOCwQJh5M4pX3mygPdtZbvJxlnZjQmNIfr9sXE9D4/l14u3NXf/LIp5bTPNvAzLTFK0QJ+qS2JILj4ehzCH4jfjMkO28pkaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfuykVwcGHMamE9UZcgwp0NKbjN+SGs6BIIaBq45gZQ=;
 b=WAxu/ohbYZt/qyJ/Yakaj9sAvHz6JfBPAAa4Gi11lx/T2z0pzy55xp0gX+7Tq1DPud6Ltwhp0h2OpubAUtpKao/PpUqbQM8E2lZKZsYvipoMS6DtFf1us/H0WwKHl2S4K41YwhT6mYguJofephWrMsEdzRzBBS9rKf1YlABp3XACeLLl1aZC4+XbwAVtgXvILmk4eWFABL9tKoFiJvQR/jN3JhRkOroUI96h2LvHq7UGnYUnrMNZhovj4NA6u74VGjtkklh82RszaZTZ7g7YwcdYpO3v0L5WN/PvbZ/q9fm/o50XR4IiYkkrLzEjcPIIoDL78tXkNixTdxSkx0eMNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB9928.eurprd04.prod.outlook.com (2603:10a6:150:117::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 16:07:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 16:07:09 +0000
Date: Mon, 18 Aug 2025 12:07:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 1/4] i3c: master: Add helpers for DMA mapping and
 bounce buffer handling
Message-ID: <aKNPp+xieX4soWCj@lizhi-Precision-Tower-5810>
References: <20250815141242.2013767-1-jarkko.nikula@linux.intel.com>
 <20250815141242.2013767-2-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250815141242.2013767-2-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: BY5PR16CA0016.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB9928:EE_
X-MS-Office365-Filtering-Correlation-Id: 46b4683f-49d9-41d9-d5ef-08ddde7148f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J9U0rsQuEYLtd1oaF0iRQ64WaAjxpYZsQCrYpY56T62ChkAksOTJjWYZt33D?=
 =?us-ascii?Q?SohQncBZ89uKuLU/Dxo0OkzlSyVt0J+SPK4TUTWCfYD9p/te8zzP5INpYXO3?=
 =?us-ascii?Q?j+0sq8BkCk0VmF3w+8B/5SV+nqC589wIGlBHzMmaWG0krwTTLpcnasAaMe8c?=
 =?us-ascii?Q?+VXGdh6A0dOR8OhYlgidYQwDlM8aKNVAQr7XY02V731d+Ic93ufBdRa6de+D?=
 =?us-ascii?Q?wLyGbQirN9Y6Tp2Dqpbbh6+vl9tdX96JyBjvA5IcoEKeCmH8GriKh4/+/I06?=
 =?us-ascii?Q?3rGsTe6tZe0FGQEz8paFLelj/o73DO985n/9yVUUP3mITICNBTvcuuE2WheF?=
 =?us-ascii?Q?ySHjhNRiyes3As9ZjAF2BjtKg6ootAxHlnxG4yMli5SEWtyuEnVTxAln3VQv?=
 =?us-ascii?Q?/SnPO8qfvxyxeUAYOnZOhCBPByWScq2tirArGq7hYWlMfJrLIMnoo6Sy9lWo?=
 =?us-ascii?Q?3MEP9DGdsN6JUtvkp6sTfplR7auOLO1pIIaUxz9fJoucX/FXWEMTFvipg1xJ?=
 =?us-ascii?Q?2N5PxgzKNroIgfDmwBepN0k7vk0fVyn/lJFAArm5Tsgv2J4DX3tLtuDPW7ee?=
 =?us-ascii?Q?Slwk5urC2Jsmx6hSv0+D2FSpFfFXi6GpPXu8L0jZzVWcB+m1qkNxkLR4Z9RA?=
 =?us-ascii?Q?okwSsX5bEsIRnEqmiMUn0qD06uS2/fPP0UCnlAOJ+T0zfw09GZCu3+GDrv4z?=
 =?us-ascii?Q?Q6Ow/ZDp5pvViCWxw44Wqll2hRf/5XvC0gF5KjBuf11fAgj/J+lZUO4V7d7s?=
 =?us-ascii?Q?a8Adtx8VKUM4D0lmj9mGgpN/2E0Zlg/3jx+v2mUlscAtfw1KJ5yeonFJAFDB?=
 =?us-ascii?Q?1aw5ej1uq0rNTqrdT80KyvDzIPp+3VCZg3PkDmkRTlRnePQBcX4M0Mfv0q15?=
 =?us-ascii?Q?JvBCu2QZnz5SGp/xGtFL6/lqVZWQhbkBZrIG2hPuE8sWMxjCwyYPVRfzy/Fm?=
 =?us-ascii?Q?mR/ZTeY/C+89vsDKvJCmfFRtUC2sHbijSAKG2+Og67f/ymWtaZJUqbSebLdW?=
 =?us-ascii?Q?XK/EY/IP/hInz4QRr9jnII4gOMwmsXzJCsUCe14MqWpZ4snY5YnS1lzrL+x0?=
 =?us-ascii?Q?+3JPd1ZIjWxUkkYxhiTYI18F1WJyR+vX8ry4dfaW/iFYQbT6BS9J1B9vNEJX?=
 =?us-ascii?Q?3FVCh6gtVkH5ywV+L3lTq3iVRg3MFZIcoE2Q6kCW1pvNKF+mA8MufORlCZX+?=
 =?us-ascii?Q?gxwL/YYrbniBuJ1dBRHSi5/1HAmWjc4JialR5idwhP1Po90U8EXy8fVIZP92?=
 =?us-ascii?Q?rjYN37ExBDuxTrDEV4czop9W8zvKvJayuIPzoybCGwc7XIIgcv5Xnf28E7F7?=
 =?us-ascii?Q?aN0RZoowPTyzY74TsCvTFXL9HE/7OBhJOFiop5ebp6IsgDrxdJtMOCrp8yOF?=
 =?us-ascii?Q?cD7xJiHXT8qWUEin95Q6lCEKU++Rvns1pQo5broLs0lmp5HIZ+9zlKEX1k2A?=
 =?us-ascii?Q?Q6gBucVCcms=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AqhUSSNa/WjMPw1yCmq+h4e6huMGVeyrzI+Yi5H0EUpaJ6sPGCRnlkDTJcNo?=
 =?us-ascii?Q?LXoKvHEnxbjIfsAhBDWU57KeAt7y4qxo9Rz/yQG65otT3gavpDGgINEbzMS0?=
 =?us-ascii?Q?U9mF9ouFickSM+38oeR4b+N4J4KUcLNS5HbL3hSu6PJY5tqTSFKXE79yB+wf?=
 =?us-ascii?Q?4g+XJP8bzcdCofUfdUwXyHHhr0G6xJiBoHsEJP3RN7KOE2RUo4kcIroPh3oC?=
 =?us-ascii?Q?+tLbtG60K+OaGRayIknPZWU8lmHbq2se2iV2ap2+QnhiPiesN+uTbxZhuCqG?=
 =?us-ascii?Q?FWcJHu5GJ4bR3+6IXBoM8/rIJXsxDWCbNZgRkrfB5y6qslYDk0fS8xm4s/Gq?=
 =?us-ascii?Q?IWQ460d1jLgg0upPTAvBhX5vLlOjKnJQQGp9nzwIYfdJ7CzPGnSjfvcjBtP0?=
 =?us-ascii?Q?tcTR/uv4g3iBokaFwloa4slKtvassukiEUAKYJk7riixFhrN36mS/HdxATBP?=
 =?us-ascii?Q?6TCwwfbWuyNCZxR0wufj5zOHV1pqaz4lnsvykJ+91fZjrUHy4JZBXCJkTF8c?=
 =?us-ascii?Q?i0pqjhGQWL2ZK5jcbP1L7APpLuRLQ2Uh8XMCA9Vr3Ea6vkthdPjp38y2OK0s?=
 =?us-ascii?Q?ZfsxU1lzEOeta6FjJLfsrhSf1rQtF9yGtysCB9YIcDYYpLpTQi7ZLzje39E9?=
 =?us-ascii?Q?OTj2bBKdGkpLDcs3ZotXh6mF4rJAjCtku1qEVlpwF2a7BBHTLabIZVw9kaXI?=
 =?us-ascii?Q?nZ7XFExGpgtA7VsL7z6ILOqnEjD1ha98cLJLafZrLBrYP3QIFbTpfBbbRPz0?=
 =?us-ascii?Q?mAtil5AIWoMpTVVjVUVYHpW1VulW/MpIH1oupKA3xGK+X4u0RDhtJWK3xVQR?=
 =?us-ascii?Q?+oGp5eCzHLdYGOt9oIjixuzp1ZDS2nwR1om0Ib2wZ65wBfrVNKktdBLy0sEA?=
 =?us-ascii?Q?yML9Sbr2EQCj2gTAiY0UgIoRdGhODr73KRz06TF7G5FBA7yJSER53Ra7XXAo?=
 =?us-ascii?Q?ST6bK9ZdkpRDEhVP6MP1jUOQBJgJLD18qFJObxqZ/aOi183RNIa7C0Sql8NH?=
 =?us-ascii?Q?IwT3+fSgHI6rWZg3+aZduKhtKI7Sl1ly4R/Z7qsTDANmSZQlhkrfvZXpN+r9?=
 =?us-ascii?Q?q85L7coFuEizuspzrfzvdiiJI2K3SX8/IZV2wp5H6B90ESSs1sy48DkgnNcS?=
 =?us-ascii?Q?I8DV63c9vCT3WXJsMZn7RZe2z2FVVl7QmcQyFuvW7Ebv2R4+8tKdtG2/sp9p?=
 =?us-ascii?Q?dR7ppmljHy+gqAjL1F2OdOUAtVy0NKuuBwAfBA4jhYPk5MhnU/jVbNH9zVD2?=
 =?us-ascii?Q?UZ/8yqusOnnZIfQWY+2QuwPp+jOg+cnvbmMQMs/fPvzRoFxbx+ZBYjAkQth+?=
 =?us-ascii?Q?+ZDZHQksA2Eq8K8JEdIgpDgFya06jOIV18dpa8P/9LfgHt2zWiU7zu2X+nAS?=
 =?us-ascii?Q?vOJiWt+eJ0tRBZyTTBZ9cXMvXUONSyqIk0tRsFFwZN0yaxpNC+h9LUHY4nDg?=
 =?us-ascii?Q?DZzm1WxOshXFBh4bhYqwY7gpq2V26WYG60ToLXX+Lgl/xyjwjwvTEQPKGQq8?=
 =?us-ascii?Q?6F14CDTGYGqAaj3iLUQqeRK0oYN/b+ahLPfi1GwMaBpl45PZ3eoQ7pfjKYkM?=
 =?us-ascii?Q?PzNftNrl2/OFY7gpY417d5v0EWDlhPw4QgCpEyh9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b4683f-49d9-41d9-d5ef-08ddde7148f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 16:07:09.5450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9nVleFwA2gSmGzd+4/n7TwBpEtdjU+A9Ak/v9uWhk2/i55ZA4kXklj838cdHwGTwX4KEjmQgBw0x3PoffvUcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9928
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_090715_703714_EA8DC86D 
X-CRM114-Status: GOOD (  27.33  )
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

On Fri, Aug 15, 2025 at 05:12:39PM +0300, Jarkko Nikula wrote:
> Some I3C controllers such as MIPI I3C HCI may pad the last DWORD (32-bit)
> with stale data from the RX FIFO in DMA transfers if the receive length
> is not DWORD aligned and when the device DMA is IOMMU mapped.
>
> In such a case, a properly sized bounce buffer is required in order to
> avoid possible data corruption. In a review discussion, proposal was to
> have a common helpers in I3C core for DMA mapping and bounce buffer
> handling.
>
> Drivers may use the helper i3c_master_dma_map_single() to map a buffer
> for a DMA transfer. It internally allocates a bounce buffer if buffer is
> not DMA'able or when the driver requires it for a transfer.
>
> Helper i3c_master_dma_unmap_single() does the needed cleanups and
> data copying from the bounce buffer.
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master.c       | 69 ++++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/master.h | 26 ++++++++++++++
>  2 files changed, 95 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 2ef898a8fd80..497bff57248a 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -8,6 +8,7 @@
>  #include <linux/atomic.h>
>  #include <linux/bug.h>
>  #include <linux/device.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
>  #include <linux/kernel.h>
> @@ -1727,6 +1728,74 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_do_daa);
>
> +/**
> + * i3c_master_dma_map_single() - Map buffer for single DMA transfer
> + * @dev: device object of a device doing DMA
> + * @buf: destination/source buffer for DMA
> + * @len: length of transfer
> + * @need_bounce: true if buffer is not DMA safe and need a bounce buffer
> + * @dir: DMA direction
> + *
> + * Map buffer for a DMA transfer and allocate a bounce buffer if required.
> + *
> + * Return: I3C DMA transfer descriptor or NULL in case of error.
> + */
> +struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *buf,
> +	size_t len, bool need_bounce, enum dma_data_direction dir)
> +{
> +	struct i3c_dma *dma_xfer __free(kfree) = NULL;
> +	void *bounce __free(kfree) = NULL;
> +	void *dma_buf = buf;
> +
> +	dma_xfer = kzalloc(sizeof(*dma_xfer), GFP_KERNEL);
> +	if (!dma_xfer)
> +		return NULL;

nit: add empty line here

> +	dma_xfer->dev = dev;
> +	dma_xfer->buf = buf;
> +	dma_xfer->dir = dir;
> +	dma_xfer->len = len;
> +	dma_xfer->map_len = len;
> +
> +	if (is_vmalloc_addr(buf))
> +		need_bounce = true;
> +
> +	if (need_bounce) {
> +		dma_xfer->map_len = ALIGN(len, cache_line_size());
> +		if (dir == DMA_FROM_DEVICE)
> +			bounce = kzalloc(dma_xfer->map_len, GFP_KERNEL);
> +		else
> +			bounce = kmemdup(buf, dma_xfer->map_len, GFP_KERNEL);
> +		if (!bounce)
> +			return NULL;
> +		dma_buf = bounce;
> +	}
> +
> +	dma_xfer->addr = dma_map_single(dev, dma_buf, dma_xfer->map_len, dir);
> +	if (dma_mapping_error(dev, dma_xfer->addr))
> +		return NULL;
> +
> +	dma_xfer->bounce_buf = no_free_ptr(bounce);
> +	return no_free_ptr(dma_xfer);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_dma_map_single);
> +
> +/**
> + * i3c_master_dma_unmap_single() - Unmap buffer after DMA
> + * @dma_xfer: DMA transfer and mapping descriptor
> + *
> + * Unmap buffer and cleanup DMA transfer descriptor.
> + */
> +void i3c_master_dma_unmap_single(struct i3c_dma *dma_xfer)
> +{
> +	struct i3c_dma *d __free(kfree) = dma_xfer;
> +	void *bounce __free(kfree) = d->bounce_buf;

This simple free, call free(dma_xfer) after memcpy directly.

Frank
> +
> +	dma_unmap_single(d->dev, d->addr, d->map_len, d->dir);
> +	if (bounce && d->dir == DMA_FROM_DEVICE)
> +		memcpy(d->buf, bounce, d->len);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_dma_unmap_single);
> +
>  /**
>   * i3c_master_set_info() - set master device information
>   * @master: master used to send frames on the bus
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 043f5c7ff398..80a621034ad0 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -558,6 +558,26 @@ struct i3c_master_controller {
>  #define i3c_bus_for_each_i3cdev(bus, dev)				\
>  	list_for_each_entry(dev, &(bus)->devs.i3c, common.node)
>
> +/**
> + * struct i3c_dma - DMA transfer and mapping descriptor
> + * @dev: device object of a device doing DMA
> + * @buf: destination/source buffer for DMA
> + * @len: length of transfer
> + * @map_len: length of DMA mapping
> + * @addr: mapped DMA address for a Host Controller Driver
> + * @dir: DMA direction
> + * @bounce_buf: an allocated bounce buffer if transfer needs it or NULL
> + */
> +struct i3c_dma {
> +	struct device *dev;
> +	void *buf;
> +	size_t len;
> +	size_t map_len;
> +	dma_addr_t addr;
> +	enum dma_data_direction dir;
> +	void *bounce_buf;
> +};
> +
>  int i3c_master_do_i2c_xfers(struct i3c_master_controller *master,
>  			    const struct i2c_msg *xfers,
>  			    int nxfers);
> @@ -575,6 +595,12 @@ int i3c_master_get_free_addr(struct i3c_master_controller *master,
>  int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  				  u8 addr);
>  int i3c_master_do_daa(struct i3c_master_controller *master);
> +struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *ptr,
> +					  size_t len, bool dma_safe,
> +					  enum dma_data_direction dir);
> +void i3c_master_dma_unmap_single(struct i3c_dma *dma_xfer);
> +DEFINE_FREE(i3c_master_dma_unmap_single, void *,
> +	    if (_T) i3c_master_dma_unmap_single(_T))
>
>  int i3c_master_set_info(struct i3c_master_controller *master,
>  			const struct i3c_device_info *info);
> --
> 2.47.2
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
