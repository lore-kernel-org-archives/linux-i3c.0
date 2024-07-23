Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E31FC49EA1
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jul 2024 23:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=riB59gjQWqo/XSbdtAp/8LC8JeGnnlAaPVDfNvGnnEY=; b=F5VyBKM6M3QVET
	tKVpyELEbirQyNMbqzrdPBWbyZas1qD6pVp68hpiriiWlAGjtlvkDntgjBgg7eplmZUd2LNru2EYS
	YVl+KIWdYbUiznd910Fk6uLs3JX58k4GaO7FwsqiEPxxlVJcCDqNbvUGaHt1wpetHMoQOKo4s59T+
	eetK7TbyelLTDonZLvBZUD+RPXD6vdD9CkxegTONh3qPP9jdoWRWRs/eM/aLUuaeTzErP3/AuPILF
	8DeMgXTAxvSD/6NSSY8ruyN0CRBANepNWWEp+MBohZip0b10ZKN3fhYAHIEviTc8pLGkhuJwx+LiW
	Y2jkgP7pD8s3CWUNXbVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWPDd-0000000Dp0i-3lsN;
	Tue, 23 Jul 2024 23:46:57 +0000
Received: from mail-bn8nam11on20618.outbound.protection.outlook.com ([2a01:111:f403:2414::618] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWJRA-0000000D8i3-2YUv
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jul 2024 17:36:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nw+tU1o6pFir7OK1tDQVtiG0MZ0GKSi+J7wCTq4/Lb97QPCuTwfcEKHgUzdY8S356zJUGnM/Sao2X6dBOyH2hVAc6mVw4U71FzNtKuDjqkzNcP28T1XwDAz0c2DdVMbCtAfRti8P2+H5W2FCCRywFubGQrDOwcUlZHfmTlzIAu12f0/jyeA12MQlXUdacTWS1SJiXmh2Rn09AfoD5HDtrz5mWoUYTxPUZhWz3BAShjZmV1DpaCUSQdWnV64IjHSxYE/79drG7g+rt8LdNBN7hAZnkxSGVEIZWGd+HwikecWhQYPFy0bPedWzalHL5iWd/V6UQuJ4Y6dZMR5TR02plQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaiWfxwrVVegUP28PVwsewnIbKV5Ajon6azAXqQupMs=;
 b=fQR3tH41CnN/gHHv4khjuGBGQP4IwmWN8Ct5rgPKCOgpSRWlKPo7Qyx+wjmYKEXlFl0lxvqpNiPegwXIKk/RnVDfd4V/cKf7vhKqzHIkujmEpCHUTWIO0wEH0X4DDGbtmn6URNvFnJrDylk33ExH77uZi07tyiNgmK1S1CbGSI4phyu8WoLm9YVc87YqR6gvn8rPW8bHo5mN3Bmyvwmo29eMhbmit+m10hmqGlQaMFyRsYFXnaXqYm41dA3thtfIJHYZtR6Zav9xWjcpP1EPQlQM5ZsTxRhSqN2UFUfiCfIg7hWuqR08mDKoVcy+vWzd5PZXOBvPoAyiyPcVOhxZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaiWfxwrVVegUP28PVwsewnIbKV5Ajon6azAXqQupMs=;
 b=fyB/k90QV9dGPd5LBhcb+aBX2of7lP6iq4xlg6DyQ0REQ4WKQ4406bqD1xPfLYXhKaKq+oUgqUwJbiUQHCCGY1lNO2puMAr3wrEpG0THI3SVQyvhnpiccEzOoN71VAdBbXP+n8U2LR1Oyc/aOa1pHaC3tqNW3E5rtQUmVFAA/cU=
Received: from BN9PR03CA0457.namprd03.prod.outlook.com (2603:10b6:408:139::12)
 by SA3PR12MB9107.namprd12.prod.outlook.com (2603:10b6:806:381::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 17:36:24 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:139:cafe::43) by BN9PR03CA0457.outlook.office365.com
 (2603:10b6:408:139::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14 via Frontend
 Transport; Tue, 23 Jul 2024 17:36:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 17:36:24 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 12:36:21 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 5/5] i3c: mipi-i3c-hci: Add a quirk to set Response buffer threshold
Date: Tue, 23 Jul 2024 23:05:38 +0530
Message-ID: <20240723173538.3493935-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723173538.3493935-1-Shyam-sundar.S-k@amd.com>
References: <20240723173538.3493935-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|SA3PR12MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d264888-4d9e-4d22-d84d-08dcab3df92b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Is7IKAUb/mBPBxXBBMjTtoVZKZ2QT0h/6hUvz15pGsXfBbWCPgARXVtwLfkv?=
 =?us-ascii?Q?XPWj/X9jCF9Ei+rbMJJuza9aFkoaEsH2v7brlRN6xKKC4ubV7mQF3YlIKaGw?=
 =?us-ascii?Q?K2EZLVYSu8rYK7zWTxbC38rw8js9DX1W6PwwlPhj3PuhSl+hp+qo2UFBw6DR?=
 =?us-ascii?Q?wEYX4HCPhL3IY6uJF3AzKgwppUyk0DbNhu6NurUW17EHyKsEAlfVz9G87snQ?=
 =?us-ascii?Q?hTPRQIJaVrKhY6HKQ6nifYrW4jhhrdS0E5sCiTVTdnAuhDsglsGcJpP8h0Li?=
 =?us-ascii?Q?SyNvS7CS3MfWAD1jmkkiZbrPSfR+ghpQqbxymGsHhFa502YOvF10leaGWCPu?=
 =?us-ascii?Q?S25cuKCZp53qD1ftQN4vvPS6dpr/EObRtAwDEf3dDef7uLYx6/S4GjP76K3u?=
 =?us-ascii?Q?PvsvBchhQ6Tn7vhnIj+Tu2HzKyaaA5soLhRINF6U22KwBu7YmVwDp4FLI5ma?=
 =?us-ascii?Q?u30/kCksHqJAiR/mPlnBkQ+PZfDn20QXTfd2mk6p8pcmQpyxdZ8p2s04pxtb?=
 =?us-ascii?Q?QTNhMfC0lfmjn5f0yFYl+W3quYw4a+/vU7cmVXtt/riQC6QcSpND7Ki7ggS2?=
 =?us-ascii?Q?QFKTqml9YqsMvfG4Vgc7LIT5mg94fPbH/rhQhm3u4D6QFsVmlm6rR1BxMvQ1?=
 =?us-ascii?Q?ouygDAjL4ZfdJu9HJMMt4nJGnlxKu4/1G3r1HUJ6DWjCqsY0jPvWTYzYKGeN?=
 =?us-ascii?Q?0OMkHJBGOPNXYS+zO0tnTR1Ccmwy2FOMUwghZe+KBfU6FRXibPId8aJONpn+?=
 =?us-ascii?Q?Qe5HuiInsI8FXZDO4heTYSq0K8HC8uOZpgAKTh4H1wr27AuXtFGXdVu2AdQl?=
 =?us-ascii?Q?iMeWqGM5DR2z4QdFEpCHk6wPxvhI6e9zYb63ArFvLSfoC7CyHYliobFtWuM2?=
 =?us-ascii?Q?yJOgYcSb96IyypqRrT2DU4t75gdRcTuMyVTDend+vISsesrjkqjg2z2aBIGe?=
 =?us-ascii?Q?3SaO31w6Ybgh6BMV5Aps42LuVXJkcRQsZPDwMWH1aXAC3p0tAiCspN5OgR05?=
 =?us-ascii?Q?EcXNbqCCoiRonzOrzr/GUtXfJ9OKP9pxetCtnIE5pkWdNoI713Whs+Ng9nfH?=
 =?us-ascii?Q?g5OTmq70+HgtfQe986bXPa4qvaBEK5pN4g5pQ+/g7hUjQg2hue/MU9Ix9ror?=
 =?us-ascii?Q?nsthS7q+uHRHtEmaFs/3t9Twp4OUppmmnnrZZGScLHmbhJJC7KRXg6kWXWfA?=
 =?us-ascii?Q?0yJ1El2M25czoTgPXFAXCbp3qzGPQK84uW2G12utiyRts0eZe5NN9o59QZMR?=
 =?us-ascii?Q?0mbgD9AAqxNXBoko6vPaj31h0zJuO/jZi2HtdiOZnQZfA7s7afL2nbIZjeD2?=
 =?us-ascii?Q?GhN3+tXzlhz2eio1bAc8JGHKTo2jyTVaqqNJh/jRn85FbzhDN0/ykaNP1uNp?=
 =?us-ascii?Q?+7+GpssXvjSahrpEFdNDy8oORlTvRXaxUvWfq1w8l+ohGv8xa79lBZ7pbvET?=
 =?us-ascii?Q?UVSykGu2eEk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 17:36:24.0741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d264888-4d9e-4d22-d84d-08dcab3df92b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_103632_676357_2583CFC3 
X-CRM114-Status: GOOD (  14.05  )
X-Mailman-Approved-At: Tue, 23 Jul 2024 16:46:54 -0700
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

The current driver sets the response buffer threshold value to 1
(N+1, 2 DWORDS) in the QUEUE THRESHOLD register. However, the AMD
I3C controller only generates interrupts when the response buffer
threshold value is set to 0 (1 DWORD).

Therefore, a quirk is added to set the response buffer threshold value
to 0.

Co-developed-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
Signed-off-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c       |  4 ++++
 drivers/i3c/master/mipi-i3c-hci/hci.h        |  2 ++
 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 12 ++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 9fc142ca7532..2da00a5b590b 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -148,6 +148,10 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
 	if (ret)
 		return ret;
 
+	/* Set RESP_BUF_THLD to 0(n) to get 1(n+1) response */
+	if (hci->quirks & HCI_QUIRK_AMD_RESP_BUF_THLD)
+		amd_set_resp_buf_thld(hci);
+
 	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
 	DBG("HC_CONTROL = %#x", reg_read(HC_CONTROL));
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index f4ec6dcb2ecf..07b90a68ec5e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -141,6 +141,7 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
 #define HCI_QUIRK_AMD_PIO_MODE		BIT(2)  /* Set PIO mode for AMD platforms */
 #define HCI_QUIRK_AMD_OD_PP_TIMING	BIT(3)	/* Set OD and PP timings for AMD platforms */
+#define HCI_QUIRK_AMD_RESP_BUF_THLD	BIT(4)	/* Set resp buf thld to 0 for AMD platforms */
 
 
 /* global functions */
@@ -150,5 +151,6 @@ void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
 
 void amd_i3c_hci_quirks_init(struct i3c_hci *hci);
 void amd_set_od_pp_timing(struct i3c_hci *hci);
+void amd_set_resp_buf_thld(struct i3c_hci *hci);
 
 #endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
index 9d8c5eedc8cc..503c81c504f1 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
+++ b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
@@ -20,11 +20,14 @@
 #define AMD_SCL_I3C_OD_TIMING		0x00cf00cf
 #define AMD_SCL_I3C_PP_TIMING		0x00160016
 
+#define QUEUE_THLD_CTRL			0xD0
+
 void amd_i3c_hci_quirks_init(struct i3c_hci *hci)
 {
 	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD) {
 		hci->quirks |= HCI_QUIRK_AMD_PIO_MODE;
 		hci->quirks |= HCI_QUIRK_AMD_OD_PP_TIMING;
+		hci->quirks |= HCI_QUIRK_AMD_RESP_BUF_THLD;
 	}
 }
 
@@ -39,3 +42,12 @@ void amd_set_od_pp_timing(struct i3c_hci *hci)
 	data |= W0_MASK(18, 16);
 	reg_write(HCI_SDA_HOLD_SWITCH_DLY_TIMING, data);
 }
+
+void amd_set_resp_buf_thld(struct i3c_hci *hci)
+{
+	u32 data;
+
+	data = reg_read(QUEUE_THLD_CTRL);
+	data = data & ~W0_MASK(15, 8);
+	reg_write(QUEUE_THLD_CTRL, data);
+}
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
