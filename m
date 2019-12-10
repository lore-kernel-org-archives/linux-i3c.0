Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7005CC2D0C4
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 10:15:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44A7D2077B
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 10:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xabr4kNn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="sGXhH7/L";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="VxLIdOTV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44A7D2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNOf+rDzlX2Rk4TTfs9APwfs8M/96/EYN3Q8JJ7KFa0=; b=Xabr4kNnSWp4Kn
	DWZ9s8KmmhWKT5YVneZOksEepnaQb6yV4rUhlziEdJi3ILh4QfPfVCL6kFbSCdMbvSsDeBo2o+DWv
	Jdv6y4v5f2rVB/ZjazzIAWZga6oEdGSGAQYb/ndlkioWVxPaZA3FFebu/SHxG7f/qAOVzX8nLEeO5
	j1QrEbHtsf6TJS0F0fDD0uWUuSrUGzgYwiYqzSmhkHMVC8WLUbVQhF9WkT083bYqPuIfILntKdw/9
	DIJKaDg/Ip8RNkdp5pO2THg3N0s5oIxMOLv182+b8ZDAmDvx/MWZGOPRttuvHZrg/MpCargEqZPtL
	9LDKx3lnDWLjueYAvWxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iecYP-00082t-In; Tue, 10 Dec 2019 10:15:41 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iecYM-00081x-8O
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 10:15:39 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBAADLOY025730; Tue, 10 Dec 2019 02:15:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=hiRhBKQUbf+Gwxh5i0A9uYD615q9LAgbZGEwmtMTSJo=;
 b=sGXhH7/Lb4KMmd+gSQtdSO18KNRCiR/iiae49kxpiqjddqX+IOPtsjjrCihbs+U0CWqb
 GxTatQ86U5kNfvq+WuhDuV/vuwRzGOWn1hcM+lPWllURhdQGoMcmYeT7Oq0jCoLJM1MI
 4ifd/vxQQI2voV4haU7jDTsvJTXHH7F3cDd+DMd2wE5Sd864JkGm2hXD2j4rlBMh5aOj
 9jU12k8/3b59BkhFzuZooozazMctcnaNT11Tm45ZOql0F8W6LREIeZx2/t6tP7OOngzb
 egCfV6tE49QStkEj7MXS+R3VABZP+ajOe0aneGfcXFg1tBQrzyc9W+2BI+fKb3NRjzLB gw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wra709bmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 02:15:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZJk05LDOQILTBYZGsi8f+F6InSXIy1rVU8j8BtaTljnWHlvo+x8aMwQAYOhpG5qCVdMoWoX4Owmad1UR1UgZkouLuESUDTacdkuMBL+iNRQjzyoEOeFRgFwOi/jG8bPhKDczXRNlH4rzBc8vZu9nzQ7Y0kX/+2UsGbSHoyfoUUj/XXlp1B5TKiOqZwlZ6p82bU7Vk7Ur0BY/nCerh7R1TbGxJLbiIGDfkWaIFmYtaFcWXALX+d/me3fkYqfzPC7WCDX8AZrvSFUag3YrE7pOqFIDGIa1AGWI+xnqhbXNZxnUsA+4aJPxZsv4V9zzS7Dhk/H3L11DVG1KAVCHGQeCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiRhBKQUbf+Gwxh5i0A9uYD615q9LAgbZGEwmtMTSJo=;
 b=CDb4Afj5CPgC8qzWe892pRUEaw2hhyhMrnbGijkJKBBsumQnaW0XiUiMMhvxRUqle2oOYucY5xXu6EFRIGsfvBKUbuBeJzSJKuPFpxAPlAG16V2oWo0MJYTUt2psR3/q33aBnrTHlQAbkWFUGyCFdRApfalSG1kgaCK95jdUj5NRKPR8+XTJKiDzUcGBxef4XsUC+8ziQkmM/YIe0FLWA2ALZrsgQw6HewzWB46inzkAaF7sz6a0ue1KZjyLeVKxtr0k3BQcOg3hEE0J5vhevLf9dv0sTAlFd3C4XNYW9TC/74vCwvUZpzE9YSo2eRo4gBmS9upPq2MRtUNZReWqTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.28) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=cadence.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=cadence.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiRhBKQUbf+Gwxh5i0A9uYD615q9LAgbZGEwmtMTSJo=;
 b=VxLIdOTVbOmaocyagjHba2pM7a4MtWg5QAq840g9zQPEMs8WTY1BQf9R1YBRZE87mbbyfmxOypRIZQq5+kZITw6HlJ3zgK2lgiEYNIdgo/vjk7LW+ywd98Ey6ZSvDUUzDnEJuI+tUIu0GnKsBWtGjluMVOhXFHEt9vzjw3IRBlg=
