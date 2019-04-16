Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7223C282DA
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 07:32:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B586F20857
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 07:32:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rzqs/g2u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="Uc1ZJo+D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="R5bfw6r5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B586F20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EJQ6XNXgK2IiCJa+Dwv8vO+KEoso1/tvcl2LD/6l9E=; b=rzqs/g2uqqmD+M
	O7pjVTHTjO9cUm4VaDolWpQNg2gs06rF9piBTgANH8Nt7m5E6TcuFPCozrFljwx5o/P6faENf0Slm
	nbR6OkEJovY3wJX1/LEJsSyGWrXAiKcK90OHlSRif92qO5PGAhlwUqBdirnp/tBkjcWXAhiOVwA96
	Mj8ZanX8E3XPWIvy5Nw0X6fQxoCRzdmfAyuuwqkBBAPUC7ZmCq/S0R1Wl5FkeAmDZUDAKu0ZIRsEB
	T5c2hFH+LgLGHncEe7e3faAxsTF9ndh+qQvJTaD1mnFwyIqFpn8PxbkuHtiQyqChV6Xi1V7hnshhY
	v/qEGDrHZBptHfHDpJ7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGIZe-0001Ny-92; Tue, 16 Apr 2019 07:32:10 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGIZa-0001Mm-Fe
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 07:32:08 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3G7IigG027638; Tue, 16 Apr 2019 00:32:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=WaHEDkW2GLP/WDIQ14pqnjNBlC9Mpic66zsbSV3XaGM=;
 b=Uc1ZJo+Dyu44HfVlh/ykMqKI2+IYGHn3Fv/Ygfd7V4WCk32R7cSHN4Gyb3KKi7+rUrSo
 o9emw4xHUroFcBOI7RwIm6ZvDx5V6s+yaDWtvzBAJZ5p+YIZH29/tuCrdFvks0tGwU/i
 cNRE7jUzt1//CLCRkRTfg7gojTY+KoOO7pKt/WqWLOTEohEL+9CAUaUiJoNNLrC5iRtR
 IjGLUwKqEOw8JFb/TXEJTzbDp4fNJJ0B3e1qZAiPRnquoZvzNG+MgZxhiCxBQ+NBx93b
 5kpAuV9COn6PBodiplgz+k0uMPYGfty9pv3CNmCweJJRRDW55OiT9cLsz7Zh6q/Yv+5O hA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2057.outbound.protection.outlook.com [104.47.41.57])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2rw7d9gtg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 16 Apr 2019 00:32:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaHEDkW2GLP/WDIQ14pqnjNBlC9Mpic66zsbSV3XaGM=;
 b=R5bfw6r5MFZ6G73l86LI/jaXJ5E+B2HRh6CCtbciTPVIh/vnNmkawJSXfabW0qoWJoIw8mS4ZFdtytzW0vnTSDconY2Wr/EDW72X0JlnAVWjuTogWv0ITLEDdytAgBqI2b42vdHOF/zTtJMSKucNANpyZ+6LB2XZ4rP6O8vvhU4=
Received: from BYAPR07CA0066.namprd07.prod.outlook.com (2603:10b6:a03:60::43)
 by MW2PR07MB4105.namprd07.prod.outlook.com (2603:10b6:907:7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1792.19; Tue, 16 Apr
 2019 07:32:01 +0000
Received: from BY2NAM05FT052.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::203) by BYAPR07CA0066.outlook.office365.com
 (2603:10b6:a03:60::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1792.15 via Frontend
 Transport; Tue, 16 Apr 2019 07:32:01 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BY2NAM05FT052.mail.protection.outlook.com (10.152.100.189) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1792.7 via Frontend Transport; Tue, 16 Apr 2019 07:32:01 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x3G7VwWX003729
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 16 Apr 2019 00:32:00 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 16 Apr 2019 09:31:59 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 16 Apr 2019 09:31:59 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x3G7VxcP015550;
 Tue, 16 Apr 2019 08:31:59 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x3G7Vx9Q015549;
 Tue, 16 Apr 2019 08:31:59 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v5 2/2] dt-bindings: i3c: Document dropped support for I2C 10
 bit devices
Date: Tue, 16 Apr 2019 08:31:48 +0100
Message-ID: <20190416073148.14534-3-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190416073148.14534-1-pgaj@cadence.com>
References: <20190416073148.14534-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(189003)(199004)(36092001)(1076003)(4744005)(14444005)(426003)(336012)(356004)(186003)(36756003)(2351001)(6666004)(86362001)(51416003)(8676002)(8936002)(4326008)(16586007)(76176011)(7636002)(76130400001)(54906003)(316002)(26005)(6916009)(107886003)(50226002)(42186006)(50466002)(26826003)(106466001)(246002)(48376002)(446003)(11346002)(47776003)(5660300002)(2906002)(305945005)(87636003)(478600001)(105596002)(486006)(476003)(2616005)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR07MB4105; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.Cadence.COM; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc66621b-8902-4be4-2ff4-08d6c23d9d82
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MW2PR07MB4105; 
X-MS-TrafficTypeDiagnostic: MW2PR07MB4105:
X-Microsoft-Antispam-PRVS: <MW2PR07MB41059CE7D2E0D5D8DDB5E8B1C2240@MW2PR07MB4105.namprd07.prod.outlook.com>
X-Forefront-PRVS: 000947967F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 0GN4dViG3TxFrc1GatIrXNSUsm/9tdKIz90kb6NmNQm8H2VasUiUiJNtZqEv6uLjiQHoc95wsd+YR0Roa1npdGt/opLCyOi/pAhaxnAd4sQ3lahNk+5hKHt4X+0X9TVAAXPWwoVWQ8AH7RAB7hwrsSlsG7G2pZdPkeksNku4V6GFUpt0rDJBTlqQp1nKWZdDOFWH0JbjYn+920gEhzABq5YmD/whbY1HETcbz2kquEgwSVRoqQGs49DzJmLxN3Bekc8ZkTcXBL5vTGrokqEB3g7nMbyd8gcYKwI7vCoZRYEU2mKIhC+CtpW5o4vIVuAx4PzoDw3j/7av84GcMJZciYFHn4lMRb7S8PbpfM+uJoRxQ9ckQmt4FWINTRhnK24GioH+Qo5Id7TYg4DVsFAmBgKKqyaD0+DEU70PA4aMn8U=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2019 07:32:01.0281 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc66621b-8902-4be4-2ff4-08d6c23d9d82
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR07MB4105
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-16_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904160052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_003207_197977_5A46E3ED 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, agolec@cadence.com,
 Przemyslaw Gaj <pgaj@cadence.com>, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Because this patch series dropped support for 10 bit I2C devices, I'm
documenting this.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 Documentation/devicetree/bindings/i3c/i3c.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentation/devicetree/bindings/i3c/i3c.txt
index ab729a0..4ffe059 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.txt
+++ b/Documentation/devicetree/bindings/i3c/i3c.txt
@@ -39,7 +39,9 @@ valid here, but several new properties have been added.
 New constraint on existing properties:
 --------------------------------------
 - reg: contains 3 cells
-  + first cell : still encoding the I2C address
+  + first cell : still encoding the I2C address. 10 bit addressing is not
+    supported. Devices with 10 bit address can't be properly passed through
+    DEFSLVS command.
 
   + second cell: shall be 0
 
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
