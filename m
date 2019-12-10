Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FA0C2D0C4
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 10:15:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A59942077B
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 10:15:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MK7W3xJp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="M0fqYjE5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="mlKX+5FF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A59942077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4f1V98xd8fGYJGL/NoxWLNQGg+2XgWc9OUQPviLpcz8=; b=MK7W3xJpFgIbfF
	ZHgm5jLl/y1SBeROIwh/77WhxcalWytg/KiysTUx9X/VasaAJvrCIIZK/VFtof0Jo3A+MpsyjA8Hk
	t2JIyDaLLB6xzbfaAojHQthJ9GFDl9qhBASDj4Pysy4bQRbhVeMhRrhn51UYYS5DDUvv0BkKBujNp
	Bal5ATEBfdYmS0sC3ELyTcKDjuJZjczEvKcPHCu9UWMXITjpR8CzfpKqdAw3mvOKCgGEjJPYiZVat
	7ZeftHCuKOUWUlcM8xYznUvfiJYKTBT96ikQtkPCmxJ0KskE9n9X78A58znBhbSKCeIkY6xeNn5Vm
	Sb7hke37IRUQ7ySwPFBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iecYX-000854-TC; Tue, 10 Dec 2019 10:15:49 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iecYV-00084C-VI
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 10:15:49 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBAADMkp025733; Tue, 10 Dec 2019 02:15:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=UqfWeSljS86z9I5VDgrWuvPBCrYpVRnLfr9Cx8xTR6E=;
 b=M0fqYjE5MUbarem7OF69tRtca5ckff5MLtDJB/TMoPqgRSmNFvzhbIm3uYGrMdwZ2FNr
 uKWAg+l/cb3FJ1mDnD8dQdTtBM5TtiF64ghUSMVCP6kGGcZtxs5dKP/4T9a5Upgvc4eG
 hd9uiSYBoccKey2pCGPNExdeJ22eFcwcFWQECeK1IFKddEc7wOmUwCoBRWUmWPXlZHWv
 sZU6/C5NgeQ40wRi8iKTVi1cOQe6WZRo66mMqHh227sJYKRhCnhYtHpDVlXnacZMEZdg
 gY2AFYEbTvv/vBRIAHbZDK4t44vgPndt0b1im+n9gQRngb1TJ3DEYYhQwzT8wqTXA/Pc VA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wra709bnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 02:15:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKHpVuSdVFV5Z1wLvF5tjm71F8VKfkTfMSZn+Ts81ahXZosaf/xTQyzcCK3KpU+sCP2HiD3uRVcyqWVVHnkym3mryc6s5BnbW2GvOUTHtdWKabOed2AQ1vwvuMf8QkAd+q0BcTxxuiPNIJsav1cG/FwYGN02InmTcdzzgmIh1SNf41D35GoNI4bNYN5ozdHaixkENzr0rQaA1HjlMG3PGJXwBoLnHBw3W7vncVDpP39wqRr/5iGmkF8wUyjkzxrs1Vs+H2f50lqw6UZiL06eGSMJFoGdYaeBYOItQ+KfJCpR5aeqItNtf4mYGphf9sbPE7PAEnXLKwyFE6nTzrSGVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqfWeSljS86z9I5VDgrWuvPBCrYpVRnLfr9Cx8xTR6E=;
 b=oRiNU/AmDhJ20O/dPOApIzWzZuOTXUNujbWt1QNOiBfkczKJkBsgzsQM6k6BtRzr8awBtkbbCq88zj9XBvb6YqdwoextfVz87L33ZL5XCtjkBj6mlvRf+DtftHeGiZf3upnHIVDJeXFxbGs3or2BzH/JtLdLkme+2pms6S5yHKQ90TvT+KQWMYgsD+Tg6kJnP5EQNfG9AFJ0KiBcQ4ubt1fFpCatMmh7BvGycr7FCuZoO7M3pLB0c7j60/D2pj7TgbtCpO12JwuHwkNaJ4h79BQfGqHf2YstElZWFEdno4rfOk8vP/09YRTgc1xk50t3M6XbukJ7bUYWzVbNCvCVHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqfWeSljS86z9I5VDgrWuvPBCrYpVRnLfr9Cx8xTR6E=;
 b=mlKX+5FFt/qcLnC3+iqaQuc+56kuZm9dCVBPlmAr3/MYIuj/t0vfmsYD+tanBBZ7nTd4kf9qhQOtK9xCSht8gfmnqxeHh3vxmGH/wrRSLZXSFIefqqqLaia+l0rspTvgm6nA4W7OOHeYYrwvhTYvFv9IehHaVpunSceCoidK0KY=
