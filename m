Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5B2606A32D
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Nov 2026 06:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MA8K3Lbg;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LoWzMrjd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nAtwhTQlWMrcAMpinT/EIQ1g79Eypi4hF38yDBrUwB0=; b=MA8K3Lbg9cC93/VA6ChhGtwHkN
	H2uZhdeXFHzCBQdOkvMPTg6A1bx9pbhaePppSbtVtYZAXhOazOOID909XCdb10cQI0c7CHes1L8BZ
	uvvLdBUf17Q1oQuN5wy4RJmNrxH7cNB1guW8E+3s05z0sq3R2BGYn4tI2+e/qs1lzVrubjlpJ1d46
	QxXKn2eh5ltcaMBO+KUHOJ3gwCu50gyX0uJ6uVnUGhz3TSkX1FG+RECNVYS7+Pz/QjxMVIKEeasVc
	Ua3XrinI/Y5BqEHcwTrodTtYEgPFUc+5mP9KKl5fRMKT13LkORyjmeOwzPmMgEZ3u5y1ahvUbJ0bL
	vzOOKXfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjiE-00000005dVR-3XpQ;
	Tue, 24 Nov 2026 06:09:06 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVjiB-00000005dUT-1syN
	for linux-i3c@lists.infradead.org;
	Tue, 24 Nov 2026 06:09:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcgLG2mPiBu7a20vyyhpUECVGimjpZ63LXuYVYnjOzsWCOwwu6QQZp4UGBaiv8+klGArllsv3NqrqQ3pdg9vobyBGUJdWrDcUrn5beyXIpg9JlS1hX/W52FC900+Q34SpNv6Q6YPWVQDAOIVOtU0PKgX5qofMGV5Ax/GHsXKlnT27uJ3vKM8xWdUtx0wltxHHDw2ACX9bGp/gmdPxGr65VtgJ9o9P3/KvVXbv1eyZaVXo/aBLmVZtrlfvGiJy849yXGwNpeH7+HADID6RPQm/lCBacdED0YkU00ZZpPXGM+Suey2xXQfVApQKUTXIRA3UaeqFrVme4H0Wco6GFVn0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvysTtCD/3LgyyuIumxSbtcjvrxRJQCrzFZgbiqhVQk=;
 b=Fh3RaCNCPbZP7gyWeYqgoEAIDIuU1hBhUnqCrXhVO4SK6d2vYOfQlpzjF3dv70XAujwg8Xs9fs2B4eI7ElTPhBLd85GA38NJCmWsqkKps5vts63a4R5aw159CZWty2QBVlf7yq0PTLy26hd3JO3HgoTa/wLl0fLWoT8RiMDoXOuZeZvNiJuwiQ9aOqyyasgKDOCpgd8VgtXX3m9/YWYbxZQeLmPu5a3LXLgWpKp7OgYCz94I7ok0vPoWvq+WEoI8QFVGdDTw6oYc6dk5gYOz6q3VMVMiie6f2yf1o7xtijFjx/bAPjWHNPbB7AONWCLS9GpI/mL0zID+m7ecQ7cVGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvysTtCD/3LgyyuIumxSbtcjvrxRJQCrzFZgbiqhVQk=;
 b=LoWzMrjdE9hyOXX6pE4NQ2jBhOMoN7Lcr/2Cv8e8St0e89XEhruStEjM0nQFdpXeKh/8Nz6weyNi0DEqb3VdTyyubTOYhcVmA34ZOG4BaHwVp064i3kSFcqsdJT0aClq+ZikfO8Waz1glg3hHeJ+lB/VroK6rXUMVzMjK5ygp3U=
Received: from BY3PR10CA0023.namprd10.prod.outlook.com (2603:10b6:a03:255::28)
 by LV0PR12MB338367.namprd12.prod.outlook.com (2603:10b6:408:3ed::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 06:08:56 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:255:cafe::4e) by BY3PR10CA0023.outlook.office365.com
 (2603:10b6:a03:255::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 06:08:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 06:08:54 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 00:08:44 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 00:07:06 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 00:07:03 -0600
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>
CC: Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston
	<matt@codeconstruct.com.au>, <linux-i3c@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<meaganlloyd@linux.microsoft.com>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v3 0/3] i3c: account for controller transfer limits
