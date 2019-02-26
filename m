Return-Path: <SRS0=oKuo=RB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D78C43381
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 14:29:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F26E20863
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 14:29:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q6EPyx68";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="IvuD5KJc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="dQ5+JElw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F26E20863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EJQ6XNXgK2IiCJa+Dwv8vO+KEoso1/tvcl2LD/6l9E=; b=Q6EPyx68TmGl5T
	6No1ZvCsauoefG4mz3CoGVV8GdpkURGk2peu7VfVy3La6AI1MebuOL+zAGo6sCP+enzTdoWRjoctN
	P2E4mX2a996eOiS/xvJvpdRkpao6nSy9TeAWEHIOrWJ5VFlr7k9vdQSNRNGgt2axHl0hyNOazpL5c
	5fLjRRVN5CZnIXTWrNkmDIpGiA+MjE1fep5vLF/4izY3lHB/TOdFRyPalHtvB9Lh96vC/Fu6lgloj
	l+bKoPQMQPp8/Vs88kKY9JtfaNFkemz4F/ShWxkfAmpOQAIbyPFyXf+ip1KeuDGF+QK2O+djoyPY4
	sfy/1L6qi6zmJQVOphOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gydjI-0004Mu-MM; Tue, 26 Feb 2019 14:29:08 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gydjG-0004M9-Ho
 for linux-i3c@lists.infradead.org; Tue, 26 Feb 2019 14:29:07 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1QESSRN021756; Tue, 26 Feb 2019 06:29:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=WaHEDkW2GLP/WDIQ14pqnjNBlC9Mpic66zsbSV3XaGM=;
 b=IvuD5KJc/fC8ENsvRU5eQq/TKgY3U43IPHYJymeZ3SO8k+YynHJEh2BcjtT3fVSdK9CE
 cAgmQwIRdYuMpBtmUop0Ro8QwYCFkNavTDFBlL27xlYH0fP5EH0JkpJbNboEMLUpTLBd
 /FNCfYARhF8jChyltM2bg7BHHQm9ydDUJ930PlNU5puafihnh8n/2N6OyMf8piIkslp7
 Epgj6EfPwn0WlUymQ/wIWb/KLfcMELnTYiN1KI5v2VBqw539wqoRT8FtR5Xb/NrnRHo8
 WtPPmDD0E97PU1qOvXIVm9F4ZlzqdIW0tbuaUYZZ8FlY8fz8wUjPJV66dpJN9Lx1LuwM NQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam01-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam01lp2059.outbound.protection.outlook.com [104.47.33.59])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2qu3m1d9b0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 26 Feb 2019 06:29:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaHEDkW2GLP/WDIQ14pqnjNBlC9Mpic66zsbSV3XaGM=;
 b=dQ5+JElwa/ZBXR4FMRF92zmVwg6TlL69MxZOaAr8Teki4AkWVjWK425jM+y5zZbgGtH2kx3K/8q/CBGT/6YrZ1r6gtHsgmaUnzLkYRmT3T+McfZg9nI4ZEddARyFMnMuKa0UJgn0yVK6gKMHVufbVpbqncxPQpWGxsa39Ck1TkM=
