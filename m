Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC389D19504
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Jan 2026 17:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qrfmUsJns1Om2kBFT7RjmV1BAOzhac43jFSlIyKNM4=; b=3CW/hSVUT/4tfU
	G3VlFv/puhS6XE1Xws4PXrPzaEMByXy/cQq0ywz3UVv6/Ii0oA7hp+UnTOW7i6e9I/WwVqAe4ZIWy
	GfodasL0TP0ik1JaoI8vsY+PlBW7tcWPw4cdE/lht05BCsUMhvFdJef/SvBFxwKJrPwI/gbYiKP1y
	XtsLZ6e1NvRBKoqpfsFkZYdZZfsTyZdo+n1So1Z0zUgXZSNhgx+dlmjL98Re94J8nTYPb0N4/UiIP
	dXpGolYOMWpJ/pCgYrT9Fhoafk+dVSHcGuQEb8h29cd2Kw1zyL4jJCBdvBWYzQg4gT7QyGAkMGfWd
	9fJhJCzmHBo84DsZxPhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPyD-0000000Curt-0x2O;
	Mon, 26 Jan 2026 17:01:45 +0000
Received: from mail-westeuropeazon11011064.outbound.protection.outlook.com ([52.101.70.64] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPyA-0000000CurV-2zMU
	for linux-i3c@lists.infradead.org;
	Mon, 26 Jan 2026 17:01:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQjsK9yJSMGx5gMJeV7+05dLYvXLbJmwmRWZvIfo0QFQgLQUBLIbg16fJayM6bFFyfyah8yZuQ3UDAVHfWw9kcoHfAumVJSnlpRHYk0ZfG8ROx9ZD9Z16nNDS3DVyauGmAmZsom6z0V6NE1kcZISJMAqwDZBdZpctnJoxx+sD6BXpWLh6NHukS3bk49YBkhMCk6CupgkvGB28JsHeHc02GUJluA6wbOgwBjkVR+5WqDtMY/J4oxZ09cAuYYJcCETcOFxzvw4t8muuRxwOsAoqNvQonRUd2JqB9Mgq7TOHnbGYgT3QfJLAbDTKsG1F/zaWqqbRsdkUz2+RpBbvpQxCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S89v7MX0KNn6/Vg2/vsMq36zGkoyF4jgkWDVKZeqtjY=;
 b=A2tPotVBH0WsNNef5qMXVM0bM1+MExAE7nqPrwZyZhtzbunqWV6b5vkv6c5zmPENxle5+ddVpoaT3xdK0xgRuErQv+BxZKfciJcS7a04rE0Td3/xB3bt9WZBCEhWptg9BOl0rFtDBoh+2Hh9LRHtN/gJ9p+opzZ0JPt32nAOpBsOsrYySghPg/BtHpk0dq1jXDExUpyLo+ZGxFOXVdkk2wYDf/shje2gTAeY61CRwBC9dpBcaxKISZLaZrqoh0EBf3AHaKiJ01uFlVG4PxenTEQmMFSu5XgrigPoM8qdXXtwma3RQRovvgOLcDQtxQm6GgxaGBP5f9aRyHjHUjJ9QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S89v7MX0KNn6/Vg2/vsMq36zGkoyF4jgkWDVKZeqtjY=;
 b=Jh0Va9OhB4ik7NEZ27YfJQTYHSY/2nB7nIC+9k9Px3M5pH4hdlZquJrXXjX+9r8f+rcmIG4by3+0g7wKb6zZ66oXBfumizmpnnvkcZKSE02KsyIoliTaxAOFtlRMUP4oecuKYgA+vg2j6MkTYlX7xhXBCIbW/QDpFPAhhJDLvEj4+zm1R92Lbr+GjcvrVrDcz330qj480vlg5jEzhoCJe2iavzQu4Qe32DO5KyhwZLcmrHDpmEoWa2MmnNX9OzxC5bpbE71JJKdRxxTXSjfmPacotEsdEdigHPROEskQ3Va5irIDLa0r7y5/qvAIKXdPvLWKP04s0c6HgWZ6GjfSdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB11663.eurprd04.prod.outlook.com (2603:10a6:10:608::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 17:01:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Mon, 26 Jan 2026
 17:01:40 +0000
Date: Mon, 26 Jan 2026 12:01:31 -0500
From: Frank Li <Frank.li@nxp.com>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: alexandre.belloni@bootlin.com, aniketmaurya@google.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] i3c: dw: Fix memory leak in dw_i3c_master_i2c_xfers()
Message-ID: <aXed6/fa3bCJhxPF@lizhi-Precision-Tower-5810>
References: <20260126081121.644099-1-zilin@seu.edu.cn>
Content-Disposition: inline
In-Reply-To: <20260126081121.644099-1-zilin@seu.edu.cn>
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB11663:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e273626-f541-4484-27c3-08de5cfc92dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fTbLT3P21oWAjsff+aJZ24A4xDpw2WkUXibRv0LDA/lZ+qVAoMDwSpJi7BV9?=
 =?us-ascii?Q?7ebn/PIRO5DC1ZgJI4ZOk7PTskJKtxR5JQrhNqMI57WoGN0zI6YBuYT8UV76?=
 =?us-ascii?Q?SQGy0AVokvfU2yoaYVDhVuanslG60iggYU9np9X1sbhlDQ5aGQyNwc6oRrEN?=
 =?us-ascii?Q?CqbErlgioY+HOFOV40zfg0wgJGUqhq9GKxa/JrXJnHitgzcaQHOOzTiqBArj?=
 =?us-ascii?Q?LszRSn7+9nJvvyMAcrisRPIVq45IHM0CBfMgNktCklURAcu10dyLxgzeWgb3?=
 =?us-ascii?Q?OSpFD2Jid1rTv9QpBksh2Uzl9zH7ayYsDVv7OqTXA9xTPPuz1fPLrEZP7UnO?=
 =?us-ascii?Q?rRCqMbYZcoJE1TRY9W737KpnFk8H4GC8YkzkTNcO9yqcvkZo+SSecmKHqHAp?=
 =?us-ascii?Q?octsNXUBm8AU/mimCvdyPNUxsiGf0T4wVK6lPAshql0mwlwIhLjH2oaP7E5H?=
 =?us-ascii?Q?5dFQGuvR0TiAY8+z+ueBuOyqggViVoQ+pNsOFdJG/28hQZSvzBpY1NBishaf?=
 =?us-ascii?Q?bXw8dtRdYKpW+u04GhPoflLFOZawA1lHjBQvJI8H9svh1zdeRtKEH5SDOCh2?=
 =?us-ascii?Q?MnqFrBTUc2hZ4lKtCiPlc+MFUqwg44a4dBpwUK80hoga69p/qSKdNMFrJm+/?=
 =?us-ascii?Q?iJBAy+epwjrb7/bon+CbVCSfkqWwYTaQ0hKrS/c251xI/T4U0zYuPprViypX?=
 =?us-ascii?Q?FWKlTSZz1gDgLNpOad2XMQDb+qQ3gYFeTH7g/GMoagXT9+ttF2YIyMtR6FNS?=
 =?us-ascii?Q?rH1MzhHi97riQnNOyUUqtYsLN6/ND1opDcrZt/th4o/F7ny3bKlImhGF1qGM?=
 =?us-ascii?Q?YnGUZFTkfVw0zPwMtRacED9rg1UnphXNH7/8c+OW6TfZPIAL1CY2KG07V+sE?=
 =?us-ascii?Q?QpTck0Uqwmdiy5WFkNUkKoj/wFAuHD9JGhsus9i+SpIpDW3ZGEBp0adwxLqU?=
 =?us-ascii?Q?O4mbs7yVDtD+GxB3LgYuhdqTnc7i+6zoHyOXHl3PPRehamgUVEkbFxYZn0qf?=
 =?us-ascii?Q?mjKntkyAWY3IcmZSZVd0jTZTDYMh5iWda7LpYdo8m2m94SYZzY0JMPgrkZCF?=
 =?us-ascii?Q?+0SaHzTy9PuhmeC1datkfbq+d9YZcvnjIRcoooAmBTDWWPMIsXj5/trXvzov?=
 =?us-ascii?Q?5I+eu8eO/igrqoIH3ouK9pCu2yTphsKRQW1x3+wDQaniEr/qeZtKONGOOtz+?=
 =?us-ascii?Q?4tnYxXDdk4UfYwyhppia/XFICZtci3xvW20X6F/edayXZ9H/jVK7Pk+l54Ja?=
 =?us-ascii?Q?AFNvMkBZ3LqsUNCzZ5UBpVmDM8JQAeVWpy2/AiHu4XY6oHU/Sw+BQGObqUb1?=
 =?us-ascii?Q?AHnfPuG5h+5cM7RkQrZGSIQIiqwIQQ0ZVST5V7jVWdJ6WiHaj4jth/z7oouJ?=
 =?us-ascii?Q?9/Ghxk94XzaFya/r7BGviSfyZUBUd8ufUJEi55FFTEskyj3/VDxXoOzgp5kk?=
 =?us-ascii?Q?9nrL4Ux7TDDbyXwF6Ph7pgQbs/hWhakLvacLAqdj9lpDF5C2qbMPzOOx1ChZ?=
 =?us-ascii?Q?7aa7Dt7rzqXZhVbU2fQHQtU/0vh8VtzjDo0KiVemLgJnYRDkMsFKCQCIzFqP?=
 =?us-ascii?Q?K3iVP2Zq2wbYW5+V9qum7q/tBh/B5pu5/2CCJm+a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iB6LNKy7F76srbgVve4o52ZTbCMVUghhQMExJz5E1o/QDajFwnueOtcZLPyP?=
 =?us-ascii?Q?p+aM51HbyWu57YLlloVnQvojUe/VU9iokHl5xBJBcLXgSuuY6Fp71+7s0tMg?=
 =?us-ascii?Q?PTRB18sTZWGOncjfi8ojDDdfS0Hzz1qdSN3PU2MNgH18+yvoXf77lYrbizz1?=
 =?us-ascii?Q?3TQ9KPYzQAEWOeZtxQVoZT/Tl6JHOcBXSrsJcViRb5ExaFEZXNdlBdWA+v/c?=
 =?us-ascii?Q?M0U2075Zk0k8G/42nlKv+ZYrVsuKyBlsfP6doZTxazT6hm69doeVCAd5BpD/?=
 =?us-ascii?Q?B7HJuPFDMCh99UEGCOApnV2DREq7MJgsR58EXjBVvYyv5DyHEf9acIUJ3M5Q?=
 =?us-ascii?Q?H8UnJvut8w3kWtpZRDbnrYVgKF9QnibZdCbcPJaRYfqBEC+ceD/irqcnciQ2?=
 =?us-ascii?Q?FZcX4dj719fbg+jEGD6HwVkVOzU+MxgnCMhuzbWCAAKoH7Cl9uH715DRiAv0?=
 =?us-ascii?Q?cJ2jB3ET0MLQ5OyptXn9V7DOvW2h4bM8OXpsTiSe2BbSg5tinuDG2/8HrVw3?=
 =?us-ascii?Q?WfhrH+qPE+iaa7fimxWdmdfubOzAjjQLQO7+oyEK82eKVFlCdTLIgd+qf+Vd?=
 =?us-ascii?Q?jq74XcMaUAAHA48se0qXdx/JSmZD/lyBlYnqbfxuPJqpFDymrRN1izq7L1xA?=
 =?us-ascii?Q?5qwuUTzxaxELw+fv4V6vk6H04UhDkVDws4hTnC9vStx95x7dF6MX8MZXC4fj?=
 =?us-ascii?Q?ct05yuW2sjYLnGNJUvjyUSA1cLQZ78LTILTDuzkq1mByzjBlFAfqCVot8E71?=
 =?us-ascii?Q?D/3bphfXev0X9NPKT195ck8ag4zR5ZVjaZTd1TaoqJyybOKlA5voIyAvdtP7?=
 =?us-ascii?Q?zgzPVYnbFPp7H64lk9HqV6HgbzdfvDGw1+J9urJfkwavEBLJsAOmRm06c0df?=
 =?us-ascii?Q?XGbGwdFzkfNOuXiSkng6zv1zrH2iVZ8lX3z23wIth+FG6ZE+U8DiSoPlGn2Y?=
 =?us-ascii?Q?3qgCLr55WcW0xZNUeGk6o2Z/rZ9uMlTvORWT24/Sh3t1WExZcnBA7QYZVZAK?=
 =?us-ascii?Q?w9a0LGKK0wOfDgNPskgbbw6yazzFx5pXHBSHw35V44rhXAJtKNiKQSlV8Kj4?=
 =?us-ascii?Q?HuBN5qDm4G1lTDVZh98NMMwgxFgSLv2OS2d6QXvbb4ikirSI8KEx2M8zk9zB?=
 =?us-ascii?Q?PCUYWxQm/RmDFcC1zrcmhlmi4NSBnxhlJ1svxm5MAxW7G3J3rEot9BfhpgxP?=
 =?us-ascii?Q?VH3Rp9hVYK668py/tzwXO8RjkpIqZPNjn3Mtz1I9Fwnz20Hz/zmaAFr9Mn2F?=
 =?us-ascii?Q?Cc69lQuyhjLfapuogBOEirD6xXjGn4qgmC85CdkLITa+KJkwgU/adpgE2Uo+?=
 =?us-ascii?Q?+nHf3x4zFx2L2Rkx2oz5OB8195RYaVN41WnOz1DmeRr4u+mvcaIciVRSPpcm?=
 =?us-ascii?Q?804PWdU5zL70RTesD0JNZAI3ssuc49G5uV6uLun8yflmc0tEoltmmgvEVJjw?=
 =?us-ascii?Q?ugwE2jh43EDuK2I0ItSAGBQeJeCHvENZsUVgykxUnfYTbYBLnYc0hgMZYIRs?=
 =?us-ascii?Q?xMMHRJO2HTlfQFR6arpzw6gLYGTNw+blAmgG2UB5lFv2/SXjUwIfr9Ja62Do?=
 =?us-ascii?Q?EVrdriPzhDvzuTNuRwVZTzrOIcl0iKXN98IRnXSaoUkA2K4GAdrwe6y6LGiK?=
 =?us-ascii?Q?nE6fQR+9FhOAtQc4trIPf41mwjKVbEwYbSXnb524IVvA/r/xbwToFtGM3hsI?=
 =?us-ascii?Q?pxCTkr0OCyfhzYyxEj3U7K+nq3SUKiPkXLumdMyUyqUpwPYW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e273626-f541-4484-27c3-08de5cfc92dd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 17:01:40.0403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41Bcp6vg8IoQom6fpt6VHvSidG3Zyb9QMkqxRskSauAp3jVQsN1jwVJqa3WxbUV3PWr0rmzKN1l0KQSd0y0WNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_090142_754967_99A4422E 
X-CRM114-Status: GOOD (  18.47  )
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

On Mon, Jan 26, 2026 at 08:11:21AM +0000, Zilin Guan wrote:
> The dw_i3c_master_i2c_xfers() function allocates memory for the xfer
> structure using dw_i3c_master_alloc_xfer(). If pm_runtime_resume_and_get()
> fails, the function returns without freeing the allocated xfer, resulting
> in a memory leak.
>
> Add a dw_i3c_master_free_xfer() call to the error path to ensure the
> allocated memory is properly freed.
>
> Compile tested only. Issue found using a prototype static analysis tool
> and code review.
>
> Fixes: 62fe9d06f570 ("i3c: dw: Add power management support")
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

After https://lore.kernel.org/linux-i3c/176840902682.1305594.13987931108275156748.b4-ty@bootlin.com/T/#t

driver's runtime pm get code can be removed.

Frank

>  drivers/i3c/master/dw-i3c-master.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 889e2ed5bc83..3e6f66dff2ec 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1099,6 +1099,7 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>  		dev_err(master->dev,
>  			"<%s> cannot resume i3c bus master, err: %d\n",
>  			__func__, ret);
> +		dw_i3c_master_free_xfer(xfer);
>  		return ret;
>  	}
>
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
