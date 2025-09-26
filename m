Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA88CAC5AE
	for <linux-i3c@archiver.kernel.org>; Fri, 26 Sep 2025 10:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYlt213sLodhKOVbwzZY+6M6Nf/Z8Mp7Wvn0vGzXkLE=; b=BG/7EBZ0bL5TU3
	AM+V0/6wqkIyDkcp4Os2FFS3DECE0Pb0HJXIFRvgdPBaLgWtRXYdizYdJtuyFu6z7QHDUkveNiuHZ
	sQdPw6uhOMpVtqdP91qr9hju0ga6uUbwMTdG6BGKWh+OYCOwACRhYTN7KbGJoqVV3Q9RU3PmHhbKN
	QXoIH3uwzynuYFALXDns8Yj5h4G6EIX8Vptq/2g3F0V4RlIgiDLgxwGcueVRtyZkyZoVMUxQmLkD0
	CTPmdJEOISSQ7OurRhrR0FCh4k3yUg9/NXkZo5HHBE3e6KjHL37YuqjN5WbdCtV012w4c1RlCjpRA
	X91inRGhs9OhCkYWcnsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2662-00000000ZVv-0Wam;
	Fri, 26 Sep 2025 10:54:38 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v265z-00000000ZTN-0yfz
	for linux-i3c@lists.infradead.org;
	Fri, 26 Sep 2025 10:54:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGaJCCexntiHEbcYXhRlgQp03CaylhD6VES7Ji2no0JE6vUkN84l2kg7M1RdzyLEebB5iWXGahrjL4NMkxBdcSRbLDLVbOqkDdOv53MNmLdh2bjjKOrCaYthpYWWJXBogiVBTTvwrNM84CHogRzUvAv7kCITmVnbrbYFKyB9fHOKgpl+uPhkv8WobAHJJuDmz2rQOCZwGSndi6Bwu8VTK435/ZuxzfiSDCngC/Ru8naLHOAK2bAiL17VhgeV5bUAqJTV0CYBBU3LweTHqZHLVEE/ZYGEQ1Rs7IsCvHcbEz7yxYn2XifZKQrVSNxE79A/+Pd0uS0PDo+nL8MtzWWNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4WA3NmV9P64Ewa9wuaSx8ufMiI8qcoNuxhGM7GFX8w=;
 b=Kx6uYfMIfOQT9qugszV3CUaDkshp4+Q6Hi5JQaluTMBLtbxKgnFztqctR/xl/LP/VEbqvPWUJKlmWKCev9IqH7pMPtes6e6YJQPPu1Y5q6VTroOMThpVV4Xjbr3ckUblssg+EEGoiZWNUFceq8fIEI9HN4PpuS9+4V4dfoJvtd3MCDBJCeHDgsshs53c+AWK3Uvgw44by+CJ76tC5ZAOVm3xhD83d7ggJJ3kGDwKMHVJTgh5LZwh4uGQ4mh8Ors2KLLn4kQgrYIPg5gjl6el96reDokSYRYhf4kYwdYOKyoN0929712EY5Ju6RuEfvX52xY0PpHzdvpajsMCvuJvXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4WA3NmV9P64Ewa9wuaSx8ufMiI8qcoNuxhGM7GFX8w=;
 b=1uFwcob8k7edM6aY4vuD1OrPXscugJlS8shpmOm2r0mx3oDI3eAihX/a3UsTDygY51FViu77ngQ4NiOkz9PT0go+FNbPG/8i35fW96mvhaSqwX3u10IsQMiQpaybwWamKzqlRdLkDFNiT9MJc8t1XH2mfK/T2bYbjJ5ZGj7lkYE=
