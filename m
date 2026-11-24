Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25170606A331
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Nov 2026 06:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XpDnC6Dp;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CJb/g/hx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Af2uQC9fljvn5yerjrXqOotgPirStr7ZqCrt+V3QqWc=; b=XpDnC6DpOOeI5AJyk+uO5yzgDD
	1HGIPYaKRxe0RCG94Sz2t10AHQonuTNUhGZELOzjC7XG5R/9jFfZLqKHM2l6MCLCUgOvXmymsAg83
	r4Fy0ewJyGk1+L3ZblrnnTl+asDOD8IhkitXrV+xOuSwiFeF9l0WG1r/gmvOZXjo5D82DLzGKr5Yh
	FdIT5qwlx0P552LpVtXKU17xH6uAP2An8Imk0xe44FibJGjJbZj4mk+sPMSL8FhkSdpLC4ZZWqtYc
	8yhVS1P6TV8Pa7AyKNOD1OfGhba6AjvTjCV1F3a+fPlOBPL2Ryie32IVC5Tu1Rs2Ve1eDnHkUSOe7
	Twmd3Dag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjiE-00000005dVW-3jyX;
	Tue, 24 Nov 2026 06:09:06 +0000
Received: from mail-northcentralusazon11013057.outbound.protection.outlook.com ([40.107.201.57] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjiB-00000005dUU-2NxS
	for linux-i3c@lists.infradead.org;
	Tue, 24 Nov 2026 06:09:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPhrAqKUkMdx5KrFe+MzfNzQB5JNxoMMDL2QiBErzYPa/xPByjtlvYgYStnpxU1ODivvTTaxg4lPiMsIEIsOiVtC7udhzOgufmi3hkruNrVODPKD/5BEEvZpU9W8LubZG5FGQGwaMlFMCy6SK3oJjk/Mjtd3fyQd2soE/Td8wBi8jpAIYVApkksrifrISPC7oCn5uPnR3DAy2enbQz1ZIiQJzjnrphFdpuNu4OhmETVbcwCnrUrjjJESED6Z+B+/rTmMg5b1HDTgaL9ZW7zuk0MLMMBsPsMt+tEIBHeBFzxhO1gi5Dk5ssyDfkoAobIzRkPCpUMqzlwG1pUMygzIwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yy5a4fEuRo7yzPSHkynjLzcAw1n10CiunSCZA/qqXqA=;
 b=X8kTup1s5uogqUZCuaV0gX1v1JIi0kx9AomHvaidwuUr3YG+77Dav+jfV6Oklb9tQKUoYkRympdbVn3DGZD/l1Ph5a3ltTcNihp7TnbA5iYf++uXtdCKmnl1nkZyBF0yRxdzicV+Szyg1p+vJFYHQIuIalxaKTi4sG3F0JHrJYJksw9UC+wK19GJbHZLQDZeWaVuoS4reaNYCBapPNFBxg653Lk9J6M34MfUlEB4Rhi51nP2IK7H2YIBhwQ87Ile96yfy5WqUVBhs2th5RLQ+2zsrlUAoD54vtqdzSWylkxocMBDbwljKuDCfxEPmWQSwM7xfWKqK4b2+hE2fi2/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yy5a4fEuRo7yzPSHkynjLzcAw1n10CiunSCZA/qqXqA=;
 b=CJb/g/hx8wQVSqqCnChafNdJTqk2HdsM61y0nuMiP77PRJfCHCsp2rvu+BhiYCGt6jXlvzTLKoVR4JwnRdPeOlG43GbWCTFMj9BueHQETvLg9iUkAKWuhPgYciryZO3SKRH9yFEh/p8puXV9XdRyRLKe68Jq6BKgsyiUHjK3R/I=
Received: from PH8PR02CA0046.namprd02.prod.outlook.com (2603:10b6:510:2da::20)
 by PH7PR12MB6882.namprd12.prod.outlook.com (2603:10b6:510:1b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 06:08:56 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:510:2da:cafe::2) by PH8PR02CA0046.outlook.office365.com
 (2603:10b6:510:2da::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 06:08:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 06:08:54 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 00:08:44 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 00:07:20 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 00:07:17 -0600
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>
CC: Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston
	<matt@codeconstruct.com.au>, <linux-i3c@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<meaganlloyd@linux.microsoft.com>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v3 3/3] net: mctp i3c: clamp transfer lengths to the controller limits
Date: Tue, 24 Nov 2026 11:36:51 +0530
Message-ID: <20261124060651.1987454-4-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124060651.1987454-1-shubhamsanjay.patil@amd.com>
References: <20261124060651.1987454-1-shubhamsanjay.patil@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|PH7PR12MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: 8225b135-52d0-40b9-a453-08df49f16b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|18002099003|22082099003|261009223027099003|261021121427099003|261021123027099003|261026140227099003|261022105027099003|261102123227099003|261026121527099003|261022113327099003|261022075727099003|261028144727099003|56012099006|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: OzknpFi+rUZg9rQw5eraCz1c943lgpQiJPS3LuYodbJh4yCN74m9PUQ74KEk+HXJ/BTDTYG5JLjjzcaqe5b8wsUPH1I4+wwd56lOwwwJUMCYGTcSlNzC45zDLIuazUTPv+h731wmxI8odpfMFI8cjRE8fTkedULRC5DMGVt7715WXYnIv5sVFRYNToktrkAmPKPfRZIB6Rnwcml8P5xmzXkwY5PWqfyExxa82zEustl0kjxsiDnDmDzAm4lESnyhlyG5oWv8FO38CwhORHOB7wdGUP1Aj7dGu1ngOz5CxYd2hFmztKjwTPKS2R6Pk0JrIIYBH0boH5RqdVcNP7IywJBm5ZbZIaCbIj7nlSLEYdTJfvlvTHKIfLRNKOJUu6OL1MVugHedp+y7EA6t2a6IQNAjLK0x4ImTidppGCfnGUp7TnlqeG2kKS5B9AlT8QIxxR2tuh4Ery+6DUjx4E35TooK8dNKUeqbceBFgr0ALXtnxeQoUiDk+5VZ1/OPhh+uqbalXZQACKhiOhmCUrtX7OhFcMdNyEdmxfN1WgepBGRyIX5Fd6foX490OShx8+9tzGym53IkxXFQqjhS5BU+teHA6sxJNGr/xxcjx92gmTdN6QlFjTSJwkveNUmq1LIs14/tcSm6FFCRfN5OejIXd2oqAfDqpwwCkGq2lAUjv5sDeHX/EQfkn6X99znp9vvwObc+vDVUpnNTE16xshi1eQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261022105027099003)(261102123227099003)(261026121527099003)(261022113327099003)(261022075727099003)(261028144727099003)(56012099006)(10067099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +AEEq0kkBzVNXvvDMmL1ByoIggPseal/jNSoz3oZVFjp9+tGkNDDvoXdLfCFJ7Rp11yc/jpUVFlquUn1SoGPCkZ7q6czsqmIBrYlvp5/5OM5yDMoiPp2ic4G0PGlbI38frxx0E7CYOzRJDQ05hYyn/ZVMVY7bMt594P0rDfDeqjR5AFJ8K9EG8a4kI5tbQ+4+EU5X+JWga2mAu21tVC2nEEYFU0wPIx2P802fQaiGd69HDE72UjJkHrQeSNHcPlUI8uitUD4S3LNQVdKsJuzEmpzqU2xRNhOc9EMb9DCbsxCHOcKtQ6ZY3nPq97OjLcWsI951mYkRyCTnJ0gzRd9Se01egk6Sx68SFygY6TlMJqwtm5ytAbDixy9rG0H4R9KOZ7JuvO+JyQWh0dVOFxF/9tO58xFnmWzkulap0UKxhjAzasd3oLziSo9Uffg9ApQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:08:54.4624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8225b135-52d0-40b9-a453-08df49f16b41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6882
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_220903_651545_4922B94D 
X-CRM114-Status: GOOD (  14.24  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mctp_i3c_setup() takes the maximum read and write lengths straight from
GETMRL and GETMWL. Those describe the endpoint alone, so on a controller
with a smaller limit every read can be built too large and rejected.
Transmit packets can similarly reach the controller even when they are
larger than its transmit buffer. The receive path also allocates an skb
for data the hardware can never deliver.

Use i3c_device_get_max_read_xfer_bytes() and
i3c_device_get_max_write_xfer_bytes() instead, which return the smaller
of the endpoint and controller limits.

Behaviour is unchanged when neither reports a limit, as the helpers
return 0 exactly as the GETMRL and GETMWL fields do today.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
Changes in v3:
- Change the subject prefix to "net: mctp i3c:".
- No code changes.

 drivers/net/mctp/mctp-i3c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/mctp/mctp-i3c.c b/drivers/net/mctp/mctp-i3c.c
index 88d9e36cd4a2..6d08898e1d21 100644
--- a/drivers/net/mctp/mctp-i3c.c
+++ b/drivers/net/mctp/mctp-i3c.c
@@ -81,9 +81,9 @@ struct mctp_i3c_device {
 	bool have_mdb;
 	/* I3C dynamic address */
 	u8 addr;
-	/* Maximum read length */
+	/* Maximum read length, limited by the device MRL and the controller */
 	u16 mrl;
-	/* Maximum write length */
+	/* Maximum write length, limited by the device MWL and the controller */
 	u16 mwl;
 	/* Provisioned ID */
 	u64 pid;
@@ -214,8 +214,8 @@ static int mctp_i3c_setup(struct mctp_i3c_device *mi)
 	i3c_device_get_info(mi->i3c, &info);
 	mi->have_mdb = info.bcr & BIT(2);
 	mi->addr = info.dyn_addr;
-	mi->mwl = info.max_write_len;
-	mi->mrl = info.max_read_len;
+	mi->mwl = i3c_device_get_max_write_xfer_bytes(mi->i3c);
+	mi->mrl = i3c_device_get_max_read_xfer_bytes(mi->i3c);
 	mi->pid = info.pid;
 
 	rc = i3c_device_request_ibi(mi->i3c, &ibi);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
