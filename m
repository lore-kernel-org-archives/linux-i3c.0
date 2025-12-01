Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE23D116E2
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Dec 2025 06:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mTOXZ24uUhaLAYYC7Hrkl20GjdFGF6xYbe2Lta+fXjU=; b=BHe82tpvtZZ95U
	r1H0sh8aGM9tAq2ZRFUUHaujLragl1pnVZPt3bTZj9Z/43lVvXSfsSsT1DVvaKQuIh53yitKALQ5Z
	YOV/smfBKSueEnk1S859AKcAVMardnq1SHmBkIYy181Yl/rd6M2tZAwHbYLuKNEVyeN0Y43DyWAry
	ktwkyBlka5D0cX29whfKu4zvgdo25g5q15lgqrWDfy9NNYIhNVa0TlxKWoISE+tG7o/2LdZNA7P32
	RpKEKNFomLNS2Te73LIXsf+rT91Wrpn2a+n5oXs/SBxJzi5EULz3ocLgiR7DaLZ7gOtA+jtGxlfZI
	Ib5n2I4/qc4pWTjrsYvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxeI-000000030hK-2HzA;
	Mon, 01 Dec 2025 06:44:38 +0000
Received: from mail-eastus2azon11010056.outbound.protection.outlook.com ([52.101.56.56] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxeF-000000030gH-32CZ
	for linux-i3c@lists.infradead.org;
	Mon, 01 Dec 2025 06:44:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRdj8LgQAi5RnPQDHooGP4IK3UzNE+lBH3MGyQ84dx5/mfZY/Rwe+TGRBN6TXYrffLJrmvbBrC9bztkHfiJ1q+B6RpMsb47Sb+DoPUFEBxBIXUEnTLtKGxE/a9Rgv+Xc9O4zNbeNFS4yT4MsLv1TS4iz5okWqWUgY3p4KpNED54RCC+HTj9D/fblnOFdrXUi22HXeOpy6ZqCejJrZJSwGIHYJkUD00VG1W+YoKK607agVGAZOZBA2hcJO/beuT1eA+ZPxvQ4hFrD+NLClZDJ3fnikVXo7PNTpLYFGihSTbNJEA1WuNWvdZmpoPd/zbwznlneaGdUqmvZMYH9ox3/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djKr4QKMJFuDy7mLCoKjVRN+KTgGtoM9ZkSVeSBTG+Q=;
 b=hizml4MIdPqxvYeLT296V7D7QeA9pT1S3YXLuSK2duPXhghnee4eOeH2rb+Hedcf362Yd4dJZ+zp6QxwRdyY5xRbXSL8y61v+EYUH4+C0FFL/ot5C/4xMxev30QSNOuGYZ9imjsdaEkpS1qEuMv2cr1CTVSbDDIfx+0oHALAWUQKUgGEojI2lEr+PMI3YuxqZnjXS8q7XS0/gg6R5XAN+iH1ScXLvtHXzFmsWxbi38QVrX1WZoPiV/HdJ0Mfe69195qmKAHRkT2+FGqtVFJAYdsFQCnSHbdhhR19d4Bvt+kC44R8az2fQ+TA4PjQT1xXcnfJif20y3rn68jc5w5Pxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djKr4QKMJFuDy7mLCoKjVRN+KTgGtoM9ZkSVeSBTG+Q=;
 b=KEoAhQMLfQWMRP5uU+Zh5Qtyl4RrXZlyhFI4mC/ghtn6oKOjYXHrrHLyIlJ7rXfEVerJ5TykS99dVSdkY/lUGnsF63/GnKbhyboC84pwQUrjNFh6dX1jrJC1MMPKsgI0qvgcbUPNiXP0jlUjRFerTWkMwYsfXmW/b+WS+cflnGNRgZX1OPMCyXd1wwr+63PenOB5sGqxLabHbA+9XXZDTJw9NMI2dgmdqUpbfrn7xi/UlUsKir1KdM0xdVRon3zE78TIqewcCEgTcj0lS0tdxAyABPgkx3XYO2WBWU8LgqS6lcon6Feco5EaWAXImDdOh7VuFT1UiPD4gNYrRSYrBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH0PR03MB5847.namprd03.prod.outlook.com (2603:10b6:510:35::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 06:44:30 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:44:30 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v4 0/5] i3c: dw-i3c: Enable support for dw-i3c controller NACK retry sysfs and DAT restore fix
Date: Mon,  1 Dec 2025 14:41:53 +0800
Message-ID: <cover.1764571045.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH0PR03MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: fa04d023-ecee-487a-0af7-08de30a5141e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dSnRIqPw3pVNELaRPzqsrm2s+w/pc2HtLBEI4a/nmdQWZDE1y6qi1TiC9o05?=
 =?us-ascii?Q?ZdVx2QwiZrot1jTsoCAdDJilVuAkiZq8CHM/9rNz4kdsD70F5xymkKQt83LE?=
 =?us-ascii?Q?PP3m3tLSKMc+kbzDeYnx3Eat8LFlCpO5v415ObmryV+1htC5XoZulOgzkuBa?=
 =?us-ascii?Q?C0quJ5TjqE3fjGmE7I5vFDEO5FTP2lM4VKRrA3Ab06EAh8auhdMgWlwckBYx?=
 =?us-ascii?Q?So2lX01xyBG3eJJHm/WCwAMEL9D1pXpeEV+wDkdc99lAymj5hQ932XfWrMix?=
 =?us-ascii?Q?IDx8YUmix6GYfW5sEOx1/92nBmm6lexCS8SET31VIRG+wuvlbD/bxHVgwsMS?=
 =?us-ascii?Q?BtjjhaNPdb7NtJG7cD4wujfyJIdd5Jk1B+EfQ/0fAzrij6Vz+ADC071oIbLM?=
 =?us-ascii?Q?9ChjwMovterE1FBVLWJnjScdrXq8+jaeZlR+WfXJXo53Wu55qeDxJT3ZdlGC?=
 =?us-ascii?Q?hr8+sqoBDl+nKpzO7I1FLx98qyMTYJ7ck3oGEuN+2XDekIAb84hTs7RicAPK?=
 =?us-ascii?Q?kz7r3IZnBKNlv8koa/7Ek+5+04uc6Yxr7Rtq54KzvTqy2HnGe4mjZN+QQ/Sl?=
 =?us-ascii?Q?d+sCrRGlGbpDv+RcqS+hxEfHDLzug/OJxKUZFzxmQoQ5MCJDQJad2EEGLH8L?=
 =?us-ascii?Q?wNhBuRW1l+yqCcvIgcnMmJtUv2vq15ZoaHCu/nteJf73cbk1haOUIzBlPPyJ?=
 =?us-ascii?Q?oJLNp97ImJS7tPfmwbEWvQCLMCHo0gkcYn2JFVvXKSQ0oSZ48WLA7mMQ055a?=
 =?us-ascii?Q?1BXIbn0AQWlNlnfIuZhDVoRAr0mxf/ecHzNeJcIYmkK8Rh4fOvRP/CKtbMV0?=
 =?us-ascii?Q?KfRaPPsZO0uNst8DH62YpLopUia3eiTyUwL+GB4llsdAgRpqfvaK8P0foUp1?=
 =?us-ascii?Q?bxrwuwbhUageXTkPxZaKzhQAZLjAhiua0VqNXeuZnKt1+NSKOHU1nUqGd6vy?=
 =?us-ascii?Q?/At7uBwxAI2ojNl6fl/8nNME+BduNXbdCD/lqJ4zkKZhUmC9Y3VG4FVvv6/k?=
 =?us-ascii?Q?5ALpXBlvNyy5kbVYCQ+GN/RI40+JcKqx3npl0ZH+Fk/PRj12gi+GTWDrsoCU?=
 =?us-ascii?Q?jY8BqZCh3cm1a2yP2cD+NtX3Q5D8epqeZEALXxtNmVAPqgtCovKVtoMWHDP3?=
 =?us-ascii?Q?EHp3YpO26O9i7wHsi/eHIx4fvuKJYD49DUa5i+zaGXl0FTmLq0EqtZFYicxc?=
 =?us-ascii?Q?LqvY4qc1wbljyeDg36c9oILWSDY9CMq2POde6hEo17p8LGyVjLTccp7fwdBF?=
 =?us-ascii?Q?10NOeYHHBsagBEqfAMTGuTbWW4qqPoZX552AWGH4x/5lrQCwGl/yGXWadKGe?=
 =?us-ascii?Q?McqdOyGaRcRKvkMfWLXGg+z72W9+c4jqrLRbl8DHROCp7nuRmp0ZcitJQTqz?=
 =?us-ascii?Q?bvMhYrE4PTlUGOhYavnO1RZdQ36xEBeosaWN0Bh60VHhI9mw8IA1OMaAOuuu?=
 =?us-ascii?Q?kJO5c01jk/0FopY5RWaFXlvq6n2Zx7g+4Y0gJ4yifdFEFl6lsvTQHA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NqADoel6tC/7Dox4n8oW0tlMKPy7lnG18gFTCvDEvwPljAlqMTrcFj0bvuEQ?=
 =?us-ascii?Q?FPs9hC26IurE40usQHCWW5YGrKIi0+nDZgOLmEUJrDCbV+JKfnIvE3huvctQ?=
 =?us-ascii?Q?c6S+uyTDfBjwcSbGJFBgmyZB8VwPAqp5Cr5O9M62WsIFz3hplwCIQc5gKfy/?=
 =?us-ascii?Q?je5inLD4GJEqlVOPg9wjxKzbODTtgJSete066SdShriurOb+qHxub+TELts8?=
 =?us-ascii?Q?K6k4vtaCtcjMTHNHwisjw/NVSGyfBwq3bLDFHWpx10/qb4cg+kXk2VAmGjkt?=
 =?us-ascii?Q?QVnSMQQ/KTG3sxYED5XAZDjTGdBOPiIImJA0CDJFfxJPWd3sOuW9ZYdc6Lyz?=
 =?us-ascii?Q?oQGc40tnTBrgkvSQ16IY5nfN/SJsi+aTzgMrHTJheuDJ8qD/uN8QVg5sMI4D?=
 =?us-ascii?Q?Czz3IbS1UnpjEujbz3taeA3FUMQOr5zdrHo0BuFNdI+mMxFZmm2n3nIbjgVu?=
 =?us-ascii?Q?u0rES/rCHQ6yMJXZ0aV/6ilpmphkBzw7rVzKKgabtfRvH0cf7rr85yCuDUua?=
 =?us-ascii?Q?g/ua1h0NQM7tFKEcmawsbQwvFh9+PrBB4SEQ0pHpHtvJh9aTuJlFBeXkTXZJ?=
 =?us-ascii?Q?Ce/mj5+/4snF0KSrQ24TVw/+7HvM6bzWV9N5/NjXqpmbSZNvzls7rNWvTsBh?=
 =?us-ascii?Q?SN/NrIzaAQHbIL4i/qGOiI8anqKdudd9gtrjMukwjcGeuZQWIY+UPzDXRGc0?=
 =?us-ascii?Q?rzGProrfAogWFGwXyJA7Zv3xgRvunHOURpB/SajG4coJb7tgFcy2jn2fEXBc?=
 =?us-ascii?Q?tnH50xaxuCPW+H7Za0yYHfLnofOJD5mBzwRQKZlNVViKSQR6i40xRe41/FB9?=
 =?us-ascii?Q?AhgyQEW+As0U1sqR6Tqk+U6H+fZkwUI/hOhmMmeuWmpKK88PGBqC7h21VNxz?=
 =?us-ascii?Q?fmN/n6YyW09i6VvQKRId00vRi/HmPV+S5JRGIhL7Fg+J3ik4FRbW019ujdV3?=
 =?us-ascii?Q?U93V4l8uCQkiFAOD9fwEB8elE9QXtTJZIjA1WHGR3l2fIFF5dJWlR2HTdSBH?=
 =?us-ascii?Q?xEAHoK0IRrPVdNyyxh6aXvzHYtQjX7qLQPmqPHz/ZJFMADLPX8QiQIDA1ktL?=
 =?us-ascii?Q?dMs+1hOnhkcF7N37b/ebChYVeg1tBaP3U6221sdM3jdK73T9NGJZgCIw4zHv?=
 =?us-ascii?Q?BPpScpq256g6OF34IBk5jCY7ydRV77y2JsEakqPIZw7oIAMJpMv8/hlFO7QE?=
 =?us-ascii?Q?2sq7GrKPeIa5sIdrsiramVDoJmm1eg+gU/ESO6iBCAvZGrEvWsKgO9y69xUa?=
 =?us-ascii?Q?1MebC0sZ5OtMjREsKu+ZVzbJwCK4vAiziYX9RiYCRRv4dc5l0UC7cTs7jy2U?=
 =?us-ascii?Q?k0rew4Be1lGOVXqMgOWt3EbgCnDNsKlqxNMTlznto9M1LlcvJSBmbmMBatKv?=
 =?us-ascii?Q?fs6VdI8NSVmLDdtvDRKhH5KQBqMWLqYC6LqtFRamSRnqWIaszHfDE4oDjGAZ?=
 =?us-ascii?Q?UcTO5ayx80Ai+jcAbLMJ+WQPTDQtaEsb8Usul2pMaNthKCyQue55Gj0inunE?=
 =?us-ascii?Q?uEpiXqQvIVwMweFB4UWOeGr9Ox6DssR0x6FR5aOyqCA8Sq6vrXvJOjNydK0F?=
 =?us-ascii?Q?vwtpnAKlwJpQ4eUnCBGN7HreBJV5Ug2DCeyC/UvKZRuZq+deK54i1Q0sEWjv?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa04d023-ecee-487a-0af7-08de30a5141e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 06:44:30.1413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xtx9Hz5wbVgKmX1koYuI6SamJ03a/LcHAyQT5FjKy+253JaoUkVWi4Ci5Ujngm8qy4orU5MuiYpdL+W18e5UnZEzCCLGZCMfK2IvAnXSHeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_224435_779050_29A94106 
X-CRM114-Status: GOOD (  10.10  )
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
v3->v4
* Make bus_maintenance_lock and bus_maintenance_unlock helpers public.
* Replace taking spinlock during DAT update with bus_maintenance_lock.
* Add macro for static and dynamic addr for device addr table.
* Replace GENMASK calls with the appropriate macros when updating addr
  table.

v3 patch link:
https://lore.kernel.org/all/cover.1763747151.git.adrianhoyin.ng@altera.com/

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

Adrian Ng Ho Yin (5):
  i3c: add sysfs entry for Device NACK Retry count
  i3c: make bus maintainenance lock helpers public
  i3c: dw: Add sysfs support for Device NACK Retry count
  i3c: dw-i3c-master: use FIELD_PREP for device address table macros
  i3c: dw: Preserve DAT entry bits when restoring addresses

 Documentation/ABI/testing/sysfs-bus-i3c | 12 ++++
 drivers/i3c/master.c                    |  4 +-
 drivers/i3c/master/dw-i3c-master.c      | 88 +++++++++++++++++++++++--
 drivers/i3c/master/dw-i3c-master.h      |  1 +
 include/linux/i3c/master.h              |  3 +
 5 files changed, 100 insertions(+), 8 deletions(-)

-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
