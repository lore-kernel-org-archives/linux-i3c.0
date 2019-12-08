Return-Path: <SRS0=QgUf=Z6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3218CC43603
	for <linux-i3c@archiver.kernel.org>; Sun,  8 Dec 2019 14:18:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDBCA206D5
	for <linux-i3c@archiver.kernel.org>; Sun,  8 Dec 2019 14:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M9rplo9j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="oq/YUIl4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="YW0Ur0jC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDBCA206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DieDTulsXpFJ4z56S5nsrGu1QMUvnzz0+B6dNA2qMig=; b=M9rplo9jlSqEfM
	tYwwhRxX57+MV1UreE3PJmZ6LMfww1uOEjX8ApGQjdGeNT6EHGNUyRY0znJoH9mqJzfJDuO/zfN78
	A4EevwQC0CLfIWAvxBkZFw+q9TtExFaXTGbShOTNdS043AvhEHrNCilrWgU17FYczBVJo/mg68wfB
	nsukBkK/kLCEr9doowQyV2TSdMpgS1j5Wy0R2AE7DEkI8l7pGkLgriznuApi0zM/xa4h3P5lT9D7w
	/3ui6w0/cIYfGs3AeunWLsMdmfvoFREMy7hBUbCwaeBXf1ACEAcIgwgqymHrZW/RNXWPPDYFw22oF
	CrOVVfu74QtZts7PlOJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idxOi-00031C-FI; Sun, 08 Dec 2019 14:18:56 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idxOe-0002zp-Qq
 for linux-i3c@lists.infradead.org; Sun, 08 Dec 2019 14:18:55 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB8E8uTl020026; Sun, 8 Dec 2019 06:18:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=ph2a/xzUPW0j7miMoNfq3GHy8vCdmpDMA3snFEOYKKY=;
 b=oq/YUIl4ogPQdSzpYtp1LkAP/SoiAdmkhZEvZDa76oHSIqbL09jGMY4yW/jmfu5qgSx3
 XQGlb7wBsJycykE4zoJTs8cFl5s6B5Po7i16OYjuNNimubO0kyULQFsQKqmdzjHu5O1e
 BZLFQuuR73pr5xSiv9zpVzHlYcMkbDNfSTf28RvcLCtzY87Zh/ze2jtBV0MiAGx5+bH4
 0DC6nD4sQ+SDeogMHyDcW3qXbQKsZgFCjTX4oud6qIvo1BkawBjRwe0PRi1RrW46IrL2
 1Cb1OROSVlJlsG7AyCwapj2OU55l05qDAWUHVFxlIavTvnkncfb2swdEWpvg/ET1LBfV 0A== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2054.outbound.protection.outlook.com [104.47.36.54])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wra702u0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Dec 2019 06:18:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IepOtZCFtWpnLHZZo3KckRIeRb0uNNqfOcDAktRIvRejOnxsGFIzZMXc4RqSrprxc8Q1FuaK0febeNA+e+0eQ8+aCqKARi2AM+duETZMgAZngU8JRaebOXAAB2RPbBipC24mifTijuN/xa9qXM1pYc1/kwuUJAkPN7lYU/gY6xitzUaEM715D1SSDyHp8OoGHiHqs4o6J9A09MVFZ852HXyQ9+FcdVrpQwtLiTmnLRWaUvfqATzBUTHFvga0iuB+EKkx4TjkLEwTDrFYdpMDz59hrnfXG8U6qzPVlpJn9JfKngIRuxpj1k9miO3yY951T/TU3MhufV2GQ3umtpOb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ph2a/xzUPW0j7miMoNfq3GHy8vCdmpDMA3snFEOYKKY=;
 b=Rc4pWfYXVtjDxFjza1bTiuClIbQMaDVZ/pe4uI6DjA7Wl/k4yRCePIk8qCPDHa3giHrvJx5hloLT4eEfr5wi8pyZ3Ow7mQAB4ZhsTyGArTCNaNucJ2Kl/wbSUqvhSLoCw4PwOHoHI+ZjX31wvEz3z9aWvjahDadbRnoHgtPieeHH5zOKKX67O8//1WTpv9ZrzSa16McYX/ygmicVh0jtbiDBhYWxiur8kGVGsVJDpSJv6Lr2slEoYoWwSiefwWbXb6hj06LBUFQSbbjKEtjB6HrXxzdC/nGKxtIMjptFExdbxNxnZtBxUKVKLpfBeed5E2aCWwGaGpp7XckPTS2bFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ph2a/xzUPW0j7miMoNfq3GHy8vCdmpDMA3snFEOYKKY=;
 b=YW0Ur0jCp2AIKygHGwDmXYIvpOiSt9FyAAvDncb9L/SzF2KaoO+0f43XgMEpD08ENaGboFModZM14ogN+YiX+TxXEdtJLxxoH9G660rew0m542tldzpMsrYKZcdJs38ejqUluYTY3q68AMhT4IGEBdGcoD0w9kBRWO8mHhs2c8A=
