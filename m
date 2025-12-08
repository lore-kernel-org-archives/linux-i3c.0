Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D8CD3B7E7
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 07:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YneLpUGVfRizesFVanfNqomM38zhL6Vof1RSJmLFkVY=; b=Qp9AvxmmdYWdnA
	Y/UzX2BhTnM6f0H5dX2MF6gnpIOSZHZflYxZI+c3EX6DGohiGYwNS/uNfemRNlXMIpZQTpsAYrMwG
	T6eqNFr+UXN5ykGj8XkLp+lT+Av0TR7Ss5E+yHUavqtu2ad53vMfrroL12qUQTrWa06DDTagH2AIN
	nr/rTL9ZtMgUX+37/pKgyh7gPSGZcbcyfGnQDNNTDCEbQdPkFw/83fjOVp8BtUej9HCrAnhXZyNNZ
	2JsiXtHbtf1AL/Uub4A3Dlnu45Y98O7MR8pzkD7UEgcyUKYdZSwy7w6Z9xadghsVUOGPq2Qxq8XYL
	At3K7U6dFvjNTM60my7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVRf-0000000Cjgh-1DRK;
	Mon, 08 Dec 2025 07:14:07 +0000
Received: from mail-westcentralusazon11010030.outbound.protection.outlook.com ([40.93.198.30] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVRd-0000000Cjcm-08aK
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 07:14:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvW8hzk+UdFrXhj2colvOArQViLZG9UJZcJT8hf7MYB8ruE1prPEf4DitxX3xHlHOmmb+Uc4gcfDeR32Ek6eTb/ybGKd/T0kqwl1j8n8Dg5HSNtpSo6fCgXigNPec47vbSPz/O6mPeGrCQd0MQ/HeLUlN7dLVxZ/oRKKKPmOuZdUBzDegHZTOehafBEeYG4rJpjFm+mUNnoglD0hLp5v6832I+LnbroqCgpbwEGjjEbj9aOTayp8GNXx5hFyjZ3Nxdrul2uViO8zS0RzRyl+mJc+8jgO32CWHjj02gMWi+UWoesjuGvYPPMyP2/qcbiCIm2S+OQ8n26dKNmNC+Cx+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCwUgqjiOlz03Hg+LACPBAukGhUn30n5Gshu5uwZAWY=;
 b=UkmpcrWRh88/roFYlO6eXKfi1mJ4/FvaAwDZFQncH541/0THIlUobxixYcBeoFcTaqPv6qe3ktTbfEOYwfqfPmXwxnDQiewGdFXiLmJT7r1eFzBhO+Q79GPGhlc01RfU+vfFeXg78lokJ0ciSMslHK0KePKAbBwYGjfVuJDngEvfnfF55KqW2eT7eDjCqFIifAjzldYSh4vRznaEigvT9CT6wn50Sdp2mDGdLizhD27Z6wRmCLsH5LoO9FOt8qFmz6GGnD5GLygEx0cPDBeMBdeGMkNZ793Ak9tUTvr8v9Z8J6rbInwJ39egSorNMAI96Pj0sd1omfQwQiZed7Dn9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCwUgqjiOlz03Hg+LACPBAukGhUn30n5Gshu5uwZAWY=;
 b=fX5E7T4JTZnXEQpibJfYyDDlE2Y1gVtssp5pgn6n/i0jAkvdmDPMigPgNQ3mHLM/3sqt8U/YMDhswZU6Uq5osWCYTsmHwwPaQEZWPagaeXsBYRNKJJ48Du+gc0s+bjbIapnLXJ9z59cOGGTL1xmhJXd5pVIoqAdN5X0ngiEQwPTFrXBT5XDFdwy/0lsNgEUZnLxe/6DtpyIRhBoka/4l1LJ5OtcmKohOmRAUIlwCZmAHp4nSbCa1SJlmpiALO9HXsTw8TRiiMkXDqsKF74DvvnOlss/SrM6sqqspScxPRHvvLCW9rTYo6UBHFjhMyWwNVR1376lZqCORu7z4EvuZwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7475.namprd03.prod.outlook.com (2603:10b6:a03:55b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 07:13:59 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 07:13:58 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v7 3/5] i3c: dw: Add support for Device NACK Retry configuration
Date: Mon,  8 Dec 2025 15:11:18 +0800
Message-ID: <5a1e1a6b3f2f055c5ce1e111c798e10a4662f8cf.1765177110.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1765177110.git.adrianhoyin.ng@altera.com>
References: <cover.1765177110.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU0P306CA0060.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::7) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ2PR03MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f3127b0-e484-4ab6-14ba-08de36295b67
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H760L2jiJK8qOWmC9BYppc1vEqLn+FzNjSgMLS5q8C3DXdslHmTCyVfWUG/A?=
 =?us-ascii?Q?4XW2hqzYTMA9lBx1yakzFAcjaqyWcxSctpkzeSh8NsS83o70DQ0DmyCxzSXv?=
 =?us-ascii?Q?zAeunJnGC/qjLlH7LWrFL0KaZwpz9yEiIjYuAt+heZVMVOg+xnblNWtF/I13?=
 =?us-ascii?Q?TqRFdpRSQu7Yhae+fqOA5bv9Rbd+FjgrUhJAuBw6np1iv+/nudhaWCnPkxe6?=
 =?us-ascii?Q?XcZAbJrovTZBGUXoVlzCnlKJurg0LPKVrNbJ5AWXIFrkU8YdRsKOeSW5sN/9?=
 =?us-ascii?Q?8I0DECzmJ0xVWZ3KH7MStnBZ3izvNgzlfdkzRA/UiAk2YEDcFzzhHdqgevxD?=
 =?us-ascii?Q?KlMswSJkUotYYOK0Ku9a+EeXL2EG0Kn9SqHZsdzoZxiqUZ1F6MBBq54M5D55?=
 =?us-ascii?Q?DogrNOSe73GicTrVOSO7/2MuN3BqTA7AYUZeJ19Ff8EJkpYlh178OMxm/6ky?=
 =?us-ascii?Q?uBIHKyreEMlBJCAplPrSCFVqawlLlxn5CIlF97xTPikFQYGcYvic2IPVVzV7?=
 =?us-ascii?Q?1Uh8eTK6KmvUgpRMRWlsBUyXYCXEpAcNcwRhaFhMJFqc03MM6Yl5QLfAsSKp?=
 =?us-ascii?Q?1qqWyV7OXxjAxOqNEDdMmlUXx4n+4d3gXx+QIHO6HY5Z9sME0h7dHpeBPOgQ?=
 =?us-ascii?Q?xc/3QSh/z2d3ZeMTNbEEvQHhdFSxuPLVhVHyNpkKv2r7s+4zlql2ybVTk0qC?=
 =?us-ascii?Q?vHwkMrsQZqSfuyE/6qgK3pQzS6XoJASptwq0RRyUPl7i13kH9Qa0rJ/F5X3v?=
 =?us-ascii?Q?Gsz/31bylLrdWCN1sDVq0L93kJzWvfOKeG8h7VgL7bRENhPgxdvgrx9NFTlj?=
 =?us-ascii?Q?AF6zBCRStPmmrjAdNPvR4SM6IOpYEruqP0UAIH6MVPkrL/v6vuHRanJjD9cl?=
 =?us-ascii?Q?RkRArUG6eg8DGkvYCRJ8OH+f/Wd1j3NfbiIsQsMK3sl+iUu2EPYDIgv4PguU?=
 =?us-ascii?Q?gu0IphopX8zI5lI9IY+m1zmC1SfTSMUi7wn6jKKX+gWMoL4ZDD9M41FLdc0U?=
 =?us-ascii?Q?oUdD06uR4vm5LJbMrAi/e5RyLuHFsw9g8yGT5KgpFr210XxfTXypfn4GiaXK?=
 =?us-ascii?Q?907eL6kh8fLi0GFdPY+CzAY1OoEPOTxi0LveW1LZ9HTXR4rtztARry5lIYDT?=
 =?us-ascii?Q?5VL1RQkk1+17gIQT8hiBsvObRMIXcxo5bdowvuYokYH+uaBBRVpjQ682cpNg?=
 =?us-ascii?Q?QT3mCKB6BcklJ/kiJyu0+NvEboo24qBAWC45Oygq58rk3wt+wu1B/YLQ0Si7?=
 =?us-ascii?Q?3B7Ryv/otPoeMXVEkJH4Ia4s6ftPm494NuIx342QcRslLFiZHcm0HMDHJOUV?=
 =?us-ascii?Q?M8qYcy62qUVjWd1VcVKsmb73PUxLbSM039yA9xKyq/yXmKAoiX6L29Im6VPj?=
 =?us-ascii?Q?nHFCrlAmJ7kJs7EWlh7dokwV3kD5kSMD1xfKZr7p30uvTTgPSuJ4D2K84+it?=
 =?us-ascii?Q?xAnO+JqDIHqDBnyzw5dMvBg1mQLjZhgc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SmZ3c8Hi8j7m+8r6DXBUVoiVdyEMg3/t4Aq7ArI/iWAZ/69vuKH1PftwdNXV?=
 =?us-ascii?Q?b4n9/CTEdpQ/5pEzxmmNHITtpf0yCY4agv4bBeDPnFTH+XyztwDfYXOxhtOc?=
 =?us-ascii?Q?6t4eLeg+HQiUW99VoMXRuW4UdCDrMautKDaSzSZVIN1MkqBvMESDt3XqfUWC?=
 =?us-ascii?Q?MYHRI/NxEIO/MONYFIcYJ9k/MBrrKe1XoyE5Fc+AP7DLIR4wMB0bGS0gE1pu?=
 =?us-ascii?Q?r4It41T0BcA7cW8bFZShNsq4Pw5AIuDT+e1jqWUSZXgkJXCx8z/Xp4Lj/80g?=
 =?us-ascii?Q?9bB9VtXxqa+HOnq5IvNLOnlDAJuvuosWLHbS5Wb4HdtvqefvSVxOwDSPVYal?=
 =?us-ascii?Q?RJnNdE+lqJ6CMxm6VlH7g5wFKn5uFjLQd+9cvjIIvk8bl1JKrRgT85fbmhg7?=
 =?us-ascii?Q?bD5dEWh+5F7XVnyIFvhGgfYhnDI1sO2cpnhjWJso2GgSUt5wpwZG1+b34Xv8?=
 =?us-ascii?Q?vKnGl74yop6ps2Fes6vy5dft1/J93zvqZYa6HwFue58/mMRo1wSYNXg1NIvG?=
 =?us-ascii?Q?L5EOpbUswGh4gc7zx3Fj0LT9pVt0BGz1ByzxY8WN4mAT2Hk7JElLlNmr20sZ?=
 =?us-ascii?Q?OzN28XL2/6CHzaSWEEaggrUUb+P2GnECX9x1SB1ikGnF1frGcwiyzdjBxb66?=
 =?us-ascii?Q?W0ehOEVJJedf+9QyOrbuJZ5JiqsG+dCfvSY/uGEr5G1jZcfLEvvpT8GHcaDR?=
 =?us-ascii?Q?a/Y8Orgq7nk8wQ348HrBpRUKS3gcCbSt12qFXarVfSg8v95ZkIjMtrGQfUFM?=
 =?us-ascii?Q?MOxxlY/Ypxqjn6JxovHOJEpA9n0uF11IrroPdYTBNDLC4g+NsEVtOD6OkJh9?=
 =?us-ascii?Q?P8EX/iA09aC/SUWzzz5BpZbPefOFv8QVB8XZpImW5ysCiin0cN60Ri0cGfNx?=
 =?us-ascii?Q?KDu40eXrrISCpmENMbnJPYqWVYei3X7DiLaNnxWPrObvaSZVbvOWrIESwaU2?=
 =?us-ascii?Q?LS1m1K2wTiN8EclMBieovZuEvYo2gPcqRvXKr7TYZTEm9SRfTyYVWViTIQSb?=
 =?us-ascii?Q?2h/v3BBP1OmahG35rnMFD3vGDeCyaq2TjS16Xi59bHm/pacvpJfCkz3mnOXR?=
 =?us-ascii?Q?BpHp+S1+m+rEodx71czQTfeXzUNfaPOE2rn0UpQSUlqctQqNvpPKfH043C/d?=
 =?us-ascii?Q?K+fYNOsQKi/lA/VdYXZms2zENg0l+n9L7usx31IJn8otsxN3b3lMm2l1hI8H?=
 =?us-ascii?Q?e0Pgt9SWrcx8egk0V+BWgkWcvxMoluMfY3/iJHVHPLZrDqcMiJtsCNltLLEk?=
 =?us-ascii?Q?gsH7SckIi/IshiS7PP64ITRRASpVPyimbQmo9YcfBdpqoyXwaRWXDeUmI58f?=
 =?us-ascii?Q?jo3/stqAkpBUdeOqAmhRoQ15s5xvxWbeYzY/siraUWB9SUtXSrqwb/ZLtA3D?=
 =?us-ascii?Q?rHlxhp0uieWlzJaBP+CD26iz4gBlPfCs+5d5gZm6z840CpVDCmIhKIgROYhS?=
 =?us-ascii?Q?6Dev6PvsNNTzPjeFCJkn4bMwsT17P/XzT8lWgtp3WHAT5QSax6rk+o6LFIeP?=
 =?us-ascii?Q?aA+5TlyW4/QQpoCljoQ+QBDyRDrC8MQ3eIS5CwxfYEtBiZuKHruZo/x/MMVD?=
 =?us-ascii?Q?SVCIHEWdv+PaJg1Ow1XihagP7t3I30Ok3TUeBvGS/fPGd0WcEP9xk10skodR?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3127b0-e484-4ab6-14ba-08de36295b67
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 07:13:58.9101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n14j3dFuT1F2L0R5lZtlFE1gSVg4OdIQK1fzcGTO7ssUKVHn8QLEPH/zuMIECEehRBIe0ydx1FsWBnfCJ3lsYw1XRBVGwqb/OnE/tVLnlVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_231405_101401_8C88FB65 
X-CRM114-Status: GOOD (  14.11  )
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

