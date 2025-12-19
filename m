Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824C1D7879C
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7lLM10Lb+kEL3vWqi9CUDRwXZdabiLUrWXxv29H9JBU=; b=k0S50Uq6qSrHAz
	RMBovx059H3IYfc5/qIkdnubUN3DV2OXmC49N+j839EK1ESESr6YwRT3rzWmpzK6QAxWdd5s6p2m9
	ySG4yDwYpO0nC8p65ssSKY6OoA1aP+LE/ntDwHSgQTWttLfmXjBeq78Q9GDu4EzmrpUkmWfM+w2mn
	67ARxpDCx1w3istyGKT5eonHEqxLuLOwt0/SAtVBSa8n7DLp5sA1YT27h42f2l1MZGAu+W1zcsaD3
	d+YDulUlm5J8VGKwa/H4eUCMrwS6E3fU9YEaf0go32fs/l7wQMEo1Ypamq7WdTjoTcdOaYmgPFs5f
	wnFVE04ThisWtaEcRdHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdFO-0000000Adru-17WL;
	Fri, 19 Dec 2025 16:22:30 +0000
Received: from mail-francecentralazon11013066.outbound.protection.outlook.com ([40.107.162.66] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdFL-0000000AdrJ-05hr
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 16:22:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSfBwndzKBmfo6Dmo/F5ZdiExorULHqxz2xvwpwKv3EbOvw7xkOYNTRMsLfyz9wywHaABg2K2lM3OTXtnaCuPVv9xppiCiDYuxXXTnXw0PaQ11Kd3uYkSny9t/ICGF1E1UW15kXMCq5qLNfo1gfM/9IfOLa4xpyVs/KTonzjIMzusezqAA0mCY6J7fO/xlAMRLXs9T/0nJ8lxvSkqn1Zw+haGTdefZ3bfDhbfcnKC3hUW6lvzMo/urp1u8YTS2o2rJSjZaE94cteAV92uQkftA4fWIu4DyVMXdOTplaed8YqSP1Y6Kh3WjL/XdUJNSl1Bf/IKDvgBvDlikq2i0ryxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4p7PK0cR0VkGsjNURvfdk4uRcjYnBWGKqmeTYJ5TAE=;
 b=op0Twz+1hddu3ekT/iH3iaVTgxvrQeCP9Duas1ywPWTBof8nwMYZJy4eDFNjo6QkiXa2UX558xyr8g3r1BnkVqdEusBsjGaHz6zwNo3sQvV+KP//hySu6KBnzPTxxWmxOh3eeYt8OA8+KKo5Je5yIxlOKPY3vaHrnHhkyYv7cuJUoQMEuVjwBVdaX+qdLE0uWwr5mTlb6l8QhjWjYLX3HF8ngnP7GcEjpCesbUYx0NChGLnpf/wSbiu3MmFMWlPjVIyMy5hUlrQ8g6WDNCflauccBW/8g5sWeFjpsV8+GTIEo0TTgv1vdgW/Qj2N7rctOlDUS/FQfRhbonsYEUPChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4p7PK0cR0VkGsjNURvfdk4uRcjYnBWGKqmeTYJ5TAE=;
 b=VHMn2uojJL2FKaKQZijjzCAf7IVFCB2OgGrGBg0JJ81xSxZZT7K2h8/NkCTcyUbsUSfRVUNzZpOdjsmi1gmuiSmDIAkkIqVSfI7OdKtmF+Ybko7CphNDaU6XYL8F7H4u7WaZxeYZm4m+pAyb4crBv9uRPUriiojcQAKMnfNLwdUnQ9C63Fl3SV4bTEdq6GDa37X03Mhbd8SGqBtOucOb4QhUdo9ttgXupkMwN6w7xDYafN7fq0s32WhzBctkOeQgZo9fds2RUIJp8EPlqxxf210I4zJOfaRmqhBvK0PzRQxyKtUAnEHxdKLl2FQ5eobkq4x8BYIP0uVEPiNCfpUjcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU0PR04MB9466.eurprd04.prod.outlook.com (2603:10a6:10:35a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 16:22:20 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:22:20 +0000
Date: Fri, 19 Dec 2025 11:22:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 02/17] i3c: mipi-i3c-hci: Ensure proper bus clean-up
Message-ID: <aUV7sBxyb+/hC736@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-3-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-3-adrian.hunter@intel.com>
X-ClientProxiedBy: SN6PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:805:de::32) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU0PR04MB9466:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af156ce-fc7c-4836-818d-08de3f1ac891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m3wRqhTlxdGqqBA9k5EZEpgANSB8gO4DCvIzE5awipw0YRykHEliEcbKrqrI?=
 =?us-ascii?Q?kriCUD4e8sp8NKgUkdD7rtC0oikjvzs1+tUUwalptYXP0hKD5GWoo0Cja3Ru?=
 =?us-ascii?Q?yaVWNaJv4J94dkjGuy5dL/OtEhmGjfVGmX+WUaf3kSWmIYeLRHdeB/aMIgzW?=
 =?us-ascii?Q?y13dbDz18XwodklAIm8CWZbk99hqxI7zcdCggM/H64zBbOWdRYw0Sf421LAu?=
 =?us-ascii?Q?m6SnOoADidHQ64eeF6CjCktP3wkpo6a7HkQ74aRuOtFNQJoCU3oLt5/NN4X+?=
 =?us-ascii?Q?ljg0rlVkwSWKb91pr6UQCWpXYBYeVc7IStk6NE3C2COxuL2y+pLt2iO458Bm?=
 =?us-ascii?Q?JxIYn994tH5Kml/ijgEQrIE9WaQweg6Zo/NJPNbzVqn9hgFivIuoX/dUUHWy?=
 =?us-ascii?Q?RAVz9Q2fLtdo/v5ZPw45hLElVY73LdN5LJGc2iyc6D3kZ2LcklWsAgmPVC8n?=
 =?us-ascii?Q?BXJn9qKtRib4BGAhDCNTnTq0h+vaBn8vEOXftH6PLWmnC4W3i1zR6hYw7Tjd?=
 =?us-ascii?Q?W7wNc668aHmxCaNSVe2dzpObPHiORbgHOBITGv4xPRPEYayIhhePFrzHPYYj?=
 =?us-ascii?Q?UxunxVxYb9IwL6BuJoQPx4RrLVUl8uyk7PONNNkF8tLk7oFyrEYguoHHM5Pb?=
 =?us-ascii?Q?i2DbK5nbeYbhYKN0Q+huk1UCbNoPU7knafo/JqqWZA3DJCh3Guzaale1EwqR?=
 =?us-ascii?Q?/D+R2z9hXTZutQc5WbCcZCVgXmWfwx7km8ScMjn8AHVT0UdjqUCKSdMdgb89?=
 =?us-ascii?Q?1OlT5As/2IDyrzSOjOY5E99FfPqyTkRr+K1xhC8kx0CBlW4CbBijlLiXGg0o?=
 =?us-ascii?Q?mqlU1TQX4/V8XiA18Pt3FXGnfXZNlwkPE0QpZKIDQN+lfk6A6jo9YgzAEKkx?=
 =?us-ascii?Q?N7MTx1ZJvssMCYti3NtTkDcQU5FT9urWG9Rpa7DtE1UGel12EIxM/1jY0TKX?=
 =?us-ascii?Q?C5lzOg7uGEAHe99L54HR9RMmUMPxzZhRNRdPNSiyPVaa3i41cb2k5b8dVxZI?=
 =?us-ascii?Q?gDcAwgpQIPKza9IeSKB5GDGk9KOR6WpHWOUDDDEPp5Hd2dkDnvj/uCiiKRvi?=
 =?us-ascii?Q?TGPVVE0K+s/eb/1CVIOV1Y/g4mLKSpxt+FokfmvaqtsQnWrV6iiJNumhJgVu?=
 =?us-ascii?Q?H7TqnbKN0TnqqQok+c1PAzXDaotUS+CEzceLMH1TVC32TwecczNkxSnntgay?=
 =?us-ascii?Q?5dP2uDR1+Ny8S2Wgid/QDFy0piVjH0JIq/y5VPxH2i2wxoqT682VVl5dPUEU?=
 =?us-ascii?Q?w3jbEPCf54vMC08qWDlCLx7hKItTBloZYPgGR7x3E2C/OtkarkLWLy/5los+?=
 =?us-ascii?Q?kiPARLLkwirNpeEHdX68qpmP8XnGBQ2/+mEn9F+xTf6hlfAnUBlBFrJYw0S9?=
 =?us-ascii?Q?6EBGqP1jAKcYCPK6zeLLZAzZTPr/lbE/BQvNF8X9nIZc/L6xQQ/k3R0IwWez?=
 =?us-ascii?Q?pX8vTltZR7E8fIvM103XQx3vMjD7Y6KXR3liRisr21hRGh8C082OubyLyaej?=
 =?us-ascii?Q?YGQQqGbPgZ638n1v/SS6jiPtMAFnWkuUMQWt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wAEkXlljlh0hd7pgBKnqnuijFR8Qpf6xGdqqutqFFNUNnT1WilDr+2zY+R5U?=
 =?us-ascii?Q?OHSNj7GZoOv+vH0bPXJqn5wuuRJJljTi2qnZxoCoULaIDPRsXpXv68Mseq2H?=
 =?us-ascii?Q?+zNWbijGnprdG6N6GBJD8EKV15l/VNRpWlpIjI5cz5W85bGa1s3WYyZdxH42?=
 =?us-ascii?Q?J2Xl+s469m036rzl651TI3ZyXQAQaTdyDXq58FpPvqKTMMbqM322Knv6C0/S?=
 =?us-ascii?Q?i3JLVuJ+LTDj8rGB3pQt8Nmqeeq1Dc7ZwdWYfEqK9XNZaRIqU9S4dP9lsQhV?=
 =?us-ascii?Q?TZpXmvLgM8D4Ot+WnnpKymF28QMoIpoZMUvBfFurCAFWLfZMSCvLzFet4b5r?=
 =?us-ascii?Q?LeMREtP0ovrohXudYVs+iaioCZ9Nc8rzGASPr9meH29CKczLKs9ui8AMYuZP?=
 =?us-ascii?Q?HXjv9+hYHUwtj9iyt8ms5DaZ2Z/JkAysYdZtmSMrKoSfTx1g8bZkehFgd26R?=
 =?us-ascii?Q?8+AkkwftcrHBb76CYJx0yfzkNLIuDh29umtHSABlMvwyxq31STLcavCe6fe3?=
 =?us-ascii?Q?e7xH36aWUVdUrpEjPqM9CqMe968z4sVBJ3aPEwK2P8syiIw7X0QKbmA0dt9K?=
 =?us-ascii?Q?OGRZZ9IG1wZL/YFSWoQ0WwzjnylMF6Bng4cDVIdLSBaV4W/QRQ9WirbppNwr?=
 =?us-ascii?Q?anzyadu1VCbOnbz8g40VcWQHIhxeYbwyyllTRVWsEcGhATmy1pX40BMM79oC?=
 =?us-ascii?Q?cmFAtKNk7PkmM5xZ3QmdHYIp+8ibAXctU0F2TZgezAhHndztKewLe5H9elpa?=
 =?us-ascii?Q?q7EfQuLacxgfEkKc6I6OapF327XAMpNmNAyXFJPqVofyn4o8HKa4nZal+E0R?=
 =?us-ascii?Q?c0R5M0PjrV5iOrLFGoZVRpu79w7EGm7sJTjJZGa8r3q6pGVH7T6XknzzIMCP?=
 =?us-ascii?Q?AwkYwjWwWAosZ7tpEKydDRnlLko6DLzhJtJ5fp3YXg8KuDxxeXz7jVMpxC4R?=
 =?us-ascii?Q?VjOhYElbgBo9MMGXLr/6VEvyST1HTQyjRlCpnmGnJaeOj5z/cF6eUzG8lNgO?=
 =?us-ascii?Q?T6NUbO/d1RykLVt6k2+f/CfWfbvR6S2OXZeWZae9TFSghjVTNyvx1WefW2gl?=
 =?us-ascii?Q?ZMorO9poCm0Xhja2ExHb8BTBU0tLQdzYknfKpanTBD5BawR879uk02YlMnux?=
 =?us-ascii?Q?rcKCFJCSb00lJsOnOyuSnZwEYMc6BKV07TEznzkyR4JecC2Tr8AQjRyhapM+?=
 =?us-ascii?Q?fdJH7Yws5X9JoaSeTNDnOhXXdQ4o7ck3oAQhumoAgxDNa254KUxLWttPjJF8?=
 =?us-ascii?Q?+8nlRkX/q/fuOR7ivX2GD8ArpxTOKw3orzuC66uDjzw8i5DHAPF4VQJ53DS6?=
 =?us-ascii?Q?VR9M8+hF8+LtkzqFEGdwyRCVWnAz1FtLfo990wqsG0uMNJlY1I11L6eIes+8?=
 =?us-ascii?Q?L53HkegUFVSyqzSgMMDi6aidDd3WNCuW5Sz1Irxpv1rwvTdt2N19JYy1y2z7?=
 =?us-ascii?Q?cY8ahsIKGATVoD/ckBJAcDe1mR2Hpjkzu+jKTC38UMOSTkyVbM3y+eEWnLS9?=
 =?us-ascii?Q?c0aqlflkX+lBXBwxuf5IMdb/NKQJKiMXCjOiZDcW/fFiIW4OIylphmy6wFC9?=
 =?us-ascii?Q?++d3KVy4Ci8Uf6Ln4JDclCkgLYRCaVAfRJpkGAO/0Lt/KIrgMxzssfVGRY6R?=
 =?us-ascii?Q?bcATH23LNX7lAdaR5XygPX1o76ERODVvpmLEwFhmPG753QDtK4v2TchcBRgk?=
 =?us-ascii?Q?0rRLTl5E04r8ovbwR7/IxlSse1sKRmkJz+xSS5GMZ9UjPBX6191EPEBVIZOm?=
 =?us-ascii?Q?oUbJ+bruAg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af156ce-fc7c-4836-818d-08de3f1ac891
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:22:20.1336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRaPRl2RTPsnbS0fe8gi7R4t96l8/U6wYmTVlHwKcC/mqBmgxiiuHRYdcJ/MsYUTS3xgFvCP/1WZmMPXdl6Jfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_082227_075394_FDF95630 
X-CRM114-Status: GOOD (  23.82  )
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

