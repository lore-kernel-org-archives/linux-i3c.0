Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9F3C1B087
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2025 22:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6hhNQ12YbNuoI5FiKUhi/bZG6A737euGo7ZPG64i2nw=; b=euWUfYr7FDNxi8
	jpqNmgN5TeMn3p26ipBb9BQey+E66owuR4JMTp60gLtnrRylMQ76XR/qOvIHkviqx771uzZck7+gJ
	0XpH+xDGvs+8XwSEjCAjb8z17h7A85DiwZWf3bsf4FEKhuKKOIGkO5eeJ32bJGtUUVZa6QiHL1vpD
	Kyvw0NVUkIjW7wb9wuSomdQeTfYkR02Ty8EbjjH4n/6hiEf0lXEJYBm1EcUPOZGByykUs+dv07ceM
	/UP1+AMGKpFmlPRkkB/4+LxccLAkUsKgC3ON7DDCmhWniD96BrVjaN7zNbRAv6RP0HrwGQyvPnV4Z
	1Ko3Sh7PKKAy4+vD4OpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnm6f-00000008yQx-01gY;
	Thu, 27 Feb 2025 22:11:49 +0000
Received: from mail-mw2nam12on2062d.outbound.protection.outlook.com ([2a01:111:f403:200a::62d] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmv8N-0000000HOqb-1txe
	for linux-i3c@lists.infradead.org;
	Tue, 25 Feb 2025 13:38:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3EhWaZm8onhZBEYtD4PcoEvPEcQLjtSpAFSB7VoBwOBBdbIerXVZ8/WvzXzUG9tMbn31NEX7LL9+kY/fV6zmMEpDXyzadU9TLm5/05j18sZQrKOI3GjhJGp98czaKRKYCP54UWzjP2vAWEutTKLrtg1vk8Y9D2D2DEJJsoozF03Ys72qC/RUqU6g+zEp/MusMIss405/XEvQGkg6l/iG2OTHiop0h4cmm8qIUdXPAK+au3x1VxvphGvxOfEdE2a5JeZukpIJq1l9F62rMv21f5g27U/rdu44eCQM6q02raGHNMJINM03RPBeX3WS0tR3F1TYjGLjDMex/Z52nCfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/60BFhklz65Ca2jcVhNQtMgRNApcO+5AKqMnud5ujk=;
 b=vCE/knLioyjF1c6VhMXmSKei0SkP8dygDtbnuigfv2g0P2+l9drOy0XBnuGnEn0z/T80+G3PY/WKJMrr5zib9fTGOY1xBR78We5DY9mYWwJwOrbo2rr6qUYa8kGm6P8qXV5njbaP91w/rIyo6OlMtR2Ca7qvojykzxdzd9EdJXS/G2xTJ6P8oAwDRAe4cvwQhkHF9wsQREZDWu5dPZXa9pLzkGzH6amsGhAZEh1rkzjRE5f+d1EnIhlPTjoztDlcPZJrG1S7WFP/KPp2750rBugGMfE3MJH8ml3Pmf6qoCBtTUHAORcZBg5T1J64RPB5NtKcxqQcZHTiNCnQ14n8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/60BFhklz65Ca2jcVhNQtMgRNApcO+5AKqMnud5ujk=;
 b=EXHxZaR2L8/WLvKH96v8TQuobWJqJJbYcAniLUI1LublzMZScvejO85zouomTabILsOuqa+pzspqKREI1lgi2njID1A4Q0S+ka1A2ZQDmAvq0wyb4sl/xCZreyxKU7nKJ/WN5x/6zpyFEh4+5xluW7bt/3I9JbAtiqSYk6l1Gpg=
Received: from SN7PR18CA0014.namprd18.prod.outlook.com (2603:10b6:806:f3::26)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 13:37:57 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:f3:cafe::3d) by SN7PR18CA0014.outlook.office365.com
 (2603:10b6:806:f3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Tue,
 25 Feb 2025 13:37:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Tue, 25 Feb 2025 13:37:56 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 07:37:52 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, "moderated list:I3C SUBSYSTEM"
	<linux-i3c@lists.infradead.org>
Subject: [PATCH] dt-bindings: i3c: dw: Add power-domains
Date: Tue, 25 Feb 2025 14:37:48 +0100
Message-ID: <fb8adcd318b1023ca6b90d294e46ae3b59dc1280.1740490666.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=691; i=michal.simek@amd.com; h=from:subject:message-id; bh=3IUrWQr/jI3fXddHP0WC5o6voDcF2dnKqw/6IrWjcBU=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhvS9x9eplXa9dd265+mzbzcdVKYe3vynZ8k3+a7lDT9Fe Nv5Uye97YhlYRBkYpAVU2SRtrlyZm/ljCnCFw/LwcxhZQIZwsDFKQATmXGWYa7Yi1Q9hz8JD37s Nwso+cVWtFZd0p9hnlVs5xzJUr7VBRzPZx08PHHuFNusdwA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: bcfb374b-ff44-457d-848f-08dd55a19c9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uu5PajTlt44rufW1pvwrPnSphFUUAIvMU34i6JG5qVvew8NpM2ZS3+IOsPCJ?=
 =?us-ascii?Q?ArtIJIA4WyXp5/JhqmOH8aiI987UUxEgfC3RAnEhn6YjIGGb5GDKsFn6LK+c?=
 =?us-ascii?Q?nvzIKsomolCdEuw6whKRcJIjC1Ee2/kXzikP2WVewPKbhgLOEi/2vIyoqJZS?=
 =?us-ascii?Q?3L/FnkC9k/5DfI44eV2BudzMhhJ92cZgiJNQLNYj6Ig57C9FW8d9DwW3jg3X?=
 =?us-ascii?Q?kxrHFQ/ZvZwdUrczccuqkD/zjhVdc8DLq2zLK4grFYI5amezBejQshfh8Zj1?=
 =?us-ascii?Q?O8Zv415uzLpfPIXhe1qecTnwPATgrSbAHxNgGPtVx0BF8v6ITEVipS5bboyV?=
 =?us-ascii?Q?GvGpyp/u1yq7op2yujsTnTtYKWMSEOITjV4MqqFyBd1q6gEamvfycyfV3BYm?=
 =?us-ascii?Q?Yo2RP6mPvF+s97iZF/T2xLQZXC1CDcrA1TfYDx7SCYlSLcbJ4iT4hhTiTwI0?=
 =?us-ascii?Q?vCaxhUVr30SIKotkuWT9N4o/k0xmeMJDbw811NHj3GtJxUTDjz/i3z0lqoAZ?=
 =?us-ascii?Q?cP5hdPtNsvtoyaU0V/uagepFLh94cbGFARmLNkcU1Q+924hFsF1N9Cm+UNJ1?=
 =?us-ascii?Q?etOlWoL6dz4aoCDfiKBn7YWTV3KCHyaZopUer0WcqzTJmwf0Cq6CqMA3D68l?=
 =?us-ascii?Q?I4AWNpPD9ljR4BRhxb+BOiATBnyKBm+OuNvu9QDGsC3chdQCgTWbgL7Ptvbl?=
 =?us-ascii?Q?3LImUJCmtbgIH4Z560/a0mz3eJuOKBP7CMGYGHvlov0WeUU0zjt24L1CRpmV?=
 =?us-ascii?Q?xCveKk3ynOsoe5ArLi+tq+Zm30rx0Lz6ZFdMmDzdTF8xJMbJHGa1Fhez5BBm?=
 =?us-ascii?Q?xfU9l/XIIJMPIQR6sJJuTbzqmGntl//9bESzoNhJaG2GvZPzuxJxnPENlfnr?=
 =?us-ascii?Q?eMunsVfIJXkitv98egYl9kN/WzilQnEsSMss7JwVcI05aRl5a8gQvOqRhuuF?=
 =?us-ascii?Q?ljJtIR7JISy2dxMNcLdQnhCnFDBbMTn5Hl88XvthYIrC+mNiWpQIqJ5Jiwvz?=
 =?us-ascii?Q?Z10Pl5sLSzm2YElmFuacubLsyRisDWVKhYetHfOPs9NgXMgfVgVqjUqeSNOJ?=
 =?us-ascii?Q?PFpOz9sZifB3AawFfBhhlYoXcXlPR2Vl0nqJGRK96qfmhHzPj/6h1B4R1kmx?=
 =?us-ascii?Q?/QOX/CRyDLi2IDfoTXu+oiH+jbNPharvEHkn37/qrae2H2JLYFVobQ1gUPzM?=
 =?us-ascii?Q?q2uuCqSNMyYZrXJOYBRtfBQJldzJ7mh+JoBQHSS6HWYH2xl90KGLB6VgamVX?=
 =?us-ascii?Q?JBv9Pvg7GApokaX6mDen8jZj91wwpLi2x7Nr1JnAzFXF+LSgzw7CDf6sAc/+?=
 =?us-ascii?Q?uvLO2MAL8qbNXAyb2Uh05OkbSWYGVRwaPtWDZiXfAZgBYAADDhdyyz+87Kgd?=
 =?us-ascii?Q?iKD+lSebCSpcqaZKbCfxf53FDwqdWQ0lyx0U/Uv3GMFzRuX/vUREatHx102b?=
 =?us-ascii?Q?opMupjeA3cqw8MQIC0VYqhUp8jlE1CokYpeG78eM1gY7OJLTFLfTKg7TlySa?=
 =?us-ascii?Q?ql5klvl0f17FG04=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 13:37:56.1205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfb374b-ff44-457d-848f-08dd55a19c9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_053803_535185_BA6F8BEB 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 27 Feb 2025 14:11:47 -0800
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

Describe optional power-domains property.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index 4fc13e3c0f75..5f6467375811 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -34,6 +34,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