The DesignWare I3C controller supports automatically retrying transactions
when a device NACKs. This is useful for slave devices that may be
temporarily busy and not ready to respond immediately.

Add new ops to configure all active DAT entry with dev_nack_retry during
runtime. Returns error when value exceeds hw specified limit.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9ceedf09c3b6..ce33600d4c5e 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -5,6 +5,7 @@
  * Author: Vitor Soares <vitor.soares@synopsys.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
@@ -204,8 +205,12 @@
 #define EXTENDED_CAPABILITY		0xe8
 #define SLAVE_CONFIG			0xec
 
+#define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
+#define DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK   GENMASK(30, 29)
 #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
 #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
+#define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x) \
+	FIELD_PREP(DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK, (x))
 #define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
 #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)	(((x) << 16) & GENMASK(23, 16))
 #define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
@@ -1484,6 +1489,40 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m,
+					    unsigned long dev_nack_retry_cnt)
+{
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	u32 reg;
+	int i;
+
+	if (dev_nack_retry_cnt > DW_I3C_DEV_NACK_RETRY_CNT_MAX) {
+		dev_err(&master->base.dev,
+			"Value %ld exceeds maximum %d\n",
+			dev_nack_retry_cnt, DW_I3C_DEV_NACK_RETRY_CNT_MAX);
+		return -ERANGE;
+	}
+
+	/*
+	 * Update DAT entries for all currently attached devices.
+	 * We directly iterate through the master's device array.
+	 */
+	for (i = 0; i < master->maxdevs; i++) {
+		/* Skip free/empty slots */
+		if (master->free_pos & BIT(i))
+			continue;
+
+		reg = readl(master->regs +
+				DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
+		reg &= ~DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK;
+		reg |= DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(dev_nack_retry_cnt);
+		writel(reg, master->regs +
+			DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
+	}
+
+	return 0;
+}
+
 static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.bus_init = dw_i3c_master_bus_init,
 	.bus_cleanup = dw_i3c_master_bus_cleanup,
@@ -1504,6 +1543,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
 	.enable_hotjoin = dw_i3c_master_enable_hotjoin,
 	.disable_hotjoin = dw_i3c_master_disable_hotjoin,
+	.set_dev_nack_retry = dw_i3c_master_set_dev_nack_retry,
 };
 
 /* default platform ops implementations */
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