On Fri, Dec 19, 2025 at 04:45:19PM +0200, Adrian Hunter wrote:
> Wait for the bus to fully disable before proceeding, ensuring that no
> operations are still in progress.  Synchronize the IRQ handler only after
> interrupt signals have been disabled.  This approach also handles cases
> where bus disable might fail, preventing race conditions and ensuring a
> consistent shutdown sequence.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/core.c | 32 +++++++++++++++++++++++---
>  drivers/i3c/master/mipi-i3c-hci/dma.c  |  7 ++++++
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
>  drivers/i3c/master/mipi-i3c-hci/pio.c  |  2 ++
>  4 files changed, 39 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 6da5daf18166..0d3ec674878d 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -151,13 +151,39 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
>  	return 0;
>  }
>
> +/* Bus disable should never fail, so be generous with the timeout */
> +#define BUS_DISABLE_TIMEOUT_US (500 * USEC_PER_MSEC)
> +
> +static int i3c_hci_bus_disable(struct i3c_hci *hci)
> +{
> +	u32 regval;
> +	int ret;
> +
> +	reg_clear(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
> +
> +	/* Ensure controller is disabled */
> +	ret = readx_poll_timeout(reg_read, HC_CONTROL, regval,
> +				 !(regval & HC_CONTROL_BUS_ENABLE), 0, BUS_DISABLE_TIMEOUT_US);
> +	if (ret)
> +		dev_err(&hci->master.dev, "%s: Failed to disable bus\n", __func__);
> +
> +	return ret;
> +}
> +
> +void i3c_hci_sync_irq_inactive(struct i3c_hci *hci)
> +{
> +	struct platform_device *pdev = to_platform_device(hci->master.dev.parent);
> +	int irq = platform_get_irq(pdev, 0);
> +
> +	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> +	synchronize_irq(irq);
> +}
> +
>  static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
>  {
>  	struct i3c_hci *hci = to_i3c_hci(m);
> -	struct platform_device *pdev = to_platform_device(m->dev.parent);
>
> -	reg_clear(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
> -	synchronize_irq(platform_get_irq(pdev, 0));
> +	i3c_hci_bus_disable(hci);
>  	hci->io->cleanup(hci);
>  	if (hci->cmd == &mipi_i3c_hci_cmd_v1)
>  		mipi_i3c_hci_dat_v1.cleanup(hci);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 5515ed740ca4..54849aa98fad 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -160,6 +160,13 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
>
>  		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
>  		rh_reg_write(RING_CONTROL, 0);
> +	}
> +
> +	i3c_hci_sync_irq_inactive(hci);
> +
> +	for (i = 0; i < rings->total; i++) {
> +		rh = &rings->headers[i];
> +
>  		rh_reg_write(CR_SETUP, 0);
>  		rh_reg_write(IBI_SETUP, 0);
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 3f88b67bc5cc..fd08b701d094 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -142,5 +142,6 @@ void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
>  void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
>  void amd_set_od_pp_timing(struct i3c_hci *hci);
>  void amd_set_resp_buf_thld(struct i3c_hci *hci);
> +void i3c_hci_sync_irq_inactive(struct i3c_hci *hci);
>
>  #endif
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index 109c6c5d83d6..90dca56fc0c5 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -211,6 +211,8 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
>
>  	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
>
> +	i3c_hci_sync_irq_inactive(hci);
> +
>  	if (pio) {
>  		dev_dbg(&hci->master.dev, "status = %#x/%#x",
>  			pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
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