Received: from BN8PR07CA0009.namprd07.prod.outlook.com (2603:10b6:408:ac::22)
 by SN6PR07MB4992.namprd07.prod.outlook.com (2603:10b6:805:ac::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Tue, 10 Dec
 2019 10:15:44 +0000
Received: from DM6NAM12FT025.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::204) by BN8PR07CA0009.outlook.office365.com
 (2603:10b6:408:ac::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.14 via Frontend
 Transport; Tue, 10 Dec 2019 10:15:44 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.28; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM6NAM12FT025.mail.protection.outlook.com (10.13.179.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 10:15:43 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 xBAAFdQa031071
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 10 Dec 2019 05:15:42 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 10 Dec 2019 11:15:41 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 10 Dec 2019 11:15:41 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xBAAFfOw009319;
 Tue, 10 Dec 2019 11:15:41 +0100
Received: (from pgaj@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xBAAFfmu009318;
 Tue, 10 Dec 2019 11:15:41 +0100
From: =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 6/6] i3c: master: dw: reattach device on first available
 location of address table
Date: Tue, 10 Dec 2019 11:15:02 +0100
Message-ID: <20191210101502.8401-7-pgaj@cadence.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20191210101502.8401-1-pgaj@cadence.com>
References: <20191210101502.8401-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(36092001)(199004)(189003)(336012)(6916009)(70586007)(81156014)(8676002)(26005)(1076003)(8936002)(426003)(81166006)(42186006)(5660300002)(316002)(76130400001)(54906003)(2616005)(36756003)(6666004)(356004)(186003)(70206006)(478600001)(86362001)(26826003)(2906002)(107886003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR07MB4992; H:rmmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3089b5ce-2b66-47af-d130-08d77d59eac0
X-MS-TrafficTypeDiagnostic: SN6PR07MB4992:
X-Microsoft-Antispam-PRVS: <SN6PR07MB4992D2BBAB4039445337F2D3C25B0@SN6PR07MB4992.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 02475B2A01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jFvDKCKX9731j3d06E7j+P3fVEr1nLy3sjISIK8hJPa/KjIXdMTBg3IVldg5Ar5JmyQU/wjZDzqGxzjPUvy5nxrRffLglwSDT6NXUSC2S7gANYwB7/w9TaTX33aMnoV/ARhFRXf5i6kVXGORfLH1XlvXmVcuXzStLRTq4mmrMh1REK/FgPRZ/WgRcdJjUvU9+p+7pwY+pCGFA2pAEH5ROv4V48dWQXhwt53MwQbk6KPoSBXQjKIijYCFWhnmTzeUVVrLFmHCta73lFdtnXfKL99DGGaTZ6TRCR2V1GdcSKoiUCE5/zQ229Kw2kELW8wdkjH4fu08XgQ2ubmeBmn7d78ci4FeAL8cBJMWOcXm4ta+Se6eI5u2Q6uhQA7LC374WgyiS9ekT8HfAaPTGGbsKNmh3A1sOs+/pzJ8HoZQXTnO/eGJN8IvLndyxWWO2E9OILOpIiqdZp5mst+0FimaAzcCtesS4z05eYnWRg6tFRnKLewVdgPCiLuqx8Pl24J9
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 10:15:43.9650 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3089b5ce-2b66-47af-d130-08d77d59eac0
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4992
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_01:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=937
 suspectscore=3 malwarescore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_021548_008117_6F551612 
X-CRM114-Status: GOOD (  12.32  )
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
 rafalc@cadence.com, vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Vitor Soares <vitor.soares@synopsys.com>

For today the reattach function only update the device address on the
controller.

Update the location to the first available too, will optimize the
enumeration process avoiding additional checks to keep the available
positions on address table consecutive.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
Change in v3:
  - None

Change in v2:
  - Add Boris rb-tag
---
 drivers/i3c/master/dw-i3c-master.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index b0ff0e12d84c..c6caba39a34b 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -899,6 +899,22 @@ static int dw_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	int pos;
+
+	pos = dw_i3c_master_get_free_pos(master);
+
+	if (data->index > pos && pos > 0) {
+		writel(0,
+		       master->regs +
+		       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
+
+		master->addrs[data->index] = 0;
+		master->free_pos |= BIT(data->index);
+
+		data->index = pos;
+		master->addrs[pos] = dev->info.dyn_addr;
+		master->free_pos &= ~BIT(pos);
+	}
 
 	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
 	       master->regs +
-- 
2.14.0


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