Received: from SN4PR0701CA0019.namprd07.prod.outlook.com
 (2603:10b6:803:28::29) by BN4PR07MB2242.namprd07.prod.outlook.com
 (2a01:111:e400:59c7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.14; Tue, 26 Feb
 2019 14:29:02 +0000
Received: from BY2NAM05FT045.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::201) by SN4PR0701CA0019.outlook.office365.com
 (2603:10b6:803:28::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.16 via Frontend
 Transport; Tue, 26 Feb 2019 14:29:01 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BY2NAM05FT045.mail.protection.outlook.com (10.152.100.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1665.5 via Frontend Transport; Tue, 26 Feb 2019 14:29:01 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1QESx7G014080
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 26 Feb 2019 06:29:00 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 26 Feb 2019 15:28:59 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 26 Feb 2019 15:28:59 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1QESxjZ029353;
 Tue, 26 Feb 2019 14:28:59 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1QESx1N029352;
 Tue, 26 Feb 2019 14:28:59 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v2 3/3] dt-bindings: i3c: Document dropped support for I2C 10
 bit devices
Date: Tue, 26 Feb 2019 14:28:46 +0000
Message-ID: <20190226142846.28294-4-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190226142846.28294-1-pgaj@cadence.com>
References: <20190226142846.28294-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(136003)(346002)(2980300002)(189003)(199004)(36092001)(126002)(476003)(426003)(446003)(11346002)(2616005)(336012)(87636003)(1076003)(26005)(478600001)(26826003)(186003)(36756003)(51416003)(5660300002)(4744005)(486006)(107886003)(76176011)(4326008)(50466002)(48376002)(246002)(2351001)(305945005)(106466001)(14444005)(2906002)(16586007)(54906003)(356004)(6666004)(8936002)(8676002)(50226002)(316002)(42186006)(47776003)(6916009)(86362001)(7636002)(105596002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN4PR07MB2242; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9378abc-391c-4b68-ac04-08d69bf6c09e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:BN4PR07MB2242; 
X-MS-TrafficTypeDiagnostic: BN4PR07MB2242:
X-Microsoft-Exchange-Diagnostics: 1; BN4PR07MB2242;
 20:5YLHgK+4PMhtaSSv+847kvanpCspX6Rlywwmvjg6nkUhpLGT5qmRwy9CzsLQnfxaQOteNe/dAsHQ1Eo4/0nJ3kFXvaIbgmvnCOwO7Sy7WlspU9mAMudhZoM4lJki6Ccq1SYsi8mZ4lWxWHU+Qo+YlzTvAgC6Oi15rLKnl3tSksdw38SE9nMa+jYMQuM3J2V/5hw0NQbMbdAGY1HutAhetI2fYMFghQxFZeqK2CgrsCvN/aLc4rcq+ig8US7WjLYxcfw+cr6qDvG9n9s+9B5MJ0/oaHYC8vJ7t/fpSktpNrc070R5YuQxbbRzo2Pq6yrCGHweWe+7UfBrUVTO+mDbqG1Imu00dO+kLQmSKXicbSsQIvSKg3Qvy9lh82/RaBv2NLBFpEn6z2GAa9O00KJH8bJFcvlat/zUJ5xvlfFccdLkD4U/NyVDouHxxHQEyUJA3IdKyEEJhy5dFzVMDz2V44vYuewKtA/d+U3w1K9knLOb+h+4Uud+Ugomo9wxZIxb
X-Microsoft-Antispam-PRVS: <BN4PR07MB2242E0535F881C9BB456D3C2C27B0@BN4PR07MB2242.namprd07.prod.outlook.com>
X-Forefront-PRVS: 096029FF66
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN4PR07MB2242;
 23:Ue+3im6hiQR0vUg+VwiVo1sjVvrr4DggAzaY0pPOq?=
 =?us-ascii?Q?eOnP5QcvASlhzD3wSKiFdAEBwvvlvgvxZulyZqejNNRbPaWLtBxkRETJzz3i?=
 =?us-ascii?Q?Oi8WUfvGtwCI1uR3WAlsfS2rJ/I2s5jxeFWDMWX7l8+Cq04oS2EMPYRJomSA?=
 =?us-ascii?Q?yj2h3cVusFbDPkX+hhbA3/jH5PYSNGf4f89bwnQ4ev0RzKsdY9Ec+IP0hnUK?=
 =?us-ascii?Q?Tid2u6wh+HlhILlKnG3JmKnkD/aWiKHYE4duVgwY2HwBWdxAoH/9RjaOk8Th?=
 =?us-ascii?Q?l0SUPyvzySQ2icr4r+hc8FP4+cDft1i78TG+6elWR5pwB1uAxW2Z2nQuLl0y?=
 =?us-ascii?Q?3sSJ8YlYqCe79zoyI4zSeAr4XqbA5EDoQCDqZUiqC+zNgEBPRQFV77al81Rv?=
 =?us-ascii?Q?UGN5q3d4vMx80j/3jIEQuMYuDotlwmfhRJ/GBeziHoPO8r4WwBzrmQ666UcC?=
 =?us-ascii?Q?bNhCNBSsT1RC47d06t7dsWRCOZmTHEOwvE+a0vMt8kH3cqAnu1EMCZiclX55?=
 =?us-ascii?Q?mO8J+9d/mlm+grmMluf5ZF47kngbm6FLXY6RddOFBdm/3rBJVSsfZ4FD3jp2?=
 =?us-ascii?Q?FK/aVW+5WaLQy2m2X/UzvhTmeOefVCn6DtiHdJ2L7SkAu+rZBrE+UdiEuu5v?=
 =?us-ascii?Q?HEQGflFQhu8oXXzKyWhX4ZI1179SJFnvRXY4AzOVQF7kurkt1TFomzxleAW8?=
 =?us-ascii?Q?gyXSNSjgGv1nAxgUiuL8E8iIiU+88Z9Cvz0LaVnYuP/3GpiG4beTOfVqmqtf?=
 =?us-ascii?Q?h/QziMV6VTJqiDW9viXditQptzJo2ydMRuFB1hLnQBTQfXcGAsmp94yWBz5p?=
 =?us-ascii?Q?LUUNOgn4k+ELxng+hesa8OIlJyny8vh/FdtKcRWz03i6z5PB21cR5R1kK/Xa?=
 =?us-ascii?Q?9yWoni6R1+6+ViQYuVnIOKzpCTdzZYTxuwJlUv0rAGXHb2JUqkWVF8wODYsh?=
 =?us-ascii?Q?pT9rOoslHW+7YYEEK7ijY2KnIPsCpQ8+vSHAPyc7H+v3brStrR/pUx3MCKfv?=
 =?us-ascii?Q?jp+zdlFaNnRvuetV6BuWsRXCbQWHrl1Ue/l8rSoLXeguqUf47Ri0C4Rigj/s?=
 =?us-ascii?Q?ok9I1AgRQ9J4fUz2cYxQ+a0JYL1KRmHprMlV3EETofgnnKMvK9utDl2MAGK1?=
 =?us-ascii?Q?X2UDhFs3eboytnRCrQeVbc6/DN/VkfC?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Pat00CS2nH7nrFMnDyg8Kx2PgIakIv7rU8hcIoEex6mdX76B8Bxezfq+aR5nhbb2631QcI7IfTb74OazQZ7iXVcG4ZxEjXVhAP2aa95/2BYxZaP7sSu79g3ZaxPtA8v3tvIJRY36UaWN+U/IMAM6YEzlnpBHgSQSA6pDXw7MscnIv8X8QpiDnns7LM+qAdgG15gntsWtHo5omQ56c9k5dyPx2+BzjN4q6e9Len+9FEuY12dohzpMAQQ/g0yGBl1NFj4Es4zCyowGVzxw5r6ctwMB/UwtgatuYWk+Vh+dujMrEYBdIEgfQ6+12MLp4dUNVkXIDxkn6IxiWFy43o1lKrkhEksBeg0JsqRTX+AgH33XknOXkCDVK9EADO1mf/dXTEaPgJBQYrgV9kLgJalTm7oDFkVE1K6IodJtdJzfDTE=
X-Microsoft-Exchange-Diagnostics: 1; BN4PR07MB2242;
 20:NJ6YxvVIvCVmDRJj6SyJhnAhU97Q4v5qQQOfIQpLYuJMTjGLQzqMfg2kKDoabP4EbbW9rYq/5MhSlNI6qWphhsGJxVMzWzrEds/SWlvoA1Tqo9sXr72aFnq32omxOhQT3p8VR1SPiXTiGVEYgCoCWWRsn0oBWGqkpldC6IeEfHm7zeijPi+zrv6KidDG4QRo/zlLpU0HKOz2hnUQtE+Jas2GgVZDKraOd+Ak+H6/VI1UcuYLoK/Z5udNf0J8JKP6
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2019 14:29:01.4787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9378abc-391c-4b68-ac04-08d69bf6c09e
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN4PR07MB2242
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-26_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902260106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_062906_703239_AE9C05FE 
X-CRM114-Status: GOOD (  10.34  )
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
Cc: linux-i3c@lists.infradead.org, Przemyslaw Gaj <pgaj@cadence.com>,
 rafalc@cadence.com, vitor.soares@synopsys.com
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