Received: from MN2PR07CA0002.namprd07.prod.outlook.com (2603:10b6:208:1a0::12)
 by SN2PR07MB2686.namprd07.prod.outlook.com (2603:10b6:804:a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.17; Tue, 10 Dec
 2019 10:15:33 +0000
Received: from DM6NAM12FT031.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::208) by MN2PR07CA0002.outlook.office365.com
 (2603:10b6:208:1a0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Tue, 10 Dec 2019 10:15:33 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.28; helo=sjmaillnx2.cadence.com;
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM6NAM12FT031.mail.protection.outlook.com (10.13.179.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 10:15:32 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 xBAAFTmU004194
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 10 Dec 2019 02:15:31 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 10 Dec 2019 11:15:29 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 10 Dec 2019 11:15:29 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xBAAFTtc009284;
 Tue, 10 Dec 2019 11:15:29 +0100
Received: (from pgaj@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xBAAFSgx009251;
 Tue, 10 Dec 2019 11:15:28 +0100
From: =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 1/6] i3c: master: make sure ->boardinfo is initialized in
 add_i3c_dev_locked()
Date: Tue, 10 Dec 2019 11:14:57 +0100
Message-ID: <20191210101502.8401-2-pgaj@cadence.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20191210101502.8401-1-pgaj@cadence.com>
References: <20191210101502.8401-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(189003)(199004)(36092001)(246002)(4326008)(2616005)(42186006)(107886003)(8936002)(26826003)(6916009)(478600001)(86362001)(316002)(36756003)(26005)(54906003)(76130400001)(186003)(1076003)(6666004)(336012)(426003)(356004)(5660300002)(70206006)(70586007)(2906002)(8676002)(7636002)(70780200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN2PR07MB2686; H:sjmaillnx2.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 548aa5de-52ef-4f81-01bd-08d77d59e423
X-MS-TrafficTypeDiagnostic: SN2PR07MB2686:
X-Microsoft-Antispam-PRVS: <SN2PR07MB2686DAC5F8494A9407731B1DC25B0@SN2PR07MB2686.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 02475B2A01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p+PgVZDGQe5FMjFpxzIum+dJqntE9Qbt5TLSuh0kqDeucgelNW24LqlcmHplcqkl3nBguVzWImuSHP4NtPwHI5/jC+JqZ+soqpVNC8WkuLadQ0gYoNDMfVp686yAVIa9wppMVB1vX+l0X8j3Vo/Ulm01Nym+SdB6tZCMbItOV5ByxVnzZcqSKVkdt8EUuQpRQ46QbgBsLxlfmMWH+whckQnVKnG+IY1DEAT/DazNc0rjSVNhtUR+Ae9Seuk2Tnx0iRfmR6APciwoeSCabshAX1Nc68rXkVnRBTFkLAxn/yiiGWdgQCCvcejEtQyRwo3clnD0SyiA7AHI3SgZG4/Bs+2JctWh3oVAUKyK/9BrUDX4TagEFb83qrXyCuUX1YPiKzcTXXsV/Qv9dUz8UA0FwZC5gOy6sp2QbC46H+yiBonCsApccFbHWv1VpeOqo/i/tT7+9Ao6A9jIlhygwgOxVLl4G2UzGEjkxJuSWY/zvv0p75N2xz1tMGzsDj+k7W51faDzgMdRe4u+pIPXj1/eSA==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 10:15:32.8214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 548aa5de-52ef-4f81-01bd-08d77d59e423
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR07MB2686
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_01:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=999
 suspectscore=1 malwarescore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_021538_301620_30D792AF 
X-CRM114-Status: GOOD (  12.26  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, Przemyslaw Gaj <pgaj@cadence.com>,
 rafalc@cadence.com, stable@vger.kernel.org, vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Vitor Soares <vitor.soares@synopsys.com>

The newdev->boardinfo assignment was missing in
i3c_master_add_i3c_dev_locked() and hence the ->of_node info isn't
propagated to i3c_dev_desc.

Fix this by trying to initialize device i3c_dev_boardinfo if available.

Cc: <stable@vger.kernel.org>
Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
Change in v4:
  - Remove addrstatus check, this will be sent as a separate patch

Change in v3:
  - None

Changes in v2:
  - Change commit message
  - Change i3c_master_search_i3c_boardinfo(newdev) to i3c_master_init_i3c_dev_boardinfo(newdev)
  - Add fixes, stable tags
---
 drivers/i3c/master.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 mode change 100644 => 100755 drivers/i3c/master.c

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 043691656245..5c06c41e6660
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1774,6 +1774,22 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
 	return NULL;
 }
 
+static void i3c_master_init_i3c_dev_boardinfo(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+	struct i3c_dev_boardinfo *boardinfo;
+
+	if (dev->boardinfo)
+		return;
+
+	list_for_each_entry(boardinfo, &master->boardinfo.i3c, node) {
+		if (dev->info.pid == boardinfo->pid) {
+			dev->boardinfo = boardinfo;
+			return;
+		}
+	}
+}
+
 /**
  * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
  * @master: master used to send frames on the bus
@@ -1854,6 +1870,8 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto err_detach_dev;
 
+	i3c_master_init_i3c_dev_boardinfo(newdev);
+
 	/*
 	 * Depending on our previous state, the expected dynamic address might
 	 * differ:
-- 
2.14.0


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
