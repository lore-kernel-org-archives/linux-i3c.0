Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5FEC47089
	for <linux-i3c@archiver.kernel.org>; Mon,  5 Dec 2022 23:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XzPAAY3g5NyJg1o27JhQLS9emqhN1sWtU2OQAeBlcLU=; b=nnnxBRED4WPiTA
	apWRW5AqXCWBtdYYdFgyS+KldYC+/cDLPEvCTfYy6rHFa7EVJ/NqltSBSpxDargGlQFJLhUpLbyZQ
	oncm/56me+j1XkAs8ZRq7ksprQTys5sA2D1irTA7Wspz6Kp+TSmpVhUyqSslwNfngx828H8GTeYO3
	B/sApI6AMkuYUVxe7I8UFdLtRFXkiO3X3cMxNMwUrdClV5vbnFLnlQvarPjnTxsjdDXrR4l2mair+
	f8W2o1byjJdwKRU0986fesM0v3f1y8czlTem0U4+dQ35SSU66ljJC3BL3rBMrpCYIj4iGspM7OjoH
	Igx6wsrFvAsX8oLgmvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Kh4-00Bz7t-15; Mon, 05 Dec 2022 23:16:14 +0000
Received: from mail-dm6nam12on2060c.outbound.protection.outlook.com ([2a01:111:f400:fe59::60c] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p297M-001IAC-V7
	for linux-i3c@lists.infradead.org; Mon, 05 Dec 2022 10:54:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3iiqocOncFbH4yYkFRmHQtdhJFEW6N5MX8d2Iamwn9DYRP61r6uJl1M8IoPI5lTwRvtZ6tvJ31EmWpbZctlqjwmTq5pAOs252ASoEj18OOTafsUPTbtTivlUOxNMOMd2O1vhWSHbJjip+u/ChldXYY+qZfVaM0IS2kVyg4Y6a2mjELjvu7VXSrHwPraRjSkHf+NjrSyuMOaSuVX5DOBPpthdsXu0d6eQ2xJZG8UqEMseQuGcZeEGgbImWBSOdVgaZ68NSEFbn3uufyrWE7ajPTFFyTfk+RroTdqrgGCbFG9/g1albh5qnM1RYL4ZC51joHUSYZ21vm0zmSK2PkXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GkIRKYtBUi1XSOGmh2wwAycFw1LhTdG5ETce4c0W0c=;
 b=X+SOaRDGY+qiwdlacQ8Sn73SS/CF0UUOtDbH/tOzgtX79r0yusL7tuZt7FxSyaXsHwFPcWQHNcUGN+wH5U+1AyXi7nCsjmDXhTPoYdsLEGbu3thGv5sGs5hpT3DnHr2lo0NwhhrFkvmexKaWP6vVDI8hArU6drYxGv+RSjQkDHT8MetO0/HiwHDFJeeHlnu303HmwnbCVahdbime0M0+7ofo7LAa4rIllDNqr1QWYC3LmGFoQvohk0uhNhQCy0/SkMZZ4ta+sZ3/5Cn02W5olaZvQ/gSJwdJHq1GJSi76CUOCaTp7yfTjX+7GhHjTKP8JipGSdrR/J2280gwSFryLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GkIRKYtBUi1XSOGmh2wwAycFw1LhTdG5ETce4c0W0c=;
 b=4YqlBNUYDKm2oh1pETA9JlGGWSUlooqTaNmvLGHrh/Ju0eBZgEbfxz7Ca2FrCyubI4bYvQ5StKYmArpHKwyrVkcjMnqrzHy4wHgvCjUoyDN46v9HvzhaERGecWOQgF9MYVn2u/DaHJ2pnoXoTrlRl5YdTwFMyUNPy36bVrkQlFc=
Received: from DM6PR21CA0023.namprd21.prod.outlook.com (2603:10b6:5:174::33)
 by SJ2PR12MB8034.namprd12.prod.outlook.com (2603:10b6:a03:4c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Mon, 5 Dec
 2022 10:54:30 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::26) by DM6PR21CA0023.outlook.office365.com
 (2603:10b6:5:174::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.4 via Frontend
 Transport; Mon, 5 Dec 2022 10:54:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.14 via Frontend Transport; Mon, 5 Dec 2022 10:54:30 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 04:54:27 -0600
From: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
To: <linux-i3c@lists.infradead.org>, <alexandre.belloni@bootlin.com>
CC: <linux-kernel@vger.kernel.org>, <boris.brezillon@collabora.com>, "Naveen
 Krishna Chatradhi" <nchatrad@amd.com>, Akshay Gupta <Akshay.Gupta@amd.com>
Subject: [PATCH] i3c: Correct the macro module_i3c_i2c_driver
Date: Mon, 5 Dec 2022 10:54:13 +0000
Message-ID: <20221205105413.937704-1-naveenkrishna.chatradhi@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT033:EE_|SJ2PR12MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: ac72c8c1-d869-46ae-3c08-08dad6af15e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	OUsxMlssuP+yoUGKbVWQbLEOpQu5vPpsPE8ydoCwUraguSb8Vbo/N1Qk39Zww5JXqXU4+/JXjZpYGcojE8TlGgmOPBGgs9Rz5rAXx3Sr5fX1Bh8Z3GGmJ9RyCZp9uTfHyf8zcwk2reHL939VLj5Zv0CqvwlvF/tiK7jOavULk/8k+pF86XoyTGrlyW6MykIg/dAQcuadtij9L9vt0njgSzWrboUBZ/B3degN+AgDecJkfQziBPAHB3XSVRnNicLxBdh+2ypUoQTpMZ80s+TbKyBm+rGEHFFAivIl0os/cRpEc6Xg5I6B6vP7909+ZrA7WjBejVifFlHp0iYtspkfNcVDoycOzDfngVBtpcbsAhqH2XPO/Ns/UG7kUzWuepvBkcXBZmTDmGTLfpwhpXvCzOp2G4S/mHcqb4rP/rLCMPJWtjqvIjjwC92oX1i6I8zkOLWUkWLSBz6Mq/ahkuWB90/FpV53m7KLqnrBiUL702M7EJ6OOc8fp/hSmTX5Xxua2EG6fYfHnQpvovvbplD8DHvUaW8T5vk+kQDj5lfG7vXc+5AXMVtDI4GjRV7f31y3HyNucRhxPoYPBGQQJBBHpaIPRr08mC4YLuorArLzYXOukdwL1wu30vNK9JEU5HrqKjlVgLd1xAvwARnIe1Znn78ukuD/LWYpFyXNoppyxNyaYmbfQr+cChVehoW8Ro2jylnSuvuYkGceTXMmVIDHZP0mTx8sw6OTexFP7FOlu5n4alWX+xXPAa/8fncoNkFd6JbC82llNFUUHeK6+FM2zw==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(186003)(26005)(7696005)(8676002)(478600001)(6666004)(47076005)(426003)(1076003)(41300700001)(5660300002)(8936002)(336012)(2616005)(4326008)(2906002)(36860700001)(70586007)(83380400001)(16526019)(81166007)(82740400003)(36756003)(40460700003)(70206006)(356005)(316002)(82310400005)(110136005)(86362001)(54906003)(40480700001)(70780200001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 10:54:30.0334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac72c8c1-d869-46ae-3c08-08dad6af15e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_025437_236117_922C0457 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 05 Dec 2022 15:16:13 -0800
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

From: Naveen Krishna Chatradhi <nchatrad@amd.com>

Present definition for module_i3c_i2c_driver uses only the
1st argument i.e., struct i3c_driver.
Irrespective of CONFIG_I3C being enabled/disabled,
struct i2c_driver is never passed to module_driver()

Passing struct i2c_driver as the 4th argument works.

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 include/linux/i3c/device.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 8242e13e7b0b..419192b5cc4d 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -287,7 +287,8 @@ static inline void i3c_i2c_driver_unregister(struct i3c_driver *i3cdrv,
 #define module_i3c_i2c_driver(__i3cdrv, __i2cdrv)	\
 	module_driver(__i3cdrv,				\
 		      i3c_i2c_driver_register,		\
-		      i3c_i2c_driver_unregister)
+		      i3c_i2c_driver_unregister,	\
+		      __i2cdrv)
 
 int i3c_device_do_priv_xfers(struct i3c_device *dev,
 			     struct i3c_priv_xfer *xfers,
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