Received: from MN0PR04CA0016.namprd04.prod.outlook.com (2603:10b6:208:52d::8)
 by BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Fri, 26 Sep
 2025 10:54:27 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:52d:cafe::b1) by MN0PR04CA0016.outlook.office365.com
 (2603:10b6:208:52d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.12 via Frontend Transport; Fri,
 26 Sep 2025 10:54:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Fri, 26 Sep 2025 10:54:26 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 26 Sep
 2025 03:54:25 -0700
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 26 Sep 2025 03:54:19 -0700
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <pgaj@cadence.com>,
	<wsa+renesas@sang-engineering.com>, <tommaso.merciai.xr@bp.renesas.com>,
	<arnd@arndb.de>, <quic_msavaliy@quicinc.com>, <Shyam-sundar.S-k@amd.com>,
	<sakari.ailus@linux.intel.com>, <billy_tsai@aspeedtech.com>,
	<kees@kernel.org>, <gustavoars@kernel.org>, <jarkko.nikula@linux.intel.com>,
	<jorge.marques@analog.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-hardening@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manion05gk@gmail.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>
Subject: [PATCH V8 3/5] i3c: fix big-endian FIFO transfers
Date: Fri, 26 Sep 2025 16:23:47 +0530
Message-ID: <20250926105349.2932952-4-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926105349.2932952-1-manikanta.guntupalli@amd.com>
References: <20250926105349.2932952-1-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|BY5PR12MB4116:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac641e1-bc5a-4c7e-b576-08ddfceb0fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|921020|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YH7NaNRvajucV114ew1oLgIUWIkr0ColUYjWW+XLfnaZ28w7uDh21+ftYa1j?=
 =?us-ascii?Q?Ga3fqfHaONhRSAne+oNMiJ/6BZ0QrMYNK9hn4zyW4TYTcItpYljIt0PCcNIX?=
 =?us-ascii?Q?3Z1/6C0hSoscGYh7PTuFn6tDFKJOU/CbQa/nlHYhz+0vbuUNBlw5Mc5p0EFZ?=
 =?us-ascii?Q?FFiAo6EPU6DWgeSCZ213Pe0bQR5K3ZeyR7F7uvfV2V4rUwai8siLyFtp/1ck?=
 =?us-ascii?Q?ik9aidptXHXR9vRV8qqd3KJy82+aMwTDY6G1Y1bUds6BZR4iBaYYCo3Sx6DV?=
 =?us-ascii?Q?qzwvkJtgFzP3NA9itXVFyIFca14xJ1ZbCgipplRQSe1HASHkXHmRnTQ/32tu?=
 =?us-ascii?Q?zI2pz3XDQ2D/GCdfGxf/vacIq31U78BykMD7vopZkMvsCgpN4G+iulRFtfBw?=
 =?us-ascii?Q?KY2hHHZ9FPfLsiyXCFWt8LgtW7CpRDP6kP4IEaNOn7ILAWDQJ9qIGm0EgL78?=
 =?us-ascii?Q?a7T1f3D0yPkghGIZblI4HXweQJKbIkDdlOVPaglmjt4f6EBg4HAMOfsgM9Vv?=
 =?us-ascii?Q?oDTzF5lVKapsPxl1XsDfcoF8Jj6SDYqL0dQE8nzCF/mxTqTnU/mjhPPKxfxI?=
 =?us-ascii?Q?33Yg9LiHpWYyNGqIFOwHwL7jDwL1QVGeDnz79iIKDZzaHtlzfCvisN1sz2DP?=
 =?us-ascii?Q?dnKw741GwTNHWEBBb9SJpqCAVNPb8uk1NaWlMOkgBhTnvrx0G1CvH2YNyAwH?=
 =?us-ascii?Q?XyGzngSpN+sR4RUchHzBaD+hEVmtRo7dyMi3Ghxg4RLJK7ofNMV3CqkQi3HI?=
 =?us-ascii?Q?1LOGGT5koiLDimO1XV8KD7dmQJOnX8wfYnRGXQ4UQALjuusUhbV5u5nYP22M?=
 =?us-ascii?Q?hsHDnLyE5WoldzZI4ISmhrFUE9/AcwkZ3Xh69pWiuuAXoZEyzO0U6pUqT/Qq?=
 =?us-ascii?Q?I0xgMUyBRTCCsSahmoO607SGIhQNCJYxOeHhQGa3vObzzQywy9+e7e37Nowt?=
 =?us-ascii?Q?NapMP8MoDiRfH+pBosyoG/8Vy6cyMKegRGC9A3D+y8HDePeShwgsMJ7Q22Tw?=
 =?us-ascii?Q?J1h6g9fefP5GG1ypeYsqbEyF3VzEwFL77V7ZFBHLdxvgcD+HtD8VVJj4ntU9?=
 =?us-ascii?Q?FYE3MgeBFxxgsx1GtIWzfbf5b3hN/Uz1VUa96b3lSD5wFzLHdQvPXWvTlL2+?=
 =?us-ascii?Q?CsYxsckAzjfEi5/0J5/QeWslRRMgqvoA9LEt0W0GY3bgZBqn1iKUjlx3gwVx?=
 =?us-ascii?Q?JJpRe5UhwjhtxDxvj6EOUeEACMO2O13i/PXTrvn4mFleq/QrNMw0drmyaNX3?=
 =?us-ascii?Q?D/H4UkPDkoptdDHA5amgf2XtfR6YrYiiZ9WedIGx+W8NymnpTplqy/veOy55?=
 =?us-ascii?Q?S1By9O4/2vUGWvBmwJRTxVY7yu1QQ9Nogl06P5C3uu8xYLfwtInKU6V5XdAj?=
 =?us-ascii?Q?kh3D6OWWi0lQZxN7rsOAev8GpobR9EfDBbRp9XMEWFRAwAvvL8e1S+3ChYg9?=
 =?us-ascii?Q?0f/vYNRe3NfAnwZckVd8EybvSmDlgbwqeXFTdFZoAjpsAc+OYtTxSQTm2N25?=
 =?us-ascii?Q?eKWEgtKTvcTwpHkb9o3zOMBeWWCh9OxqoL6M?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 10:54:26.7450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac641e1-bc5a-4c7e-b576-08ddfceb0fba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_035435_308923_876C9DB0 
X-CRM114-Status: GOOD (  16.06  )
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

From: Arnd Bergmann <arnd@arndb.de>

Short MMIO transfers that are not a multiple of four bytes in size need
a special case for the final bytes, however the existing implementation
is not endian-safe and introduces an incorrect byteswap on big-endian
kernels.

This usually does not cause problems because most systems are
little-endian and most transfers are multiple of four bytes long, but
still needs to be fixed to avoid the extra byteswap.

Change the special case for both i3c_writel_fifo() and i3c_readl_fifo()
to use non-byteswapping writesl() and readsl() with a single element
instead of the byteswapping writel()/readl() that are meant for individual
MMIO registers. As data is copied between a FIFO and a memory buffer,
the writesl()/readsl() loops are typically based on __raw_readl()/
__raw_writel(), resulting in the order of bytes in the FIFO to match
the order in the buffer, regardless of the CPU endianess.

The earlier versions in the dw-i3c and i3c-master-cdns had a correct
implementation, but the generic version that was recently added broke it.

Fixes: 733b439375b4 ("i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()")
Cc: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Jorge Marques <jorge.marques@analog.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
---
Changes since V8:
This patch has been included in this series as the current series depends on it.
https://patchwork.kernel.org/project/linux-i3c/patch/20250924201837.3691486-1-arnd@kernel.org/
---
 drivers/i3c/internals.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 0d857cc68cc5..77d56415cb99 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -38,7 +38,11 @@ static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
 		u32 tmp = 0;
 
 		memcpy(&tmp, buf + (nbytes & ~3), nbytes & 3);
-		writel(tmp, addr);
+		/*
+		 * writesl() instead of writel() to keep FIFO byte orderer to match
+		 * the order in the buffer regardless of the CPU endianess.
+		 */
+		writesl(addr, &tmp, 1);
 	}
 }
 
@@ -55,7 +59,11 @@ static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
 	if (nbytes & 3) {
 		u32 tmp;
 
-		tmp = readl(addr);
+		/*
+		 * readsl() instead of readl() to keep FIFO byte orderer to match
+		 * the order in the buffer regardless of the CPU endianess.
+		 */
+		readsl(addr, &tmp, 1);
 		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
 	}
 }
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