Date: Tue, 24 Nov 2026 11:36:48 +0530
Message-ID: <20261124060651.1987454-1-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|LV0PR12MB338367:EE_
X-MS-Office365-Filtering-Correlation-Id: 10dc3bed-d9eb-4b56-7093-08df49f16b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|6133799003|18002099003|11063799006|261021135927099003|56012099006|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003|261022115727099003|261021130227099003|261009221227099003|261009223327099003|261021123027099003|261009220027099003|261009221727099003|261026130827099003|261009223027099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: ZUgNM9vOR8wKR+8IJmfIrbcd/1SAqlH+1lRF/jxZ0lOujLW/ROyvIeH+Q1WSWfTeXx2976JNFe0JFEb7IYSP8VtQ2O2gBFFbcZISSiyPGvqiXDfmBtwqUgP1NgXcHxoKyoh5xGuFV+3i+Lo6jG9Z9bcULRRngSg/6lc30uvMdyIM2fPu3bCX20rw0Tm76rloVb/n2wB8tzp6NIaKZYIlDHUd51efhqmBrAxs/z6LVD+O22KpTfaMfiq/GlkfAlAiZ85phGCaH8Xl0LMJIpSCZfcIgRPTsmnENgN1Z+0quM32hkHV6FhdnyK3oeri5YKYxNEyFT4C9JVl89vng29A7pY1/EP/aVINCH/0QeWZwsv2McG85Gf+SzS/G/14gM6IbjB2bHgNGVMheLdxjPdk/Hok2/bffo9nFmF/UqBTDEFqVyKRABMEDB490egM69f1Ha8qVsoelx8Zt59S4YFMZ60TqOo9nQIde5nEI68Fqu24GLgKvC+7PcKSxzqNCJTfzbdDnyjPma15GJqR2HSMHnDZ8C4wgl+M8wuCFF2cWueZbSTynik6zOyi2lFWDzdFIC1+LmDuBi5tUTtPXc8aQOeF1YVzzLouKQf/9ZdlZDYUiX+q6XTTMZEG2h6QyjGUkeh0vOG4zSirO4FVr4lqnQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(6133799003)(18002099003)(11063799006)(261021135927099003)(56012099006)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(261022115727099003)(261021130227099003)(261009221227099003)(261009223327099003)(261021123027099003)(261009220027099003)(261009221727099003)(261026130827099003)(261009223027099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HVYiIDsFS7mBp2mKbX00dksXW0RrDnsTgZjQ0IWWbAMukkiuJJEyM1nN8efikLD/FvMm8pxwuxXNBqj73+XN9HwrcTQAwcQLDF60AHPrQlnzX2GsT9naePWAQ5yuWRdgOrPEjxTx66iyFVhodbXOZanzXQrL3t4VMCmf5GMZ7fR69n225bvkSEO25pzZAurXcZL+yK+Es9qASIiUx0GaFe/vmp3a9mSxJBAOEXryB0qei66P8/CL1WzhBOcZ4/6a0+jY1rRF017sMiH73dYiCXPoDVLySy67Kt2UzDR4cQFYA5mISkymaAGzB/rrO8rClGVw7hba7AHJtPuMuCsSC7zwCxWenTlX0nhNfDMSjQyiRjqCDkcDxdkb98WjS9mJk3uPbzjUSAq9HknNIf/UkbnPpEIpJtm6eeZAZhjPTLVQGzgMyx/ucGXe6xBOUcM1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:08:54.6432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10dc3bed-d9eb-4b56-7093-08df49f16b66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB338367
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_220903_651594_76988552 
X-CRM114-Status: GOOD (  10.64  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Targets advertise MRL and MWL, but these values do not account for smaller controller transmit and receive buffers. This can cause client drivers such as mctp-i3c to request transfers that the controller must reject.

Add controller transfer limits to the I3C core, publish the independent DesignWare transmit and receive buffer depths, and make mctp-i3c use the effective target/controller limits.

 Changes in v3:
  - Rename controller limit fields to max_tx_bytes/max_rx_bytes.
  - Use FIELD_GET() and a u32 variable for the RX capability register.
  - Use sizeof(u32) to convert FIFO depths to bytes.
  - Add the DesignWare databook reference for RX_BUF_SIZE.
  - Shorten patch 1's commit message and update patch 3's subject prefix.

Link to v2:
https://lore.kernel.org/all/20261105085425.3418230-1-shubhamsanjay.patil@amd.com/

Changes in v2:
- Rework the solution to preserve the target-reported MRL and MWL instead
  of sending SETMRL/SETMWL and rewriting the GETMRL/GETMWL responses.
- Add I3C core fields and helper APIs that combine target and controller
  transfer limits.
- Track the DesignWare transmit and receive buffer depths separately.
- Add an mctp-i3c patch that uses the effective transfer limits.
- Drop the unrelated IBI payload-length clamping from this series.
- Split the original DesignWare-only patch into three patches.

Link to v1:
https://lore.kernel.org/all/20260908102724.3232660-1-shubhamsanjay.patil@amd.com/

Shubham Patil (3):
  i3c: Add helpers to get the maximum transfer size for a device
  i3c: dw: Track the transmit and receive buffer depths separately
  net: mctp i3c: clamp transfer lengths to the controller limits

 drivers/i3c/device.c               | 49 ++++++++++++++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c | 24 ++++++++++-----
 drivers/i3c/master/dw-i3c-master.h |  3 +-
 drivers/net/mctp/mctp-i3c.c        |  8 ++---
 include/linux/i3c/device.h         |  3 ++
 include/linux/i3c/master.h         | 13 ++++++--
 6 files changed, 85 insertions(+), 15 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
