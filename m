Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD66109B481
	for <linux-i3c@archiver.kernel.org>; Tue, 31 Mar 2026 14:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcHblnd8M0NlYvAl0ksBKTKXwANblCH2kvX95Gir38c=; b=R4/gQ9RczZaGpd
	D/r8K/TZ8b1WduD1tgmxEyFdbiGlp+1To1cZ0mK1ifhZ1ajjvDderOWSbCRhE11eqFN0CcXoA7vDi
	ZK8CueZ4OeEKi0JOMb5XBfTtMx9l0z+UZeZ3k9BF1T5HDCHPNvW2AZJOcmDdHzTnkrG68iEZ89UUm
	AGbWJ3M8aH8I7fW/rS5m1Fs6u8PRE+nxT5zPH+xj/DHSpYvzdwHreC6GfDI7tOpU/Vo2GUnUzkqXP
	6cvuDlcDSvN9C4AnG9koGXSqHUMNZ7BKryFyH5ILxbRzyGODDe1i7Vyf6XUgW4GY6UlYnu5dQuhDl
	y5Nn0qndN3fLeaFr2Zxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aXN-0000000D8Om-2mVa;
	Tue, 31 Mar 2026 14:57:49 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aXL-0000000D8OK-3clL
	for linux-i3c@lists.infradead.org;
	Tue, 31 Mar 2026 14:57:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxtHe0BCX7LeJ9YYJzjze3W5WCmex0alhFit/67SV/q9ZXXDbr5VJWxia5KUfK0m1J08G2U0e0OHAnokhp2TEeW2Vlu6b74g/ojq5OcxSRjzME9zI3BKCsD5OZREev4ly3iUfRPqDQFBL+MlpbPQ2YTrhzgtij0jhoGoBkOtpXQBWRpsB8tE5OmyPEC+dw3UCno3yiL7sMt/V7crZi7YxXD/hvVUFiIR9Ge0SrqZTlnVxKuhXpGVmpplMb77f2uz4kaqZOaliizj7Rd8p6SagNoVFGQS1I/x5Mn2hCd0+w/6DLWiif6gr1ibyf6sd3cDIuqlp0OaDOQOyur+KcD12w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8Xdnk2Bjbm0J9Ns3+I6tcIHKcfCkLOiRBmCOI1tBDs=;
 b=Uyj9EpTy9WSmTwGOUCQ6S1dcoQ8JkKzao0dBUUVNuO7h8shkLhOBZQKXH9ySGfnKuAKK9TL/W1bgTcHuhL0PKFtIeREOqt2xoV36eiOrlmQJ8P++c94/G/Iol2YXdZXBbFJ4xv9R7gm/7BjoX4RPzrnS1vchHUrgZga0jZSIR/f9mnRtPMpFg8i9jaaI/5KGDr7k47sPfoMundOhpPJ2wi9LXlCcJnFBRu2k6l1sLbU1D5OWOlO2HCicAMxqtrfva1T6jYWa38bWYhUfO/9hMV8/zFux5UkT72UVTN6cT1n24j+BrmhAbwNwoY5Ny/BvxiRMUJtVkukjycN9osD0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8Xdnk2Bjbm0J9Ns3+I6tcIHKcfCkLOiRBmCOI1tBDs=;
 b=WZenrs4VXodEQFoQuJXht4VApaEqeYXB0w9o6fFCAr5JJ2+zBnuAd6Xw2B0GNIqMCdH4gpHCExK42q/+Gln9xHcojDSiM+gBsoYn3L/JlOA3/L9j6bOOchGfivG1mKmAjkFCCZOQx0I8sBZ0maemoFaOMUFLAh5miAd3qrUc5lRbqug6UUgvtCfP894kgHJa9vSXa4QSKdnKVXH72KKWxalnJxhQx9tC1WRk53H2zHQ+ujlMGpeEO8uPOC8mcTUw0ISIO+R1g3UAIBg7RtAZGEtTua3ktHcbdFlI/bAHX+PjtYD4sF291G7Ku874sV3d6v1EVHc/0ZBlKHXFr/SJdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6958.eurprd04.prod.outlook.com (2603:10a6:803:137::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 14:57:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 14:57:41 +0000
Date: Tue, 31 Mar 2026 10:57:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: mipi-i3c-hci: fix atomic updates to RING_OPERATION1
 register
Message-ID: <acvg36HWslcwTFht@lizhi-Precision-Tower-5810>
References: <20260331-i3c-hci-dma-lock-v1-1-708bc5848381@aspeedtech.com>
Content-Disposition: inline
In-Reply-To: <20260331-i3c-hci-dma-lock-v1-1-708bc5848381@aspeedtech.com>
X-ClientProxiedBy: PH8PR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 56826787-5d4d-47e9-0764-08de8f35dbbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7xq92urKZR4hckwjq7l++2M+gcWQgijImq+gTCNXJSTaTIKlfq9qGeixHO9YvzvObuDjzGCXS16RrhsGYT7iRBKUOlmzXjh4rKyq4Bi/RSeieMDCh68HLYGy53MlCIPyTP0FnPvMUkXL6um17uYm/wL6UHugiue9Y0rYTEaHh+66Zpz5Li8TRLfSPmZEsmplCPF7+gI4XNEYlSleHftLsXGs09D4+GK3A/y9MWpamWYGvViY3nR77UxAMQMTCMXg1e0qCrgOlvqK78RQinpyWQ0Vmv1gH5mXzt7tbMOHZ+rcZHgq4XWgRXDVNUlZkgsy4Sg0b3KU2HJe+GM0/xSBlwc+yfZkW6tJeCK2s4CqnAK9yrF6+h0/gGc7f/zOJxEl1mOzjUBgJCmeRwgnHIhLZEG23gkE9NxiwW/wy8xUqIfTgoXSumuP8rhKNMJykD8Lpzxd84KrmXzX3sh6e7sqTVDimsD/+q6kCA2+a59l3Lgj1uj7VsVioXREBylfqnvvJ5gH4cWS5vP9tkqruLWqyu9sA842sU6X7mYkHo0gzHbIDi2K+wI80Vci5noNoCZAyBbu6MEPjJ0YaV3EdOjj8uwfgnY+iEJjuzes3VwuFpK4M5TbLVZYbGs8bw8VDPL+4wxy27Ql6QNhuV2AhL7MHTWTjwCgHuuUW8gO+pgyA1t21qPupr+3MQfTxTu6TduPcOotpYDY1h7f9rokPnGYPiL7URFkmKhNqUyf1HV8LNIkOOSvorOqONETrqcH4DhmBtedk0FNOPTg8ZyuqTdo2tm3oESTrK+TK8rcdOW8jWM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jtfzX5KbNx8HM1BVWtKkfBV0E7jd05xy4wp68ltTcW4itTp7AzexAi1S5PG8?=
 =?us-ascii?Q?kpFaWpLEIK8Fpz065wyR7mpW5Hv12tQ08IwAjxWSaaC6yEvCwBVPT0N8OgZ5?=
 =?us-ascii?Q?CUiMWY9mIhlDwD+tIi7sXHgD6HiDbboR6qxnKgB7eNZX95YilYjHxJc1vH2D?=
 =?us-ascii?Q?J7TpXF7REpOyeQSwjQzooUSMfzgn1u/ZvNH7VNsmtW85d1epkotRa0T+lHcF?=
 =?us-ascii?Q?4e4nFzXr4Di7Qe2wwHHJoRi3Du+9ShKss4EeXEXbYmZ5yPFlt1q85qoFXHnX?=
 =?us-ascii?Q?xJlrFnSFOm0xMUNlkUj44RSZgBHq9MJGCeZrqT9B4UelQhO+pQyvb8ikyuJq?=
 =?us-ascii?Q?qK5cO0BV1S4V3O/0fAMoxpZxtujdUJP4cD26HpAgPt1tBAUb+nPaDCmyPkS0?=
 =?us-ascii?Q?uMv7tMKyueVMW5nR+s9PBtzhtrC5k96Xx8vNFAblMD7X5ShcLMlX0JYVXVJn?=
 =?us-ascii?Q?uKgCkKXMqMYxoow4JzYcLrafKJ/+pK1w5HxCRZ/6C4nIDKw9qlAPGSpwR1L1?=
 =?us-ascii?Q?Qqytp7UDVT7HKsnUoBM2vfu0zFLLV997qbisSWR13XvwhgukjAAx5QZ7Wipa?=
 =?us-ascii?Q?6R1hrZZnzPYBX7Ue1Qnx4v5LeXlwnF1fZUwnUU8mdba8INyRPMTHmqVn3OxS?=
 =?us-ascii?Q?ZMZcU3R0tGb+ZKl2jTlkcdN3I0HIQ5uHBWCg+nCbzIlvTDU0RkjPGpBkaZtH?=
 =?us-ascii?Q?onnsaOaN9uQ13XtzreoEQzvlo7IQHhkjCRpxxnTnGblPeDvw2K02jRXoClvG?=
 =?us-ascii?Q?WpebqDkbw1lgjQjmG3Ji6s3E590pD4O95qCRZLtoLzG8GVqAidv1se6RqtCn?=
 =?us-ascii?Q?a0a3ecbFAgirnHCFDsJws+gfnsthapmAm35bT2hE4Y7dmohICYe0P+rRP2Bt?=
 =?us-ascii?Q?wIGsL61lGVZYrl9Ii9VKSdv7uJLqwadIPQe29nowRMmaldpERQ/2wVomU6eE?=
 =?us-ascii?Q?8Ykbxkw+pp6Z6CzueHUet3QfWbAbcZ5V1ecmIvJbXBNxkm8jve3nQkkhHn1h?=
 =?us-ascii?Q?oQmC1T59O21UueiGbjZHE/9xj9dfktKhNSr4cS+aVSxf8XH5SvoOA5s5E0yN?=
 =?us-ascii?Q?qS5zWxmzcCfkjGvGDI2FtZyzOjchFP4wZ+JLe/NsM8IePKk+xpZkM6PP0T3D?=
 =?us-ascii?Q?MqYkHrCiDr3jhgInuer4SdriRq71FOW6hwc5UIMM3SY1MTGP7CjRNHq5m38C?=
 =?us-ascii?Q?1vmw1ijlkpLBe2Fpl4f8mK5Zn7wDDoDFOejcpx4jjrn6qUDWtdeejFt0fyCs?=
 =?us-ascii?Q?rAtMH1QkdJQR9Dw7JqWzlyN425fZm56JUtsYnmZZAHvs8gQOtZGXcTzdPVaY?=
 =?us-ascii?Q?3sVHzM9yZ2IayRf+GM2wJwTRqJy2oIXzhoEKeIVX/+v8GJcjCeubPer3LcAH?=
 =?us-ascii?Q?ogo4y7sDmtEIgwfuYldK6k+INBdVymlfVgzyCVJUAHlBN3iVyJyAb+qkE0qR?=
 =?us-ascii?Q?FCsNhIA8pd25ipljMb+D9tmflDsQXQahkAE0lCvHDBUZ0cQdwDy+NsV+9o8r?=
 =?us-ascii?Q?G5sIqFhQQ+jLyk5brc7dr7uN4V9FHHCrGl+Z4UXAQg80lsrZaGzK+duKlqQR?=
 =?us-ascii?Q?EWMi+9eqElOGkvYjwZB9H233QFfanqgijS5g+A+fIcZLI6pPS1Ez9Nwc2TbW?=
 =?us-ascii?Q?bgLW91ba5CSYceLcs/KAhrOxXxWo/ZY5b8nKLIFV2cjTDu+k5loA5hQ+tLsR?=
 =?us-ascii?Q?lv7vz+DnLPXtxt/tuyvphyTq4mddHpk/z3WiKo8hIABmqh7o?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56826787-5d4d-47e9-0764-08de8f35dbbd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 14:57:41.7386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZK6H+lvNiJGdL+3aIKSY0o4pWTEoKOg/128tf6BgnChH13wh6GPq/mXq4ExIcwacixeMuAmVRA0CGL7N9hu7HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_075748_222630_A88FE581 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

On Tue, Mar 31, 2026 at 08:12:23PM +0800, Billy Tsai wrote:
> The RING_OPERATION1 register contains multiple bitfields (enqueue,
> software dequeue, and IBI dequeue pointers) that are updated from
> different contexts. Because these updates are performed via
> read-modify-write sequences, concurrent access from process and IRQ
> contexts can lead to lost updates.
>
> Example:
> CPU 0 (hci_dma_queue_xfer): reads RING_OPERATION1 (enq=5, deq=2)
> CPU 1 (hci_dma_xfer_done): reads RING_OPERATION1 (enq=5, deq=2)

Add Adrian Hunter <adrian.hunter@intel.com>, who add lock at equeue.

https://lore.kernel.org/linux-i3c/20260306072451.11131-6-adrian.hunter@intel.com/

Dose above patch fix your problem ?

Frank

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