Received: from DM5PR07CA0065.namprd07.prod.outlook.com (2603:10b6:4:ad::30) by
 CY4PR0701MB3732.namprd07.prod.outlook.com (2603:10b6:910:8d::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Sun, 8 Dec
 2019 14:18:41 +0000
Received: from DM6NAM12FT047.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::207) by DM5PR07CA0065.outlook.office365.com
 (2603:10b6:4:ad::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14 via Frontend
 Transport; Sun, 8 Dec 2019 14:18:41 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.28; helo=sjmaillnx2.cadence.com;
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM6NAM12FT047.mail.protection.outlook.com (10.13.179.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Sun, 8 Dec 2019 14:18:41 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 xB8EIdcm024662
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sun, 8 Dec 2019 06:18:40 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sun, 8 Dec 2019 15:18:38 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sun, 8 Dec 2019 15:18:38 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xB8EIcnL010362;
 Sun, 8 Dec 2019 15:18:38 +0100
Received: (from pgaj@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xB8EIbst010357;
 Sun, 8 Dec 2019 15:18:37 +0100
From: =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH] i3c: make sure the PID is set before registering the device
Date: Sun, 8 Dec 2019 15:18:34 +0100
Message-ID: <20191208141834.10310-1-pgaj@cadence.com>
X-Mailer: git-send-email 2.14.0
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(36092001)(189003)(199004)(356004)(48376002)(6666004)(50466002)(426003)(305945005)(6916009)(336012)(316002)(87636003)(42186006)(478600001)(26826003)(7636002)(2906002)(26005)(2616005)(54906003)(186003)(8936002)(4326008)(50226002)(86362001)(107886003)(70586007)(51416003)(8676002)(5660300002)(36756003)(4744005)(70206006)(76130400001)(1076003)(246002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0701MB3732; H:sjmaillnx2.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:corp.Cadence.COM; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61566428-447a-4bdf-ebd3-08d77be986c4
X-MS-TrafficTypeDiagnostic: CY4PR0701MB3732:
X-Microsoft-Antispam-PRVS: <CY4PR0701MB3732D963B90CAF87855EE86AC2590@CY4PR0701MB3732.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0245702D7B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ufDnzFsSQo3wvUCVZb+Yf01Q4tp+aTZe1J2E+DrLt3iRqt66+IVR1YE/dXWPUytwsTS7yltdX5ZBrTy8UhlJ6zegLgiWAg/psrLjFPfGPJ2QuSinSX0zoKfxi3w3hxMkITjIfxX4Eb3SyWJqYWJKAH6LeCC4bENwmva9TOza0ECFhtqoMJkZGWLt8E6JXdnOziM0OgjqrljYrFvsT2azBwVN1JEPDNmjH41IDyxX7Z/7P+hYBVt9tuNhwdobm1oLZn+degTmaojkOiuKt2Sdm5Ar829Z1D4oE0SIrpdySN/Yt5OciHR7j09Bk6lJ1amoxAEGU7fYoLUDCtD1LtIIcntmOaqEEa+oU16sMB1rrufyTVu7ZKIMAdVzaPhFApNm2M4DG7/Iz+UOn1MwRTA2JAlX+bMgR9sIL9jOzy3rl0yPF9ApZnsmDVmrkJHmN+gxwyIL5fLUZV5KYdQEr4YnwAorgk656pgeh/rAH7Oe0A24RrZc03eeOASQKJygYONp
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2019 14:18:41.3808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61566428-447a-4bdf-ebd3-08d77be986c4
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0701MB3732
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-08_04:2019-12-05,2019-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=837
 suspectscore=1 malwarescore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912080124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_061853_229687_97E87BFD 
X-CRM114-Status: GOOD (  10.80  )
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

From: Przemyslaw Gaj <pgaj@cadence.com>

Provisioned ID (PID) is the value with which device drivers are
matched. I check the value before registering the device.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 043691656245..07ea8b0b7736 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1449,7 +1449,8 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 		return;
 
 	i3c_bus_for_each_i3cdev(&master->bus, desc) {
-		if (desc->dev || !desc->info.dyn_addr || desc == master->this)
+		if (desc->dev || !desc->info.dyn_addr ||
+		    desc == master->this || !desc->info.pid)
 			continue;
 
 		desc->dev = kzalloc(sizeof(*desc->dev), GFP_KERNEL);
-- 
2.18.0


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
