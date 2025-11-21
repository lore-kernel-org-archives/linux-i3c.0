Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FCCCFA477
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Nov 2025 06:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EPYven9RLV6mwq9Do/IcwQmEnVkVYixIf8zFP33OP/k=; b=2IHldGK6fGZdnx
	jh8l2z11WjnYwbd47RogBCxjVlLeyCpZDv4tTk3hcBpZ74w5EtvOYKdJtRbMPQvvqYRaPRVSeGHpb
	Pd0NDh2v+4IckUOTsy5//Y2r0n1MYZtOxY007VIIM/zoiX7DMRpCnlhOfVPKjJdeLsYs90SP2W8yE
	yVZ4vr48E2So94iB6/jDEBtgonWD+Ek4/MdjB822UAmwcITUPWfc8dYbx2+54R5NTWau7Tl+93JwE
	VxBsLhmQiZoXdanizfP3J+67b6xvEjhLwXLEhlAyeMAyXqaxEUPUt50PLPGvJLwpSHT4VVMwT/F+V
	UWkBcaexyy6Nq6SaxIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKZK-00000007uPf-2DL2;
	Fri, 21 Nov 2025 06:24:30 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKZI-00000007uOz-0jGQ
	for linux-i3c@lists.infradead.org;
	Fri, 21 Nov 2025 06:24:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHCJem4NwtD/bUEngiu68A+Mfn0hIflcGT9O0Tjv/7CyK0QcEExB/ZuDmTmZ9J7vt/Vk1VWMrvfKfdJIRSoGcG+Aa0RnqkAZlH8HYEwA+iCZzQE3aeo53BLNYicr3pI6AuEsfKLkohOPZslSb/PILqoHQiKw0jgfHSBWPFNmx48PyvCQMRKsRKmEYgn1FPaR5C7Hzk9/659gRYYx0r8hiCwZnF6kGdEMGn8soh+Un9Crk8yaupc3nUP0fOzzM8x/tokDhFkLpbl15RMs0AxC9JyVGasE6KiP/3xfVAcym3JNy0/uZZ7X0QS0GQfZePUOZEWtrpYXr07vttDyqe5LIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfB/ySENPPI4Dy8+jljzTlxVXQIYmZOayDL4hk15E5g=;
 b=V4X2lK/n1bD2wMtdr5QFfeGKGVOnpiO4hX8XDzyFhxKfW8qr+OyY9Ha/2Be0xVYvl/pOlcZwJYos8BjKCB+tRUhQqwqFt8NnrYnQVOK5Wrfi8X1I9Pb1i9eNBrEaMtGoKFFwLnN/0u7BnPRwM3brttn3Dorn9RD0Gg9ektc/HRj09TYmny2wo7Y+1svbGhK+/7LVeO8S2Y9leIlRaFk5VgZ2v2A2LaA+ZVHUh7y2GKrY/E1vLZD5EDDmhxg9C9pzyj3r2X/SmQIhWcZHxEZ0oymEPbbIGhqRficngXDVjd6AUbRvP7ztFHrp2ncVAbSC5RsNgig3dKu1qiAQimzd6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfB/ySENPPI4Dy8+jljzTlxVXQIYmZOayDL4hk15E5g=;
 b=kLM9fSoddnxqdrvAOssRkaejRhEQT6kYdQX7x9kWroEoIdb47X3VC7AjL+SLq3s17nUTNAZD0gTvX3Z19vbTM32aS0zqgCfSnaclldmweT66h/cCQPMxneRlw6UEpAn61j1Bpk6Q8ezfbSscLclJvQyTHQQehzKh9iGMiE78NqOgeUE+LlGCGn2C/sXLUw6qfOpURJcnui1adgPyRuazVE/2s83GaR2HLg/9n4u72aowxhc407Xw4FFF82PNHPUm0scGvXQR3yCk0qoJCB8gJ15kHSNOKig5mjkrsFC/FnrzN8WN++XZtX2Mps6NEESXmqhGXfG7rOtTgnNnfTW1WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from PH0PR03MB6235.namprd03.prod.outlook.com (2603:10b6:510:ed::16)
 by SA6PR03MB7613.namprd03.prod.outlook.com (2603:10b6:806:442::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 06:24:21 +0000
Received: from PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::24d3:54df:52d0:1030]) by PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::24d3:54df:52d0:1030%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 06:24:21 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v2 0/3] i3c: dw-i3c: Enable support for dw-i3c controller NACK retry sysfs and DAT restore fix
Date: Fri, 21 Nov 2025 14:21:47 +0800
Message-ID: <cover.1763703573.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: KU2P306CA0073.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3a::19) To PH0PR03MB6235.namprd03.prod.outlook.com
 (2603:10b6:510:ed::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6235:EE_|SA6PR03MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: b5351e18-f3f2-4fd0-b76e-08de28c69b35
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SPNcpXCZVXWhuCdQmYo/3n7hrl3RMiWm9oQhbkMUwcIAK2XcRhD1q0KvZ7TM?=
 =?us-ascii?Q?36sBIkw9D4laXw08HGiYiVRYd1Tgf3+pkyFyCgvLx6kxuFRXWx067hfD2/3K?=
 =?us-ascii?Q?aPftfSuOi5MW93lH7WbJERQkHM7Agv6HOxhAkK0c7/BI1k4nE/8LC9VWhIoh?=
 =?us-ascii?Q?qJ+FDRV9/ZIFsKJSAwIpWYhb1053AnETGsnlCmufkCpCgGZ5+Vu7qkuF5ZxS?=
 =?us-ascii?Q?+93QXvKQBH85VJf6sDOAcCHp4U4JQwCn+0oXEwwiL+nQHKVVG+W1SJO/Ikh0?=
 =?us-ascii?Q?KL3hkWqnp1qBrbAin0T1wAhNe0ZfRMvjuDh2Ivx4TBKba0FW6AbuWSv2Y5O6?=
 =?us-ascii?Q?ELKUvOQMhuWyEeUXrK/i0orAI/pMVcmOvePpEExLHm1Bxd6huKZ4xUI9cPlw?=
 =?us-ascii?Q?CCs580dtAIp/2UwndmeHJss+ItUFBExPyobwlvsjleQxyQQUgqxTzFVe2oHi?=
 =?us-ascii?Q?8ITZppv5rD8b/0ZlvXErR8Qso1zNJDvDYLCWZU7j7Msdg6DQBL9LSOY1boGF?=
 =?us-ascii?Q?qIhP659uLKpiwqr7/t9gyuyMH1WpeV1zMysRZIRNWz1cvMvOG6EyBtpbUxBo?=
 =?us-ascii?Q?3YHaQtIZjAIXglNild9yPRrfelbCCYxju6VIcUfy3sD7iCbJNladTuKz8ezr?=
 =?us-ascii?Q?Drq2HTk1JJTmr/mwcmQLHyQ/Lum2Inz9QFXYEbyhafAM2gl8gIU8P1gD+97t?=
 =?us-ascii?Q?+0G7zN08i7n7SNq3bRSbGgnSiHWXFyTYd5F55g5a03j8jiCsnNmS31IAQ4vZ?=
 =?us-ascii?Q?VNE5AFZQDjPYVuTJWmjl/j4giU1kCS5qMax/EfDo24d4gI8O87CoaB6c6DAD?=
 =?us-ascii?Q?7iNs+raUVwHgy03J1Gl4Ud5vQrcEQ1cu5jOfbAVApe7LWNHxGIaKgJ3gP1oZ?=
 =?us-ascii?Q?RL3S6VWLUqvCweW4QQSFZ2wDSDXwzQ+aCI4gSaNo6qpN67fg8qsFPF53tD9l?=
 =?us-ascii?Q?nVi3OxeR3+xd4PAER4q7icjAzE90vQWN75t9BdagAwZOm+D/rHNUWt5CQE/v?=
 =?us-ascii?Q?+I44S7GsODVmO/rhBH+Xyg5R8gr7/50d6ZJVDcyKKjzmkWVdPU3kO2cHOFcc?=
 =?us-ascii?Q?DiPWyqkFks6t/1avjaICSCq5Euf+1CBt+VubiEK0hYGyabukKj4dTT3QVXbU?=
 =?us-ascii?Q?yGQpLIpuXv71Z2mYALrFhZkKlqFCHOKCxVaD3R7+v+ukzHcVB/FFBNDW1fdE?=
 =?us-ascii?Q?6KygOM7eC1f/rCYOcJKy59Df/bJ8tcwmKD1tvQKaNTkX0GIsmUOOChd5Hao1?=
 =?us-ascii?Q?lW2radu65FJDVZM/tmYfLXt2GgrFgwSZdszuqV8TCIXoS22liYd95rXQkK9M?=
 =?us-ascii?Q?/IpehpdR1BjHEMb0tTXnfnA334ZwkkURFx7qI1UORYHM6NBcCi3pfkjJCqzx?=
 =?us-ascii?Q?cWJOqdm/p0OOCmiv5N7TgNo9OmSXpSd5YEGbq95MQItoMD2ZsRLi47Ae2eFw?=
 =?us-ascii?Q?7C/k7ju5T3ii4pZxQ13EjM0X1Lghg/BATfEAQR0ZlRuw65d3Qtucyg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6235.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QIQ+lLGkGXGpbJz6CJIM23bSw1RBqemj+cXdvrqw20HD7dqMsulTvnpxh8Li?=
 =?us-ascii?Q?d+JDB23tWVbtwdF+017UhBotUzX7vWVuqUOhIgrrTZWuIDUjw75eVHqDY8S9?=
 =?us-ascii?Q?WUit47Mc0VcPPyByKeuBtHj6yCCbIdz4Il6etXu3NqV4orujQSEQn0hvtyQp?=
 =?us-ascii?Q?cs2L5wDYdJ8/I30IHPXbig7BBZyhMwRzEP2zIjTc1lycIDMAUox+0Q72BypO?=
 =?us-ascii?Q?1gZOPhfkPtmQLOAcaK/TFlCN7V2n8HzYDGjiB2/XFCvfn/StpQ6yzTwjcYsw?=
 =?us-ascii?Q?PT85q0yRayxSQm+ZnNAuI8fSL+aUQRWOkdquTVAXhUc1UWxLr9sLWMtzKmg8?=
 =?us-ascii?Q?fekPzfjri4DqrjhjHG6vWC7cYPswsFGvrleKMon0tLvX5b9Zf8Eyv+GxjgU7?=
 =?us-ascii?Q?a/IWLdIZSR5nwsIQ6IGgyKhDhOrz4fIcTLN9+M73ypvv2moYdisrmSnqLh88?=
 =?us-ascii?Q?+n+W4BbWscW3jIcJw16mwWUKKZYcLE2/Ey818txIasTPKOxKJqzQlfP9LXpq?=
 =?us-ascii?Q?AxxkUj6Rl7kGehxvyzwt+stoLF3r889U2coOYpImTWg4TwovwejcfEA5Qcf1?=
 =?us-ascii?Q?5xMPZ+cVTwOGxYt3dGxvKWx9y3dr+siQZ4bNx2YVMuD80bm5OVmYfn7cidae?=
 =?us-ascii?Q?HIYQVIRVIpLpCGVIMxfHGmBbkfK+dCGIXzSAqVuHhgJmmDcUJP3rNZDNS9Nu?=
 =?us-ascii?Q?Rk/8mt71jbso1Cu4omvi7kvDKix4m/ysK7NeCOeUJuIjExXLI33LI7TFZjI+?=
 =?us-ascii?Q?e83tF/MXWimM5bY5lklI9UqkffiqWmwNaGBpkwhYozZ59wBq6jamqOEV1p4e?=
 =?us-ascii?Q?rrYmC5zjOEiluUH++BYfcCt5rmDD2Va3wDXkdpJe+DLYc1NR33EHFFN/GUlm?=
 =?us-ascii?Q?3e9nAz2kTiwoVH0300fBIirwzhXJYgwD0SRtjzTkvTxiVUJsNMXrGnnDVfmh?=
 =?us-ascii?Q?D1k+thSdOCp5/ugq7yQUggYkbhLaRkxBzDdpOUmJNU8xzKeFlC5RjVRZrQwj?=
 =?us-ascii?Q?Dgot83E9QWxkUXHylQCIOK/KUa4qbZKXufKM1ikVp7d31nlJZyp7jbxrt5Uq?=
 =?us-ascii?Q?TFwAa3awAHyXcDeiDwodNGkbjuzbD6znvHUvpa07/ufpqKt9OzNx6EloPHDR?=
 =?us-ascii?Q?zW9YRb5oaTR5m0rdyZtiAJ3x+cO3F4nSZntUm3njDUyJrcFbu8bytE6a2pJJ?=
 =?us-ascii?Q?trpO93fepwDH0zNkIvgIw/y+Fi2cxONZ0ofsZaWsuOEGBVsPR2UXEupsYJjx?=
 =?us-ascii?Q?lrYku5TRZiNY7QlRrBPFRMuVepY4j8u91j8X93ORGQX7TPxXGAA0v5BrBvps?=
 =?us-ascii?Q?cLdIB6TQicYyYCfKQsawNEs8tO60FfQImrrNOjrQP+4ntHz7MQnco2O3sXEz?=
 =?us-ascii?Q?yPuL5cEHRaENrPghj+0WSs9r//uCYnYklQamMidMljMZYsAkihkKDtyrSaih?=
 =?us-ascii?Q?9Z6NEsmkM4yPZLRpypjC9pB23p6S0V40R/FZZLlPnptBrC0vIjESInhJVi+y?=
 =?us-ascii?Q?DPMlzE1kAZiTdIQ/jdcpz9sps3ur6s/2fiK2IpPfwYBndGxFumdbGZwa4tSA?=
 =?us-ascii?Q?BjGvW7q/ddovwFZLOHPEICx+L4hy6jn+g6COTUQDeYQjOoyA8RPq9JbWbnmI?=
 =?us-ascii?Q?Dw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5351e18-f3f2-4fd0-b76e-08de28c69b35
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6235.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 06:24:20.9665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aRTXHTS/4tEiaprKVqyp7ONuUEu53U05Vw1gfFrj4YUB6VRtjBJYszPYsFPoxuECP6M9IbjvdbG3ubVHAX+V4O8Yf3PAqK6cqyQu0z8jsro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_222428_236259_13988329 
X-CRM114-Status: UNSURE (   8.10  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

This patch series adds a controller-wide sysfs attribute
dev_nack_retry_count for the DesignWare I3C controller, allowing runtime
control of the automatic retry mechanism when a device NACKs. Some I3C
slave devices may temporarily be busy and unable to respond immediately;
automatic retries improve robustness in such cases. Writes are clamped to
the hardware maximum of 3, and the value is applied to all active DAT
entries.

The series also fixes dw_i3c_master_restore_addrs() to preserve existing
DAT entry bits, preventing overwrites during runtime PM resume.

---
changelog:
v1->v2
* Drop dev_nack_retry_cnt binding and device tree changes.
* Update commit message for better clarity.
* Update to use controller wide sysfs attribute that configures
  dev_nack_retry_cnt during runtime.

v1 patch link:
https://lore.kernel.org/all/cover.1762245890.git.adrianhoyin.ng@altera.com/
---

Adrian Ng Ho Yin (3):
  i3c: add sysfs entry for Device NACK Retry count
  i3c: dw: Add sysfs support for Device NACK Retry count
  i3c: dw: Preserve DAT entry bits when restoring addresses

 Documentation/ABI/testing/sysfs-bus-i3c | 11 ++++
 drivers/i3c/master/dw-i3c-master.c      | 70 ++++++++++++++++++++++++-
 drivers/i3c/master/dw-i3c-master.h      |  1 +
 3 files changed, 80 insertions(+), 2 deletions(-)

-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
