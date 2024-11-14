Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B82D65C7C
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2024 11:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvRJat6XAnEy84JtDNnXQUd0kM/S+CRJaVjJSg++NCE=; b=b9zxnfPVknEn3T
	KqtlDvsaVy8W9V0jPPfPvrCNxsAMO0+sfkNnRGRLga9QpQPPoPVxi142xqTkPKMOZao6hItg82Nf5
	p1dRZ8hVwJ/Ez14mMvWpXOqXr4cAG368hgFdVrScwwQootBlGovbKXD42TLgaH05jjKYsmwbxLA6B
	Sm7UixPLRladcScj8w5AoFw8AKdZQaQ/eAAWyk08y8dT9afuNd5LdTWHYH06frobnus40xfTV4Pj9
	TPhIYxpqhQQA8uUz7cEYHnhv0sOfrOmUPw+K1Rj78tgiM6yNTHo2qCRdsB+Q/kWpldW+t5LqC2DBw
	3XvfjSgaY/NiedJGdIyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYIg-00000009mOA-2pTJ;
	Thu, 14 Nov 2024 11:46:14 +0000
Received: from mail-bn8nam11on20618.outbound.protection.outlook.com ([2a01:111:f403:2414::618] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXcz-00000009eGd-06Ik
	for linux-i3c@lists.infradead.org;
	Thu, 14 Nov 2024 11:03:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uX79M0IKOjwgb8CaiGTjBsYqr5Y9kT98eyDzCGShQ68Wn43/Rn65hvZyQzTNiwMhjtcXjBLuAnMKOnFcnJn5WVpGwHmkSkwaHIoi0kYKrYHZ5V14EcNngcFYUlIq0qX4Aynm6h2oWuhDOoOe3Wg6zEUeRfj/aQXYGkXmOVZOHcPzC3d5K6tZvVsjTepd1LqNUnnVdT2NdyApEBEvLm+wN4DV7gPd9ltZwxlFfa8gT6g8rb2veX8Up3kHuBJeb6mrTJjvHxMhLi52E1OeLemNBwoALNj5I62/EeppeqqT3HUmXK/44i7u5Z+jnLFqEkQlINmdZ8w+WCGeLJRv7xHYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKez0rYB87Sravy9nKEf4B2Ordj55ZWPAv2xNuP4urY=;
 b=l9lUxJj4Dzy46YBE1nxklaBKrfmtmS6cqgdK1Og2VsKxIhFnHJl4xZnSuVVdQiNZmdpgX0gfcSDFllnUDEjS+VMfkOVrGyc4I8ooJhhlMPgAJw8Z9HdeXKmHp1r0ysNp42AEbVxFe8dPZGwg+cPCc3t7Ge2iDvlyn5lD+W92+6hI0vVax3FjtJqlHQfRVRNZtZSwKof+5cXpTOvJ9LzUJ0bN+ICfAvTSus+Gzkm/QR+gAGyCnkvlywxLUWaHHOiwxPIg11iTXVGotPpf3i/oXhbRUQOGNE6SCSdOflCR61G+IYiWU2JZG86+vA7NGbaUvPssqnOmpH5XtaEwItlC4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKez0rYB87Sravy9nKEf4B2Ordj55ZWPAv2xNuP4urY=;
 b=OOJBcI6yhoE4otCJWBbfJAMHOJgUkpAJJy4TR4um19I5Nz6ZRqYPbn8/9gd6VSuBZFGghBxWaIrQ4naKj5fYHeUZWefj+Iecp/DbHgoxULgCAH1EJwqtKJmy1w/5x4ssLiwlB00hgS/BzF++gvBapfIov30NLQDdIafkTqs13nQ=
Received: from BLAPR03CA0001.namprd03.prod.outlook.com (2603:10b6:208:32b::6)
 by PH7PR12MB7986.namprd12.prod.outlook.com (2603:10b6:510:27d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Thu, 14 Nov
 2024 11:03:03 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::fa) by BLAPR03CA0001.outlook.office365.com
 (2603:10b6:208:32b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Thu, 14 Nov 2024 11:03:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 11:03:02 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 05:03:00 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/2] i3c: dw: Add support for AMDI0015 ACPI ID
Date: Thu, 14 Nov 2024 16:32:38 +0530
Message-ID: <20241114110239.660551-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114110239.660551-1-Shyam-sundar.S-k@amd.com>
References: <20241114110239.660551-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|PH7PR12MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf2a6c8-25b9-478f-ac4b-08dd049be897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RsoiaunjZK/RSG8aHKbTeZ2Vu1B6/8286n9WUIYGLNzbsyCcmpTdeWla7rxb?=
 =?us-ascii?Q?ZCy3h/l8QSs3JiIKLM1BZCv78F3ZqgjAD+mQa3dCg8gbrmh6qF2R9TavvzCT?=
 =?us-ascii?Q?KJxx9SMpHCgr5kd2bfvXqf6w5ov4ecOvwYC1M7Zg3yqu5qroIJwLz9PV9Nbz?=
 =?us-ascii?Q?VTJAlwou5uJG12lPg9XzYG1odfekoXosLa6AYWRV+pag4U4PbXqqj3Ha0u7K?=
 =?us-ascii?Q?4prAoScFqvaWsrjhcZpK+KWVYzcy1yJ712oDsaHDvEpVkTY0kLu7X5VKTv8j?=
 =?us-ascii?Q?goYGSg6Ouv60K0Ksc34zqW6twitfClRe0s36804CjeKk6a8KXHtLrfhZDBlP?=
 =?us-ascii?Q?k1mSHX5JPqK/esooYBdmmMPbm1rKBmdHjb82hC0RnqKEZEc82E1YSDyQePO4?=
 =?us-ascii?Q?e8vP7EJSEExGGaZ4XWQXgmP72DCxkVfbs+dSLMRJPGpmUgUh4jmfDsYbix/b?=
 =?us-ascii?Q?OKymq/0XVEp+X9ldFewjeFkDesgj57fz3n3j68f2M50lhqoyERtzQNJYK2Cj?=
 =?us-ascii?Q?MyA6PlwU0C5xbQguHBj3jtBXdh0mPwPYwoJhGlU6iTZBK+4Mi1sWnPMQs0BG?=
 =?us-ascii?Q?jEJt635bHkxH+EMYQb9/f3WJvMG9Jw71I2R7bVew5TOpQou/JmN7VMQ/ETpp?=
 =?us-ascii?Q?sETYfslOejd9OQ78MSIcUTJbnwBALYgZtljoCN5wZ5jd69OKIIsaAslDnsEl?=
 =?us-ascii?Q?wGJQWLiNHco5t6EqdfrKj07JnII+4e+xpRM8O5Svl7SS8e4EO2Sy/1VGY+nk?=
 =?us-ascii?Q?JiPnmQPUzBMvL/aLkzPJ6P0+QZqg8kMNbb07+ZONWvpek7f5vJrtLEgazs6K?=
 =?us-ascii?Q?Gll4abcv2v3M1a1ZdQztKqD7xdwLWXuIBaw9egKc4QXyX4YJNZfU9hayI3KX?=
 =?us-ascii?Q?ahZXWmiQvMI8Tatu+qdLuCQKsiFg+WVwCVhV9eUsUnEUuXhZlj8DPfSxaWPq?=
 =?us-ascii?Q?xkUvvNqb1arXY9JXLF8M6adyEFaiUZRwGiudxNUI0p27rEkpMYZvrBYb3qSs?=
 =?us-ascii?Q?jMNmPUsU+RmyeCV0bk5afH6q2gcH7arVZoyDzfTVCRuvwsQgRvZ0dOiOUrtc?=
 =?us-ascii?Q?QpeBoZxP0NTib0kkbGtD24kI5dQIFlVX6RwExi7eySc5mVZnSePHWtr3U+B4?=
 =?us-ascii?Q?f5iwvV09hfAymkwcp7kevsVP3c3ZWaa341g6nCWkBscIDGxfv9KsOnaYm5FX?=
 =?us-ascii?Q?0QXSorDfV162fbc80jDV0xRtv5XBEAybpFyiKP82+vE89lPp45VK2wYI2kN9?=
 =?us-ascii?Q?9IdSuL2U3kswZypNv6bOEpUDnOmySRKYM0+1wKOTVJGXeLdBWsxMljBOAG3/?=
 =?us-ascii?Q?qf2uLvCi0ygwhQPlLEcN6/ZB7k3k/aM3wEqaqvtjEAPSpnBdb79QwdC39rAf?=
 =?us-ascii?Q?MtG1d1kbNTRHiSDW3pV4Jf7ZMn9ejgC2t86wiz71z/OV4FhYSw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 11:03:02.4393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf2a6c8-25b9-478f-ac4b-08dd049be897
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7986
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_030309_197833_2A7E21AC 
X-CRM114-Status: GOOD (  12.09  )
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

Add AMDI0015 _HID for Designware I3C driver so that the dw-i3c-master
driver can be probed on AMD platforms.

Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/dw-i3c-master.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 8d694672c110..1a7c300b6d45 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1748,12 +1748,19 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
 
+static const struct acpi_device_id amd_i3c_device_match[] = {
+	{ "AMDI0015" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
+
 static struct platform_driver dw_i3c_driver = {
 	.probe = dw_i3c_probe,
 	.remove_new = dw_i3c_remove,
 	.driver = {
 		.name = "dw-i3c-master",
 		.of_match_table = dw_i3c_master_of_match,
+		.acpi_match_table = amd_i3c_device_match,
 		.pm = &dw_i3c_pm_ops,
 	},
 };
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
