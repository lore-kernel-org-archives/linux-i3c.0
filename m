Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3063CCFC29A
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Nov 2025 18:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fGDNZ+RHkcxMZFnwcij2cb/D4PimcLU6ErC0dYEKm1I=; b=q4MMuOWu9SGr3Y
	ms2MY2a8JaObqCaOrC7h3QujBg43Qeh1+/00/s5EMfX/XGtwz/DrefP1vd1UjN+OCC78tY4Iy9YmJ
	6v+93DWVzy8rRHx0ZfGAoFSxJ1mgQVdt7GHjCwPBVkukYvQiwp5lFzcNg1ZEbVKGu8QvKZ9DuYq/H
	EIRcRn7CoqezROM1caLWb0xximzqo8tn1YQ4DYOQ6duoBEtFVnAJBBXqR+ser0+xqDplbc0kF58q6
	sRU1+rkw5NFh2JOUe4Ho1x3//T/TqOynyDjwyoXDgxgF43q4ZGIepJRXahc9RyVW4WLgLStTjnVn5
	+Y9XfX2iZAvRTtUGKUpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVTW-00000008pJH-2seX;
	Fri, 21 Nov 2025 18:03:14 +0000
Received: from mail-southcentralusazon11013001.outbound.protection.outlook.com ([40.93.196.1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVTU-00000008pIg-0xJt
	for linux-i3c@lists.infradead.org;
	Fri, 21 Nov 2025 18:03:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X801zLiLulKYAqn3lgj9OOlzGK7DM1r6KpXJ2iBj5w6RrrB5J+OWbtcWce54veArwiOIDrMrxlCXN/UjXEelRz+TdVCRK9O9yxInC9h4pl1Y9+tgQAJAhaXbOXGK3N7mOVUDrhLtJzivnz0BsoXEIOANegQDawj7PpatDzZCW1zt5xiwKIxjejIPJ5Cq1aFXt7oKivG5263X5HnkXvvlj5NuAIHY9JqDBnIH4ZveZOexZoeI3J5T2C8o5/0wK9Cltn5Kpxm0JTMO5bUMqxlQdQbdmhy7IOWEw1fhLl0ZrVhDBNP8eAvxEq98N7Lao2UtkyJdScb7Z3RAMCKoo4VCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUJga1cOCYKgGnL0N4WYhCXoix9kY7AYnH+32cu+2Zw=;
 b=gS7IDoHc3I6ZQ/Mr3FBis2OKA+JIh4Sd1KPxgEZkojBchC//gESzPUvEkyd7D9b76TKexMjYLoyeLBXZAo5lTa0LRbyQXsUeJ65JQY+jMwP3GhhdGkSgdPypVHopd1etjKIjv2MrgriTQXCZKdWMJNwJfGLaX7uP1ioVnORkd64GIERpj6JMLiiKahIDqNDvJhsle0xTAAyhYruPeXOf/eq0xEJDihCWg46jZrpxPhZp2py8luJFZ1mB+DY6uuNT5bw26BFj8zXedt9Q3CvAcqb5ayQ/mPHxWUHMuhTGzKmv0CJ/F+RDmAgwz2odvYJ1wrPIOu2E6/5neaVpDeZVLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUJga1cOCYKgGnL0N4WYhCXoix9kY7AYnH+32cu+2Zw=;
 b=MRnSTP6TvoXR/cpKNwoB1LHsKbEeIe4FO4UvWUliZn9k9jomg2cHSmxxPV8cCFJWj0O2QG4M514KBLx/x7cFYN/6LYOMye2cAd5DCO0st3UskXYToPzg+2NDi0a4rofw2HrlXQWtcsCv5DAwqQezpq+opckSlVgal5BZYT267jouO46vpFupkNLDiByJ8oem0cWDs3cAlV2bekF/p7kQkXk6pa/GS+BJ9tyTz1mrA9zZwrD8P3RnZe0LF4uNBYamINm6WwtHb+uxtc6N21OOfRrEvuQBr/SYEtEApRJMr3HmpXLnYOCgRfNyLINbp06/UA1qlE2fcpw45BPapmTDuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 MN2PR03MB4926.namprd03.prod.outlook.com (2603:10b6:208:1b1::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.14; Fri, 21 Nov 2025 18:03:07 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 18:03:06 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v3 0/3] i3c: dw-i3c: Enable support for dw-i3c controller NACK retry sysfs and DAT restore fix
Date: Sat, 22 Nov 2025 02:00:38 +0800
Message-ID: <cover.1763747151.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: KUZPR04CA0028.apcprd04.prod.outlook.com
 (2603:1096:d10:25::12) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|MN2PR03MB4926:EE_
X-MS-Office365-Filtering-Correlation-Id: 9671f1e2-8b9a-4fbc-7728-08de29283907
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?//lOd6n/V+2KUssThBG1f8dTQUzXe12qRAbKAxrp7mwuQ6rbbIw3fPFcpA6i?=
 =?us-ascii?Q?1pBVR+gNWhFoCqEYVRhqwKIxVwl5279FR43b5sKjk2FNXGSq/1SB+nznebMA?=
 =?us-ascii?Q?Li31ZBSsp/0YFA/yDx8aYSCx/WrF620408q1f/sl7c4xnR3R0f8M4MtFHse4?=
 =?us-ascii?Q?1gWmcyJ3X5vjT4m7zaX6K8+58nE2nyfwBQZoab8Z+0QfmaGv/Fb2/bKK1zUm?=
 =?us-ascii?Q?SJlttZbsMvPkjao06ejUuvk/9fxOd8TTs66rUF/1qjORDUbf/LbtVP/8ikaN?=
 =?us-ascii?Q?eCAosiaiJLiTjnA1dRvu5VuDJDJjBTJw/CR9Gy/QDZyXhI80glJbXgnCFsfy?=
 =?us-ascii?Q?zv4+zvLmOxsBz9DwDS5i5jGBSa92sLJyVQAGDSCWxomwsA/r7z6W5aalMVBP?=
 =?us-ascii?Q?8LdnPEMyux6a2MITGj7ehaAM6B71hpRGZ0pso3JAzPBr9tmq+wBo0nxw+00z?=
 =?us-ascii?Q?hRwXbXiiUxsYCsaNFHIrz1y7n78Fspk0mJYNNFVcq2H5ig7tO1LyvEOj4xi9?=
 =?us-ascii?Q?Xj89flOZumjNhAvXaxM9l5uFguz0beGyvRI6H4ZRjfEU4T5mkUtJsPCBF1FO?=
 =?us-ascii?Q?llf2SH2yIzaGKRL/n1eb3sWtFOzuioMN1LVisdhkC4pNHIa1odQhXLt2baLi?=
 =?us-ascii?Q?AJg5bzynUpF19bjZNnZWCnbGQMkojM2rjm6ZPRl4W/4ibszo+Vcv69LC225G?=
 =?us-ascii?Q?OGBbO/EU/KWJ8QDR7ovWfXiYkexeGQi5iNluUAEbaoWuepNNJdx46qV3kSM6?=
 =?us-ascii?Q?0HQmifS57uYgWthdNz6rMcfNxTw0R/+C/ouipmHOeQKl1tvbqs4HOUJfDr6x?=
 =?us-ascii?Q?g5yE9CvMNhc43cHX/KHUfoyZF1ZIe/1k8VOsvIiV7cqNeheDtQ5+n6I+7NMb?=
 =?us-ascii?Q?HQ9tdRSKwi4rTNjb0nYR/NWcNFOdoospRwYPskOhKiAMXErnX7CffStMNy/l?=
 =?us-ascii?Q?15gIHOJv4+6enD88yIuhtdTzRKO+7280SFOWQf9rhRWsdHVrWuk0P03AxHQR?=
 =?us-ascii?Q?bOYM6I7sN3BCbXm8dh6oLL5uqPyYASM7MsLFzRps1+/sAGXP2SbedDTH42mb?=
 =?us-ascii?Q?TfK8aSFefg8HkaWPD6mqN8IajE7Am0y/LUf6HfXTGJCxfBbcw25JcJno+5RI?=
 =?us-ascii?Q?BTNV+4GHFBDowHmbd47e/mhH4LVOrta1mbcDv8x+B02wd41t9qCNNPeski2+?=
 =?us-ascii?Q?4/9beKcfo2hIZVShsZ6WKkOjMAtC7o/xWSFLirNDYXVxZY1Z5b+XlS1ZxyR5?=
 =?us-ascii?Q?JcWKe5zpzGaNmrlF86M5enTZNCr+jdlbAY//t8QFmXj6W6mJUTBxBnlNlHCp?=
 =?us-ascii?Q?RpdyMgiyj9/wM5bMt1ZVYD1E5gUKJvYMqtfdt/MoeSzr3oeDAS0u7FxLGNf0?=
 =?us-ascii?Q?TR0x4bQaYOBeKsPJkbSV3EVIkD2fNJlXE3hIQZDGgqTr0TVKuXdDu6oxWIRR?=
 =?us-ascii?Q?2Cq+N+tkhJ+YzcadcDGHgo5ll2q81pfPKXZAuG5g9sRxRqjdSP32Bg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d8Nd8VPp+oZc2ej3rqcq8QEd2vDgKFa/KBcaOT8pgz/wTSPVTaIDdH13EMsC?=
 =?us-ascii?Q?4Bjgy9HJ+YRdNvu8PKT5IPXkphD7k5CS5qSQN7v1BsC19msczmLlEwspj9OL?=
 =?us-ascii?Q?LEkKErsZVdYymeRpR1rhk/UYn/V6PA2cKjTGWmvrn8rGC1sRbgFUIeA6ls8b?=
 =?us-ascii?Q?Z+EYAIJFj1IjcOJKg01d+J8A0fU81tEl496yU2gHVeHDNEkkaCUwgGbHyU0R?=
 =?us-ascii?Q?VTFtN0H1eO+2mNxA+Og97V31YHvjc3SaTltbfk49P7wuzauZrBFGMqxeAHNk?=
 =?us-ascii?Q?FHBdbpof2BrFXxMKIGJqdaFOgo9Y9GS6W+Bi7Mdb6rfrbAEnH8a4wBER8/cp?=
 =?us-ascii?Q?BkIIOd+0AxjDGauJPkGXRE+JuNE3zEs2ztSVDq2tTGJYNWf0hpZY6jOCNJtC?=
 =?us-ascii?Q?PEstfyuDkOeFHcn4865YsS7PTOw7g4QyH9QfdpNBZHirt19hph7/tvvnnpQ6?=
 =?us-ascii?Q?YgeVacBkgPmDX3jKk9vwgUx4za/azXxl1md8UJed+mdzf+8mYsKmxS1HmzAb?=
 =?us-ascii?Q?6tZ4BF3xFktVImsd1QC8l8SA/Cu9Mtr+QWIrw+W2g/gMBBmM1VaGIPDR8BFM?=
 =?us-ascii?Q?VDZW4lQggww+Dw8zpBykvH6i6DO5Cu6pDSG7swqGPoS19Ir8FNUdc5vMMHJ6?=
 =?us-ascii?Q?GYez1fW4ebar7EJtk7G3gcVNmgxFyzj5WiKIIi3OHn2QM3ITfvdwwKAM7WOw?=
 =?us-ascii?Q?ppXdWBuoNsX1ECi8KpRpP7VCTLr9883EbzgZazAePwdB64o9qm8nFqPR25hT?=
 =?us-ascii?Q?uQZA5yS5EyeBO3TMKDhctG17Q0gWjLoKXzVZWdoMMDDv5QFXLsKrUaNFv3q2?=
 =?us-ascii?Q?nv6q/wQBRJkGTSfX2M51xPkUeDE8LOTQHRW3GbN2RS2fsvknhoxpOwXRIQ8Z?=
 =?us-ascii?Q?7SEFww37jrSq0YSgRyFj9v/rsn1PPNAEY9xQhh/Vx+eASqj3RwymzpAVYFUs?=
 =?us-ascii?Q?TNHKBWuTdshBlDID9Z+XCcZGUaIkk9xRCP+bcuDp/okO7ymQU2bPdHunokTp?=
 =?us-ascii?Q?zz3ezJ0WhZr5zeFUQgIVNZs5GZRF8MW0WK3DVEM/k2/75D9JM8f/19KoGNox?=
 =?us-ascii?Q?M2m/zNjEeOlPe1mRkxGsQK3uz9DHfhLo9Ut5kgG0mj07dzk+hs+9lV6vZ/a3?=
 =?us-ascii?Q?IVmwGobSXFaDyxpsWWHiafviMueDCFKlA+mXqxN5O56GUb8xTeGqlpWDgkpq?=
 =?us-ascii?Q?qIuLh7GL46rPpnB0WzBtnTQ0v6W8GCwpDQh7iedVu7L1kwe6xzAguiLLeocK?=
 =?us-ascii?Q?dbSpN3UlDGVqAHApIgOWA8RdL1XP664jt814/S0g38XqLky7XaZ5RbkHyml2?=
 =?us-ascii?Q?sl1TZ6W5O2MVsab4xkpUxsrkwOwSHrcGCZghB9v3WIQ+9xFY2BCixkh2oSxg?=
 =?us-ascii?Q?C8PAettgppnErq7TQm5rvquTa2+lIQbxfpc62Fhpbb3xHgiNUDcNHN4vla7R?=
 =?us-ascii?Q?FFlOFIHasnEr44rC13pCAzmvraWRwGLzHAZFcB/z2XDyZNWCgG3BD4RodVz7?=
 =?us-ascii?Q?DUzBpp8JjyterT1sObarSWV0+pYFQLfZbfZmIbVJwWp4iR7ekUUhJPW3924z?=
 =?us-ascii?Q?HWt439jPCfxiwZjf125g7XDghOWC6jefyv2Xs6BGU7xOPkbudssLBb8eAYcj?=
 =?us-ascii?Q?8Q=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9671f1e2-8b9a-4fbc-7728-08de29283907
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 18:03:06.7404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4PDBAQHe0A8zaLnaaAKU4VGTbIbDReeu+dYE32CfClLVuPV2e2JTJ9yn6bGgedlXaF9he2IdhA9d8+ZjhtvFKZ0RZr2HP35/ecLybPkJJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_100312_307153_ACB82166 
X-CRM114-Status: UNSURE (   9.71  )
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
v2->v3
* Update commit message for better clarity
* Update function name to maintain consistency.
* Update store function to return error when retry value exceeds hw limit.
* Add lock to protect DAT to avoid concurrent during transfers.
* Clear the address field in the DAT entry before setting new values to
  ensure correct dynamic/static address configuration

v2 patch link:
https://lore.kernel.org/all/cover.1763703573.git.adrianhoyin.ng@altera.com/

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

 Documentation/ABI/testing/sysfs-bus-i3c | 12 ++++
 drivers/i3c/master/dw-i3c-master.c      | 82 +++++++++++++++++++++++--
 drivers/i3c/master/dw-i3c-master.h      |  1 +
 3 files changed, 91 insertions(+), 4 deletions(-)

-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
